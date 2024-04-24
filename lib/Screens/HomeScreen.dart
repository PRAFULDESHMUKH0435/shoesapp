import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shoesapp/Services/helper.dart';
import '../Constants/Style/appstyle.dart';
import 'KidsShoes.dart';
import 'MensShoes.dart';
import 'WomensShoes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>with TickerProviderStateMixin<HomeScreen> {

  late final TabController _tabController = TabController(
      length: 3,
      vsync: this);

  late Future<List> _male ;
  late Future<List> _female ;
  late Future<List> _kids ;

   void getMale(){
     _male = Helper().getMaleSneakersTemp();
   }

  void getFeMale(){
    _female = Helper().getFeMaleSneakersTemp();
  }

  void getKids(){
    _kids = Helper().getKidsSneakersTemp();
  }



  @override
  void initState() {
    // TODO: implement initState
     getMale();
     getFeMale();
     getKids();
     super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE2E2E2),
      body:SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(16, 45, 0, 0),
                height: MediaQuery.of(context).size.height*0.4,
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage('Assets/Images/background.jpg'))
                ),
                child: Container(
                  padding: EdgeInsets.only(left: 8,bottom: 15),
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Athletics Shoes",style: appstylewithht(42,Colors.white,FontWeight.bold,1.2),),
                      Text("Collection",style: appstylewithht(42,Colors.white,FontWeight.bold,1.2)),
                      Padding(
                        padding:EdgeInsets.zero,
                        child: TabBar(
                            indicatorSize: TabBarIndicatorSize.label,
                            indicatorColor: Colors.transparent,
                            isScrollable: true,
                            controller: _tabController,
                            labelColor: Colors.white,
                            labelStyle: appstyle(24, Colors.white, FontWeight.bold),
                            unselectedLabelColor: Colors.grey.withOpacity(0.3),
                            tabs: [
                              Tab(text: "Mens Shoes",),
                              Tab(text: "Women Shoes",),
                              Tab(text: "Kids Shoes",),
                            ]),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.265),
                child: Container(
                  padding: EdgeInsets.only(left: 12),
                  child: TabBarView(
                      controller: _tabController,
                      children: [
                        MensShoes(category: _male,),
                        WomensShoes(category: _female,),
                        KidsShoes(category: _kids,),
                      ]),
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}
