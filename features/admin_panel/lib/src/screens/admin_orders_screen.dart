import 'package:admin_panel/admin_panel.dart';
import 'package:admin_panel/src/widgets/order_card.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:settings/settings.dart';

class AdminOrdersScreen extends StatelessWidget {
  const AdminOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AdminBloc adminBloc = BlocProvider.of<AdminBloc>(context);

    return Scaffold(
      appBar: const HomeAppBar(title: 'Admin orders'),
      body: RefreshIndicator(
        color: Theme.of(context).secondaryHeaderColor,
        onRefresh: () async {
          adminBloc.add(InitOrdersEvent());
        },
        child: BlocConsumer<AdminBloc, AdminState>(
          listener: (_, AdminState state) {
            if (state.exception is AdminError) {
              FlushBar.showFlushBar(
                context: context,
                icon: Icons.error,
                message: state.exception.toString(),
                gradient: ThemeState.errorGradient,
                textColor: Colors.white,
              );
            }
            if (state.exception is AdminSuccess &&
                state.exception.toString() != '') {
              FlushBar.showFlushBar(
                context: context,
                icon: Icons.done,
                message: state.exception.toString(),
                gradient: ThemeState.successGradient,
                textColor: Colors.black,
              );
            }
          },
          builder: (_, AdminState adminState) {
            if (adminState.approvedOrders.isNotEmpty) {
              return SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Unapproved',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          AppTextButton(
                            title: Text(
                              'Approve selected',
                              style: TextStyle(
                                color: Theme.of(context).secondaryHeaderColor,
                                fontSize: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .fontSize,
                              ),
                            ),
                            onTap: () {
                              AppAlertDialog.showAlertDialog(
                                context: context,
                                title: 'Do you want to approve the orders?',
                                onTap: () {
                                  BlocProvider.of<AdminBloc>(context).add(
                                    ApproveOrdersEvent(
                                      orders:
                                          adminState.checkedOrders.values.toList(),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: adminState.unapprovedOrders.length,
                      itemBuilder: (_, int index) {
                        return OrderCard(
                          index: index,
                          order: adminState.unapprovedOrders[index],
                          openList: adminState.isUnapprovedOrderTileOpenList,
                          approveRequired: true,
                        );
                      },
                    ),
                    const Divider(
                      indent: 15,
                      endIndent: 15,
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
                      child: Text(
                        'Approved',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: adminState.approvedOrders.length + 1,
                      itemBuilder: (_, int index) {
                        if (index == adminState.approvedOrders.length) {
                          return const SizedBox(height: 15);
                        } else {
                          return OrderCard(
                            index: index,
                            openList: adminState.isApprovedOrderTileOpenList,
                            order: adminState.approvedOrders[index],
                          );
                        }
                      },
                    ),
                  ],
                ),
              );
            } else {
              return const AppCenterLoader();
            }
          },
        ),
      ),
    );
  }
}
