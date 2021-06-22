import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ppi_connect/arguments/argument.dart';
import 'package:ppi_connect/models/member.dart';
import 'bar.dart';
import 'body.dart';

class ProfileScreen extends StatefulWidget {
  static Route route({memberData}) => MaterialPageRoute(
      builder: (context) => ProfileScreen(memberData: memberData));

  final Member _memberData;
  Member get memberData => _memberData;

  ProfileScreen({memberData}) : _memberData = memberData;
  @override
  ProfileScreenState createState() => ProfileScreenState();
}

class ProfileScreenState extends State<ProfileScreen> {
  Member get memberData => widget._memberData;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: SafeArea(
        child: Scaffold(
          appBar: Bar(),
          body: Body(state: this),
        ),
      ),
    );
  }
}
