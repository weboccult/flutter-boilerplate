

import 'package:flutter/material.dart';



class InitialPage extends StatefulWidget {
  const InitialPage({Key? key}) : super(key: key);

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {


  @override
  void initState() {
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   BaseHttp.checkAuthStatus();
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
    // return StreamBuilder<AuthStatus>(
    //   stream: BaseHttp.getAuthenticationStream,
    //   builder: (context,AsyncSnapshot<AuthStatus> snapshot) {
    //     if(snapshot.data == AuthStatus.valid) {
    //       //TODO: Goto Home Page
    //       return HomePage();
    //     } else if(snapshot.data == AuthStatus.inValid) {
    //       //TODO: Goto Login Page
    //       return  AuthPage();
    //     }
    //     //TODO: add Loading or Initial Screen Page
    //     return Container();
    //   },
    //
    // );
  }
}
