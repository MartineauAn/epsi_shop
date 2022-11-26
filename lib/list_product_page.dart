import 'dart:convert';
import 'package:epsi_shop/cart.dart';
import 'package:epsi_shop/product.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

Future<List<Product>> fetchProducts() async {
  final response = await http.get(Uri.parse('https://fakestoreapi.com/products'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
    return parsed.map<Product>((json) => Product.fromMap(json)).toList();
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load product');
  }
}

class ListProduct extends StatelessWidget {
  const ListProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Liste des produits"),
        actions: [
          Stack(
            alignment: Alignment.center,
            children: [
              IconButton(onPressed: (){ context.go('/cart'); }, icon: const Icon(Icons.shopping_cart)),
              Positioned(
                right: 8,
                top: 4,
                child: Container(
                  width: 18,
                  height: 18,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.red
                  ),
                  child: Text(context.watch<Cart>().getNumberProducts().toString(),style: TextStyle(color: Colors.white), textAlign: TextAlign.center,
                  ),
                )
              )
            ],
          )
        ],
      ),
      body: FutureBuilder<List<Product>>(
            future: fetchProducts(),
            builder: (context, AsyncSnapshot<List<Product>> snapshot){
              if(snapshot.hasData){
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                    itemBuilder: (_, index) => ListTile(
                      onTap: () => context.go('/product', extra: snapshot.data![index]),
                      leading: Hero(tag: "product_${snapshot.data![index].id}",child: Image.network(snapshot.data![index].image),),
                      title: Text(snapshot.data![index].nom),
                      subtitle: Text(snapshot.data![index].displayPriceInEuro(), style: TextStyle(fontWeight: FontWeight.bold),),
                      trailing: TextButton(child: Text("Add"), onPressed: (){ context.read<Cart>().add(snapshot.data![index]); },),
                    )
                );
              }
              else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          )
    );
  }
}



