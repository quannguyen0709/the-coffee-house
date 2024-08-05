

class UserModel{
  UserModel._singleton();
  static final UserModel _instance = UserModel._singleton();

  factory UserModel(){
    return _instance;
  }

  String _name = '';

  set checkEmptyUser(bool value) {
    _checkEmptyUser = value;
  }

  String  _address = '';
  String _gmail = '';
  String _facebook = '';
  String _passWord = '';
  String _phone = '';
  bool _checkEmptyUser = true;


  bool get checkEmptyUser => _checkEmptyUser;

  String get phone => _phone;

  set phone(String value) {
    _phone = value;
  }

  String get passWord => _passWord;

  set passWord(String value) {
    _passWord = value;
  }

  String get facebook => _facebook;

  set facebook(String value) {
    _facebook = value;
  }

  String get gmail => _gmail;

  set gmail(String value) {
    _gmail = value;
  }

  String get address => _address;

  set address(String value) {
    _address = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
    _instance._checkEmptyUser = false;
  }


  setUser (String name, String address, String phone, String gmail, String facebook, String passWord) {
    _instance._name = name;
    _instance._address = address;
    _instance._facebook = facebook;
    _instance._gmail = gmail;
    _instance._phone = phone;
    _instance._passWord = passWord;
    _instance._checkEmptyUser = false;
  }
}
