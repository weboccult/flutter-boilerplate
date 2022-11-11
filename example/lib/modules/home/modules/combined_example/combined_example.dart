import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_example/common/utils/loaders.dart';

import '../../../../common/data/constants/api_strings.dart';
import '../../../../common/data/constants/storage_keys.dart';
import '../../../../common/services/storage/storage.dart';
import '../../../../common/utils/utils.dart';
import '../../../../common/widgets/http/http_widget.dart';
import '../../../../common/widgets/listener/storage_listener_widget.dart';
import '../../../../services/api_services.dart';
import '../../controllers/home_controller.dart';

class CombinedHttpAndStorageListenerExample extends StatelessWidget {
  const CombinedHttpAndStorageListenerExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeController hC = HomeController();
    return Scaffold(
      appBar: AppBar(
          title: const Text(
              "Http & Storage Listener Widget Combined Example Page")),
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
                listenKey: StorageKeys.randomIDKey,
                builder: (randomID) {
                  if (randomID == null) {
                    return const Text('no data in storage!');
                  }
                  return HttpWidget(
                    key: ValueKey('$randomID'),
                    errorWidget: const Text('Error in getting data!'),
                    loader: CustomLoaders.circularLoader(),
                    api: hC.getRandomPOSTS(randomID),
                    useCache: true,
                    apiURL: '${ApiStrings.postsAPIString}/$randomID',
                    builder: (post) {
                      return ListTile(
                        leading: Text('${post['id']}'),
                        title: Text('${post['title']}'),
                        subtitle: Text('${post['body']}'),
                      );
                    },
                  );
                },
              ),
              const SizedBox(height: 20.0),
              SizedBox(
                width: double.infinity,
                height: 50.0,
                child: ElevatedButton(
                    onPressed: () {
                      AppStorage.updateValue(
                          StorageKeys.randomIDKey,
                          int.parse(
                              BasicUtils.getRandomString(2, isNumber: true)
                                  .toString()));
                    },
                    child: const Text('update data')),
              ),
            ],
          )),
    );
  }
}
