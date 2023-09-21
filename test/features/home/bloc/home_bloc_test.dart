import 'package:domain/usecases/usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:home/home.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bloc_test/bloc_test.dart';
import '../../../helper/helper_stuff.dart';

void main() {
  late MockFetchAllProductsUseCase mockFetchAllProductsUseCase;
  late MockAppRouter mockAppRouter;

  setUp(
    () {
      TestWidgetsFlutterBinding.ensureInitialized();
      mockFetchAllProductsUseCase = MockFetchAllProductsUseCase();
      mockAppRouter = MockAppRouter();
      when(
        () => mockFetchAllProductsUseCase.execute(
          const NoParams(),
        ),
      ).thenAnswer(
        (_) => Future.value(productList),
      );
    },
  );

  group(
    'ProductBloc',
    () {
      blocTest<ProductBloc, ProductState>(
        'initial state',
        build: () => ProductBloc(
          fetchAllProductsUseCase: mockFetchAllProductsUseCase,
          appRouter: mockAppRouter,
        ),
        act: (ProductBloc bloc) => bloc.add(InitEvent()),
        expect: () => [initialProductState],
      );

      blocTest<ProductBloc, ProductState>(
        'filter products by category',
        build: () => ProductBloc(
          fetchAllProductsUseCase: mockFetchAllProductsUseCase,
          appRouter: mockAppRouter,
        ),
        seed: () => initialProductState,
        act: (ProductBloc bloc) => bloc.add(
          FilterByCategoryEvent(
            category: 'Third',
            index: 2,
          ),
        ),
        expect: () => [
          initialProductState.copyWith(
            products: [productList[2]],
            activatedFilterList: const [false, false, true],
          ),
        ],
      );

      blocTest<ProductBloc, ProductState>(
        'show all products after filtering',
        build: () => ProductBloc(
          fetchAllProductsUseCase: mockFetchAllProductsUseCase,
          appRouter: mockAppRouter,
        ),
        seed: () => initialProductState.copyWith(
          products: [productList[2]],
          activatedFilterList: const [false, false, true],
        ),
        act: (ProductBloc bloc) => bloc.add(
          ShowAllProductsEvent(),
        ),
        expect: () => [initialProductState],
      );
    },
  );
}
