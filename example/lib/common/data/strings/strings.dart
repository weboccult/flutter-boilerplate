import '../constants/constants.dart';

abstract class Strings {
    static const String appName = Constants.appName;

    ///--> Authentication Module
    static const welcomeBack = 'Welcome Back!';
    static const getStarted = 'Get Started';
    static const loginToContinue = 'Login to continue';
    static const createAnAccount = 'Create an account';
    ///--> input field validations
    static const String cantBeEmpty = "can't be empty.";
    static const String fieldCantBeEmpty = 'Field $cantBeEmpty';
    static const String enterValid = 'Please enter a valid';
    static const otpValidation = 'Invalid OTP';
    ///---> name <----
    static const fullName = 'Full Name';
    static const  enterYourFullName = 'Enter your full name';
    ///--> email <--
    static const emailAddress = 'Email Address';
    static const enterYourEmailAddress = 'Enter your email address';
    static const String emailCantBeEmpty = 'Email $cantBeEmpty';
    static const String enterValidEmail = '$enterValid email.';
    ///--> password <---
    static const String password = 'Password';
    static const enterYourPassword  = 'Enter your password';
    static const forgotPassword = 'Forgot Password';
    static const forgotPasswordDescription = "Enter your registered email id below to receive the password reset instructions & check your email";
    static const String confirmPassword = 'Confirm $password';
    static const String enterPassword = 'Enter $password';
    static const String passwordCantBeEmpty = '$password $cantBeEmpty';
    static const String passwordValidation = '$password must be at least 6 characters long.';
    static const confirmPasswordValidation = '$password and Confirm password should be same.';
    static const newPassword = "New Password";
    static const createNewPassword = "Now you can create a new password";
    static const reEnterYourPassword = "Re-enter your new password";
    ///--> mobile number <--
    static const mobileNumber = 'Mobile Number';
    static const String emailOrMobile = '$emailAddress or $mobileNumber';
    static const String numberCantBeEmpty = '$emailOrMobile $cantBeEmpty';
    static const String enterValidNumber = '$enterValid $mobileNumber.';
    ///--> Code <---
    static const String sendCode = "Send Code";
    static const String enterVerificationCode = "Enter Verification Code";
    static const verificationCodeSendToEmail = "We have sent you a code to verify your email address";
    static const resendOTP = 'Resend OTP';
    static const verify = 'Verify';
    ///--> log-in / sign-up  <---
    static const logIn  = 'Log in';
    static const signUp = 'Sign up';
    static const alreadyHaveAnAccount = "Do you already have an account? ";
    static const notHaveAnAccount = "Don't have an account? ";
     static const orContinueWith = 'or continue with';
     static const or = 'or';
    static const google = 'Google';
    static const apple = 'Apple';
    static const signInWithGoogle = 'Sign in with Google';
    static const signInWithApple = 'Sign in with Apple';



    ///--> Internet Error Strings <---
    static const unknownError = 'Unknown error! Please try again after some time.';
    static const connectionTimeout = 'Connection timeout. Please try again after some time.';
    static const noConnection = 'No connection. Please turn on your internet!';
    static const unauthorized = 'Unauthorized. Please login again!';


  /// --> Global Strings <---
    static const String ok = 'Ok';
    static const String error = 'Error';
    static const String noInternet = 'No internet. Please try again later.';
    static const String logOut = 'Log out';
    static const String retry = 'Retry';
    static const String confirm = 'Confirm';
    static const String somethingWentWrong = 'Something went wrong.';
    static const String home = 'Home';

    static const gallery = 'Gallery';
    static const camera = 'Camera';
    static const mobile = 'Mobile';
    static const from = 'From';
    static const toCap = 'To';
    static const success = 'Success';
    static const checkboxValidation = 'Dummy Checkbox Validation Message';
  }
