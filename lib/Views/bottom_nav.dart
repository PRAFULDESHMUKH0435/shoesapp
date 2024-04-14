import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoesapp/Controllers/mainscreen_provider.dart';

import '../Constants/SingleItemBottomNavIcon.dart';
class BottomNavbar extends StatelessWidget {
  const BottomNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return  Consumer<MainScreenNotifier>(
      builder:(context,mainScreenNotifier,child){
        return SafeArea(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Container(
                padding: EdgeInsets.all(12),
                margin: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.all(Radius.circular(14.0))
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SingleItemBottomNavIcon(onTap: ()=>mainScreenNotifier.pageIndex=0,icon:mainScreenNotifier.pageIndex==0?Icons.home:Icons.home_outlined,),
                    SingleItemBottomNavIcon(onTap: ()=>mainScreenNotifier.pageIndex=1,icon:mainScreenNotifier.pageIndex==1?Icons.search:Icons.search_outlined,),
                    SingleItemBottomNavIcon(onTap: ()=>mainScreenNotifier.pageIndex=2,icon:mainScreenNotifier.pageIndex==2?Icons.add:Icons.add_outlined,),
                    SingleItemBottomNavIcon(onTap: ()=>mainScreenNotifier.pageIndex=3,icon:mainScreenNotifier.pageIndex==3?Icons.shopping_cart:Icons.shopping_cart_outlined,),
                    SingleItemBottomNavIcon(onTap: ()=>mainScreenNotifier.pageIndex=4,icon:mainScreenNotifier.pageIndex==4?Icons.person:Icons.person_outline,),
                  ],
                ),
              ),
            ));
      }
    );
  }
}
