import 'package:domain/domain.dart';
import 'package:home/home.dart';
import 'package:mocktail/mocktail.dart';
import 'package:domain/usecases/export_usecases.dart';
import 'package:navigation/navigation.dart';

const List<ProductModel> productList = [
  ProductModel(
    id: 0,
    name: 'first',
    price: '1.0',
    imageUrl: 'image.png',
    description: 'description 1',
    ingredients: ['ing_1', 'ing_2'],
    category: 'First',
  ),
  ProductModel(
    id: 1,
    name: 'second',
    price: '2.0',
    imageUrl: 'image.png',
    description: 'description 2',
    ingredients: ['ing_1', 'ing_2'],
    category: 'Second',
  ),
  ProductModel(
    id: 2,
    name: 'third',
    price: '2.0',
    imageUrl: 'image.png',
    description: 'description 3',
    ingredients: ['ing_1', 'ing_2'],
    category: 'Third',
  ),
];

final List<String> categories = productList
    .map((ProductModel product) => product.category)
    .toSet()
    .toList();

final ProductState initialProductState = ProductState(
  products: productList,
  internetConnection: true,
  categories: categories,
  allProducts: productList,
  activatedFilterList: List.filled(categories.length, false),
);

class MockFetchAllProductsUseCase extends Mock
    implements FetchAllProductsUseCase {}

class MockAppRouter extends Mock implements AppRouter {}

class MockSetThemeDataUseCase extends Mock implements SetThemeDataUseCase {}

class MockCheckThemeDataUseCase extends Mock implements CheckThemeDataUseCase {}

class MockSetFontSizeUseCase extends Mock implements SetFontSizeUseCase {}

class MockGetFontSizeUseCase extends Mock implements GetFontSizeUseCase {}

