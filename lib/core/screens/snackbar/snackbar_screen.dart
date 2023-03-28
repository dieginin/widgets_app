import 'package:flutter/material.dart';

class SnackbarScreen extends StatelessWidget {
  const SnackbarScreen({super.key});

  static const name = 'snackbar_screen';

  showCustomSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();

    final snackBar = SnackBar(
      content: const Text('data'),
      action: SnackBarAction(label: 'Ok', onPressed: () {}),
      duration: const Duration(seconds: 2),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  openDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('¿Estás Seguro?'),
        content: const Text(
            'Exercitation proident adipisicing fugiat sit tempor anim amet ullamco cupidatat ut non occaecat adipisicing occaecat. Quis Lorem magna deserunt cupidatat nostrud do nostrud qui consequat voluptate occaecat sunt et ullamco. Sunt velit sunt in amet ad adipisicing sunt Lorem enim labore exercitation. Amet officia ea dolor qui. Anim aute dolore culpa ullamco ea. Pariatur esse amet occaecat esse sunt incididunt cillum et excepteur incididunt voluptate.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancelar'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Acentar'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snackbars y Dialogos'),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Mostrar Snack Bar'),
        icon: const Icon(Icons.remove_red_eye_outlined),
        onPressed: () => showCustomSnackbar(context),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
              onPressed: () {
                showAboutDialog(context: context, children: [
                  const Text(
                      'Eu labore tempor irure reprehenderit sit deserunt. Labore occaecat aliquip irure ullamco sit. Mollit ad cillum amet sint amet sunt ullamco id magna. Eu dolore aute officia duis. Veniam in nisi ad in anim nulla qui est laborum commodo sint et id magna. Exercitation eiusmod et cillum esse sit. Laborum ut commodo pariatur sunt voluptate veniam nisi nostrud magna cupidatat pariatur.'),
                ]);
              },
              child: const Text('Licencias usadas'),
            ),
            FilledButton.tonal(
              onPressed: () => openDialog(context),
              child: const Text('Mostrar dialogo'),
            )
          ],
        ),
      ),
    );
  }
}
