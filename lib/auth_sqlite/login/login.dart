import 'package:flutter/material.dart';
import 'package:signing_users_using_sqflite/auth_sqlite/login/components/login_forms_using_dss.dart';
import 'package:signing_users_using_sqflite/auth_sqlite/reg/registeration.dart';
import 'package:signing_users_using_sqflite/customs/casuals.dart';

import '../../customs/buttons.dart';

class LoginWithSqlite extends StatelessWidget {
  const LoginWithSqlite({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size sizeView = sizePerView(context);
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: sizeView.height * 0.55,
              child: Image.asset(
                "assets/images/background.png",
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            // heightForAdjustChilds,
            Text(
              "Login View",
              style: Theme.of(context).textTheme.bodyText1,
            ),
            heightForAdjustChilds,
            const LoginFormsUsingDSSheet(),
            // heightForAdjustChilds,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: secondryButton(
                  pressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RegisterationWithSqlite(),
                      )),
                  values: [
                    Text(
                      "just click",
                      style: Theme.of(context).textTheme.caption,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Registered\t",
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    Text(
                      "yourself if not here...?",
                      style: Theme.of(context).textTheme.caption,
                    )
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
