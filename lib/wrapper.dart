import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_ecommerse/Models/model.dart';
import 'package:flutter_ecommerse/providers/provider.dart';
import 'package:flutter_ecommerse/shared/shared.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  void initState() {
    getInit();

    Timer(Duration(seconds: 3), () => Navigator.pushNamed(context, '/sign-in'));
    super.initState();
  }

  getInit() async {
    await Provider.of<ProductProvider>(context, listen: false).getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
          backgroundColor: bgColor3,
          valueColor: AlwaysStoppedAnimation<Color>(primaryTextColor)),
    );
  }
}
