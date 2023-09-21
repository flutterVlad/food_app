import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:home/home.dart';
import 'package:settings/settings.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../helper/helper_stuff.dart';

void main() {
  late ThemeBloc themeBloc;
  late  MockSetThemeDataUseCase mockSetThemeDataUseCase;
  late  MockCheckThemeDataUseCase mockCheckThemeDataUseCase;
  late  MockSetFontSizeUseCase mockSetFontSizeUseCase;
  late  MockGetFontSizeUseCase mockGetFontSizeUseCase;

  setUp(() {
    mockSetThemeDataUseCase = MockSetThemeDataUseCase();
    mockCheckThemeDataUseCase = MockCheckThemeDataUseCase();
    mockSetFontSizeUseCase = MockSetFontSizeUseCase();
    mockGetFontSizeUseCase = MockGetFontSizeUseCase();
    themeBloc = ThemeBloc(
      setThemeDataUseCase: mockSetThemeDataUseCase,
      checkThemeDataUseCase: mockCheckThemeDataUseCase,
      setFontSizeUseCase: mockSetFontSizeUseCase,
      getFontSizeUseCase: mockGetFontSizeUseCase,
    );
  });

  Widget makeTestableWidget(Widget body) {
    return BlocProvider<ThemeBloc>(
      create: (BuildContext context) => themeBloc,
      child: MaterialApp(
        home: Material(
          child: Scaffold(
            body: body,
          ),
        ),
      ),
    );
  }

  testWidgets(
    'product name should be displayed',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        makeTestableWidget(
          HomeCard(
            model: productList[0],
          ),
        ),
      );
      expect(find.text('first'), findsOneWidget);
    },
  );
}
