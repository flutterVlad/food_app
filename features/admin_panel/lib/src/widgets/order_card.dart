import 'package:admin_panel/admin_panel.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:domain/domain.dart';
import 'package:intl/intl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:settings/settings.dart';

class UnapprovedOrderCard extends StatelessWidget {
  final OrderModel order;

  const UnapprovedOrderCard({
    super.key,
    required this.order,
  });

  @override
  Widget build(BuildContext context) {
    final AdminState adminState = BlocProvider.of<AdminBloc>(context).state;

    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.fromLTRB(15, 15, 15, 0),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: CheckboxListTile(
        activeColor: Theme.of(context).secondaryHeaderColor,
        value: adminState.checkedOrders.containsKey(order.id),
        onChanged: (bool? newValue) {
          if (newValue!) {
            context.read<AdminBloc>().add(
                  SelectOrderEvent(order: order),
                );
          } else {
            context.read<AdminBloc>().add(
                  UncheckOrderEvent(order: order),
                );
          }
        },
        title: Text(
          '${order.user.userName} - ${DateFormat('hh:mm a, dd MMMM yyyy').format(order.dateTime)}',
          style: Theme.of(context).textTheme.titleSmall,
        ),
      ),
    );
  }
}

class ApprovedOrderCard extends StatelessWidget {
  final OrderModel order;

  const ApprovedOrderCard({
    super.key,
    required this.order,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.fromLTRB(15, 15, 15, 0),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        title: Text(
          '${order.user.userName} - ${DateFormat('hh:mm a, dd MMMM yyyy').format(order.dateTime)}',
          style: Theme.of(context).textTheme.titleSmall,
        ),
      ),
    );
  }
}

class OrderCard extends StatelessWidget {
  final OrderModel order;
  final int index;
  final bool approveRequired;
  final List<bool> openList;

  const OrderCard({
    super.key,
    required this.order,
    required this.index,
    required this.openList,
    this.approveRequired = false,
  });

  @override
  Widget build(BuildContext context) {
    final AdminBloc adminBloc = BlocProvider.of<AdminBloc>(context);

    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (_, ThemeState themeState) {
        return BlocBuilder<AdminBloc, AdminState>(
          builder: (_, AdminState adminState) {
            return AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              margin: const EdgeInsets.fromLTRB(15, 0, 15, 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: themeState.appTheme.primaryColor.withOpacity(1),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: openList[index]
                        ? themeState.appTheme.secondaryHeaderColor
                            .withOpacity(0.5)
                        : themeState.appTheme.primaryColor.withOpacity(0.5),
                    blurRadius: 10,
                    spreadRadius: openList[index] ? 5 : 0,
                  ),
                ],
              ),
              child: ExpansionTile(
                onExpansionChanged: (bool isOpen) {
                  if (approveRequired) {
                    adminBloc.add(
                      OpenUnapprovedOrderTileEvent(
                        index: index,
                      ),
                    );
                  } else {
                    adminBloc.add(
                      OpenApprovedOrderTileEvent(
                        index: index,
                      ),
                    );
                  }
                },
                shape: const Border(),
                iconColor: themeState.appTheme.secondaryHeaderColor,
                title: Text(
                  '${order.user.userName} - ${DateFormat('hh:mm a, dd MMMM yyyy').format(order.dateTime)}',
                  style: themeState.appTheme.textTheme.titleSmall,
                ),
                leading: approveRequired
                    ? Checkbox(
                        activeColor: themeState.appTheme.secondaryHeaderColor
                            .withOpacity(0.5),
                        checkColor: themeState.appTheme.secondaryHeaderColor,
                        value: adminState.checkedOrders.keys.contains(order.id),
                        onChanged: (bool? newValue) {
                          if (newValue!) {
                            context.read<AdminBloc>().add(
                                  SelectOrderEvent(order: order),
                                );
                          } else {
                            context.read<AdminBloc>().add(
                                  UncheckOrderEvent(order: order),
                                );
                          }
                        },
                      )
                    : const Icon(Icons.history_outlined),
                children: <Widget>[
                  ListView.builder(
                    itemCount: order.cart.products.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: index == order.cart.products.length
                              ? const BorderRadius.vertical(
                                  bottom: Radius.circular(15),
                                )
                              : null,
                        ),
                        child: ListTile(
                          leading: Text(
                            '${index + 1}',
                            style: themeState.appTheme.textTheme.titleSmall,
                          ),
                          title: Text(
                            order.cart.products[index].product.name,
                            style: themeState.appTheme.textTheme.titleMedium,
                          ),
                          trailing: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              GradientBlock(
                                gradient: themeState.gradient,
                                child: Text(
                                  '${order.cart.products[index].quantity}',
                                  style:
                                      themeState.appTheme.textTheme.titleSmall,
                                ),
                              ),
                              GradientBlock(
                                gradient: themeState.gradient,
                                child: Text(
                                  order.cart.products[index].product.price,
                                  style:
                                      themeState.appTheme.textTheme.titleSmall,
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
                      style: themeState.appTheme.textTheme.titleMedium,
                    ),
                    trailing: GradientBlock(
                      gradient: themeState.gradient,
                      child: Text(
                        '${order.cart.totalPrice}',
                        style: themeState.appTheme.textTheme.titleMedium,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
