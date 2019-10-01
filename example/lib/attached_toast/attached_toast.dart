import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:bot_toast/bot_toast.dart';

class AttachedToast extends StatefulWidget {
  @override
  _AttachedToastState createState() => _AttachedToastState();
}

class _AttachedToastState extends State<AttachedToast> {
  BuildContext targetContext;
  Offset target;
  double verticalOffset = 0;
  double horizontalOffset = 0;
  int second = 4;
  PreferDirection preferDirection = PreferDirection.topCenter;
  bool ignoreContentClick = false;
  bool onlyOne = true;
  bool allowClick = true;
  bool enableSafeArea = true;
  int backgroundColor = 0x00000000;
  int animationMilliseconds = 200;
  int animationReverseMilliseconds = 200;

  double buttonAlign = 0;

  CancelFunc show({BuildContext context, Offset target}) {
    return BotToast.showAttachedWidget(
        target: target,
        targetContext: context,
        verticalOffset: verticalOffset,
        horizontalOffset: horizontalOffset,
        duration: Duration(seconds: second),
        animationDuration:
        Duration(milliseconds: animationMilliseconds),
        animationReverseDuration:
        Duration(milliseconds: animationReverseMilliseconds),
        preferDirection: preferDirection,
        ignoreContentClick: ignoreContentClick,
        onlyOne: onlyOne,
        allowClick: allowClick,
        enableSafeArea: enableSafeArea,
        backgroundColor: Color(backgroundColor),
        attachedBuilder: (cancel) => (Card(
          color: Colors.amber,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    FlatButton.icon(
                      padding: EdgeInsets.all(5),
                      onPressed: (){
                        BotToast.showSimpleNotification(title: "Let's go travel together.😘");
                      },
                      label: Text("favorite"),
                      icon: Icon(Icons.favorite,color: Colors.redAccent),
                    ),
                    FlatButton.icon(
                      padding: EdgeInsets.all(5),
                      onPressed: (){
                        BotToast.showSimpleNotification(title: "Thank you for liking me.😝");
                      },
                      label: Text("bookmark"),
                      icon: Icon(Icons.bookmark,color: Colors.redAccent),
                    )                  ],
                ),
              ),
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AttachedToast"),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              GestureDetector(
                onTapDown: (details) {
                  show(target: details.globalPosition);
                },
                child: Card(
                  margin: EdgeInsets.symmetric(horizontal: 25),
                  color: Colors.black45,
                  child: Container(
                    height: 200,
                    alignment: Alignment.center,
                    child: Text(
                      "click me",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Align(
                  alignment: Alignment(buttonAlign, 0),
                  child: Builder(builder: (context) {
                    return RaisedButton(
                      onPressed: () {
                        show(context: context);
                      },
                      child: Text("AttachedToast"),
                    );
                  }),
                ),
              ),
              ListTile(
                title: Text("buttonAlign: $buttonAlign"),
                trailing: CupertinoSlider(
                  min: -1,
                  max: 1,
                  value: buttonAlign.toDouble(),
                  onChanged: (double value) {
                    setState(() {
                      buttonAlign = value;
                    });
                  },
                ),
              ),
              Text("$preferDirection",style: TextStyle(fontSize: 15),),
              Row(
                children: <Widget>[
                  Expanded(
                    child: SizedBox.shrink(),
                  ),
                  Expanded(
                      child: Radio(
                          value: PreferDirection.topLeft,
                          groupValue: preferDirection,
                          onChanged: (PreferDirection value) {
                            setState(() {
                              preferDirection = value;
                            });
                          })),
                  Expanded(
                      child: Radio(
                          value: PreferDirection.topCenter,
                          groupValue: preferDirection,
                          onChanged: (PreferDirection value) {
                            setState(() {
                              preferDirection = value;
                            });
                          })),
                  Expanded(
                      child: Radio(
                          value: PreferDirection.topRight,
                          groupValue: preferDirection,
                          onChanged: (PreferDirection value) {
                            setState(() {
                              preferDirection = value;
                            });
                          })),
                  Spacer(),
                ],
              ),
              Row(
                children: <Widget>[
                  Spacer(),
                  Expanded(
                      child: Text(
                    "topLeft",
                    textAlign: TextAlign.center,
                  )),
                  Expanded(
                      child: Text(
                    "topCenter",
                    textAlign: TextAlign.center,
                  )),
                  Expanded(
                      child: Text(
                    "topRight",
                    textAlign: TextAlign.center,
                  )),
                  Spacer(),
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                      child: Radio(
                          value: PreferDirection.leftTop,
                          groupValue: preferDirection,
                          onChanged: (PreferDirection value) {
                            setState(() {
                              preferDirection = value;
                            });
                          })),
                  Spacer(),
                  Spacer(),
                  Spacer(),
                  Expanded(
                      child: Radio(
                          value: PreferDirection.rightTop,
                          groupValue: preferDirection,
                          onChanged: (PreferDirection value) {
                            setState(() {
                              preferDirection = value;
                            });
                          })),
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                      child: Text(
                    "leftTop",
                    textAlign: TextAlign.center,
                  )),
                  Spacer(),
                  Spacer(),
                  Spacer(),
                  Expanded(
                      child: Text(
                    "rightTop",
                    textAlign: TextAlign.center,
                  )),
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                      child: Radio(
                          value: PreferDirection.leftCenter,
                          groupValue: preferDirection,
                          onChanged: (PreferDirection value) {
                            setState(() {
                              preferDirection = value;
                            });
                          })),
                  Spacer(),
                  Spacer(),
                  Spacer(),
                  Expanded(
                      child: Radio(
                          value: PreferDirection.rightCenter,
                          groupValue: preferDirection,
                          onChanged: (PreferDirection value) {
                            setState(() {
                              preferDirection = value;
                            });
                          })),
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                      child: Text(
                    "leftCenter",
                    textAlign: TextAlign.center,
                  )),
                  Spacer(),
                  Spacer(),
                  Spacer(),
                  Expanded(
                      child: Text(
                    "rightCenter",
                    textAlign: TextAlign.center,
                  )),
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                      child: Radio(
                          value: PreferDirection.leftBottom,
                          groupValue: preferDirection,
                          onChanged: (PreferDirection value) {
                            setState(() {
                              preferDirection = value;
                            });
                          })),
                  Spacer(),
                  Spacer(),
                  Spacer(),
                  Expanded(
                      child: Radio(
                          value: PreferDirection.rightBottom,
                          groupValue: preferDirection,
                          onChanged: (PreferDirection value) {
                            setState(() {
                              preferDirection = value;
                            });
                          })),
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                      child: Text(
                    "leftBottom",
                    textAlign: TextAlign.center,
                  )),
                  Spacer(),
                  Spacer(),
                  Spacer(),
                  Expanded(
                      child: Text(
                    "rightBottom",
                    textAlign: TextAlign.center,
                  )),
                ],
              ),
              Row(
                children: <Widget>[
                  Spacer(),
                  Expanded(
                      child: Radio(
                          value: PreferDirection.bottomLeft,
                          groupValue: preferDirection,
                          onChanged: (PreferDirection value) {
                            setState(() {
                              preferDirection = value;
                            });
                          })),
                  Expanded(
                      child: Radio(
                          value: PreferDirection.bottomCenter,
                          groupValue: preferDirection,
                          onChanged: (PreferDirection value) {
                            setState(() {
                              preferDirection = value;
                            });
                          })),
                  Expanded(
                      child: Radio(
                          value: PreferDirection.bottomRight,
                          groupValue: preferDirection,
                          onChanged: (PreferDirection value) {
                            setState(() {
                              preferDirection = value;
                            });
                          })),
                  Spacer(),
                ],
              ),
              Row(
                children: <Widget>[
                  Spacer(),
                  Expanded(
                      child: Text(
                    "bottomLeft",
                    textAlign: TextAlign.center,
                  )),
                  Expanded(
                      child: Text(
                    "bottomCenter",
                    textAlign: TextAlign.center,
                  )),
                  Expanded(
                      child: Text(
                    "bottomRight",
                    textAlign: TextAlign.center,
                  )),
                  Spacer(),
                ],
              ),
              SwitchListTile(
                value: ignoreContentClick,
                onChanged: (value) {
                  setState(() {
                    ignoreContentClick = value;
                  });
                },
                title: Text("ignoreContentClick: "),
              ),
              SwitchListTile(
                value: onlyOne,
                onChanged: (value) {
                  setState(() {
                    onlyOne = value;
                  });
                },
                title: Text("onlyOne: "),
              ),
              SwitchListTile(
                value: allowClick,
                onChanged: (value) {
                  setState(() {
                    allowClick = value;
                  });
                },
                title: Text("allowClick: "),
              ),
              SwitchListTile(
                value: enableSafeArea,
                onChanged: (value) {
                  setState(() {
                    enableSafeArea = value;
                  });
                },
                title: Text("enableSafeArea: "),
              ),
              ListTile(
                title: Text("duration:   ${second}s"),
                trailing: CupertinoSlider(
                  min: 1,
                  max: 20,
                  value: second.toDouble(),
                  onChanged: (double value) {
                    setState(() {
                      second = value.toInt();
                    });
                  },
                ),
              ),
              ListTile(
                title: Text("animationDuration:   ${animationMilliseconds}ms"),
                trailing: CupertinoSlider(
                  min: 100,
                  max: 1000,
                  divisions: 18,
                  value: animationMilliseconds.toDouble(),
                  onChanged: (double value) {
                    setState(() {
                      animationMilliseconds = value.toInt();
                    });
                  },
                ),
              ),
              ListTile(
                title: Text(
                    "animationReverseDuration:   ${animationReverseMilliseconds}ms"),
                trailing: CupertinoSlider(
                  min: 100,
                  max: 1000,
                  divisions: 18,
                  value: animationReverseMilliseconds.toDouble(),
                  onChanged: (double value) {
                    setState(() {
                      animationReverseMilliseconds = value.toInt();
                    });
                  },
                ),
              ),
              ListTile(
                title: Text("verticalOffset:   ${verticalOffset.toString()}"),
                trailing: CupertinoSlider(
                  min: 0,
                  max: 40,
                  value: verticalOffset.toDouble(),
                  onChanged: (double value) {
                    setState(() {
                      verticalOffset = value;
                    });
                  },
                ),
              ),
              ListTile(
                title:
                    Text("horizontalOffset:   ${horizontalOffset.toString()}"),
                trailing: CupertinoSlider(
                  min: 0,
                  max: 40,
                  value: horizontalOffset.toDouble(),
                  onChanged: (double value) {
                    setState(() {
                      horizontalOffset = value;
                    });
                  },
                ),
              ),
              ListTile(
                title: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Expanded(child: Text("backgroundColor:")),
                    Container(
                      height: 20,
                      width: 20,
                      color: Color(backgroundColor),
                    )
                  ],
                ),
                trailing: CupertinoSlider(
                  min: 0x00000000,
                  max: 0xffffffff,
                  value: backgroundColor.toDouble(),
                  onChanged: (double value) {
                    setState(() {
                      backgroundColor = value.toInt();
                    });
                  },
                ),
              ),
              Divider(),
              Text("code"),
              Divider(),
              Text(
                _code,
                textAlign: TextAlign.start,
              ),
              Divider(),
            ],
          ),
        ),
      ),
    );
  }
}

String _code = """
BotToast.showAttachedWidget(
        target: target,
        targetContext: context,
        verticalOffset: verticalOffset,
        duration: Duration(seconds: second),
        preferDirection: preferDirection,
        ignoreContentClick: ignoreContentClick,
        onlyOne: onlyOne,
        allowClick: allowClick,
        backgroundColor: Color(backgroundColor),
        attachedWidget: (cancel) => (Card(
              child: IconButton(
                padding: EdgeInsets.all(20),
                onPressed: (){
                  BotToast.showSimpleNotification(title: "Let's go travel together.😘");
                },
                icon: Icon(Icons.favorite,color: Colors.redAccent,),
              ),
)));
""";
