import 'package:flutter/material.dart';
import 'package:rcs_mobile/screens/recycle_item_add_screen.dart';

class PickImageActionButton extends StatelessWidget {
  const PickImageActionButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.image, color: Theme.of(context).colorScheme.secondaryVariant,),
      tooltip: "Pick Image from gallery",
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RecycleItemAddScreen(),
          ),
        );
      },
      backgroundColor: Theme.of(context).colorScheme.primary,
    );
  }
}