
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app/common/services/navigation/navigation.dart';
import '../../../common/services/http/base_http.dart';



///[InitialPage] is the entry page of your application where you check the Authentication Status.
///
/// NOTE:- This is the first page of your application.
/// In Navigation Stack no matter how deep you goes it will always remain on top.
/// Never Pop-out this Page. It will crash the application.
///
/// Always use [NavigationService]'s [navigationService.clearStack] function to safely pop-out to home-page.
///
class InitialPage extends StatefulWidget {
  const InitialPage({Key? key}) : super(key: key);
  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {


  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      /// use this only if your application is using authentication functionality
      BaseHttp.checkAuthStatus();
    });
    super.initState();
  }

  @override
  void dispose() {
    BaseHttp.closeAuthStatusResponse();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    /// if your application is not using authentication functionality then edit the below code and add your own initial page logic!!
    return StreamBuilder<AuthStatus>(
      stream: BaseHttp.getAuthenticationStream,
      builder: (context,AsyncSnapshot<AuthStatus> snapshot) {
        if(snapshot.data == AuthStatus.valid) {
          ///ADD your application Home Page
          // return HomePage();
        } else if(snapshot.data == AuthStatus.inValid) {
          ///ADD your application Auth Page
          // return  AuthPage();
        }
        ///ADD your application Loading or Initial Screen Page
        return Container();
      },
    );
  }
}
