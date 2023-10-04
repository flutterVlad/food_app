import 'package:admin_panel/src/widgets/product_card.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/admin_bloc.dart';
import 'package:settings/settings.dart';

class AdminProductsScreen extends StatelessWidget {
  const AdminProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(
        title: 'Admin products',
        leading: IconButton(
          icon: const Icon(Icons.add),
          onPressed: () {
            BlocProvider.of<AdminBloc>(context).add(
              NavigateToCreateProduct(),
            );
          },
        ),
      ),
      body: BlocConsumer<AdminBloc, AdminState>(
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
        builder: (_, AdminState state) {
          if (state.products.isNotEmpty) {
            return Column(
              children: <Widget>[
                Expanded(
                  child: ListView.builder(
                    itemCount: state.products.length + 1,
                    itemBuilder: (_, int index) {
                      if (index == state.products.length) {
                        return const SizedBox(height: 15);
                      } else {
                        return ProductCard(
                          product: state.products[index],
                        );
                      }
                    },
                  ),
                ),
              ],
            );
          } else {
            return const AppCenterLoader();
          }
        },
      ),
    );
  }
}
