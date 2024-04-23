import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
class SingleItemScreen extends StatefulWidget {
  String price,category,id,name;
  List imageurl;
  List sizes;
  SingleItemScreen({super.key,required this.price,required this.category,required this.id,required this.name,required this.imageurl,required this.sizes});


  @override
  State<SingleItemScreen> createState() => _SingleItemScreenState();
}

class _SingleItemScreenState extends State<SingleItemScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            stretch: true,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap:(){
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.close)),
                GestureDetector(
                    onTap: (){

                    },
                    child: Icon(Icons.menu))
              ],
            ),
            bottom: PreferredSize(
                preferredSize: Size(double.infinity, 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:List.generate(widget.imageurl.length, (index){
                    return Padding(
                      padding: EdgeInsets.only(bottom: 8.0,left: 2.0,right: 2.0),
                      child: CircleAvatar(
                        radius: 10,
                        backgroundColor: Colors.black,
                      ),
                    );
                  }),
                )),
            backgroundColor: Colors.yellow,
            floating: true,
            pinned: true,
            collapsedHeight: 250,
            snap: true,
            flexibleSpace: FlexibleSpaceBar(
              background: PageView.builder(
                  itemCount: widget.imageurl.length,
                  scrollDirection: Axis.horizontal,
                  pageSnapping: true,
                  itemBuilder: (context,index){
                    return Image.network(widget.imageurl[index],fit: BoxFit.cover);
                  }),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.name,style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: Colors.black),),
                  Row(
                    children: [
                      Text("Men's Running",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Colors.grey)),
                     SizedBox(width: 18,),
                      RatingBar(
                          size: 25,
                          filledIcon: Icons.star,
                          emptyIcon: Icons.star_border_outlined,
                          filledColor: Colors.black,
                          onRatingChanged: (newrating){

                          })
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("\$79.00",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Colors.black)),
                     SizedBox(width: 8,),
                      Row(
                        children: [
                          Text("Colors",style: TextStyle(color: Colors.grey,fontSize: 22,fontWeight: FontWeight.bold),),
                          SizedBox(width: 8,),
                          CircleAvatar(
                            backgroundColor: Colors.black,
                            radius: 8,
                          ),
                          SizedBox(width: 2,),
                          CircleAvatar(
                            backgroundColor: Colors.red,
                            radius: 8,
                          ),
                        ],
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Text("Select Sizes",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Colors.black)),
                      SizedBox(width: 18,),
                      Text("View Size Guide",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Colors.grey)),
                    ],
                  ),
                  Container(
                     height: 50,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: widget.sizes.length,
                        itemBuilder: (context,index){
                          return GestureDetector(
                            onTap: null,
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 4.0),
                              child: CircleAvatar(
                                radius: 20,
                                backgroundColor: Colors.grey,
                                child: Text(widget.sizes[index]["size"],style: TextStyle(color: Colors.black),),
                              ),
                            ),
                          );
                        }),
                  ),
                  Divider(height: 2.0,color: Colors.black,),
                  Text("Adidas Cooling Shoes\n With Cooling Ventilations",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.black),),
                  Text("Adidas AG (German pronunciation: [ˈʔadiˌdas] ⓘ; stylized in all lowercase since 1949)[4] is a German athletic apparel and footwear corporation headquartered in Herzogenaurach, Bavaria, Germany. It is the largest sportswear manufacturer in Europe, and the second largest in the world, after Nike.[5][6] It is the holding company for the Adidas Group, which also owns an 8.33% stake of the football club Bayern München,[7] and Runtastic, an Austrian fitness technology company. Adidas's revenue for 2018 was listed at €21.915 billion.[")
                ],
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: GestureDetector(
        onTap: (){

        },
        child: Container(
          height: 50,
          margin: EdgeInsets.symmetric(horizontal: 25.0,vertical: 8.0),
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.all(Radius.circular(14.0))
          ),
           child: Row(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               Text("Add To Bag",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white),),
               SizedBox(width: 8,),
               Icon(Icons.shopping_bag,color: Colors.white,size: 25,)
             ],
           ),
        ),
      ),


    );



  }
}
