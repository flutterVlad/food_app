import 'package:flutter/material.dart';
import 'package:home/src/widgets/widgets.dart';
import 'package:home/src/bloc/home_bloc.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:settings/settings.dart';
import 'package:order_history/order_history.dart';
import 'package:auth/auth.dart';
import 'package:animations/animations.dart';
import 'package:product_detailed_view/product_detailed_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final ThemeState themeState = BlocProvider.of<ThemeBloc>(context).state;
    final ProductBloc bloc = BlocProvider.of<ProductBloc>(context);

    return Scaffold(
      appBar: const HomeAppBar(title: 'Products'),
      body: RefreshIndicator(
        color: Theme.of(context).secondaryHeaderColor,
        onRefresh: () async {
          bloc.add(InitEvent());
        },
        child: BlocConsumer<ProductBloc, ProductState>(
          listener: (BuildContext context, ProductState state) {
            if (state.internetConnection) {
              FlushBar.showFlushBar(
                context: context,
                icon: Icons.done,
                message: 'Internet connection success',
                gradient: ThemeState.successGradient,
                textColor: Colors.black,
              );
              FlushBar.showFlushBar(
                context: context,
                icon: Icons.error,
                message: 'No internet connection',
                gradient: ThemeState.errorGradient,
                textColor: Colors.white,
              );
            } else {
              FlushBar.showFlushBar(
                context: context,
                icon: Icons.error,
                message: 'No internet connection',
                gradient: ThemeState.errorGradient,
                textColor: Colors.white,
              );
            }
          },
          listenWhen: (ProductState previous, ProductState current) {
            return current.internetConnection != previous.internetConnection;
          },
          builder: (BuildContext context, ProductState state) {
            BlocProvider.of<HistoryBloc>(context).add(
              InitHistoryEvent(
                uid: BlocProvider.of<AuthBloc>(context).state.userModel.uid,
              ),
            );
            if (state.products.isNotEmpty) {
              return SingleChildScrollView(
                child: Container(
                  margin: const EdgeInsets.all(15),
                  child: Column(
                    children: <Widget>[
                      const AdvertisementBlock(),
                      const SizedBox(height: 15),
                      const FilterBar(),
                      const SizedBox(height: 15),
                      GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 15,
                          mainAxisSpacing: 15,
                          childAspectRatio:
                              ThemeState.cardSize[themeState.sizeData] ?? 0.72,
                        ),
                        clipBehavior: Clip.none,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: state.products.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Theme
                                  .of(context)
                                  .primaryColor,
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                  color: Theme
                                      .of(context)
                                      .primaryColor
                                      .withOpacity(0.5),
                                  blurRadius: 5,
                                  spreadRadius: 5,
                                ),
                              ],
                            ),
                            child: OpenContainer(
                              transitionType: ContainerTransitionType.fadeThrough,
                              transitionDuration:
                                  const Duration(milliseconds: 500),
                              closedShape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              closedColor: themeState.appTheme.primaryColor,
                              openColor: themeState.appTheme.primaryColor,
                              openBuilder: (_, __) {
                                return ProductDetailsScreen(
                                  model: state.products[index],
                                );
                              },
                              closedBuilder: (_, __) {
                                return HomeCard(
                                  model: state.products[index],
                                );
                              },
                            ),
                          );
                        },
                      ),
                    ],
                  ),
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
