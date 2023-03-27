import 'package:flutter/material.dart';

class MenuItem {
  const MenuItem({
    required this.title,
    required this.subTitle,
    required this.link,
    required this.icon,
  });

  final IconData icon;
  final String link;
  final String subTitle;
  final String title;
}

const appMenuItems = [
  MenuItem(
    title: 'Botones',
    subTitle: 'Varios botones en Flutter',
    link: '/buttons',
    icon: Icons.smart_button_outlined,
  ),
  MenuItem(
    title: 'Tarjetas',
    subTitle: 'Un contenedor estilizado',
    link: '/cards',
    icon: Icons.credit_card,
  ),
  MenuItem(
    title: 'Progress Indicators',
    subTitle: 'Generales y controlados',
    link: '/progress',
    icon: Icons.refresh_rounded,
  ),
];
