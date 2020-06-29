import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rcs_mobile/providers/recycled_items_provider.dart';
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
  Future _fetchAndSetItems;

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
//    _fetchAndSetItems =
//        Provider.of<RecycledItemsProvider>(context, listen: true)
//            .fetchAndSetItems();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    _fetchAndSetItems =
        Provider.of<RecycledItemsProvider>(context, listen: true)
            .fetchAndSetItems();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: RcsDrawer(),
      body: FutureBuilder(
          future: _fetchAndSetItems,
          builder: (context, snapshot) {
            return snapshot.connectionState == ConnectionState.waiting
                ? Center(child: CircularProgressIndicator())
                : CustomScrollView(
                    controller: _scrollController,
                    slivers: <Widget>[
                      SliverAppBar(
                        pinned: true,
                        actions: isShrink ? <Widget>[AvatarFlatButton()] : null,
                        backgroundColor: isShrink
                            ? Theme.of(context).colorScheme.surface
                            : Colors.transparent,
                        elevation: 4,
                        expandedHeight: Platform.isIOS
                            ? (MediaQuery.of(context).size.height) * 0.35
                            : (MediaQuery.of(context).size.height) * 0.45,
                        flexibleSpace: FlexibleSpaceBar(
                          background: Container(
                            padding: EdgeInsets.only(
                                top:
                                    (MediaQuery.of(context).size.height) * 0.1),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color:
                                  Theme.of(context).colorScheme.primaryVariant,
                              shape: BoxShape.rectangle,
                              borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(50)),
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
                      Consumer<RecycledItemsProvider>(
                        builder: (context, value, child) {
                          return value.getItems.length > 0
                              ? SliverList(
                                  delegate: SliverChildBuilderDelegate(
                                    (context, index) {
                                      return RecycledCard(
                                        recycledItem: value.getItems[index],
                                      );
                                    },
                                    childCount: value.getItems.length,
                                  ),
                                )
                              : child;
                        },
                        child: SliverList(
                          delegate: SliverChildListDelegate([
                            Container(
                              padding: EdgeInsets.all(20),
                              child: Text(
                                'You have no items yet',
                                style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.onPrimary,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                            ),
                          ]),
                        ),
                      ),
                    ],
                  );
          }),
      floatingActionButton: PickImageActionButton(),
    );
  }
}
