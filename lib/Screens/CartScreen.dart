import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(0.2),
      body: SafeArea(
        minimum: EdgeInsets.symmetric(horizontal: 15.0),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "My Cart",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 15,
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      return Slidable(
                        endActionPane: ActionPane(
                            motion: StretchMotion(),
                            children: [
                              SlidableAction(onPressed:(context){},icon: Icons.share,backgroundColor: Colors.green,)
                            ],
                            ),
                        child: Stack(
                          children: [
                            Container(
                              height: 150,
                              margin: EdgeInsets.symmetric(vertical: 5.0),
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(14.0)),
                                  color: Colors.white),
                              child: Row(
                                children: [
                                  Expanded(
                                      flex: 2,
                                      child: Container(
                                        child:
                                            Image.asset("Assets/Images/nike.png"),
                                      )),
                                  Expanded(
                                    flex: 6,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Original Superstar",
                                          style: TextStyle(
                                              fontSize: 22,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text("Kids Running",
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.grey)),
                                        Row(
                                          children: [
                                            SizedBox(
                                              width: 18,
                                            ),
                                            Text("\$89.99",
                                                style: TextStyle(
                                                    fontSize: 22,
                                                    fontWeight: FontWeight.bold)),
                                            SizedBox(
                                              width: 18,
                                            ),
                                            Row(
                                              children: [
                                                Text("Size",
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.grey)),
                                                SizedBox(
                                                  width: 8,
                                                ),
                                                Text("4.0",
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.grey))
                                              ],
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                      flex: 2,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Container(
                                            child: Icon(Icons.remove),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(Radius.circular(2.0)),
                                              color: Colors.grey
                                            ),
                                          ),
                                          Text("1",style: TextStyle(fontSize: 20),),
                                          Container(
                                            child: Icon(Icons.add,color: Colors.white,),
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.all(Radius.circular(2.0)),
                                                color: Colors.black
                                            ),
                                          ),
                                        ],
                                      ))
                                ],
                              ),
                            ),
                            Positioned(
                                bottom: -1,
                                child: Container(
                                  width: 45,
                                  decoration: BoxDecoration(
                                      color: Colors.black,
                                      shape: BoxShape.rectangle,
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(14.0))),
                                  child: Icon(
                                    Icons.delete,
                                    color: Colors.white,
                                  ),
                                ))
                          ],
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () {},
        child: Container(
          height: 50,
          margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 0.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(14.0)),
            color: Colors.black,
          ),
          child: Center(
              child: Text(
            "Proceed To CheckOut",
            style: TextStyle(
                fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
          )),
        ),
      ),
    );
  }
}
