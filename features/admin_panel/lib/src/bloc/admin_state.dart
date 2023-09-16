part of 'admin_bloc.dart';

class AdminState {
  final List<ProductModel> products;
  final List<OrderModel> approvedOrders;
  final List<OrderModel> unapprovedOrders;
  final List<UserModel> users;
  final Map<String, OrderModel> checkedOrders;
  final List<bool> isApprovedOrderTileOpenList;
  final List<bool> isUnapprovedOrderTileOpenList;
  final Map<String, TextEditingController> productControllers;
  final List<String> ingredients;
  final String selectedImage;
  final bool isLoading;
  final AdminException exception;

  AdminState({
    required this.products,
    required this.approvedOrders,
    required this.unapprovedOrders,
    required this.users,
    required this.checkedOrders,
    required this.isApprovedOrderTileOpenList,
    required this.isUnapprovedOrderTileOpenList,
    required this.productControllers,
    required this.ingredients,
    required this.selectedImage,
    required this.isLoading,
    required this.exception,
  });

  AdminState.empty()
      : products = [],
        approvedOrders = [],
        unapprovedOrders = [],
        users = [],
        checkedOrders = {},
        isApprovedOrderTileOpenList = [],
        isUnapprovedOrderTileOpenList = [],
        productControllers = {},
        ingredients = [],
        selectedImage = '',
        isLoading = false,
        exception = AdminSuccess();

  AdminState copyWith({
    List<ProductModel>? products,
    List<OrderModel>? approvedOrders,
    List<OrderModel>? unapprovedOrders,
    List<UserModel>? users,
    Map<String, OrderModel>? checkedOrders,
    List<bool>? isApprovedOrderTileOpenList,
    List<bool>? isUnapprovedOrderTileOpenList,
    Map<String, TextEditingController>? productControllers,
    List<String>? ingredients,
    String? selectedImage,
    bool? isLoading,
    AdminException? exception,
  }) {
    return AdminState(
      products: products ?? this.products,
      approvedOrders: approvedOrders ?? this.approvedOrders,
      unapprovedOrders: unapprovedOrders ?? this.unapprovedOrders,
      users: users ?? this.users,
      checkedOrders: checkedOrders ?? this.checkedOrders,
      isApprovedOrderTileOpenList:
          isApprovedOrderTileOpenList ?? this.isApprovedOrderTileOpenList,
      isUnapprovedOrderTileOpenList:
          isUnapprovedOrderTileOpenList ?? this.isUnapprovedOrderTileOpenList,
      productControllers: productControllers ?? this.productControllers,
      ingredients: ingredients ?? this.ingredients,
      selectedImage: selectedImage ?? this.selectedImage,
      isLoading: isLoading ?? this.isLoading,
      exception: exception ?? AdminSuccess(),
    );
  }
}
