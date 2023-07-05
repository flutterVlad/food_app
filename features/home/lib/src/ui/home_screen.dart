import 'package:auto_route/auto_route.dart';
import 'package:domain/models/product/product_model.dart';
import 'package:flutter/material.dart';
import 'package:domain/usecases/export_usecases.dart';
import 'package:home/src/widgets/widgets.dart';
import 'package:home/src/bloc/bloc.dart';
import 'package:core/di/app_di.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:navigation/navigation.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductBloc>(
      create: (BuildContext context) => ProductBloc(
        getAllProductsUseCase: appLocator.get<FetchAllProductsUseCase>(),
      )..add(
          InitEvent(),
        ),
      child: BlocBuilder<ProductBloc, ProductState>(
        builder: (BuildContext context, ProductState state) {
          final List<ProductModel> products = state.getProducts;
          final bool isEven = products.length % 2 == 0;
          if (state is EmptyState) {
            BlocProvider.of<ProductBloc>(context).add(InitEvent());
          }
          if (state is LoadingState) {
            return const AppCenterLoader();
          }
          if (state is LoadedState) {
            return ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              itemCount:
                  isEven ? products.length ~/ 2 : products.length ~/ 2 + 1,
              itemBuilder: (BuildContext context, int index) {
                if (index == 0) {
                  return Column(
                    children: <Widget>[
                      const AdvertisementBlock(),
                      const SizedBox(height: 15),
                      const FilterBar(),
                      const SizedBox(height: 15),
                      Container(
                        margin: const EdgeInsets.only(bottom: 15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                HomeCard(model: products[index * 2]),
                                if (isEven && index != products.length)
                                HomeCard(model: products[index * 2 + 1]),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                } else {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            HomeCard(model: products[index * 2]),
                            if (isEven && index != products.length)
                            HomeCard(model: products[index * 2 + 1]),
                          ],
                        ),
                      ],
                    ),
                  );
                }
              },
            );
          } else {
            return const Text('Error');
          }
        },
      ),
    );
  }
}
