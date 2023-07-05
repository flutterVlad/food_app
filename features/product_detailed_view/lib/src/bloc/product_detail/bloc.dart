import 'package:domain/models/product/product_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'event.dart';
part 'state.dart';

class ProductDetailBloc extends Bloc<ProductDetailEvent, ProductDetailState> {
  ProductDetailBloc() : super(EmptyState()) {
    on<LoadEvent>((event, emit) {

    });
  }



}
