
class Validator {
  dynamic isValidEmail(String? value){
    String regex = r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    RegExp regExp = RegExp(regex);
    if (value != null && value.isNotEmpty && regExp.hasMatch(value)){
      return null;
    }
    return "Email is not valid";
  }
  dynamic isValidPassword(String? value){
    String regex = r"";
    RegExp regExp = RegExp(regex);
    if (value != null && value.isNotEmpty && regExp.hasMatch(value)){
      return null;
    }
    return "Password must be of 8 characters";
  }
  dynamic isValidPhoneNo(String? value){
    String regex = r'^[+0-9]';
    RegExp regExp = RegExp(regex);
    if(value != null && value.isNotEmpty && regExp.hasMatch(value)){
      return null;
    }
    return "Invalid Phone Number";
  }
}