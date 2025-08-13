


class SignInModelClass {

  int rollno;
  String password;
  int clid ;
  String dbno;
  String tns;

  SignInModelClass({
    required this.rollno,
    required this.password,
    required this.clid,
    required this.tns,
    required this.dbno
  });

  // SignInModelClass.fromJson(Map<String, dynamic> json) {
  //   rollno = json['rollno'];
  //   password = json['password'];
  // }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rollno'] = rollno;
    data['password'] = password;
    data['clid'] = clid;
    data['dbno'] = dbno;
    data['tns'] = tns;
    return data;
  }


}
