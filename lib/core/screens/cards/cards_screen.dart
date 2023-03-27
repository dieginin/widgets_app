import 'package:flutter/material.dart';

const cards = <Map<String, dynamic>>[
  {'elevation': 0.0, 'label': 'Elevation 0'},
  // {'elevation': 1.0, 'label': 'Elevation 1'},
  // {'elevation': 2.0, 'label': 'Elevation 2'},
  {'elevation': 3.0, 'label': 'Elevation 3'},
  // {'elevation': 4.0, 'label': 'Elevation 4'},
  // {'elevation': 5.0, 'label': 'Elevation 5'},
  {'elevation': 6.0, 'label': 'Elevation 6'},
];

class CardsScreen extends StatelessWidget {
  const CardsScreen({super.key});

  static const name = 'cards_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CardsScreen'),
      ),
      body: _CardsView(),
    );
  }
}

class _CardsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ...cards.map(
            (card) => _CardType1(label: card['label'], elevation: card['elevation']),
          ),
          ...cards.map(
            (card) => _CardType2(label: card['label'], elevation: card['elevation']),
          ),
          ...cards.map(
            (card) => _CardType3(label: card['label'], elevation: card['elevation']),
          ),
          ...cards.map(
            (card) => _CardType4(label: card['label'], elevation: card['elevation']),
          ),
          const SizedBox(height: 50),
        ],
      ),
    );
  }
}

class _CardType1 extends StatelessWidget {
  const _CardType1({
    required this.label,
    required this.elevation,
  });

  final double elevation;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: elevation,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.more_vert),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(label),
            )
          ],
        ),
      ),
    );
  }
}

class _CardType2 extends StatelessWidget {
  const _CardType2({
    required this.label,
    required this.elevation,
  });

  final double elevation;
  final String label;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colors = Theme.of(context).colorScheme;

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: colors.outline),
      ),
      elevation: elevation,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.more_vert),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text('$label - Outline'),
            )
          ],
        ),
      ),
    );
  }
}

class _CardType3 extends StatelessWidget {
  const _CardType3({
    required this.label,
    required this.elevation,
  });

  final double elevation;
  final String label;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colors = Theme.of(context).colorScheme;

    return Card(
      color: colors.surfaceVariant,
      elevation: elevation,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.more_vert),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text('$label - Filled'),
            )
          ],
        ),
      ),
    );
  }
}

class _CardType4 extends StatelessWidget {
  const _CardType4({
    required this.label,
    required this.elevation,
  });

  final double elevation;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      elevation: elevation,
      child: Stack(
        children: [
          Image.network(
            'https://picsum.photos/id/${elevation.toInt()}/600/350',
            height: 350,
            fit: BoxFit.cover,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20)),
              ),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.more_vert),
              ),
            ),
          )
        ],
      ),
    );
  }
}
