import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rcs_mobile/widgets/index.dart';
import 'package:rcs_mobile/screens/new_recycle.dart';

class DashboardScreen extends StatefulWidget {
  static const routeName = '/dashboard';

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  TextEditingController editingController = TextEditingController();
  ScrollController _scrollController;
  bool lastAppBarStatus = true;

  _scrollListener() {
    if (isShrink != lastAppBarStatus) {
      setState(() {
        lastAppBarStatus = isShrink;
      });
    }
  }

  bool get isShrink {
    return _scrollController.hasClients &&
        _scrollController.offset > (200 - kToolbarHeight);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    super.dispose();
  }

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: RcsDrawer(),
      body: CustomScrollView(
        controller: _scrollController,
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            actions: isShrink
                ? <Widget>[
                    AvatarFlatButton()
                  ]
                : null,
            backgroundColor: isShrink ? Color(0xFF4D9F69) : Colors.transparent,
            elevation: 4,
            expandedHeight: Platform.isIOS
                ? (MediaQuery.of(context).size.height) * 0.35
                : (MediaQuery.of(context).size.height) * 0.45,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                padding: EdgeInsets.only(
                    top: (MediaQuery.of(context).size.height) * 0.1),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xFF50AE72),
                  shape: BoxShape.rectangle,
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(50)),
                ),
                child: Column(
                  children: <Widget>[
                    Container(
                      child: CircleAvatar(
                        radius: 40,
                        backgroundImage: AssetImage(
                            'assets/sample/images/user-avatar.jpg'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Text(
                        'Irene Ford',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                    Stack(
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            color: Color(0xFF499763).withOpacity(0.5),
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                          ),
                          alignment: Alignment.centerRight,
                          child: Padding(
                              padding: EdgeInsets.only(right: 10),
                              child: Text(
                                '102 points',
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              )),
                          height: 35,
                          width: 210,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Color(0xFF499763),
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                          ),
                          alignment: Alignment.center,
                          child: Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: Text(
                              '34 recycled',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          height: 35,
                          width: 120,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      width: 300,
                      child: TextField(
                        onChanged: (value) {
                          //TODO: implement search handler
                        },
                        controller: editingController,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.search),
                          labelText: "search...",
                          labelStyle: TextStyle(fontSize: 20),
                          hintStyle: TextStyle(fontSize: 16),
                          helperStyle: TextStyle(fontSize: 16),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.transparent,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFFbbedc4).withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return SizedBox(
                  height: 140,
                  child: Padding(
                    padding: EdgeInsets.all(5),
                    child: Stack(
                      overflow: Overflow.visible,
                      children: <Widget>[
                        Positioned(
                          top: 0,
                          left: 25,
                          child: Container(
                            alignment: Alignment.centerLeft,
                            width: MediaQuery.of(context).size.width - 55,
                            height: 120,
                            child: Padding(
                              padding: EdgeInsets.only(left: 85),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        DateFormat('yyyy-MM-dd kk:mm')
                                            .format(DateTime.now()),
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w300,
                                          color: Color(0xFF19A765),
                                        ),
                                      ),
                                      Text(
                                        'Your Item $index',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFF284730),
                                        ),
                                      ),
                                      Container(
                                        height: 3,
                                        width: 100,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFbbedc4),
                                          shape: BoxShape.rectangle,
                                          borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(3),
                                            bottomLeft: Radius.circular(3),
                                          ),
                                        ),
                                      ),
                                      Text(
                                        'Item $index short description...',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          color: Color(0xFF19A765),
                                        ),
                                      )
                                    ],
                                  ),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: IconButton(
                                      tooltip: 'Add a new item',
                                      onPressed: () {
                                        //TODO: implement handler
                                      },
                                      icon: Icon(
                                        Icons.more_vert,
                                        color: Color(0xFF19A765),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xFF70b57c).withOpacity(0.2),
                                  spreadRadius: 2,
                                  blurRadius: 7,
                                  offset: Offset(
                                      0, 2), // changes position of shadow
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          top: 0,
                          left: 25,
                          child: Container(
                              width: 80.0,
                              height: 80.0,
                              decoration: new BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      bottomRight: Radius.circular(20)),
                                  image: new DecorationImage(
                                      fit: BoxFit.fill,
                                      image: NetworkImage(
                                          'https://via.placeholder.com/80')))),
                        ),
                      ],
                    ),
                  ),
                );
              },
              childCount: 50,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.image),
        tooltip: "Pick Image from gallery",
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NewRecycleScreen(),
            ),
          );
        },
        backgroundColor: Color(0xFF70b57c),
      ),
    );
  }
}
