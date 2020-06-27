import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rcs_mobile/widgets/index.dart';

class DashboardScreen extends StatefulWidget {
  static const routeName = '/dashboard';

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  TextEditingController editingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    RcsAppBar rcsAppBar = RcsAppBar();

    return Scaffold(
      appBar: rcsAppBar,
      drawer: RcsDrawer(),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            overflow: Overflow.visible,
            children: <Widget>[
              Container(
                width: double.infinity,
                height: (MediaQuery.of(context).size.height) * 0.4 -
                    rcsAppBar.preferredSize.height,
                decoration: BoxDecoration(
                  color: Color(0xFFbbedc4),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.only(
                      bottomLeft:
                          Radius.circular(rcsAppBar.preferredSize.height * 2)),
                ),
                //child: Text('body'),
              ),
              Positioned(
                  top: 20,
                  left: 20,
                  child: Container(
                    width: MediaQuery.of(context).size.width - 40,
                    child: TextField(
                      onChanged: (value) {
                        //TODO: implement search handler
                      },
                      controller: editingController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        labelText: "search your items",
                        labelStyle: TextStyle(fontSize: 20),
                        hintStyle: TextStyle(fontSize: 16),
                        helperStyle: TextStyle(fontSize: 16),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          borderSide: BorderSide(
                            color: Color(0xFF70b57c),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          borderSide: BorderSide(color: Color(0xFF70b57c)),
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.all(
                        Radius.circular(rcsAppBar.preferredSize.height * 0.2),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xFF70b57c).withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                  )),
/*              Positioned(
                top: 85,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 3,
                  decoration: BoxDecoration(
                    color: Color(0xFF70b57c),
                    shape: BoxShape.rectangle,
                    borderRadius:
                    BorderRadius.only(
                      topRight:
                      Radius.circular(3),
                    ),
                  ),
                ),
              ),*/
              Positioned(
                top: 90,
                left: 10,
                child: Container(
                  width: MediaQuery.of(context).size.width - 20,
                  height: MediaQuery.of(context).size.height,
                  child: ShaderMask(
                    shaderCallback: (Rect bounds) {
                      return LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: [0.4, 0.99],
                        colors: <Color>[Colors.transparent, Color(0xFFbbedc4)],
                      ).createShader(bounds);
                    },
                    blendMode: BlendMode.dstOut,
                    child: ListView.builder(
                      itemCount: 50,
                      itemBuilder: (context, index) {
                        return SizedBox(
                          height: 80,
                          child: Padding(
                            padding: EdgeInsets.all(5),
                            child: Stack(
                              overflow: Overflow.visible,
                              children: <Widget>[
                                Positioned(
                                  top: 0,
                                  left: 20,
                                  child: Container(
                                    alignment: Alignment.centerLeft,
                                    width:
                                        MediaQuery.of(context).size.width - 55,
                                    height: 60,
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 25),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                DateFormat('yyyy-MM-dd kk:mm')
                                                    .format(DateTime.now()),
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w300,
                                                    color: Colors.white),
                                              ),
                                              Text(
                                                'Your Item $index',
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white),
                                              ),
                                              Container(
                                                height: 3,
                                                width: 100,
                                                decoration: BoxDecoration(
                                                  color: Color(0xFFbbedc4),
                                                  shape: BoxShape.rectangle,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topRight:
                                                        Radius.circular(3),
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                'Item $index short description...',
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w200,
                                                    color: Colors.white),
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
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                      color: Color(0xFF70b57c),
                                      shape: BoxShape.rectangle,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(
                                            rcsAppBar.preferredSize.height *
                                                0.2),
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color(0xFF70b57c)
                                              .withOpacity(0.5),
                                          spreadRadius: 5,
                                          blurRadius: 7,
                                          offset: Offset(0,
                                              3), // changes position of shadow
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 10,
                                  left: 0,
                                  child: CircleAvatar(
                                    radius: 20,
                                    backgroundImage: NetworkImage(
                                        'https://via.placeholder.com/150'),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //TODO: implement handler
        },
        child: Icon(Icons.add),
        backgroundColor: Color(0xFF70b57c),
      ),
    );
  }
}