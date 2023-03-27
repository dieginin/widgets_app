import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final slides = <SlideInfo>[
  SlideInfo(
    'Busca la comida',
    'Enim irure voluptate sint aliquip ullamco duis dolor qui elit in sint et deserunt ipsum. Labore sunt eiusmod eu qui exercitation eiusmod magna. Aliqua voluptate enim cupidatat velit quis fugiat occaecat do labore incididunt nostrud esse occaecat. Consequat incididunt qui consectetur proident in irure.',
    'assets/images/1.png',
  ),
  SlideInfo(
    'Entrega rápida',
    'Esse ut cillum do dolore nostrud reprehenderit. Pariatur elit qui dolor cupidatat esse non. Labore elit id sunt anim reprehenderit eiusmod minim ea. Enim ut occaecat nisi labore ipsum culpa nisi. Eiusmod sit veniam sunt in quis exercitation exercitation et adipisicing.',
    'assets/images/2.png',
  ),
  SlideInfo(
    'Disfruta la comida',
    'Velit ullamco nulla consectetur aliquip ea irure. Do tempor ullamco culpa deserunt excepteur. Reprehenderit est ullamco laboris tempor est sint velit. Laboris officia pariatur id esse officia aliquip cillum veniam eiusmod cillum reprehenderit mollit cupidatat eu. Ullamco magna ut enim id sint aliquip do aliquip officia Lorem. Laborum aute adipisicing nisi exercitation dolor consequat excepteur amet ad et qui sint.',
    'assets/images/3.png',
  ),
];

class SlideInfo {
  SlideInfo(
    this.title,
    this.caption,
    this.imageUrl,
  );

  final String caption;
  final String imageUrl;
  final String title;
}

class AppTutorialScreen extends StatefulWidget {
  const AppTutorialScreen({super.key});

  static const name = 'tutorial_screen';

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {
  final PageController pageViewController = PageController();
  bool endReached = false;

  @override
  void initState() {
    super.initState();

    pageViewController.addListener(() {
      final page = pageViewController.page ?? 0;

      if (!endReached && page >= (slides.length - 1.5)) {
        setState(() => endReached = true);
      }
    });
  }

  @override
  void dispose() {
    pageViewController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            controller: pageViewController,
            physics: const BouncingScrollPhysics(),
            children: [
              ...slides.map(
                (slideData) => _Slide(
                  title: slideData.title,
                  caption: slideData.caption,
                  imageUrl: slideData.imageUrl,
                ),
              )
            ],
          ),
          Positioned(
            right: 20,
            top: 50,
            child: TextButton(
              onPressed: () => context.pop(),
              child: const Text('Salir'),
            ),
          ),
          if (endReached)
            Positioned(
              bottom: 30,
              right: 30,
              child: FadeInRight(
                from: 15,
                delay: const Duration(milliseconds: 300),
                child: FilledButton(
                  onPressed: () => context.pop(),
                  child: const Text('Empezar'),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  const _Slide({
    required this.title,
    required this.caption,
    required this.imageUrl,
  });

  final String caption;
  final String imageUrl;
  final String title;

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodySmall;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image(image: AssetImage(imageUrl)),
          const SizedBox(height: 20),
          Text(title, style: titleStyle),
          const SizedBox(height: 10),
          Text(caption, style: captionStyle),
        ],
      ),
    );
  }
}
