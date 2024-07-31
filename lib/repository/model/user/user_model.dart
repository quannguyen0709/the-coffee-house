

class UserModel{
  UserModel._singleton();
  static final UserModel _instance = UserModel._singleton();

  factory UserModel(){
    return _instance;
  }

  String _name = '';
  String  _address = '';
  String _gmail = '';
  String _facebook = '';
  String _passWord = '';
  String _phone = '';


  bool checkEmptyUser() {
    return (_name.isEmpty);
  }



}
