import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter/material.dart';

// Use the @GenerateMocks annotation to specify which classes to mock.
@GenerateMocks(
    [http.Client, FlutterSecureStorage, ScaffoldMessengerState, BuildContext])
void main() {}
