


import '../../env/environment.dart';
import '../../env/types/staging.env.dart';

class ApiStrings {
  //---> Singleton Creation
  static final ApiStrings _ = ApiStrings._internal();
  factory ApiStrings() => _;
  ApiStrings._internal();



  static const usersAPIString = 'https://jsonplaceholder.typicode.com/users';
  static const commentsAPIString = 'https://jsonplaceholder.typicode.com/comments';
  static const postsAPIString = 'https://jsonplaceholder.typicode.com/posts';





}