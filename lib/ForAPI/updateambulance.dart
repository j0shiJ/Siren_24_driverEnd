class UpdateApi {
  late String message ;

  UpdateApi({required this.message});
  UpdateApi.fromJson(Map<String, dynamic> json) {
    message = json['message'] ;
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['message'] = message ;
    return data ;
  }
}

