import 'package:filmstv/screen/home.dart';
import 'package:filmstv/screen/movies.dart';
import 'package:filmstv/screen/tvs.dart';
import 'package:flutter/material.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class HomeScreenMain extends StatefulWidget {
  const HomeScreenMain({Key? key}) : super(key: key);

  @override
  State<HomeScreenMain> createState() => _HomeScreenMainState();
}

class _HomeScreenMainState extends State<HomeScreenMain> with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey<ScaffoldState>();

  static const List<Tab> myTabs = <Tab>[
    Tab(text: 'Home'),
    Tab(text: 'Movies'),
    Tab(text: 'TVs'),
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
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(30.0),
            child: Container(
              height: 35,
              padding: const EdgeInsets.only(left: 20, right: 20),
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
              HomeScreenHome(),
              HomeScreenMovies(),
              HomeScreenTvs(),
            ],
          ),
        ),
      ),
    );
  }
}
