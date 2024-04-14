import 'package:antdesign_icons/antdesign_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../Constants/StaggeredCard.dart';

class OrderByCategoryScreen extends StatefulWidget {
   Future<List> category;
  OrderByCategoryScreen({super.key , required this.category});

  @override
  State<OrderByCategoryScreen> createState() => _OrderByCategoryScreenState();
}

class _OrderByCategoryScreenState extends State<OrderByCategoryScreen>with TickerProviderStateMixin<OrderByCategoryScreen>  {



  late final TabController _tabController = TabController(
      length: 3,
      vsync: this);


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(12.0))
        ),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.08,left: 20,right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap:(){
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.close,color: Colors.white,size: 30,)),
                  GestureDetector(
                      onTap:(){
                        OpenFilter(context);
                      },
                      child: Icon(AntIcons.filterTwotone,color: Colors.white,size: 30,))
                ],
              ),
            ),
            // Padding(
            //   padding:EdgeInsets.zero,
            //   child: TabBar(
            //       indicatorSize: TabBarIndicatorSize.label,
            //       indicatorColor: Colors.transparent,
            //       isScrollable: true,
            //       controller: _tabController,
            //       labelColor: Colors.white,
            //       labelStyle: appstyle(24, Colors.white, FontWeight.bold),
            //       unselectedLabelColor: Colors.grey.withOpacity(0.3),
            //       tabs: [
            //         Tab(text: "Mens Shoes",),
            //         Tab(text: "Women Shoes",),
            //         Tab(text: "Kids Shoes",),
            //       ]
            //   ),
            // ),
            Expanded(
              child: FutureBuilder(
                  future: widget.category,
                  builder: (context,snapshot){
                    return GridView.builder(
                        itemCount: snapshot.data!.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                        itemBuilder: (context,index){
                          var singleitem = snapshot.data![index];
                          return StaggeredCard(
                            imgurl: singleitem["imageurl"][0],
                            name: singleitem["name"],
                            price: singleitem["price"],
                          );
                        });
                  }),
            ),
          ],
        ),
      ),
    );



  }
}

Future<dynamic> OpenFilter(context) {
  double  slidervalue =0.5;
  return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context){
           return Container(
             // height: double.infinity,
             // width: double.infinity,
             decoration: BoxDecoration(
                 color: Colors.white70,
                 borderRadius: BorderRadius.only(
                     topLeft: Radius.circular(14.0),
                     topRight: Radius.circular(14.0)
                 )
             ),
             child: Container(
               child: Column(
                 mainAxisSize: MainAxisSize.min,
                 children: [
                   Text("Filter",style: TextStyle(fontSize: 45,fontWeight: FontWeight.bold),),
                   SizedBox(height: 15,),
                   /// FOR GENDER
                   Text("Gender",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                   SizedBox(height: 8,),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                     children: [
                       ReUsableButton("Mens",Colors.black),
                       ReUsableButton("Womens",Colors.grey),
                       ReUsableButton("Kids",Colors.grey),

                     ],
                   ),
                   /// FOR CATEGORIES
                   SizedBox(height: 8,),
                   Text("Categories",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                   SizedBox(height: 8,),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                     children: [
                       ReUsableButton("Shoes",Colors.grey),
                       ReUsableButton("Apparels",Colors.black),
                       ReUsableButton("Accesori",Colors.grey),

                     ],
                   ),
                   /// FOR CATEGORIES
                   SizedBox(height: 8,),
                   Text("Price",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                   Slider(
                       value: slidervalue,
                       activeColor: Colors.black,
                       inactiveColor: Colors.grey,
                       divisions: 10,
                       label: "Price",
                       onChanged: (newvalue){

                       }),
                   /// FOR Brands
                   SizedBox(height: 8,),
                   Text("Brands",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                   Container(
                     margin: EdgeInsets.only(bottom: 8.0),
                     height: 120,
                     child: ListView.builder(
                         scrollDirection: Axis.horizontal,
                         itemCount: 4,
                         itemBuilder: (context,index){
                           return SingleItemBrandCard("https://w7.pngwing.com/pngs/578/20/png-transparent-adidas-adidas-angle-text-logo-thumbnail.png");
                         }),
                   )
                 ],
               ),
             ),
           );
      });
}

 SingleItemBrandCard(imgurl) {
  return Container(
    height: 50,
    width: 100,
    margin: EdgeInsets.all(5.0),
    decoration: BoxDecoration(
      image: DecorationImage(image: NetworkImage(imgurl),fit: BoxFit.fill),
      color: Colors.grey,
      borderRadius: BorderRadius.all(Radius.circular(14.0))
    ),
  );
}

ReUsableButton(label,color) {
  return MaterialButton(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(14.0)),
          border: Border.all(color: Colors.black,width: 1.0)
        ),
          child:Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(label,style: TextStyle(fontSize: 15,color: color),))
      ),
      onPressed: null);
}


