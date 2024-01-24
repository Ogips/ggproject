import 'package:filmstv/screen/my_list.dart';
import 'package:flutter/material.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class WatchListMain extends StatefulWidget {
  const WatchListMain({Key? key}) : super(key: key);

  @override
  State<WatchListMain> createState() => _WatchListMainState();
}

class _WatchListMainState extends State<WatchListMain> with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey<ScaffoldState>();

  static const List<Tab> myTabs = <Tab>[
    Tab(text: 'My List'),
    Tab(text: 'Download'),
  ];

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: myTabs.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Future<void> _handleRefresh() async {
    return await Future.delayed(const Duration(seconds: 2));
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: myTabs.length,
      child: Scaffold(
        key: _scaffoldkey,
        appBar: AppBar(
          title: Image.asset(
              'assets/images/logo_filmstv.png', // Replace with your actual logo image asset path
              fit: BoxFit.contain,
              height: 50,
            ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                color: Colors.white,
              ),
            ),
          ],
          backgroundColor: const Color.fromARGB(255, 62, 54, 54),
          // bottom: TabBar(
          //   tabs: myTabs,
          //   controller: _tabController,
          //   labelColor: Colors.white,
          //   unselectedLabelColor: Colors.white,
          //   isScrollable: true,
          //   indicatorColor: Colors.red,
          //   indicatorWeight: 3,
          //   indicatorSize: TabBarIndicatorSize.tab,
          // ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(30.0),
            child: Container(
              height: 35,
              padding: const EdgeInsets.only(left: 20, right: 20),
              // decoration: BoxDecoration(
              //   // color: Colors.white,
              //   borderRadius: BorderRadius.only(
              //     topLeft: Radius.circular(24.0),
              //     topRight: Radius.circular(24.0),
              //   ),
              // ),
              child: TabBar(
                tabs: myTabs,
                controller: _tabController,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.white,
                indicator: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                
              ),
            ),
          ),
        ),
        
        body: LiquidPullToRefresh(
          onRefresh: _handleRefresh,
          child: TabBarView(
            controller: _tabController,
            children: const [
              MyListScreen(),
              MyListScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
