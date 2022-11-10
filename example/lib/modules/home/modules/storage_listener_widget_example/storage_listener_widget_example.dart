import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_example/common/data/constants/storage_keys.dart';
import 'package:flutter_boilerplate_example/common/services/storage/storage.dart';
import 'package:flutter_boilerplate_example/common/utils/utils.dart';
import 'package:flutter_boilerplate_example/common/widgets/listener/storage_listener_widget.dart';

class StorageListenerWidgetExample extends StatelessWidget {
  const StorageListenerWidgetExample({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Storage Listener Widget Example Page")),
      body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              StorageListenerWidget(
                /// by default [AppStorage.storage] is used and selected. To use another storage you can specify it in [storage:] property.
                storage: AppStorage.storage,
                listenKey: StorageKeys.randomStringKey,
                builder: (value) {
                  return Text('RANDOM STRING :-  $value');
                },
              ),
              const SizedBox(height: 20.0),
              SizedBox(
                width: double.infinity,
                height: 50.0,
                child: ElevatedButton(onPressed: () {
                  AppStorage.updateValue( StorageKeys.randomStringKey, BasicUtils.getRandomString(20,isNumber: false));
                }, child: const Text('Update String')),
              ),
            ],
          )),
    );
  }
}
