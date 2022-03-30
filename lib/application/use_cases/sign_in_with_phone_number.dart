// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:freegamesexample/core/use_cases.dart';
// import 'package:freegamesexample/domain/value_objects/sign_in_with_phone_number.dart';

// class SignInWithPhoneNumberUseCase extends AsyncUseCaseWithParams<Exception, Void, SignInWithPhoneNumberUseCaseParams> {
//   const SignInWithPhoneNumberUseCase({required this.authenticationService});

//   final FirebaseAuth authenticationService;

//   @override
//   Future<UseCaseResult<Exception, Void>> execute(SignInWithPhoneNumberUseCaseParams params) async {
//     final response = await authenticationService.signInWithPhoneNumber(params.phoneNumber);
//   }
// }
