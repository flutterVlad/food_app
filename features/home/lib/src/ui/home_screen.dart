import 'package:flutter/material.dart';
import 'package:domain/usecases/export_usecases.dart';
import 'package:home/src/widgets/widgets.dart';
import 'package:home/src/bloc/bloc.dart';
import 'package:core/di/app_di.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      child: Scaffold(
        backgroundColor: AppDarkThemeColors.backgroundColor,
        appBar: const HomeAppBar(),
        body: BlocBuilder<ProductBloc, ProductState>(
          builder: (BuildContext context, ProductState state) {
            final products = state.getProducts;
            if (state is EmptyState) {
              BlocProvider.of<ProductBloc>(context).add(InitEvent());
            }
            if (state is LoadingState) {
              return const AppCenterLoader();
            }
            if (state is LoadedState) {
              return ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                itemCount: products.length ~/ 2,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  HomeCard(
                                    name: products[index * 2].name,
                                    imageUrl: products[index * 2].imageUrl,
                                    price: products[index * 2].price,
                                  ),
                                  HomeCard(
                                    name: products[index * 2 + 1].name,
                                    imageUrl: products[index * 2 + 1].imageUrl,
                                    price: products[index * 2 + 1].price,
                                  ),
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
                              HomeCard(
                                name: products[index * 2].name,
                                imageUrl: products[index * 2].imageUrl,
                                price: products[index * 2].price,
                              ),
                              HomeCard(
                                name: products[index * 2 + 1].name,
                                imageUrl: products[index * 2 + 1].imageUrl,
                                price: products[index * 2 + 1].price,
                              ),
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
        bottomNavigationBar: const BottomBar(),
      ),
    );
  }
}
