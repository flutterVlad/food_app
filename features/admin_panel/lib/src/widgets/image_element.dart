import 'dart:io';

import 'package:admin_panel/admin_panel.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

class ImageElement extends StatelessWidget {
  final ProductModel? product;

  const ImageElement({
    super.key,
    this.product,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdminBloc, AdminState>(
      builder: (_, AdminState adminState) {
        final MediaQueryData media = MediaQuery.of(context);

        if (adminState.selectedImage == '' && product != null) {
          return Center(
            child: CachedImage(
              imageUrl: product?.imageUrl ?? '',
              height: media.size.width * 0.5,
            ),
          );
        } else if (adminState.selectedImage != '') {
          return Center(
            child: Image.file(
              File(adminState.selectedImage),
              height: media.size.width * 0.5,
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
