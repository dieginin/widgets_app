import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ButtonsScreen extends StatelessWidget {
  const ButtonsScreen({super.key});

  static const name = 'buttons_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('ButtonsScreen'),
      ),
      body: _ButtonView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.pop(),
        child: const Icon(Icons.arrow_back_ios_new_rounded),
      ),
    );
  }
}

class _ButtonView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ColorScheme colors = Theme.of(context).colorScheme;

    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Wrap(
          spacing: 10,
          alignment: WrapAlignment.center,
          children: [
            ElevatedButton(onPressed: () {}, child: const Text('Elevated')),
            const ElevatedButton(onPressed: null, child: Text('Elevated Disabled')),
            ElevatedButton.icon(onPressed: () {}, icon: const Icon(Icons.access_alarm_outlined), label: const Text('Eleveted Icon')),
            FilledButton(onPressed: () {}, child: const Text('Filled')),
            FilledButton.icon(onPressed: () {}, icon: const Icon(Icons.accessibility_new), label: const Text('Filled Icon')),
            OutlinedButton(onPressed: () {}, child: const Text('Outline')),
            const OutlinedButton(onPressed: null, child: Text('Outline Disabled')),
            OutlinedButton.icon(onPressed: () {}, icon: const Icon(Icons.terminal), label: const Text('Ourline Icon')),
            TextButton(onPressed: () {}, child: const Text('Text')),
            TextButton.icon(onPressed: () {}, icon: const Icon(Icons.account_box_outlined), label: const Text('Text Icon')),
            _CustomButton(),
            IconButton(onPressed: () {}, icon: const Icon(Icons.app_registration_rounded)),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.app_registration_rounded),
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(colors.primary),
                iconColor: const MaterialStatePropertyAll(Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CustomButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ColorScheme colors = Theme.of(context).colorScheme;

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Material(
        color: colors.primary,
        child: InkWell(
          onTap: () {},
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              'Custom',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
