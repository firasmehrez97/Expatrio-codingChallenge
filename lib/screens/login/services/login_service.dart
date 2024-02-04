import 'dart:io'; // Import Dart's IO library for network/socket exceptions.
import 'package:coding_challenge/screens/tax/tax_screen.dart'; // Import the tax screen from the project's screens.
import 'package:coding_challenge/shared/utils/extensions/theme_data_extension.dart'; // Import theme data extension for UI customization.
import 'package:coding_challenge/shared/widgets/bottom_modal.dart'; // Import a custom widget for displaying bottom modals.
import 'package:flutter/material.dart'; // Import Flutter's material design library.
import 'package:flutter_secure_storage/flutter_secure_storage.dart'; // Import the flutter secure storage package for secure data storage.
import 'package:http/http.dart'
    as http; // Import the http package for making API requests.
import 'dart:convert'; // Import Dart's convert library for JSON processing.

class LoginService {
  static const String baseUrl =
      'https://dev-api.expatrio.com'; // Base URL for the API.

  Future<bool> login(
      String email, String password, BuildContext context) async {
    // Display a snackbar with a login attempt message.
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text(
      "Trying to login...",
    )));

    const storage = FlutterSecureStorage(); // Initialize secure storage.

    try {
      // Prepare request body with email and password.
      final requestBodydata = {"email": email, "password": password};

      // Make a POST request to the login API.
      final requestResponse = await http.post(
        Uri.parse("$baseUrl/auth/login"),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(requestBodydata),
      );

      // Decode the JSON response body.
      final requestResponseBody = json.decode(requestResponse.body);

      if (requestResponse.statusCode == 200) {
        // If the request was successful.
        if (context.mounted) {
          ScaffoldMessenger.of(context)
              .removeCurrentSnackBar(); // Remove any existing snackbars.
          _showSuccessfulBottomSheet(context); // Show a success modal.
        }

        // Store accessToken and userId in secure storage.
        await storage.write(
          key: "accessToken",
          value: requestResponseBody['accessToken'],
        );
        await storage.write(
          key: "userId",
          value: requestResponseBody['userId'].toString(),
        );
        return true; // Return true to indicate a successful login.
      } else {
        // If the request failed.
        if (context.mounted) {
          ScaffoldMessenger.of(context)
              .removeCurrentSnackBar(); // Remove any existing snackbars.
          _showErrorBottomSheet(
              context,
              requestResponseBody[
                  'message']); // Show an error modal with the server's response message.
        }
        return false; // Return false to indicate a failed login.
      }
    } on SocketException catch (e) {
      // Catch network errors.
      if (context.mounted) {
        ScaffoldMessenger.of(context)
            .removeCurrentSnackBar(); // Remove any existing snackbars.
        _showErrorBottomSheet(context,
            "Unable to communicate with the server. Check your internet connection and retry! Error: $e"); // Show an error modal with a custom message.
      }
      return false; // Return false to indicate a network error.
    }
  }

  // Private helper method to show a successful login bottom sheet.
  void _showSuccessfulBottomSheet(BuildContext context) {
    ButtomModal(
        context: context,
        heightFactor: 0.4,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.check_circle,
                color: Theme.of(context)
                    .colors
                    .primary, // Use the primary theme color for the icon.
                size: 80,
              ),
              const SizedBox(height: 16),
              const Text(
                'Successful login',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              const Text('You will be redirected to your dashboard'),
              const SizedBox(height: 16),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context)
                        .colors
                        .primary, // Use the primary theme color for the button.
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  ),
                  onPressed: () async {
                    Navigator.pop(context); // Close the modal.
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const TaxScreen()), // Navigate to the tax screen.
                    );
                  },
                  child: Container(
                    height: 24,
                    width: 250,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Theme.of(context)
                          .colors
                          .primary, // Use the primary theme color for the container.
                      borderRadius:
                          const BorderRadius.all(Radius.circular(100)),
                    ),
                    child: const Text(
                      'Got it ',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  )),
            ],
          ),
        ));
  }

  // Private helper method to show an error login bottom sheet.
  void _showErrorBottomSheet(BuildContext context, String errorMessage) {
    ButtomModal(
        context: context,
        heightFactor: 0.4,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Icon(
                Icons.error_outline,
                color: Colors.red, // Use red color for the error icon.
                size: 80,
              ),
              const SizedBox(height: 16),
              const Text(
                'Login failure',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Text(errorMessage), // Display the error message.
              const SizedBox(height: 16),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context)
                        .colors
                        .primary, // Use the primary theme color for the button.
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  ),
                  onPressed: () async {
                    Navigator.pop(context); // Close the modal.
                  },
                  child: Container(
                    height: 24,
                    width: 250,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Theme.of(context)
                          .colors
                          .primary, // Use the primary theme color for the container.
                      borderRadius:
                          const BorderRadius.all(Radius.circular(100)),
                    ),
                    child: const Text(
                      'OK',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  )),
            ],
          ),
        ));
  }
}
