import 'package:flutter/material.dart';

AppBar buildAppBarWithTabBar(BuildContext context, String title, List<Tab> myTabs, TabController tabController) {
  return new AppBar(
    title: new Text(title),
    elevation: Theme.of(context).platform == TargetPlatform.iOS ? 0.0 : 3.0,
    bottom: TabBar(
        controller: tabController,
        tabs:myTabs)
  );
}

AppBar buildAppBar(BuildContext context, String title) {
	return new AppBar(
			title: new Text(title),
			elevation: Theme.of(context).platform == TargetPlatform.iOS ? 0.0 : 3.0,
	);
}