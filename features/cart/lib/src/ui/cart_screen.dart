import 'package:cart/src/widgets/list_tile_element.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cart/src/bloc/cart_bloc.dart';
import 'package:navigation/navigation.dart';
import 'package:settings/settings.dart';
import 'package:auth/auth.dart';
import 'package:order_history/order_history.dart';
import 'package:lottie/lottie.dart';
import 'package:animations/animations.dart';
import 'package:product_detailed_view/product_detailed_view.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> with TickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<double> _animation;
  late final Animation<double> _totalPriceAnimation;
  late final AnimationController _totalPriceController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _totalPriceController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    _animation = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(_animationController);
    _totalPriceAnimation = CurvedAnimation(
      parent: _totalPriceController,
      curve: Curves.easeInOutSine,
    );
    _totalPriceController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _totalPriceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeAppBar(title: 'Cart'),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (_, CartState state) {
          final ThemeState themeState =
              BlocProvider.of<ThemeBloc>(context).state;

          if (state.countCartProducts > 0) {
            return SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.cart.products.length,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (_, int index) {
                      return Container(
                        margin: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                        child: OpenContainer(
                          transitionType: ContainerTransitionType.fadeThrough,
                          transitionDuration: const Duration(milliseconds: 500),
                          closedShape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          closedColor:
                              themeState.appTheme.primaryColor.withAlpha(255),
                          openColor: themeState.appTheme.primaryColor,
                          closedBuilder: (_, __) {
                            return ListTileElement(
                              model: state.cart.products[index],
                            );
                          },
                          openBuilder: (_, __) {
                            return ProductDetailsScreen(
                              model: state.cart.products[index].product,
                            );
                          },
                        ),
                      );
                    },
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 15,
                      horizontal: 20,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Total amount',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        BlocListener<CartBloc, CartState>(
                          listenWhen: (CartState previous, CartState current) {
                            return previous.cart.totalPrice !=
                                current.cart.totalPrice;
                          },
                          listener: (_, __) {
                            _totalPriceController.forward(from: 0.0);
                          },
                          child: FadeTransition(
                            opacity: _totalPriceAnimation,
                            child: Text(
                              '\$${state.cart.totalPrice}',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      context.read<CartBloc>().add(
                            CreateOrderEvent(
                              uid: BlocProvider.of<AuthBloc>(context)
                                  .state
                                  .userModel
                                  .uid,
                            ),
                          );
                      BlocProvider.of<HistoryBloc>(context).add(
                        AddOrderEvent(
                          cartModel: state.cart,
                        ),
                      );
                    },
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
                            fontSize: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .fontSize,
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
            _animationController.forward(from: 0.0);
            return FadeTransition(
              opacity: _animation,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Lottie.asset(
                      themeState.appTheme.brightness == Brightness.light
                          ? AppTheme.cartAnimationLightTheme
                          : AppTheme.cartAnimationDarkTheme,
                      width: 200,
                    ),
                    Text(
                      'Cart is empty.',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    GradientBlock(
                      gradient: themeState.gradient,
                      child: TextButton(
                        onPressed: () {
                          context.router.navigate(const ProductsRoute());
                        },
                        child: Text(
                          'Go choose products',
                          style: themeState.appTheme.textTheme.titleMedium,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
