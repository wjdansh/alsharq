import 'package:flutter/material.dart';

class mainv extends StatefulWidget {
  @override
  _mainvState createState() => _mainvState();
}

class _mainvState extends State<mainv> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white.withOpacity(0.1),
      width: 50,
      height: 600,
      child: ListView(
        itemExtent: 200,
        children: [
          // dahcard;
          Card(
              child: Container(
            // height: 300,
            color: Colors.white,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    color: Colors.orange,
                    height: 40,
                    child: Row(
                      children: <Widget>[
                        IconButton(
                          icon: Icon(
                            Icons.filter_frames_outlined,
                            color: Colors.white.withOpacity(0.8),
                          ),
                          onPressed: () {},
                        ),
                        Text(
                          'MyAccounts Summary',
                          style: TextStyle(
                              color: Colors.white.withOpacity(0.8),
                              fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    // width: 20,
                    // height: 300,
                    color: Colors.white,
                    child: displayAccoutList(),

                    // Text("part 1",
                    //     style: TextStyle(fontSize: 25)),
                  ),
                ],
              ),
            ),
          )),
          Card(
              child: Container(
            //height: 300,
            //color: Colors.white,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    color: Color(0xff204d64),
                    height: 40,
                    child: Row(
                      children: <Widget>[
                        IconButton(
                          icon: Icon(
                            Icons.pie_chart_outline_outlined,
                            color: Colors.white.withOpacity(0.8),
                          ),
                          onPressed: () {},
                        ),
                        Text(
                          'My Expenses',
                          style: TextStyle(
                              color: Colors.white.withOpacity(0.8),
                              fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    // width: 100,
                    // height: 190,
                    color: Colors.white,
                    child: Column(
                      children: [
                        Container(
                          width: 190,
                          height: 70,
                          child: Image.asset("assets/images/iconExp.png"),
                        ),

                        Text("Are you speding more on shopping or dining? ",
                            style: TextStyle(fontSize: 16)),
                        Text("Are you speding more on shopping or dining? ",
                            style: TextStyle(fontSize: 10, color: Colors.grey)),
                        // Padding(
                        //   child: Container(
                        //     child:
                        OutlineButton(
                          highlightedBorderColor: Colors.white,
                          borderSide: BorderSide(color: Colors.red, width: 2.0),
                          highlightElevation: 0.0,
                          splashColor: Colors.red,
                          highlightColor: Colors.white,
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0),
                          ),
                          child: Text(
                            "Let's go!",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.red,
                                fontSize: 20),
                          ),
                          onPressed: () {},
                          // ),
                          // height: 50,
                        ),
                        //padding: EdgeInsets.only(top: 10, left: 20, right: 20),
                        // ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )),
          Card(
              child: Container(
            //height: 300,
            color: Colors.white,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    color: Colors.green,
                    height: 40,
                    child: Row(
                      children: <Widget>[
                        IconButton(
                          icon: Icon(
                            Icons.credit_card,
                            color: Colors.white.withOpacity(0.8),
                          ),
                          onPressed: () {},
                        ),
                        Text(
                          'My Cards',
                          style: TextStyle(
                              color: Colors.white.withOpacity(0.8),
                              fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                  Container(
                      width: 190,
                      height: 170,
                      //color: Colors.white,
                      child: Image.asset("assets/images/card.png")), //
                ],
              ),
            ),
          )),
          Card(
              child: Container(
            //height: 200,
            //color: Colors.white,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    color: Color(0xff000080),
                    height: 40,
                    child: Row(
                      children: <Widget>[
                        IconButton(
                          icon: Icon(
                            Icons.article_outlined,
                            color: Colors.white.withOpacity(0.8),
                          ),
                          onPressed: () {},
                        ),
                        Text(
                          'BLF News',
                          style: TextStyle(
                              color: Colors.white.withOpacity(0.8),
                              fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    // width: 400,
                    // height: 200,
                    color: Colors.white,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                                height: 50,
                                width: 50,
                                child: Image.asset("assets/images/ban.jpg")),
                            Column(
                              children: [
                                Text(
                                    ' standard dummy text ever since the when ...',
                                    style: TextStyle(fontSize: 15.0)),
                                Text(
                                    "is simply dummy text of the printing and typesetting industry \n Lorem Ipsum has been the industry's.",
                                    style: TextStyle(
                                        fontSize: 12.0, color: Colors.grey))
                              ],
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                                height: 50,
                                width: 50,
                                child:
                                    Image.asset("assets/images/download.png")),
                            Column(
                              children: [
                                Text(
                                    ' standard dummy text ever since the when ...',
                                    style: TextStyle(fontSize: 15.0)),
                                Text(
                                    "is simply dummy text of the printing and typesetting industry \n Lorem Ipsum has been the industry's.",
                                    style: TextStyle(
                                        fontSize: 12.0, color: Colors.grey))
                              ],
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                                height: 50,
                                width: 50,
                                child: Image.asset("assets/images/news.jpg")),
                            Column(
                              children: [
                                Text(
                                    ' standard dummy text ever since the when ...',
                                    style: TextStyle(fontSize: 15.0)),
                                Text(
                                    "is simply dummy text of the printing and typesetting industry \n Lorem Ipsum has been the industry's.",
                                    style: TextStyle(
                                        fontSize: 12.0, color: Colors.grey))
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )),
        ],
      ),
    );
  }

  Container accountItems(
          String item, String charge, String dateString, String type,
          {Color oddColour = Colors.white}) =>
      Container(
        decoration: BoxDecoration(color: oddColour),
        padding: EdgeInsets.only(top: 5.0, bottom: 5.0, left: 5.0, right: 5.0),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(item, style: TextStyle(fontSize: 12.0)),
                Text(charge,
                    style: TextStyle(
                        fontSize: 12.0, color: Colors.black.withGreen(200)))
              ],
            ),
            SizedBox(
              height: 5.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(dateString,
                    style: TextStyle(color: Colors.grey, fontSize: 10.0)),
                Text(type, style: TextStyle(color: Colors.grey, fontSize: 10.0))
              ],
            ),
          ],
        ),
      );

  displayAccoutList() {
    return
        // SingleChildScrollView(
        //   //  margin: EdgeInsets.all(15.0),
        //   child:
        Column(
      children: <Widget>[
        accountItems("Trevello App", r"+ $ 4,946.00", "28-04-16", "credit",
            oddColour: const Color(0xFFF7F7F9)),
        accountItems("Creative Studios", r"+ $ 5,428.00", "26-04-16", "credit"),
        accountItems("Amazon EU", r"+ $ 746.00", "25-04-216", "Payment",
            oddColour: const Color(0xFFF7F7F9)),
        accountItems(
            "Creative Studios", r"+ $ 14,526.00", "16-04-16", "Payment"),
        accountItems("Book Hub Society", r"+ $ 2,876.00", "04-04-16", "Credit",
            oddColour: const Color(0xFFF7F7F9)),
      ],
      // ),
    );
  }
}
