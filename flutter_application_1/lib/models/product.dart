import 'package:flutter/material.dart';
class Product {
 final String id,name,description,imageAsset,iconAsset; final int price; final Color color,tint;
 const Product({required this.id,required this.name,required this.price,this.description='',this.imageAsset='',this.iconAsset='assets/icons/shoe.svg',this.color=const Color(0xFF2F5233),this.tint=const Color(0xFFE4EBE1)});
 Map<String,Object?> toMap()=>{'id':id,'name':name,'price':price.toDouble(),'description':description};
 factory Product.fromMap(Map<String,Object?> m)=>Product(id:m['id'].toString(),name:m['name'].toString(),price:(m['price'] as num).toInt(),description:(m['description']??'').toString());
}
final List<Product> dummyProducts=[
Product(id:'p1',name:'Sneakers Urban Runner',price:459000,description:'Sepatu sneakers untuk aktivitas sehari-hari.',imageAsset:'assets/images/sneaker_urban_runner.webp',iconAsset:'assets/icons/shoe.svg',color:Color(0xFF2F5233),tint:Color(0xFFE4EBE1)),
Product(id:'p2',name:'Tas Ransel Explore',price:329000,description:'Tas ransel praktis untuk sekolah dan bepergian.',imageAsset:'assets/images/tas_ransel_explore.jpg',iconAsset:'assets/icons/bag.svg',color:Color(0xFFB8863B),tint:Color(0xFFF3E7D3)),
Product(id:'p3',name:'Jaket Bomber Classic',price:389000,description:'Jaket bomber bergaya klasik.',imageAsset:'assets/images/jaket_bomber_classic.jpg',iconAsset:'assets/icons/jacket.svg',color:Color(0xFF54606B),tint:Color(0xFFE4E7EA)),
Product(id:'p4',name:'Topi Baseball Signature',price:129000,description:'Topi baseball untuk melengkapi penampilan.',imageAsset:'assets/images/topi_baseball_signature.jpg',iconAsset:'assets/icons/cap.svg',color:Color(0xFFA8503B),tint:Color(0xFFF1DED7)),];
