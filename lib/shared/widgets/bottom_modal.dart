import 'package:flutter/material.dart';

class ButtomModal {
  final BuildContext context;
  final double heightFactor;
  final Widget child;
  final EdgeInsets padding;
  ButtomModal(
      {required this.context,
      this.heightFactor = 0.6,
      required this.child,
      this.padding = const EdgeInsets.all(32)}) {
    _showModal();
  }
  void _showModal() {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(18.0)),
      ),
      builder: (BuildContext context) {
        return FractionallySizedBox(
            heightFactor: heightFactor,
            child: Container(
              color: Colors.transparent,
              child: Container(
                  padding: padding,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                  ),
                  child: child),
            ));
      },
    );
  }
}
