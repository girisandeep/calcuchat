import 'package:flutter/material.dart';
import 'package:Calcuchat/CalculatorService.dart';

var currentUserEmail;

class ChatMessageListItem extends StatelessWidget {
  final ChatMessageSnapshot messageSnapshot;

  final Animation animation;

  ChatMessageListItem({this.messageSnapshot, this.animation});

  @override
  Widget build(BuildContext context) {
    return new SizeTransition(
      sizeFactor:
      new CurvedAnimation(parent: animation, curve: Curves.decelerate),
      child: new Container(
        margin: const EdgeInsets.symmetric(vertical: 10.0),
        child: new Row(
          children: messageSnapshot.is_system_user
              ? getReceivedMessageLayout(): getSentMessageLayout(),
        ),
      ),
    );
  }

  List<Widget> getSentMessageLayout() {
    return <Widget>[
      new Expanded(
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            new Text("Me",
                style: new TextStyle(
                    fontSize: 14.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold)),
            new Container(
              margin: const EdgeInsets.only(top: 5.0),
              child: new Text(messageSnapshot.message),
            ),
          ],
        ),
      ),
//      new Column(
//        crossAxisAlignment: CrossAxisAlignment.end,
//        children: <Widget>[
//          new Container(
//              margin: const EdgeInsets.only(left: 8.0),
//              child: new CircleAvatar(
//                backgroundImage:
//                new NetworkImage("Some photo url of avatar"),
//              )),
//        ],
//      ),
    ];
  }

  List<Widget> getReceivedMessageLayout() {
    return <Widget>[
//      new Column(
//        crossAxisAlignment: CrossAxisAlignment.start,
//        children: <Widget>[
//          new Container(
//              margin: const EdgeInsets.only(right: 8.0),
//              child: new CircleAvatar(
//                backgroundImage:
//                new NetworkImage('senderPhotoUrl'),
//              )),
//        ],
//      ),
      new Expanded(
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Text("Calc",
                style: new TextStyle(
                    fontSize: 14.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold)),
            new Container(
              margin: const EdgeInsets.only(top: 5.0),
              child: new Text(this.messageSnapshot.message),
            ),
          ],
        ),
      ),
    ];
  }
}