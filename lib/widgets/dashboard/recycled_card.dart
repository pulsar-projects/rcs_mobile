import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class RecycledCard extends StatelessWidget {
  final int index;

  const RecycledCard({
    Key key,
    this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                      offset: Offset(0, 2), // changes position of shadow
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
                          image:
                              NetworkImage('https://via.placeholder.com/80')))),
            ),
          ],
        ),
      ),
    );
  }
}
