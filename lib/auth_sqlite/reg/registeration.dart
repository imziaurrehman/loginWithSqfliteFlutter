import 'package:flutter/material.dart';
import 'package:signing_users_using_sqflite/customs/casuals.dart';

import 'components/regFormsUsingDSS.dart';

class RegisterationWithSqlite extends StatelessWidget {
  const RegisterationWithSqlite({Key? key}) : super(key: key);

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
              "Registration View",
              style: Theme.of(context).textTheme.bodyText1,
            ),
            heightForAdjustChilds,
            const RegFormsUsingDSSheet(),
          ],
        ),
      ),
    );
  }
}
