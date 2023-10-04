import 'dart:io';
import 'package:domain/domain.dart';
import 'package:domain/usecases/usecase.dart';

class UploadImageUseCase extends FutureUseCase<File, String> {
  final ProductRepository _productRepository;

  UploadImageUseCase({
    required ProductRepository productRepository,
  }) : _productRepository = productRepository;

  @override
  Future<String> execute(File imageFile) async {
    return await _productRepository.uploadImage(imageFile);
  }
}
