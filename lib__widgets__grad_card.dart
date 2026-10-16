import 'package:flutter/material.dart';
import '../core/theme.dart';
import 'thick_card.dart';

BoxDecoration gradDecoration(BuildContext c, {double radius = 16}) => BoxDecoration(
      color: NX.card(c),
      borderRadius: BorderRadius.circular(radius),
      border: Border.all(color: NX.line(c), width: 2),
      boxShadow: [BoxShadow(color: Theme.of(c).colorScheme.primary, offset: const Offset(3, 3))],
    );

/// Nama lama dipertahankan agar semua halaman tetap jalan; tampilannya kini kartu NEXVORA.
class GradCard extends StatelessWidget {
  final Widget child;
  final EdgeInsets padding;
  final VoidCallback? onTap;
  const GradCard({super.key, required this.child, this.padding = const EdgeInsets.all(14), this.onTap});
  @override
  Widget build(BuildContext context) => ThickCard(padding: padding, onTap: onTap, child: child);
}

class MenuTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? subtitle;
  final Widget? trailing;
  final VoidCallback? onTap;
  const MenuTile({super.key, required this.icon, required this.title, this.subtitle, this.trailing, this.onTap});
  @override
  Widget build(BuildContext context) {
    final accent = Theme.of(context).colorScheme.primary;
    return GradCard(
      onTap: onTap,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      child: Row(children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(color: accent.withOpacity(0.12), borderRadius: BorderRadius.circular(10), border: Border.all(color: accent, width: 1.5)),
          child: Icon(icon, color: accent),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(title, style: const TextStyle(fontWeight: FontWeight.w800)),
            if (subtitle != null) Text(subtitle!, style: const TextStyle(fontSize: 12, color: Colors.grey)),
          ]),
        ),
        trailing ?? const Icon(Icons.chevron_right),
      ]),
    );
  }
}
