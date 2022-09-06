***REMOVED***

***REMOVED***
import 'package:gharelu/src/home/entities/cart_entities.dart';
import 'package:gharelu/src/home/models/product_model.dart';

class CartState extends StateNotifier<CartEntities> ***REMOVED***
  CartState() : super(CartEntities.empty());

  void addToCart(ProductModel product) ***REMOVED***
    final cart = state;
    state = state.copyWith(
      price: cart.price,
      products: [...cart.products, product.copyWith(quantity: 1)],
    );
    calculatePrice();
  ***REMOVED***

  void calculatePrice() ***REMOVED***
    final cart = state;
    int _price = 0;
    cart.products.forEach((element) ***REMOVED***
      _price = element.quantity * element.price;
  ***REMOVED***
    state = state.copyWith(
      products: cart.products,
      price: _price,
    );
  ***REMOVED***

  void removeFromCart(ProductModel product) ***REMOVED******REMOVED***
***REMOVED***

final cartStateProvider =
    StateNotifierProvider<CartState, CartEntities>((ref) => CartState());
