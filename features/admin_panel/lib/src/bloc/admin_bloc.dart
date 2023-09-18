import 'dart:io';
import 'package:admin_panel/admin_panel.dart';
import 'package:flutter/material.dart';
import 'package:domain/usecases/usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:domain/domain.dart';
import 'package:domain/usecases/export_usecases.dart';
import 'package:navigation/navigation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:core/core.dart';

part 'admin_event.dart';

part 'admin_state.dart';

part 'admin_exception.dart';

class AdminBloc extends Bloc<AdminEvent, AdminState> {
  final FetchAllProductsUseCase _fetchAllProductsUseCase;
  final FetchAllOrdersUseCase _fetchAllOrdersUseCase;
  final FetchAllUsersUseCase _fetchAllUsersUseCase;
  final AddProductUseCase _addProductUseCase;
  final RemoveProductUseCase _removeProductUseCase;
  final UpdateProductUseCase _updateProductUseCase;
  final UploadImageUseCase _uploadImageUseCase;
  final ApproveOrdersUseCase _approveOrdersUseCase;
  final UpdateUserRoleUseCase _updateUserRoleUseCase;
  final AppRouter _appRouter;

  AdminBloc({
    required FetchAllProductsUseCase fetchAllProductsUseCase,
    required FetchAllOrdersUseCase fetchAllOrdersUseCase,
    required FetchAllUsersUseCase fetchAllUsersUseCase,
    required AddProductUseCase addProductUseCase,
    required RemoveProductUseCase removeProductUseCase,
    required UpdateProductUseCase updateProductUseCase,
    required UploadImageUseCase uploadImageUseCase,
    required ApproveOrdersUseCase approveOrdersUseCase,
    required UpdateUserRoleUseCase updateUserRoleUseCase,
    required AppRouter appRouter,
  })  : _fetchAllProductsUseCase = fetchAllProductsUseCase,
        _fetchAllOrdersUseCase = fetchAllOrdersUseCase,
        _fetchAllUsersUseCase = fetchAllUsersUseCase,
        _addProductUseCase = addProductUseCase,
        _removeProductUseCase = removeProductUseCase,
        _updateProductUseCase = updateProductUseCase,
        _uploadImageUseCase = uploadImageUseCase,
        _approveOrdersUseCase = approveOrdersUseCase,
        _updateUserRoleUseCase = updateUserRoleUseCase,
        _appRouter = appRouter,
        super(AdminState.empty()) {
    on<InitProductsEvent>(_initProducts);
    on<InitOrdersEvent>(_initOrders);
    on<InitUsersEvent>(_initUsers);
    on<SelectOrderEvent>(_selectOrder);
    on<UncheckOrderEvent>(_uncheckOrder);
    on<OpenApprovedOrderTileEvent>(_openApprovedElement);
    on<OpenUnapprovedOrderTileEvent>(_openUnapprovedElement);
    on<ApproveOrdersEvent>(_approveOrders);
    on<NavigateToEditEvent>(_navigateToEditProduct);
    on<NavigateToCreateProduct>(_navigateToCreateProduct);
    on<AddProductEvent>(_addProduct);
    on<UpdateProductEvent>(_updateProduct);
    on<DeleteProductEvent>(_deleteProduct);
    on<AddIngredientEvent>(_addIngredient);
    on<RemoveIngredientEvent>(_removeIngredient);
    on<SelectImageEvent>(_selectImage);
    on<UpdateUserRoleEvent>(_updateUserRole);

    on<NavigateBackEvent>(_navigateBack);
    on<ThrowExceptionEvent>(_throwException);

    add(InitProductsEvent());
    add(InitOrdersEvent());
    add(InitUsersEvent());
  }

  Future<void> _initProducts(
    InitProductsEvent event,
    Emitter<AdminState> emit,
  ) async {
    final List<ProductModel> products =
        await _fetchAllProductsUseCase.execute(const NoParams());

    emit(
      state.copyWith(
        products: products,
      ),
    );
  }

  Future<void> _initOrders(
    InitOrdersEvent event,
    Emitter<AdminState> emit,
  ) async {
    final List<OrderModel> orders =
        await _fetchAllOrdersUseCase.execute(const NoParams());

    final List<OrderModel> unapprovedOrders = orders
        .where(
          (OrderModel order) => !order.approved,
        )
        .toList();
    final List<OrderModel> approvedOrders = orders
        .where(
          (OrderModel order) => order.approved,
        )
        .toList();

    emit(
      state.copyWith(
        approvedOrders: approvedOrders,
        unapprovedOrders: unapprovedOrders,
        isApprovedOrderTileOpenList: List.filled(approvedOrders.length, false),
        isUnapprovedOrderTileOpenList:
            List.filled(unapprovedOrders.length, false),
      ),
    );
  }

  Future<void> _initUsers(
    InitUsersEvent event,
    Emitter<AdminState> emit,
  ) async {
    final List<UserModel> users =
        await _fetchAllUsersUseCase.execute(const NoParams());

    emit(
      state.copyWith(
        users: users,
      ),
    );
  }

  Future<void> _updateUserRole(
    UpdateUserRoleEvent event,
    Emitter<AdminState> emit,
  ) async {
    await _updateUserRoleUseCase.execute(event.user);
    add(InitUsersEvent());
  }

  Future<void> _selectOrder(
    SelectOrderEvent event,
    Emitter<AdminState> emit,
  ) async {
    try {
      final Map<String, OrderModel> newCheckedOrders = state.checkedOrders;
      newCheckedOrders[event.order.id] = event.order;
      emit(
        state.copyWith(
          checkedOrders: newCheckedOrders,
        ),
      );
    } on FirebaseException catch (error) {
      emit(
        state.copyWith(
          exception: AdminError(
            error.message,
          ),
          isLoading: false,
        ),
      );
    }
  }

  Future<void> _uncheckOrder(
    UncheckOrderEvent event,
    Emitter<AdminState> emit,
  ) async {
    final Map<String, OrderModel> newCheckedOrders = state.checkedOrders;
    newCheckedOrders.remove(event.order.id);
    emit(
      state.copyWith(
        checkedOrders: newCheckedOrders,
      ),
    );
  }

  Future<void> _openUnapprovedElement(
    OpenUnapprovedOrderTileEvent event,
    Emitter<AdminState> emit,
  ) async {
    final List<bool> updatedUnapprovedList =
        state.isUnapprovedOrderTileOpenList;
    updatedUnapprovedList[event.index] = !updatedUnapprovedList[event.index];
    emit(
      state.copyWith(
        isUnapprovedOrderTileOpenList: updatedUnapprovedList,
      ),
    );
  }

  Future<void> _openApprovedElement(
    OpenApprovedOrderTileEvent event,
    Emitter<AdminState> emit,
  ) async {
    final List<bool> updatedApprovedList = state.isApprovedOrderTileOpenList;
    updatedApprovedList[event.index] = !updatedApprovedList[event.index];
    emit(
      state.copyWith(
        isApprovedOrderTileOpenList: updatedApprovedList,
      ),
    );
  }

  Future<void> _approveOrders(
    ApproveOrdersEvent event,
    Emitter<AdminState> emit,
  ) async {
    try {
      final List<OrderModel> approvedOrders = event.orders
          .map(
            (OrderModel order) => order.copyWith(approved: true),
          )
          .toList();
      await _approveOrdersUseCase.execute(approvedOrders);
      add(InitOrdersEvent());
      emit(
        state.copyWith(
          checkedOrders: {},
          exception: AdminSuccess(
            message: 'Orders has been approved!',
          ),
        ),
      );
    } on FirebaseException catch (error) {
      emit(
        state.copyWith(
          exception: AdminError(
            error.message,
          ),
          isLoading: false,
        ),
      );
    }
  }

  Future<void> _addProduct(
    AddProductEvent event,
    Emitter<AdminState> emit,
  ) async {
    try {
      emit(
        state.copyWith(
          isLoading: true,
        ),
      );
      final String imageUrl = await _uploadImageUseCase.execute(
        File(state.selectedImage),
      );
      final ProductModel product = ProductModel.empty.copyWith(
        name: state.productControllers['Name']?.text ?? '',
        description: state.productControllers["Description"]?.text ?? '',
        category: state.productControllers['Category']?.text ?? '',
        price: state.productControllers['Price']?.text ?? '',
        ingredients: state.ingredients,
      );
      await _addProductUseCase.execute(
        product.copyWith(
          imageUrl: imageUrl,
        ),
      );
      emit(
        state.copyWith(
          isLoading: false,
        ),
      );
      add(NavigateBackEvent());
      emit(
        state.copyWith(
          exception: AdminSuccess(
            message: 'Product ${product.name} has been added!',
          ),
        ),
      );
    } on FirebaseException catch (error) {
      emit(
        state.copyWith(
          exception: AdminError(
            error.message,
          ),
          isLoading: false,
        ),
      );
    }
  }

  Future<void> _updateProduct(
    UpdateProductEvent event,
    Emitter<AdminState> emit,
  ) async {
    try {
      emit(
        state.copyWith(
          isLoading: true,
        ),
      );
      final ProductModel product = event.product.copyWith(
        name: state.productControllers['Name']?.text ?? '',
        description: state.productControllers["Description"]?.text ?? '',
        category: state.productControllers['Category']?.text ?? '',
        price: state.productControllers['Price']?.text ?? '',
        ingredients: state.ingredients,
      );
      if (state.selectedImage != '') {
        final String imageUrl = await _uploadImageUseCase.execute(
          File(state.selectedImage),
        );
        await _updateProductUseCase.execute(
          product.copyWith(
            imageUrl: imageUrl,
          ),
        );
      } else {
        await _updateProductUseCase.execute(product);
      }
      emit(
        state.copyWith(
          isLoading: false,
        ),
      );
      add(NavigateBackEvent());
      emit(
        state.copyWith(
          exception: AdminSuccess(
            message: 'Product ${product.name} has been updated!',
          ),
        ),
      );
    } on FirebaseException catch (error) {
      emit(
        state.copyWith(
          exception: AdminError(
            error.message,
          ),
          isLoading: false,
        ),
      );
    }
  }

  Future<void> _deleteProduct(
    DeleteProductEvent event,
    Emitter<AdminState> emit,
  ) async {
    try {
      await _removeProductUseCase.execute(event.product.id.toString());
      final List<ProductModel> products =
          await _fetchAllProductsUseCase.execute(
        const NoParams(),
      );
      emit(
        state.copyWith(
          products: products,
        ),
      );
    } on FirebaseException catch (error) {
      emit(
        state.copyWith(
          exception: AdminError(
            error.message,
          ),
          isLoading: false,
        ),
      );
    }
  }

  Future<void> _navigateToEditProduct(
    NavigateToEditEvent event,
    Emitter<AdminState> emit,
  ) async {
    final Map<String, String> productMap = event.product.toMap();
    final Map<String, TextEditingController> textEditingControllers = {};
    for (MapEntry field in productMap.entries) {
      textEditingControllers[field.key] = TextEditingController(
        text: field.value,
      );
    }

    emit(
      state.copyWith(
        productControllers: textEditingControllers,
        ingredients: event.product.ingredients,
      ),
    );

    _appRouter.navigate(
      EditRoute(
        product: event.product,
      ),
    );
  }

  Future<void> _navigateBack(
    NavigateBackEvent event,
    Emitter<AdminState> emit,
  ) async {
    emit(
      state.copyWith(
        selectedImage: '',
      ),
    );
    _appRouter.pop();
  }

  Future<void> _navigateToCreateProduct(
    NavigateToCreateProduct event,
    Emitter<AdminState> emit,
  ) async {
    final Map<String, TextEditingController> textEditingControllers = {};
    for (MapEntry field in ProductModel.defaultFields.entries) {
      textEditingControllers[field.key] = TextEditingController(
        text: field.value,
      );
    }
    emit(
      state.copyWith(
        productControllers: textEditingControllers,
        ingredients: [],
        selectedImage: '',
      ),
    );
    _appRouter.navigate(EditRoute());
  }

  Future<void> _addIngredient(
    AddIngredientEvent event,
    Emitter<AdminState> emit,
  ) async {
    final List<String> ingredients = state.ingredients;
    ingredients.add(event.ingredient);
    emit(
      state.copyWith(
        ingredients: ingredients,
      ),
    );
  }

  Future<void> _removeIngredient(
    RemoveIngredientEvent event,
    Emitter<AdminState> emit,
  ) async {
    final List<String> ingredients = state.ingredients;
    ingredients.removeAt(event.index);
    emit(
      state.copyWith(
        ingredients: ingredients,
      ),
    );
  }

  Future<void> _selectImage(
    SelectImageEvent event,
    Emitter<AdminState> emit,
  ) async {
    try {
      final ImagePicker imagePicker = ImagePicker();

      final XFile? file = await imagePicker.pickImage(
        source: ImageSource.gallery,
      );
      emit(
        state.copyWith(
          selectedImage: file?.path ?? '',
        ),
      );
    } on FirebaseException catch (error) {
      emit(
        state.copyWith(
          exception: AdminError(
            error.message,
          ),
          isLoading: false,
        ),
      );
    }
  }

  Future<void> _throwException(
    ThrowExceptionEvent event,
    Emitter<AdminState> emit,
  ) async {
    emit(
      state.copyWith(
        exception: AdminError(event.exception),
        isLoading: false,
      ),
    );
  }
}
