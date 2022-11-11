import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_example/modules/authentication/pages/authentication_page.dart';
import 'package:flutter_boilerplate_example/modules/home/pages/home_page.dart';
import '../../../common/services/http/base_http.dart';

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
  Widget build(BuildContext context) {
    /// if your application is not using authentication functionality then edit the below code and add your own initial page logic!!
    return StreamBuilder<AuthStatus>(
      stream: BaseHttp.getAuthenticationStream,
      builder: (context, AsyncSnapshot<AuthStatus> snapshot) {
        if (snapshot.data == AuthStatus.valid) {
          return const HomePage();
        } else if (snapshot.data == AuthStatus.inValid) {
          return const AuthenticationPage();
        }
        return Container();
      },
    );
  }
}
