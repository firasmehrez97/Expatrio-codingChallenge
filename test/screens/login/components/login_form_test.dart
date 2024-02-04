import 'package:coding_challenge/screens/login/components/login_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:coding_challenge/screens/login/services/login_service.dart';

class MockLoginService extends Mock implements LoginService {}

void main() {
  group('LoginForm Tests', () {
    late MockLoginService mockLoginService;

    setUp(() {
      mockLoginService = MockLoginService();
    });

    Widget makeTestableWidget({required Widget child}) {
      return MaterialApp(
        home: Scaffold(
          body: child,
        ),
      );
    }

    testWidgets('Empty email and password does not call login',
        (WidgetTester tester) async {
      // Arrange
      when(mockLoginService.login("any", "any", "any" as BuildContext))
          .thenAnswer((_) async => true);

      // Act
      await tester.pumpWidget(makeTestableWidget(child: const LoginForm()));

      // Find the login button and tap it
      final loginButton = find.byType(ElevatedButton);
      await tester.tap(loginButton);
      await tester.pump();

      // Assert
      verifyNever(mockLoginService.login("any", "any", "any" as BuildContext));
    });

    testWidgets('Valid email and password calls login',
        (WidgetTester tester) async {
      // Arrange
      when(mockLoginService.login("any", "any", "any" as BuildContext))
          .thenAnswer((_) async => true);

      // Provide valid inputs
      await tester.pumpWidget(makeTestableWidget(child: const LoginForm()));
      await tester.enterText(
          find.byType(TextFormField).at(0), 'test@example.com');
      await tester.enterText(find.byType(TextFormField).at(1), 'password123');

      // Act
      await tester.tap(find.byType(ElevatedButton));
      await tester.pump();

      // Assert
      verify(mockLoginService.login(
              'test@example.com', 'password123', "any" as BuildContext))
          .called(1);
    });

    testWidgets('Toggles password visibility', (WidgetTester tester) async {
      // Arrange & Act
      await tester.pumpWidget(makeTestableWidget(child: const LoginForm()));

      // Assert initial state is obscured
      expect(
          tester.widget<TextFormField>(find.byType(TextFormField).at(1)), true);

      // Tap the visibility icon to toggle
      await tester.tap(find.byIcon(Icons.visibility));
      await tester.pump();

      // Assert the state is updated to not obscured
      expect(tester.widget<TextFormField>(find.byType(TextFormField).at(1)),
          false);
    });

    // Add more tests as needed
  });
}
