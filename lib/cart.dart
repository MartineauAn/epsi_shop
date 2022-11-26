import 'package:epsi_shop/product.dart';
import 'package:flutter/cupertino.dart';
import 'product.dart';

class Cart extends ChangeNotifier {
  final List<Product> _lsproducts = [];

  void add(Product product){
    _lsproducts.add(product);
    notifyListeners();
  }

  void remove(Product product){
    _lsproducts.remove(product);
    notifyListeners();
  }

  void removeAll(){
    _lsproducts.clear();
    notifyListeners();
  }

  int getNumberProducts(){
    return _lsproducts.length;
  }

  List<Product> getProducts(){
    return _lsproducts;
  }

  Product getProduct(int index){
    return _lsproducts[index];
  }

  double getTotalPrice(){
    double total = 0.00;

    for (var element in _lsproducts) {
      total += element.prix;
    }

    return total;
  }

  String plurial(){
    return (getNumberProducts() > 1 ? "s" : "");
  }

}