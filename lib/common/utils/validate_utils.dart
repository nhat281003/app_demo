
import 'package:app_3tv/common/widget/multi_widget/multi_widget.dart';
import 'package:app_3tv/data/model/textfield/title_textfield_model.dart';
import 'package:email_validator/email_validator.dart';

import 'form_validator.dart';

class ValidateUtils {
  static bool isEmail(String email) {
    if (RegExp(
            "^[a-zA-Z0-9.!#/%&'\$\*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*")
        .hasMatch(email)) {
      return false;
    } else {
      return true;
    }
  }

  // static bool isValidateName(String name) {
  //   if ((RegExp(r"^[\p{L} '-]*$",
  //           caseSensitive: false, unicode: true, dotAll: true)
  //       .hasMatch(name))) {
  //     return false;
  //   }
  //   return true;
  // }

  static bool isPhoneNumber(String phoneNumber) {
    if (RegExp(r'^0[0-9]{9,12}$').hasMatch(phoneNumber)) {
      return false;
    } else {
      return true;
    }
  }

  static bool isPassword(String password) {
    if (password.length >= 6) {
      return false;
    } else {
      return true;
    }
  }

  static bool validateInput(List<TitleTextFieldModel> listData) {
    bool result = true;
    for (var item in listData) {
      if (item.widget == null && (item.isRequired ?? false)) {
        if (item.editingController.text.trim().isEmpty) {
          MultiWidget.requiredText();
          return false;
        }
      }
    }
    if (result) {
      for (var item in listData) {
        if (item.textInputType != null ) {
          if(!FormValidator.instance
              .isCheckInteger(item.editingController.text.trim())) {
            MultiWidget.requiredNumber();
          }else if(item.editingController.text.trim().length !=10 && (item.isPhone ?? false)){
            MultiWidget.requiredNumber(textError: 'Vui lòng nhập đủ số điện thoại gồm 10 số');
          }
          return false;
        } else if ((item.isEmail ?? false) &&
            (!EmailValidator.validate(item.editingController.text.trim()))) {
          MultiWidget.requiredEmail();
          return false;
        }
      }
    }
    return result;
  }
}
