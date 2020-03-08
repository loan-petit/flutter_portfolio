import 'package:flutter/material.dart';

/// Create a stylized link with a [label] to an internal or external uri.
///
/// On link tap the [onTap] callback is executed.
class Link extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  Link({
    @required this.label,
    @required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onTap,
      child: UnconstrainedBox(
        child: Container(
          padding: const EdgeInsets.all(5.0),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Theme.of(context).colorScheme.primary,
                width: 3.0,
              ),
            ),
          ),
          child: Text(
            this.label,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.subtitle1.apply(
              color: Theme.of(context).colorScheme.primary,
              fontWeightDelta: 2,
            ),
          ),
        ),
      ),
    );
  }
}
