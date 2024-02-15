import 'package:flutter/material.dart';
import 'package:frontend/util/constants.dart';

String getTextAndtrim(TextEditingController controller) {
return controller.text.trim();
}

String handleResponse(int statusCode) {
        switch (statusCode) {
            case 500:
                return ValidationConstants.internalServerError;
                break;
            case 400:
                return ValidationConstants.somethingWentWrong;
                break;
            case 409:
                return ValidationConstants.wrongCredentials;
                break;
            default:
                return '';
    }
}