import 'package:get/get.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': {
      'email': 'Email Address',
      'password': 'Password',
      'signIn': 'Sign In',
      'forgetPassword': 'Forgot Password?',
      'requiredFields': 'All fields are required',
      'validEmail': 'Please enter a valid email address',
      'atLeastSixCharacters': 'Password must be at least 6 characters',
      'articles': 'Articles',
      'articleDetails': 'Article Details',
      'noContent': 'No content available.',
    },
    'bn_BD': {
      'email': 'ইমেইল ঠিকানা',
      'password': 'পাসওয়ার্ড',
      'signIn': 'সাইন ইন',
      'forgetPassword': 'পাসওয়ার্ড ভুলে গেছেন?',
      'requiredFields': 'সব ঘর পূরণ করা আবশ্যক',
      'validEmail': 'একটি বৈধ ইমেইল ঠিকানা লিখুন',
      'atLeastSixCharacters': 'পাসওয়ার্ড ন্যূনতম ৬ অক্ষরের হতে হবে',
      'articles': 'প্রবন্ধ',
      'articleDetails': 'নিবন্ধের বিস্তারিত',
      'noContent': 'কোনও কন্টেন্ট উপলব্ধ নেই।',
    },
  };
}
