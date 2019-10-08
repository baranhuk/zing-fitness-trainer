import 'package:flutter/material.dart';
import 'package:zing_fitnes_trainer/components/button.dart';
import 'package:zing_fitnes_trainer/utils/myColors.dart';
import 'package:zing_fitnes_trainer/components/infoCard.dart';

class InfoPages extends StatelessWidget {
  final String title;
  final String paramTitle1;
  final String paramValue1;
  final String paramTitle2;
  final String paramValue2;
  final String cardTitle;
  final Widget card;

  InfoPages(
      {Key key,
      this.title,
      this.paramTitle1,
      this.paramValue1,
      this.paramTitle2,
      this.paramValue2,
      this.cardTitle,
      this.card})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    var colors = new MyColors();
    return MaterialApp(
      title: "Bookings details",
      home: Scaffold(
        appBar: PreferredSize(
            preferredSize: Size(double.infinity, 50),
            child: LayoutBuilder(builder: (context, constraints) {
              return Container(
                color: colors.skyBlue,
                child: Row(children: [
                  Padding(
                    padding: EdgeInsets.only(right: 0),
                    child: IconButton(
                      padding: EdgeInsets.all(0),
                      alignment: Alignment.centerLeft,
                      icon: Icon(Icons.navigate_before),
                      onPressed: () {},
                    ),
                  ),
                  Padding(
                      padding:
                          EdgeInsets.only(left: constraints.maxWidth * 0.19),
                      child: Text(this.title,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w900)))
                ]),
              );
            })),
        body: InfoPagesBody(
          paramTitle1: this.paramTitle1,
          paramTitle2: this.paramTitle2,
          paramValue1: this.paramValue1,
          paramValue2: this.paramValue2,
        ),
      ),
    );
  }
}

class InfoPagesBody extends StatelessWidget {
  var paramTitle1;

  var paramTitle2;

  var paramValue1;

  var paramValue2;

  var cardTitle;

  var card;

  InfoPagesBody(
      {Key key,
      this.paramTitle1,
      this.paramValue1,
      this.paramTitle2,
      this.paramValue2,
      this.cardTitle,
      this.card})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var colors = MyColors();
    return Container(
        padding: EdgeInsets.only(bottom: 0, top: 10, left: 30, right: 30),
        color: colors.skyBlue,
        child: Column(
          children: <Widget>[
            IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 40),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                this.paramTitle1,
                                style: TextStyle(
                                    color: colors.deepBlue,
                                    fontSize: 13,
                                    height: 1.2),
                              ),
                              Text(
                                this.paramValue1,
                                style: TextStyle(
                                    color: colors.textBlack,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w900),
                              )
                            ]),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                this.paramTitle2,
                                style: TextStyle(
                                    color: colors.deepBlue,
                                    fontSize: 13,
                                    height: 1.2),
                              ),
                              Text(
                                this.paramValue2,
                                style: TextStyle(
                                    color: colors.textBlack,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w900),
                              )
                            ]),
                      ],
                    ),
                  ),
                  SizedBox(
                      width: size.width * 0.56,
                      child: Image.asset("assets/images/mng.png"))
                ],
              ),
            ),
            InfoCard(),
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Button(text: "ACCEPT"),
            )
          ],
        ));
  }
}
