import 'package:ecommerce_app/presentation/widgets/button.dart';
import 'package:flutter/material.dart';

class AdminDashBoard extends StatelessWidget {
  const AdminDashBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.primary,
        appBar: AppBar(
            leading: backButton(
              nextPageName: "/home",
            ),
            backgroundColor: Theme.of(context).colorScheme.primary),
        body: DashBoard());
  }
}

class DashBoard extends StatelessWidget {
  const DashBoard({super.key});

  @override
  Widget build(BuildContext context) {
    var children = [
      Container(
        width: 200,
        height: 300,
        color: Colors.red,
      ),
      Container(
        width: 300,
        height: 200,
        color: Colors.red,
      ),
      Container(
        width: 200,
        height: 300,
        color: Colors.red,
      ),
      Container(
        width: 400,
        height: 100,
        color: Colors.red,
      ),
      Container(
        width: 200,
        height: 300,
        color: Colors.red,
      ),
      Container(
        width: 140,
        height: 500,
        color: Colors.red,
      ),
      Container(
        width: 200,
        height: 300,
        color: Colors.red,
      ),
      Container(
        width: 200,
        height: 300,
        color: Colors.red,
      ),
    ];
    return Container(
        padding: EdgeInsets.all(40),
        child: Wrap(
            direction: Axis.horizontal,
            spacing: 10,
            alignment: WrapAlignment.spaceAround,
            runAlignment: WrapAlignment.start,
            children: [
              Container(
                width: 300,
                child: Card(
                  color: Theme.of(context).colorScheme.secondary,
                  child: Container(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Recent Reviews",
                              style: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.onPrimary),
                            ),
                            Text(
                              "View All",
                              style: TextStyle(color: Colors.orange),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        
                        SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  CircleAvatar(
                                    child: Icon(Icons.person),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [

                                      Text(
                                        "User",
                                        style: TextStyle(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onPrimary),
                                      ),
                                      Row(
                                children: [1, 2, 3, 4, 5, 6, 7].map(
                                  (e) {
                                    var color =
                                        Theme.of(context).colorScheme.onSecondary;
                                    var icon = Icons.star_border;
                                    if (e == 7) {
                                      return Text(
                                        "($e)",
                                        style: TextStyle(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onSecondary),
                                      );
                                    } else if (e == 6) {
                                      return SizedBox(
                                        width: 10,
                                      );
                                    } else if (e >= 0) {
                                      icon = Icons.star;
                                      color = Colors.yellow;
                                    }
                                    return Icon(icon, color: color);
                                  },
                                ).toList(),
                              ),
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(
                            height: 5,
                          ),
                              
                              SizedBox(
                            height: 15,
                          ),
                              Text(
                                "A very good Product",
                                style: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSecondary),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ]));
  }
}
