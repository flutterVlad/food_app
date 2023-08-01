import 'package:cart/src/widgets/list_tile_element.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cart/src/bloc/cart_bloc.dart';
import 'package:settings/settings.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (BuildContext context, CartState state) {
        final CartBloc productBloc = BlocProvider.of<CartBloc>(context);

        if (state.countCartProducts == 0) {
          return Center(
            child: Text(
              'Cart is empty.',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          );
        }
        if (state.countCartProducts > 0) {
          return SingleChildScrollView(
            child: Column(
              children: <Widget>[
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: state.products.length,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: ListTileElement(
                        model: state.products[index],
                        quantity: state.quantity[index],
                        onTap: () {
                          productBloc.add(
                            RouteToDetailPageEvent(
                              context: context,
                              model: state.products[index],
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 15,
                    horizontal: 25,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Total amount',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Text(
                        '\$${state.getTotalAmount()}',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(15, 0, 15, 15),
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient:
                          BlocProvider.of<ThemeBloc>(context).state.gradient,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Center(
                      child: Text(
                        'Confirm',
                        style: TextStyle(
                          fontSize: Theme.of(context).textTheme.titleLarge!.fontSize,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        } else {
          return const Text('Error');
        }
      },
    );
  }
}
