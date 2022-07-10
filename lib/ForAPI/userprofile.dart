class Profile{
    late String name ;
    late String phonenumber;
    late String dob;
    late String gender;
    late String profileimg;

    Profile({required this.name, required this.dob, required this.gender, required this.phonenumber, required this.profileimg});

    Profile.fromJson(Map<String, dynamic> json)
    {
      name = json['name'];
      phonenumber = json['phoneno'].toString();
      dob = json['dob'] ;
      gender = json['gender'];
      profileimg = json['profile_img'];
    }

    Map<String, dynamic> toJson(){
      final Map<String, dynamic> data = new Map<String, dynamic>();
      data['name'] = this.name ;
      data['phonemo'] = this.phonenumber ;
      data['dob'] = this.dob ;
      data['gender'] = this.gender ;
      data['profile_img'] = this.profileimg ;
      return data;
    }

}