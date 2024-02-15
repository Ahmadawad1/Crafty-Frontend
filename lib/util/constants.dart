class FormConstants {
  static const String loginFormHeader = 'Login';
  static const String signupFormHeader = 'Create New Account';
  static const String loginButtonLabel = 'Submit';
  static const String signupButtonLabel = 'Register';
  static const String emailFieldLabel = 'Email';
  static const String firstNameFieldLabel = 'First Name';
  static const String lastNameFieldLabel = 'Last Name';
  static const String passwordFieldLabel = 'Password';
  static const String confirmPasswordFieldLabel = 'Confirm Password';
  static const String welcomeBackFormHeader = 'Welcome Back!'; 
}

class NavigationConstants {
  static const String dontHaveAccount = 'Don\'t have an account? Sign up';
  static const String alreadyHaveAccount = 'Already have an account? Log in';
  static const String signupRoute = '/signup';
  static const String loginRoute = '/login';
}

class ValidationConstants {
  static const String requiredField = 'This field is required';
  static const String passwordMatchError = 'Passwords don\'t match';
  static const String emailRegexError = 'Please enter a valid email';
  static const String passwordMinCharError = 'Password must be at least 6 characters long';
  static const String nameMinCharError = 'Name must be at least 3 characters long';
  static const String nameSpacesError = 'Name cannot contain spaces';
  static const String internalServerError = 'Internal Server Error, Try Again';
  static const String somethingWentWrong = 'Something Went Wrong';
  static const String emailAlreadyExisted = 'Email is already used';
  static const String wrongCredentials = 'Invalid Email or Password';
  static const String success = 'Success';
}

class PathConstants {
  static const String baseURL ='https://localhost:44301/';
  static const String membershipController = 'Membership/';
  static const String signupPostActionMethod = 'Signup';
  static const String signinPostActionMethod = 'Signin';
  static const String contentTypeHeaderValue = 'application/json; charset=UTF-8';
}


class ProductConstants {
  static const String productName = 'Crafty';
}
