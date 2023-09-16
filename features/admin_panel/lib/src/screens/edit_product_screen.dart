import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:admin_panel/admin_panel.dart';
import 'package:navigation/navigation.dart';
import '../widgets/confirm_button.dart';
import '../widgets/image_element.dart';
import '../widgets/ingredient_element.dart';
import 'package:settings/settings.dart';

class EditProductScreen extends StatefulWidget {
  final ProductModel? product;

  const EditProductScreen({
    super.key,
    this.product,
  });

  @override
  State<EditProductScreen> createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late final TextEditingController _ingredientController;

  @override
  void initState() {
    super.initState();
    _ingredientController = TextEditingController();
  }

  @override
  void dispose() {
    _ingredientController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(
        title: widget.product?.name ?? 'Add product',
      ),
      body: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (_, ThemeState themeState) {
          return SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.all(15),
              child: BlocConsumer<AdminBloc, AdminState>(
                listener: (_, AdminState state) {
                  if (state.exception is AdminError) {
                    FlushBar.showFlushBar(
                      context: context,
                      icon: Icons.error,
                      message: state.exception.toString(),
                      gradient: ThemeState.errorGradient,
                      textColor: Colors.white,
                    );
                  }
                },
                builder: (_, AdminState adminState) {
                  final AdminBloc adminBloc =
                      BlocProvider.of<AdminBloc>(context);
                  final List<String> titles =
                      adminState.productControllers.keys.toList();
                  final List<TextEditingController> textControllers =
                      adminState.productControllers.values.toList();

                  return Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        ...List.generate(
                          ProductModel.defaultFields.length,
                          (int index) {
                            return Column(
                              children: <Widget>[
                                Text(
                                  titles[index],
                                  style:
                                      themeState.appTheme.textTheme.titleMedium,
                                ),
                                TextFormField(
                                  controller: textControllers[index],
                                  validator: TextFormValidation.validate(
                                    field: titles[index],
                                  ),
                                  style:
                                      themeState.appTheme.textTheme.titleMedium,
                                ),
                                const SizedBox(height: 10),
                              ],
                            );
                          },
                        ),
                        Ingredients(
                          ingredientController: _ingredientController,
                        ),
                        Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(15),
                              child: InkWell(
                                onTap: () {
                                  adminBloc.add(SelectImageEvent());
                                },
                                child: Text(
                                  'Add image',
                                  style: TextStyle(
                                    color: themeState
                                        .appTheme.secondaryHeaderColor,
                                    fontSize: themeState.appTheme.textTheme
                                        .titleMedium!.fontSize,
                                  ),
                                ),
                              ),
                            ),
                            ImageElement(
                              product: widget.product,
                            ),
                          ],
                        ),
                        ConfirmButton(
                          onTap: () {
                            if (adminState.selectedImage == '' &&
                                widget.product == null) {
                              adminBloc.add(
                                ThrowExceptionEvent(
                                  exception: 'Add image!',
                                ),
                              );
                            } else if (adminState.ingredients.isEmpty) {
                              adminBloc.add(
                                ThrowExceptionEvent(
                                  exception: 'Add some ingredients!',
                                ),
                              );
                            } else if (_formKey.currentState!.validate()) {
                              if (widget.product == null) {
                                adminBloc.add(AddProductEvent());
                              } else {
                                adminBloc.add(
                                  UpdateProductEvent(
                                    product: widget.product!,
                                  ),
                                );
                              }
                              context.router.pop();
                              adminBloc.add(InitProductsEvent());
                            }
                          },
                          content: widget.product != null
                              ? 'Update product'
                              : 'Create product',
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
