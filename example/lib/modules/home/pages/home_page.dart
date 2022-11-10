import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_example/modules/authentication/controllers/authentication_controller.dart';
import 'package:flutter_boilerplate_example/modules/home/controllers/home_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final AuthenticationController aC = AuthenticationController();
    final HomeController hC = HomeController();
    return Scaffold(
      appBar: AppBar(
        title:Text("Hello! ${hC.getUserName()}"),
        actions: [
          IconButton(onPressed: aC.onLogout, icon: const Icon(Icons.logout_rounded)),
          const SizedBox(width: 20.0)
        ],
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20.0),
            SizedBox(
              width: double.infinity,
              height: 50.0,
              child: ElevatedButton(onPressed: hC.goToHTTPWidgetExamplePage, child: const Text('HTTP WIDGET PAGE')),
            ),
            const SizedBox(height: 20.0),
            SizedBox(
              width: double.infinity,
              height: 50.0,
              child: ElevatedButton(onPressed: hC.goToStorageListenerExampleWidget, child: const Text('STORAGE LISTENER WIDGET PAGE')),
            ),
            const SizedBox(height: 20.0),
            SizedBox(
              width: double.infinity,
              height: 50.0,
              child: ElevatedButton(onPressed: hC.goToCombinedHttpAndStorageListenerWidget, child: const Text('BOTH ABOVE COMBINED PAGE')),
            ),
          ],
        ),
      )


    );
  }
}
