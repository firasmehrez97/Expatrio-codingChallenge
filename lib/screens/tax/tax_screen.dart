import 'package:flutter/material.dart';

import 'components/tax_shape.dart';

class TaxScreen extends StatelessWidget {
  const TaxScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.grey[200], // Set the AppBar color

          iconTheme: const IconThemeData(color: Colors.black)),
      body: const TaxShape(),
    );
  }
}
