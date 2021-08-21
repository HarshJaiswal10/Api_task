import 'package:flutter/material.dart';
import 'package:task/model/profile_model.dart';

class AppWidget {
  static GridView gridViewWidget(double itemWidth, double itemHeight,
      AsyncSnapshot<List<ProfileModel>> snapshot) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: (itemWidth / itemHeight),
          crossAxisCount: 2),
      itemCount: snapshot.data?.length,
      itemBuilder: (_, index) => Container(
        height: itemHeight,
        width: itemWidth,
        decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.2),
            borderRadius: BorderRadius.circular(15)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: NetworkImage(snapshot.data![index].avatar)))),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: Text(
                          "First Name : ",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                      ),
                      Center(
                        child: Text(
                          snapshot.data![index].firstName,
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
                  ),
									Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: Text(
                          "Last Name : ",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                      ), 
                      Center(
                        child: Text(
                          snapshot.data![index].lastName,
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
                  ),
									Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: Text(
                          "email : ",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                      ),
                      Center(
                        child: Text(
                          snapshot.data![index].email,
                          textAlign: TextAlign.center,
													style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 10),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
