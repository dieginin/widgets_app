import 'package:flutter/material.dart';

class ProgressScreen extends StatelessWidget {
  const ProgressScreen({super.key});

  static const name = 'progress_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProgressScreen'),
      ),
      body: _ProgressView(),
    );
  }
}

class _ProgressView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: [
        const SizedBox(height: 30),
        const Text('Circular progress indicator'),
        const SizedBox(height: 10),
        const CircularProgressIndicator(strokeWidth: 2, backgroundColor: Colors.black12),
        const SizedBox(height: 20),
        const Text('Controlled circuland and linear'),
        const SizedBox(height: 10),
        _ControllerProgressIndicator(),
      ]),
    );
  }
}

class _ControllerProgressIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Stream.periodic(const Duration(milliseconds: 300), (value) {
          return (value * 2) / 100;
        }).takeWhile((value) => value < 100),
        builder: (context, snapshot) {
          final double progressValue = snapshot.data ?? 0;

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(value: progressValue, strokeWidth: 2, backgroundColor: Colors.black12),
                const SizedBox(width: 20),
                Expanded(
                  child: LinearProgressIndicator(value: progressValue),
                ),
              ],
            ),
          );
        });
  }
}
