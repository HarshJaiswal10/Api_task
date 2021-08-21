import 'package:flutter/material.dart';
import 'package:task/api/rest_api.dart';
import 'package:task/model/profile_model.dart';
import 'package:task/widget/app_widget.dart';

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 3.5;
    final double itemWidth = size.width / 2;
    return FutureBuilder<List<ProfileModel>>(
      future: RestApi.fetchProfile(1),
      builder: (_, snapshot) {
        if (snapshot.data != null) {
          return AppWidget.gridViewWidget(itemWidth, itemHeight, snapshot);
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
