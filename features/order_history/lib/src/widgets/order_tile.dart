import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:settings/settings.dart';
import 'package:order_history/order_history.dart';

class OrderTile extends StatefulWidget {
  final OrderModel order;
  final int index;

  const OrderTile({
    super.key,
    required this.order,
    required this.index,
  });

  @override
  State<OrderTile> createState() => _OrderTileState();
}

class _OrderTileState extends State<OrderTile> {
  @override
  Widget build(BuildContext context) {
    final HistoryBloc historyBloc = BlocProvider.of<HistoryBloc>(context);

    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (BuildContext context, ThemeState state) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          margin: const EdgeInsets.only(bottom: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: state.appTheme.primaryColor.withOpacity(1),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: historyBloc.state.isTileOpenList[widget.index]
                    ? state.appTheme.secondaryHeaderColor.withOpacity(0.5)
                    : state.appTheme.primaryColor.withOpacity(0.5),
                blurRadius: 10,
                spreadRadius:
                    historyBloc.state.isTileOpenList[widget.index] ? 5 : 0,
              ),
            ],
          ),
          child: ExpansionTile(
            onExpansionChanged: (bool isOpen) {
              historyBloc.add(
                OpenTileEvent(
                  index: widget.index,
                ),
              );
            },
            shape: const Border(),
            iconColor: state.appTheme.secondaryHeaderColor,
            title: Text(
              DateFormat('hh:mm a, dd MMMM yyyy').format(widget.order.dateTime),
              style: state.appTheme.textTheme.titleMedium,
            ),
            leading: const Icon(Icons.history_outlined),
            children: <Widget>[
              ListView.builder(
                itemCount: widget.order.cart.products.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: index == widget.order.cart.products.length
                          ? const BorderRadius.vertical(
                              bottom: Radius.circular(15),
                            )
                          : null,
                    ),
                    child: ListTile(
                      leading: Text(
                        '${index + 1}',
                        style: state.appTheme.textTheme.titleSmall,
                      ),
                      title: Text(
                        widget.order.cart.products[index].product.name,
                        style: state.appTheme.textTheme.titleMedium,
                      ),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          GradientBlock(
                            gradient: state.gradient,
                            child: Text(
                              '${widget.order.cart.products[index].quantity}',
                              style: state.appTheme.textTheme.titleSmall,
                            ),
                          ),
                          GradientBlock(
                            gradient: state.gradient,
                            child: Text(
                              widget.order.cart.products[index].product.price,
                              style: state.appTheme.textTheme.titleSmall,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              ListTile(
                title: Text(
                  'Amount',
                  style: state.appTheme.textTheme.titleMedium,
                ),
                trailing: GradientBlock(
                  gradient: state.gradient,
                  child: Text(
                    '${widget.order.cart.totalPrice}',
                    style: state.appTheme.textTheme.titleMedium,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
