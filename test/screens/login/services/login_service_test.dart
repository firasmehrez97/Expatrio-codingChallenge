import 'package:coding_challenge/screens/login/services/login_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;

import '../../../mocks/mock_classes.mocks.dart';
// Import the generated mock classes

void main() {
  group('LoginService', () {
    late MockClient mockHttpClient;
    late MockFlutterSecureStorage mockSecureStorage;
    late LoginService loginService;
    late MockBuildContext mockBuildContext;

    setUp(() {
      mockHttpClient = MockClient();
      mockSecureStorage = MockFlutterSecureStorage();
      loginService = LoginService();
      mockBuildContext = MockBuildContext();
    });

    test('Successful login', () async {
      // Arrange
      when(mockHttpClient.post(
        any,
        headers: anyNamed('headers'),
        body: anyNamed('body'),
      )).thenAnswer((_) async => http.Response(
          '{"accessToken": "dummy_access_token", "userId": "1"}', 200));

      // Act
      final result = await loginService.login(
          'test@example.com', 'password', mockBuildContext);

      // Assert
      expect(result, true);
      verify(mockSecureStorage.write(
              key: "accessToken", value: "dummy_access_token"))
          .called(1);
      verify(mockSecureStorage.write(key: "userId", value: "1")).called(1);
    });

    test('Failed login', () async {
      // Arrange
      when(mockHttpClient.post(
        any,
        headers: anyNamed('headers'),
        body: anyNamed('body'),
      )).thenAnswer((_) async =>
          http.Response('{"message": "Invalid credentials"}', 400));

      // Act
      final result = await loginService.login(
          'wrong@example.com', 'wrongpassword', mockBuildContext);

      // Assert
      expect(result, false);
    });
  });
}
