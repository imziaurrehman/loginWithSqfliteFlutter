import 'package:flutter/material.dart';

import '../model/user.dart';

EdgeInsetsGeometry parentWidgetPadding =
    const EdgeInsets.symmetric(horizontal: 20, vertical: 20);
SizedBox heightForAdjustChilds = const SizedBox(
  height: 20,
);
Size sizePerView(BuildContext context) {
  return MediaQuery.of(context).size;
}

User? currentUser;
