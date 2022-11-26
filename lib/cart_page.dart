import 'package:epsi_shop/cart.dart';
import 'package:epsi_shop/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Panier Flutter Sales"),
          backgroundColor: Colors.green,
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                  "Votre panier contient ${context.watch<Cart>().getNumberProducts().toString()} élément${context.watch<Cart>().plurial()}",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline6
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: context.watch<Cart>().getNumberProducts(),
                  itemBuilder: (_, index) {
                    Product product = context.watch<Cart>().getProduct(index);
                    return ListTile(
                      leading: Image.network(product.image),
                      title: Text(product.nom),
                      subtitle: Text(product.displayPriceInEuro(), style: TextStyle(fontWeight: FontWeight.bold),),
                      trailing: TextButton(child: Text("Remove"), onPressed: (){ context.read<Cart>().remove(product); },),
                    );
                  }
                ),
              ),
              Text(
                  "Votre panier total est de : ${context.watch<Cart>().getTotalPrice().toStringAsFixed(2)}€",
                  style: Theme.of(context).textTheme.headline6
              )
            ],
          ),
        )
      ),
    );
  }
}
