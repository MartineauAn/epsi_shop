import 'package:epsi_shop/cart_page.dart';
import 'package:epsi_shop/list_product_page.dart';
import 'package:epsi_shop/product_page.dart';
import 'package:epsi_shop/product.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'cart.dart';

void main() {
  runApp(
      ChangeNotifierProvider<Cart>(
        create: (context) => Cart(),
        child: EpsiShop(),
      )
  );
  /*
  final _lsProduct = [
  Product("Huawei p20 pro","C'est pas de la caille",800.00,"img","Huawei"),
  Product("Wiko w4.5","C'est de la caille",50.00,"img","Wicaille"),
  Product("Iphone 14 pro max","téléphone de pigeon",2000.00,"img","Apple"),
  ];
  print(_lsProduct.first.displayPriceInEuro());
  */
}

class EpsiShop extends StatelessWidget {
  EpsiShop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "Espi Shop",
      theme: ThemeData(
          primaryColor: Colors.amber
      ),
      debugShowCheckedModeBanner: false,
      routerConfig: _router,
    );
  }

  final GoRouter _router = GoRouter(
      routes: <GoRoute>[
        GoRoute(
            path: "/",
            builder: (BuildContext context, GoRouterState state) {
              return const ListProduct();
            },
            routes: <GoRoute>[
              GoRoute(
                path: "cart",
                builder: (BuildContext context, GoRouterState state) {
                  return const CartPage();
                },
              ),
              GoRoute(
                name: "product",
                path: "product",
                builder: (BuildContext context, GoRouterState state) {
                  return ProductPage(
                    product: state.extra as Product,
                  );
                },
              )
            ]
        )
      ]
  );
}



