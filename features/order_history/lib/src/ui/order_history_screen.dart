import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:navigation/navigation.dart';
import 'package:order_history/src/widgets/order_tile.dart';
import 'package:order_history/order_history.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_emoji/flutter_emoji.dart';
import 'package:settings/settings.dart';

class OrderHistoryScreen extends StatelessWidget {
  const OrderHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeAppBar(title: 'Order History'),
      body: BlocBuilder<HistoryBloc, HistoryState>(
        builder: (BuildContext context, HistoryState state) {
          final ThemeState themeState =
              BlocProvider.of<ThemeBloc>(context).state;

          if (state.orders.isNotEmpty) {
            return SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                child: ListView.builder(
                  itemCount: state.orders.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return OrderTile(order: state.orders[index], index: index);
                  },
                ),
              ),
            );
          } else {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Lottie.asset(
                    themeState.appTheme.brightness == Brightness.light
                        ? AppTheme.orderAnimationLightTheme
                        : AppTheme.orderAnimationDarkTheme,
                    width: 200,
                  ),
                  Text(
                    'Order history is empty ${EmojiParser().emojify(':disappointed:')}',
                    style: Theme.of(context).textTheme.titleMedium,
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
            );
          }
        },
      ),
    );
  }
}
