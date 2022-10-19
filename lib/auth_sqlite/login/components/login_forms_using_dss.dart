import 'package:flutter/material.dart';
import 'package:signing_users_using_sqflite/customs/casuals.dart';
import 'package:signing_users_using_sqflite/customs/form_inputs.dart';

import '../../../db_services/create_db.dart';

class LoginFormsUsingDSSheet extends StatefulWidget {
  const LoginFormsUsingDSSheet({Key? key}) : super(key: key);

  @override
  State<LoginFormsUsingDSSheet> createState() => _LoginFormsUsingDSSheetState();
}

class _LoginFormsUsingDSSheetState extends State<LoginFormsUsingDSSheet> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _email.dispose();
    _password.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final SqliteServicesCreateDB services = SqliteServicesCreateDB();
    services.dataInfo();
  }

  @override
  Widget build(BuildContext context) {
    Size sizeView = sizePerView(context);
    return Padding(
      padding: parentWidgetPadding,
      child: SizedBox(
        height: sizeView.height * 0.35,
        child: DraggableScrollableSheet(
          builder: (context, scrollController) {
            return SingleChildScrollView(
              controller: scrollController,
              child: Column(
                children: [
                  Container(
                    width: 35,
                    decoration: BoxDecoration(
                        color: Colors.orange,
                        border: Border.all(
                          color: Colors.orange,
                          width: 2.2,
                        ),
                        borderRadius: const BorderRadius.horizontal(
                          left: Radius.circular(16),
                          right: Radius.circular(16),
                        )),
                  ),
                  heightForAdjustChilds,
                  TextField(
                    controller: _email,
                    decoration: customInputDecoration(
                        label: "Email",
                        prefXIcon: Icons.alternate_email_outlined,
                        hint: "Enter Email Address Here"),
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                  ),
                  heightForAdjustChilds,
                  TextField(
                    controller: _password,
                    decoration: customInputDecoration(
                        label: "Password",
                        prefXIcon: Icons.lock_outline,
                        hint: "Enter Password Here"),
                    keyboardType: TextInputType.visiblePassword,
                    textInputAction: TextInputAction.done,
                  ),
                  heightForAdjustChilds,
                  ElevatedButton(
                      onPressed: () async {
                        final SqliteServicesCreateDB services =
                            SqliteServicesCreateDB();

                        await services
                            .fetchData(_email.text, _password.text, context)
                            .then((_) {
                          if (currentUser!.email!.isNotEmpty ||
                              currentUser!.password!.isNotEmpty) {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Home(
                                          userEmail: currentUser!.email!,
                                          userPassword: currentUser!.password!,
                                        )));
                          }

                          debugPrint(currentUser!.email);
                        }).catchError((error) {
                          debugPrint(error.toString());
                        });
                        setState(() {});
                      },
                      child: const Text("Login Now")),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key, required this.userEmail, required this.userPassword})
      : super(key: key);
  final String userEmail, userPassword;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: const BoxDecoration(),
          child: ListTile(
            title: Text("email:\t$userEmail"),
            subtitle: Text("password:\t$userPassword"),
          ),
        ),
      ),
    );
  }
}
