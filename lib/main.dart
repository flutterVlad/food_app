import 'package:domain/usecases/export_usecases.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:settings/settings.dart';
import 'package:core/core.dart';
import 'package:navigation/navigation.dart';
import 'package:cart/cart.dart';
import 'package:auth/auth.dart';
import 'package:home/home.dart';
import 'package:order_history/order_history.dart';
import 'package:admin_panel/admin_panel.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  appDI.initDependencies();
  await dataDI.initDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: <BlocProvider>[
        BlocProvider<ThemeBloc>(
          create: (BuildContext context) => ThemeBloc(
            setThemeDataUseCase: appLocator.get<SetThemeDataUseCase>(),
            checkThemeDataUseCase: appLocator.get<CheckThemeDataUseCase>(),
            setFontSizeUseCase: appLocator.get<SetFontSizeUseCase>(),
            getFontSizeUseCase: appLocator.get<GetFontSizeUseCase>(),
          )..add(InitialAllThemeSettingsEvent()),
        ),
        BlocProvider<CartBloc>(
          create: (BuildContext context) => CartBloc(
            appRouter: appLocator.get<AppRouter>(),
            clearCartUseCase: appLocator.get<ClearCartUseCase>(),
            putProductInCartUseCase: appLocator.get<AddProductInCartUseCase>(),
            deleteProductFromCartUseCase:
                appLocator.get<DeleteProductFromCartUseCase>(),
            getAllCartUseCase: appLocator.get<GetAllCartUseCase>(),
          ),
        ),
        BlocProvider<ProductBloc>(
          create: (BuildContext context) => ProductBloc(
            getAllProductsUseCase: appLocator.get<FetchAllProductsUseCase>(),
            appRouter: appLocator.get<AppRouter>(),
          ),
        ),
        BlocProvider<AuthBloc>(
          create: (BuildContext context) => AuthBloc(
            signUpUseCase: appLocator.get<SignUpUseCase>(),
            signInUseCase: appLocator.get<SignInUseCase>(),
            signInWithGoogleUseCase: appLocator.get<SignInWithGoogleUseCase>(),
            signOutUseCase: appLocator.get<SignOutUseCase>(),
            appRouter: appLocator.get<AppRouter>(),
            checkAuthenticationUseCase:
                appLocator.get<CheckAuthenticationStatusUseCase>(),
          ),
        ),
        BlocProvider<HistoryBloc>(
          create: (BuildContext context) => HistoryBloc(
            getOrdersUseCase: appLocator.get<GetOrdersUseCase>(),
            addOrderUseCase: appLocator.get<AddOrderUseCase>(),
          ),
        ),
        BlocProvider<AdminBloc>(
          create: (BuildContext context) => AdminBloc(
            fetchAllProductsUseCase: appLocator.get<FetchAllProductsUseCase>(),
            fetchAllOrdersUseCase: appLocator.get<FetchAllOrdersUseCase>(),
            fetchAllUsersUseCase: appLocator<FetchAllUsersUseCase>(),
            addProductUseCase: appLocator.get<AddProductUseCase>(),
            removeProductUseCase: appLocator.get<RemoveProductUseCase>(),
            updateProductUseCase: appLocator.get<UpdateProductUseCase>(),
            uploadImageUseCase: appLocator.get<UploadImageUseCase>(),
            approveOrdersUseCase: appLocator.get<ApproveOrdersUseCase>(),
            updateUserRoleUseCase: appLocator.get<UpdateUserRoleUseCase>(),
            appRouter: appLocator.get<AppRouter>(),
          ),
        ),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (BuildContext context, ThemeState state) {
          return MaterialApp.router(
            routerDelegate: appLocator.get<AppRouter>().delegate(
                  navigatorObservers: () => [HeroController()],
                ),
            routeInformationParser:
                appLocator.get<AppRouter>().defaultRouteParser(),
            title: 'Yum Hub',
            theme: state.appTheme,
          );
        },
      ),
    );
  }
}
