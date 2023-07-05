import 'package:bloc/bloc.dart';
import 'package:domain/models/product/product_model.dart';
import 'package:domain/usecases/export_usecases.dart';
import 'package:domain/usecases/usecase.dart';
import 'package:equatable/equatable.dart';

part 'event.dart';
part 'state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final FetchAllProductsUseCase _getAllProductsUseCase;

  List<ProductModel> products = <ProductModel>[];
  int currentIndex = 0;

  ProductBloc({
    required FetchAllProductsUseCase getAllProductsUseCase,
  })  : _getAllProductsUseCase = getAllProductsUseCase,
        super(EmptyState()) {
    on<InitEvent>(_init);
  }

  void _init(InitEvent event, Emitter<ProductState> emit) {
    _loadProductList();
  }

  void _loadProductList() async {
    emit(LoadingState());
    products = await _getAllProductsUseCase.execute(const NoParams());
    emit(LoadedState(products: products));
  }
}
