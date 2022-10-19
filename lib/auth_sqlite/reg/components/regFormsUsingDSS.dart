import 'package:flutter/material.dart';
import 'package:signing_users_using_sqflite/auth_sqlite/login/login.dart';
import 'package:signing_users_using_sqflite/model/user.dart';

import '../../../customs/casuals.dart';
import '../../../customs/form_inputs.dart';
import '../../../db_services/create_db.dart';

class RegFormsUsingDSSheet extends StatefulWidget {
  const RegFormsUsingDSSheet({Key? key}) : super(key: key);

  @override
  State<RegFormsUsingDSSheet> createState() => _RegFormsUsingDSSheetState();
}

class _RegFormsUsingDSSheetState extends State<RegFormsUsingDSSheet> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  bool isLoading = false;

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
                    controller: _emailController,
                    decoration: customInputDecoration(
                        label: "Email",
                        prefXIcon: Icons.alternate_email_outlined,
                        hint: "Enter Email Address Here"),
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                  ),
                  heightForAdjustChilds,
                  TextField(
                    controller: _passwordController,
                    decoration: customInputDecoration(
                        label: "Password",
                        prefXIcon: Icons.lock_outline,
                        hint: "Enter Password Here"),
                    keyboardType: TextInputType.visiblePassword,
                    textInputAction: TextInputAction.done,
                    obscureText: true,
                  ),
                  heightForAdjustChilds,
                  ElevatedButton(
                    onPressed: () async {
                      final SqliteServicesCreateDB services =
                          SqliteServicesCreateDB();
                      String email = _emailController.text;
                      String password = _passwordController.text;
                      if (email.isEmpty && password.isEmpty) {
                        return debugPrint("please enter email and password");
                      }
                      // if (isLoading = true) {
                      //   showDialog(
                      //     context: context,
                      //     builder: (context) {
                      //       return const HelperView();
                      //     },
                      //   );
                      // }

                      setState(() {
                        isLoading = true;
                      });
                      debugPrint(email);
                      debugPrint(password);

                      await services
                          .createAuth(User(email: email, password: password))
                          .then((value) {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginWithSqlite(),
                            ));
                        debugPrint(value.toString());
                      }).catchError((error) {
                        debugPrint(error);
                        debugPrint("something went wrong..?");
                      });
                      setState(() {
                        isLoading = false;
                      });
                      // _emailController.clear();
                      // _passwordController.clear();
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.orange.shade600,
                    ),
                    child: isLoading
                        ? const Center(child: CircularProgressIndicator())
                        : const Text("Register Now"),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
