import 'dart:convert';

import 'package:epsi_shop/product.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProductPage extends StatelessWidget {
  const ProductPage({Key? key, required this.product}) : super(key: key);
  final Product product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fiche Produit n°${product.nom}"),
      ),
      body: Center(
        child: Container(
            padding: EdgeInsets.all(8),
            child: Column(
              children: [
                Expanded(child: Hero(tag: "product_${product.id}",child: Image.network(product.image),)),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(product.nom, textAlign: TextAlign.center, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
                ),

                Text(product.description),
                Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: List.generate(5, (index){
                        if (product.note <= index) {
                          return const Icon(Icons.star_border_outlined, color: Colors.yellow);
                        }
                        else if(product.note <= index + 0.5){
                          return const Icon(Icons.star_half_outlined, color: Colors.yellow);
                        }
                        return const Icon(Icons.star_rounded, color: Colors.yellow);
                      }),
                    ),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(product.displayPriceInEuro(), style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),),
                      ElevatedButton(onPressed: (){}, child: Text("Acheter"))
                    ],
                  ),
                ),

              ],
            ),
          )
      )
    );
  }
}
