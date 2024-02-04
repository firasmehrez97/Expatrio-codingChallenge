import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginHelpButton extends StatelessWidget {
  const LoginHelpButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        final Uri url = Uri.parse('https://www.expatrio.com');
        await launchUrl(url);
      },
      child: Row(
        children: [
          const SizedBox(width: 16),
          RichText(
            text: const TextSpan(
              children: [
                WidgetSpan(
                  child: Icon(Icons.help_outline,
                      size: 18,
                      color: Colors
                          .teal), // Customize the color and size as needed
                ),
                TextSpan(
                  text: " Help",
                  style: TextStyle(
                      color: Colors.teal,
                      fontWeight: FontWeight
                          .bold), // Customize the color and font style as needed
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
