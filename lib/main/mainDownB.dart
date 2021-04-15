import 'package:flutter/material.dart';
import '../global/globalVars.dart' as Global;
import 'package:get/get.dart';
import 'package:alsharq/view/dialogView.dart';

class mainDownBotton extends StatelessWidget {
  // showCustomDialog show = new showCustomDialog();
  showCustomDialog show;
  String name;
  IconData icon;
  String RName;
  Color color = Colors.white.withOpacity(0.7);
  mainDownBotton(this.name, this.icon, this.RName);
  @override
  Widget build(BuildContext context) {
    return buildFlatButton();
  }

  FlatButton buildFlatButton() {
    return FlatButton(
      minWidth: 125,
      onPressed: () => {
        RName == '/MassegeView'
            ? {
                show = new showCustomDialog(),
                show.show_Message(),
              }
            : Get.toNamed(RName, arguments: [
                Global.Gpass,
                Global.Gtoken,
              ]),
        color = Color(0xff8e0016)
      },
      child: Column(
        children: <Widget>[
          Icon(
            icon = this.icon,
            color: color,
            size: 23,
          ),
          SizedBox(height: 10),
          Text(
            name,
            style: TextStyle(
              fontSize: 12,
              color: color,
            ),
          )
        ],
      ),
    );
  }
}
