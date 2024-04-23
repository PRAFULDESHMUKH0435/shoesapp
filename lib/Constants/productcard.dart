import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shoesapp/Constants/Style/appstyle.dart';
import 'package:shoesapp/Screens/SingleItemScreen.dart';
class ProductCard extends StatelessWidget {
  String price,category,id,name;
  List image;
  List sizes;
  ProductCard({super.key,required this.price,required this.category,required this.id,required this.name,required this.image,required this.sizes});

  @override
  Widget build(BuildContext context) {
    bool _isselected = true;
    return  Padding(
      padding: EdgeInsets.fromLTRB(8, 0, 20, 0),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(16)),
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width*0.6,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.white,
                spreadRadius: 1,
                blurRadius: 0.6,
                offset: Offset(1,1)
              )
            ]
          ),

            child: GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>SingleItemScreen(
                  price: price,
                  category: category,
                  id: id,
                  name: name,
                  sizes: sizes,
                  imageurl: image,
                )));
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height*0.23,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(image[0]),fit: BoxFit.fill)
                          ),
                        ),

                        Positioned(
                            right: 10,
                            top: 10,
                            child: GestureDetector(
                              onTap: null,
                              child: Icon(Icons.favorite_outline),
                            ))
                      ],
                    ),

                    Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(name,style: appstylewithht(35, Colors.black, FontWeight.bold, 1.1),),
                            Text(category,style: appstylewithht(18, Colors.grey, FontWeight.bold, 1.5),),
                          ],
                        ),
                    ),
                    Expanded(
                      child: Padding(
                          padding: EdgeInsets.only(left: 8.0,right: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("\$20",style: appstylewithht(30, Colors.black, FontWeight.w600,1),),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text("Colors",style: appstyle(18, Colors.grey, FontWeight.w500),),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(4.0),
                                    child: ChoiceChip(
                                        label: Text(""),
                                        selected: false,
                                        visualDensity: VisualDensity.compact,
                                        selectedColor: Colors.green,
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                      ),
                    )
                  ],
                        ),
            ),
        ),
      ),
    );
  }
}
