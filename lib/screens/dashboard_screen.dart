import 'dart:io';

import 'package:flutter/material.dart';
import 'package:rcs_mobile/widgets/common/index.dart';
import 'package:rcs_mobile/widgets/dashboard/index.dart';

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
            actions: isShrink ? <Widget>[AvatarFlatButton()] : null,
            backgroundColor: isShrink ? Theme.of(context).colorScheme.surface : Colors.transparent,
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
                  color: Theme.of(context).colorScheme.primaryVariant,
                  shape: BoxShape.rectangle,
                  borderRadius:
                      const BorderRadius.only(bottomLeft: Radius.circular(50)),
                ),
                child: Column(
                  children: <Widget>[
                    UserAvatar(),
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: UserDetails(),
                    ),
                    UserStats(),
                    SizedBox(height: 15),
                    SearchBar(editingController: editingController)
                  ],
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return RecycledCard(index: index,);
              },
              childCount: 50,
            ),
          ),
        ],
      ),
      floatingActionButton: PickImageActionButton(),
    );
  }
}
