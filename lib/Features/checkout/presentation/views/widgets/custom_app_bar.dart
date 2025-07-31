import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';

AppBar buildAppBar({String? title}) {
  return AppBar(
    leading: const BackButton(color: Colors.black),
    elevation: 0,
    backgroundColor: Colors.transparent,
    centerTitle: true,
    title: Text(title ?? '', style: Styles.style25),
  );
}
