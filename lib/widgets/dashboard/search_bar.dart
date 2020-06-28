import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key key,
    @required this.editingController,
  }) : super(key: key);

  final TextEditingController editingController;

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}