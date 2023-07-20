import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:home/src/widgets/widgets.dart';
import 'package:home/src/bloc/home_bloc.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:settings/settings.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final ThemeState themeBloc = BlocProvider.of<ThemeBloc>(context).state;
    final ProductBloc bloc = BlocProvider.of<ProductBloc>(context);

    SnackBar snackBar = SnackBar(
      content: Center(
        child: Text(
          'No network connection!',
          style: TextStyle(
            color: Colors.black,
            fontSize: themeBloc.appTheme.textTheme.titleMedium!.fontSize,
          ),
        ),
      ),
      backgroundColor: Theme.of(context).secondaryHeaderColor,
      duration: const Duration(seconds: 2),
    );

    return RefreshIndicator(
      color: Theme.of(context).secondaryHeaderColor,
      onRefresh: () async {
        if (!(await dataDI.checkInternet())) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(snackBar);
        }
        bloc.add(InitEvent());
      },
      child: BlocBuilder<ProductBloc, ProductState>(
        builder: (BuildContext context, ProductState state) {
          if (state is EmptyState) {
            BlocProvider.of<ProductBloc>(context).add(InitEvent());
          }
          if (state is LoadingState) {
            return const AppCenterLoader();
          }
          if (state is LoadedState) {
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
                            ThemeState.cardSize[themeBloc.sizeData]!,
                      ),
                      clipBehavior: Clip.none,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: state.getProducts.length,
                      itemBuilder: (BuildContext context, int index) {
                        return HomeCard(
                          model: state.getProducts[index],
                          onTap: () {
                            BlocProvider.of<ProductBloc>(context).add(
                              NavigateToDetailPageEvent(
                                context: context,
                                model: state.getProducts[index],
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            );
          } else {
            return const Text('Error');
          }
        },
      ),
    );
  }
}
