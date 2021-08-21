import 'package:flutter/material.dart';
import 'package:task/api/rest_api.dart';
import 'package:task/model/profile_model.dart';
import 'package:task/widget/app_widget.dart';

class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 3.5;
    final double itemWidth = size.width / 2;
    return FutureBuilder<List<ProfileModel>>(
      future: RestApi.fetchProfile(2),
      builder: (_, snapshot) {
        if (snapshot.data != null) {
          return AppWidget.gridViewWidget(itemWidth, itemHeight, snapshot);
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
