import 'package:flutter/material.dart';
import '../core/theme.dart';

/// Kartu NEXVORA: border gelap tebal dan bayangan teal keras.
class ThickCard extends StatelessWidget {
  final Widget child;
  final EdgeInsets padding;
  final double radius;
  final double shadow;
  final VoidCallback? onTap;
  const ThickCard({super.key, required this.child, this.padding = const EdgeInsets.all(14), this.radius = 16, this.shadow = 3, this.onTap});

  @override
  Widget build(BuildContext context) {
    final accent = Theme.of(context).colorScheme.primary;
    final r = BorderRadius.circular(radius);
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 4, shadow + 1, shadow + 5),
      child: Container(
        decoration: BoxDecoration(
          color: NX.card(context),
          borderRadius: r,
          border: Border.all(color: NX.line(context), width: 2),
          boxShadow: [BoxShadow(color: accent, offset: Offset(shadow, shadow))],
        ),
        child: Material(
          color: Colors.transparent,
          borderRadius: r,
          clipBehavior: Clip.antiAlias,
          child: InkWell(onTap: onTap, child: Padding(padding: padding, child: child)),
        ),
      ),
    );
  }
}

/// Judul bagian: garis teal di kiri, huruf kapital.
class SectionTitle extends StatelessWidget {
  final String text;
  const SectionTitle(this.text, {super.key});
  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.fromLTRB(2, 16, 2, 6),
        child: Row(children: [
          Container(width: 4, height: 16, color: Theme.of(context).colorScheme.primary),
          const SizedBox(width: 8),
          Text(text.toUpperCase(), style: const TextStyle(fontWeight: FontWeight.w900, letterSpacing: 1.2, fontSize: 12)),
        ]),
      );
}
