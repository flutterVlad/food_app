class TextFormValidation {
  static String? Function(String?)? validate({String? field}) {
    return (String? value) {
      print(value);
      if (value == null || value.isEmpty) {
        return 'Please enter some text';
      }
      if (field == 'Price') {
        if (double.tryParse(value) == null) {
          return 'Please enter some number';
        }
      }
      return null;
    };
  }
}
