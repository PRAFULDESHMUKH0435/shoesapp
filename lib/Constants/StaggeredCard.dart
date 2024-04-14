import 'package:flutter/material.dart';
import 'package:shoesapp/Constants/Style/appstyle.dart';
class StaggeredCard extends StatelessWidget {
  String imgurl;
  String name;
  String price;
  StaggeredCard({required this.imgurl,required this.name,required this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12.0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14.0)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Expanded(
          //     child: Image.network(imgurl,fit: BoxFit.fitWidth,width: double.infinity,)),
          //
         Expanded(child: Container(
           // height: MediaQuery.of(context).size.height*0.23,
           decoration: BoxDecoration(
               image: DecorationImage(
                   image: NetworkImage(imgurl),fit: BoxFit.fill)
           ),
         ),),
          Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(name,style: appstyle(18, Colors.black, FontWeight.bold),),
                  Text("\$${price}",style: appstyle(16, Colors.black, FontWeight.bold),)
                ],
              )),

        ],
      ),
    );
  }
}
