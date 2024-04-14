import 'dart:convert';

import 'package:flutter/services.dart';

class Helper{

  /// MALE



  Future<List> getMaleSneakersTemp() async{
    final malesneakers = await rootBundle.loadString("Assets/Json/Shoes.json");
    final maledata = jsonDecode(malesneakers);
    print("MaleSneakers Data Is ${maledata}");
    return maledata;
  }

  Future<List> getFeMaleSneakersTemp() async{
    final femalesneakers = await rootBundle.loadString("Assets/Json/Shoes.json");
    final femaledata = jsonDecode(femalesneakers);
    print("FeMaleSneakers Data Is ${femaledata}");
    return femaledata;
  }


  Future<List> getKidsSneakersTemp() async{
    final kidssneakers = await rootBundle.loadString("Assets/Json/Shoes.json");
    final kidsdata = jsonDecode(kidssneakers);
    print("MaleSneakers Data Is ${kidsdata}");
    return kidsdata;
  }





  // /// MALE BY ID
  // Future<Sneakers> getMaleSneakersById(String Id) async{
  //   final  malesneakers = await rootBundle.loadString("Assets/Json/Shoes.json");
  //   final  maleList = sneakersFromJson(malesneakers);
  //   final singlesneaker = malesneakers.firstWhere((sneaker)=>sneaker.id==Id);
  //   return singlesneaker;
  // }
  //
  //
  // /// FEMALE BY ID
  // Future<Sneakers> getFemaleSneakersById() async{
  //   final  kidssneakers = await rootBundle.loadString("Assets/Json/Shoes.json");
  //   final kidsList = sneakersFromJson(kidssneakers);
  //   return kidsList;
  // }
  //
  //
  // /// KIDS  BY ID
  // Future<Sneakers> getKidsSneakersById() async{
  //   final  kidssneakers = await rootBundle.loadString("Assets/Json/Shoes.json");
  //   final kidsList = sneakersFromJson(kidssneakers);
  //   return kidsList;
  // }




}