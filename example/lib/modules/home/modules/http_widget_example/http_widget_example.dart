import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_example/modules/home/controllers/home_controller.dart';
import 'package:flutter_boilerplate_example/modules/home/modals/users_modal.dart';
import '../../../../common/data/constants/api_strings.dart';
import '../../../../common/utils/loaders.dart';
import '../../../../common/widgets/http/http_widget.dart';

class HttpWidgetExample extends StatelessWidget {
  const HttpWidgetExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeController hC = HomeController();
    return Scaffold(
      appBar: AppBar(title: const Text("Http Widget Example Page")),
      body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 15.0),
          child: HttpWidget(
            key: const ValueKey(ApiStrings.usersAPIString),
            errorWidget: CustomLoaders.circularLoader(),
            loader: CustomLoaders.circularLoader(),
            api: hC.getUsers(),
            useCache: true,
            apiURL: ApiStrings.usersAPIString,
            builder: (data) {
              List<UserDTO> users =
                  (data as List).map((e) => UserDTO.fromJson(e)).toList();
              return ListView.builder(
                itemCount: users.length,
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Text('${users[index].id}'),
                    title: Text('${users[index].name}'),
                    subtitle: Text('${users[index].email}'),
                  );
                },
              );
            },
          )),
    );
  }
}
