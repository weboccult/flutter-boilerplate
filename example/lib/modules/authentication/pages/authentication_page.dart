

import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_example/common/services/storage/storage.dart';
import 'package:flutter_boilerplate_example/modules/authentication/controllers/authentication_controller.dart';

class AuthenticationPage extends StatelessWidget {
  const AuthenticationPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final AuthenticationController aC = AuthenticationController();
    return Scaffold(
      appBar: AppBar(title: const Text("Example Authentication Page")),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
             Icon(Icons.login_rounded,size: 100.0,color: Colors.grey.shade500),
            const SizedBox(height: 20.0),
            TextFormField(
              onChanged:  aC.updateUserName,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Username',
                hintText: 'Enter your name here'

              ),
            ),
            const SizedBox(height: 20.0),
            SizedBox(
              width: double.infinity,
              height: 50.0,
              child: ElevatedButton(onPressed: aC.onLoginPressed, child: const Text('LOGIN')),
            )
          ],
        ),
      ),
    );
  }
}
