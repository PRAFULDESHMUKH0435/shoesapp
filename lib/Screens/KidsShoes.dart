import 'package:flutter/material.dart';
import 'package:antdesign_icons/antdesign_icons.dart';
import 'package:flutter/material.dart';
import '../Constants/Style/appstyle.dart';
import '../Constants/productcard.dart';
import '../Services/helper.dart';
import 'OrderByCategoryScreen.dart';
class KidsShoes extends StatefulWidget {
  Future<List> category;
  KidsShoes({super.key,required this.category});

  @override
  State<KidsShoes> createState() => _KidsShoesState();
}

class _KidsShoesState extends State<KidsShoes> {
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height*0.405,
          child: FutureBuilder<List>(
            future: widget.category,
            builder: (context,snapshot){
              print("Snasphot Data Is ${snapshot.data}");
              if(snapshot.connectionState==ConnectionState.waiting){
                return Center(child: CircularProgressIndicator());
              }else if(snapshot.hasError){
                return Text(snapshot.error.toString(),style: TextStyle(fontSize: 24,color: Colors.white),);
              }else{
                final male = snapshot.data;
                print("Current Male Data Is ${male}");
                return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context,index){
                      final shoe = snapshot.data![index];
                      return ProductCard(
                          price: shoe["price"],
                          category: shoe["category"],
                          id: shoe["id"],
                          name: shoe["name"],
                          sizes: shoe["sizes"],
                          image: shoe["imageurl"][0]);
                    });
              }
            },
          ),
        ),
        Column(
          children: [
            Padding(
              padding:const EdgeInsets.fromLTRB(12,20,12,20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Latest Shoes",style: appstyle(24, Colors.black, FontWeight.bold),),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>OrderByCategoryScreen(category:widget.category,)));
                    },
                    child: Row(
                      children: [
                        Text("Show All",style: appstyle(24, Colors.black, FontWeight.bold),),
                        Icon(AntIcons.caretRightFilled)
                      ],),
                  ),
                ],
              ),
            )
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height*0.13,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 6,
              itemBuilder: (context,index){
                return Padding(
                  padding:const EdgeInsets.all(8.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height*0.12,
                    width: MediaQuery.of(context).size.width*0.28,
                    decoration:const BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.all(Radius.circular(16.0)),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.white,
                              spreadRadius: 1,
                              blurRadius: 0.8,
                              offset: Offset(0, 1)
                          )
                        ]
                    ),
                    child: Image.asset("Assets/Images/shoes.jpg",fit: BoxFit.fitWidth,),
                  ),
                );
              }),
        )
      ],
    );
  }
}
