import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:order_history/src/widgets/order_tile.dart';
import 'package:order_history/order_history.dart';

class OrderHistoryScreen extends StatelessWidget {
  const OrderHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HistoryBloc, HistoryState>(
      builder: (BuildContext context, HistoryState state) {
        return SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.fromLTRB(15, 15, 15, 0),
            child: ListView.builder(
              itemCount: state.orders.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return OrderTile(order: state.orders[index]);
              },
            ),
          ),
        );
      },
    );
  }
}
