import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:logger/logger.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:siren24/ForAPI/updateambulance.dart';
import 'package:http/http.dart' as http ;
import 'package:siren24/ForAPI/userprofile.dart';
import 'otp.dart';
import 'otpverify.dart';




String otpToken = " ";
String authToken = " ";
String userid = " ";
String ip = "3.109.161.225";

class ApiCaller {
  // late int otp;



  //*********************************************************************************//

  //Send OTP
  Future<void> sendOtpToPhone(int phone, int usertype) async {
    var res = await post(
      Uri.parse('http://$ip:4000/api/otp/sendotp'),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
      },
      body: jsonEncode({"phone": phone, "usertype": usertype}),
    );
    handleError(res);

    Logger().d(res.body);
    var response = RequestOtp.fromJson(jsonDecode(res.body));
    otpToken = response.token!;
  }

  //*********************************************************************************//

  //Send OTP
  Future<void> sendOtpReferralcodeToPhone(int phone, int usertype, String referralcode) async {
    var res = await post(
      Uri.parse('http://$ip:4000/api/otp/sendotp'),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
      },
      body: jsonEncode({"phone": phone, "usertype": usertype, "referral_code": referralcode}),
    );
    handleError(res);

    Logger().d(res.body);
    var response = RequestOtp.fromJson(jsonDecode(res.body));
    otpToken = response.token!;
  }

  //*********************************************************************************//

  //Verify OTP
  Future<int> verifyOtp(int otp) async {
    var res = await post(
      Uri.parse('http://$ip:4000/api/otp/verifyotp'),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        "authtoken": otpToken,
      },
      body: jsonEncode({"otp": otp}),
    );
    // await handleError(res);

    Logger().d(res.body);
      // var response = Verify.fromJson(jsonDecode(res.body));
      // authToken = response.authtoken;
      // userid = response.userid;
    if ( res.statusCode >= 300 )
      {
        return res.statusCode ;
      }
      else{
      var response = Verify.fromJson(jsonDecode(res.body));
      // authToken = response.authtoken;
      final SharedPreferences preferences = await SharedPreferences.getInstance();
      preferences.setString('authToken', response.authtoken);
      // userid = response.userid;
      preferences.setString('userID', response.userid) ;
      return res.statusCode ;
    }
    // if (res.statusCode >= 300 ) {
    //   return 'ERROR';
    // } else {
    //   var response = Verify.fromJson(jsonDecode(res.body));
    //   authToken = response.authtoken;
    //   userid = response.userid;
    //   return 'SUCCESS' ;
    // }



  }

  //*********************************************************************************//

  //Update Ambulance
  Future<void> updateambulance(String _id, String brand, String model) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();

    var res = await post(
      Uri.parse('http://$ip:4000/api/ambulance/update'),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        "authtoken": preferences.getString('authToken')!,
      },
      body: jsonEncode({"_id": _id, "brand": brand, "model": model}),
    );
    handleError(res);
    Logger().d(res.body) ;
  }

  //*********************************************************************************//

  //Reject Ambulance
  Future<String> rejectambulance(String orderid, String cencelation_reason) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    var res = await post(
        Uri.parse('http://$ip:4000/api/order/driver/cencelbooking'),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        // "authtoken": authToken,
        "authtoken": preferences.getString('authToken')!,
      },
      body: jsonEncode({"orderid": orderid, "cencelation_reason": cencelation_reason}),
    );
    Logger().d(res.body) ;
    handleError(res) ;
    String response = jsonDecode(res.body) ;
    return response ;
  }

  //*********************************************************************************//

  //Add Ambulance
  Future<String> addambulance(String car_no,  String type,
      String brand, String model, List addons) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    var res = await post(
      Uri.parse('http://$ip:4000/api/ambulance/add'),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        // "authtoken": "B6gMxyAqFF6n4Pepmb16TeqLBoJQHJShTLKho4CWLmwU",
        // 'authtoken': authToken,
        "authtoken": preferences.getString('authToken')!,
      },
      body: jsonEncode({
        'car_no': car_no,
        'ownerid': preferences.getString('userID'),
        // "ownerid": "61e2b1e569a5c49180d4ee7c" ,
        'type': type,
        'brand': brand,
        'model': model,
        'addons': addons
      }),
    );
    print("a" + preferences.getString('userID')!) ;
    print(authToken);
    handleError(res);
    Logger().d(res.body) ;
    var response = jsonDecode(res.body);
    return response['message'] ;
  }

  //*********************************************************************************//

  //Get Ambulance
  Future<List> get_ambulance() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    var res = await get(Uri.parse('http://$ip:4000/api/ambulance/find'),
    headers: {
      // HttpHeaders.contentTypeHeader: 'application/json',
      // "authtoken": "B6gMxyAqFF6n4Pepmb16TeqLBoJQHJShTLKho4CWLmwU",
      "authtoken": preferences.getString('authToken')!,
      // "authtoken": authToken,
    },
    );
    handleError(res);
    Logger().d(res.body) ;

    return jsonDecode(res.body) ;
  }
  
  //*********************************************************************************//

  //User Profile
  Future<Map> user_profile() async{
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    var res = await get(
      Uri.parse('http://$ip:4000/api/profile/view'),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        // "authtoken": "B6gMxyAqFF6n4Pepmb16TeqLBoJQHJShTLKho4CWLmwU",
        // "authtoken": authToken,
        "authtoken": preferences.getString('authToken')!,
      },
    );
    handleError(res);
    Logger().d(res.body) ;

    var value = jsonDecode(res.body) ;
    return value ;
  }

  //*********************************************************************************//

  //Update Location
  Future<String> updatelocation(double lat, double lng) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    var res = await post(
      Uri.parse('http://$ip:4000/api/location/vehical/update'),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        // "authtoken": "B6gMxyAqFF6n4Pepmb16TeqLBoJQHJShTLKho4CWLmwU",
        // "authtoken": authToken,
        "authtoken": preferences.getString('authToken')!,
      },
      body: jsonEncode({"lat": lat, "lng": lng}),
    );
    handleError(res) ;
    
    Logger().d(res.body) ;
    var response = UpdateApi.fromJson(jsonDecode(res.body));
    return response.toString() ;
  }

  //*********************************************************************************//

  //Edit/Register
  Future<String> editProfile(
      String updatename,
      String updatedob,
      String updategender,
      String updateimg,
      String aadhar_card,
      String voter_id,
      String pan_card,
      String driving_license,
      int updateage,) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    var res = await post(
      Uri.parse('http://$ip:4000/api/profile/edit'),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        // "authtoken": "B6gMxyAqFF6n4Pepmb16TeqLBoJQHJShTLKho4CWLmwU",
        // "authtoken": authToken,
        "authtoken": preferences.getString('authToken')!,
      },
      body: jsonEncode({
        "name": updatename ,
        "dob": updatedob,
        "gender": updategender,
        "profile_img": updateimg,
        "age": updateage,
        "aadhar_card": aadhar_card,
        "voter_id": voter_id,
        "pan_card": pan_card,
        "driving_licence": driving_license,
      }),
    );
    handleError(res);

    Logger().d(res.body);
    var response = UpdateApi.fromJson(jsonDecode(res.body));
    return response.message.toString();
  }

  //*********************************************************************************//

  //History
  Future<List> historydata() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    var res = await post(
      Uri.parse('http://$ip:4000/api/order/user/get'),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        // "authtoken": "B6gMxyAqFF6n4Pepmb16TeqLBoJQHJShTLKho4CWLmwU",
        "authtoken": preferences.getString('authToken')!,
        // "authtoken": authToken,
      },
    );
    handleError(res) ;
    Logger().d(res.body) ;
    var response = jsonDecode(res.body) ;
    return response ;
  }

  //*********************************************************************************//

  Future<String> logout() async{
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    var res = await post(
      Uri.parse('http://$ip:4000/api/otp/logout'),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        // "authtoken": authToken,
        "authtoken": preferences.getString('authToken')!,
        // "authtoken": "EVuSACB5AchWPbj2hsaPKPK9XWnPiyHqxxocUMTKJ7N9" ,
      }
    );
    print("step1");
    handleError(res) ;
    Logger().d(res.body) ;
    var response = jsonDecode(res.body) ;
    return response['message'] ;
  }

  //*********************************************************************************//

  // //File Uploader Api
  // Future<String> fileUploader(String filename,File file, String extension) async{
  //   var res = await post(Uri.parse('https://8h43nvvxfd.execute-api.ap-south-1.amazonaws.com/Prod/api/upload_file'),
  //   headers: {
  //     HttpHeaders.contentTypeHeader: 'application/json',
  //     "folder-name": "FileUpload" ,
  //     "filename": filename ,
  //   },
  //   body: jsonEncode({
  //         "file": file ,
  //       "Metadata": {"extension":(filename.split('.').last),"mimetype":"image/jpg"}
  //       }),
  //   );
  //
  //   // handleError(res) ;
  //   Logger().d(res.body) ;
  //   var response = jsonDecode(res.body) ;
  //   return response["message"] ;
  // }
  
  //*********************************************************************************//

  //File Uploader Api
  Future<Map> fileUploader(String filename,File file, String extension) async{
      var res = await http.MultipartRequest('POST',Uri.parse('https://8h43nvvxfd.execute-api.ap-south-1.amazonaws.com/Prod/api/upload_file'));
      Map <String, String> headers = {'folder-name':'FileUpload','filename':filename.split(".").first};
      res.headers.addAll(headers) ;
      Map <String, String> metadata = {
        'extension': '.'+extension ,
        'mimetype': 'image/'+extension
      };
      res.fields['Metadata']=jsonEncode(metadata) ;
      res.files.add( await http.MultipartFile.fromPath('file', file.path,));
      print(res.fields['Metadata']) ;
      // res.files.add( await
      //     http.MultipartFile.fromBytes(
      //         'file',
      //         file,
      //         filename: filename
      //     )
      // );

      var response = await res.send() ;
      var answer  = await http.Response.fromStream(response) ;
      Logger().d(answer.body) ;
      var finalresponse  = jsonDecode(answer.body) ;
      return finalresponse ;
  }

  // //*********************************************************************************//

  //Registration Token
  Future<String> registrationtoken(String firebasetoken) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    var res = await post(Uri.parse('http://65.2.132.175:4000/api/push_notification/update/registration_token'),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        // "authtoken": authToken ,
        "authtoken": preferences.getString('authToken')!,
        // "authtoken": "EVuSACB5AchWPbj2hsaPKPK9XWnPiyHqxxocUMTKJ7N9" ,
      },
      body: jsonEncode({
        "registrationToken": firebasetoken ,
      }),
    );
    print("reach") ;
    handleError(res) ;
    Logger().d(res.body) ;
    var response = jsonDecode(res.body) ;
    return response["message"] ;
  }

  //*********************************************************************************//

  //Handle error
  handleError(Response response) {
    if (response.statusCode >= 300) {
      print("b");
      throw Exception(
          jsonDecode(response.body) ?? "Unexpected error occurred");
    }
  }

  //*********************************************************************************//


}
