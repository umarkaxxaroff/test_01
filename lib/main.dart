import 'package:flutter/material.dart';

void main() {
  runApp(const MyAppText());
}

class MyAppText extends StatefulWidget {
  const MyAppText({Key? key}) : super(key: key);

  @override
  State<MyAppText> createState() => _MyAppState();
}

class _MyAppState extends State<MyAppText> {
  int screenIndex = 0;
  final screens = [];

  @override
  void initState() {
    super.initState();
    screens.add(FirstScreen(increment: increment));
    screens.add(SecondScreen(increment: increment));
    screens.add(FourthScreen(increment: increment));
  }

  void increment() {
    if (screenIndex == screens.length - 1) {
      screenIndex = 0;
    } else {
      screenIndex += 1;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Nunito'),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        bottomNavigationBar: const ImageButtons(),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: Center(
                  child: SizedBox(
                    height: 64,
                    width: 64,
                    child: CircleAvatar(
                      backgroundColor: Color(0xFFE6E8EB),
                      child: Text(
                        'K',
                        style: TextStyle(
                            color: Color(0xFF011936),
                            fontSize: 32,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              const Center(
                child: Text(
                  'Константин Володарский',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF011936),
                  ),
                ),
              ),
              const Divider(
                color: Color(0xFFE6E8EB),
                thickness: 2,
              ),
              const SizedBox(
                height: 24,
              ),
              screens[screenIndex],
            ],
          ),
        ),
      ),
    );
  }
}

class ImageButtons extends StatefulWidget {
  const ImageButtons({Key? key}) : super(key: key);

  @override
  State<ImageButtons> createState() => _ImageButtonsState();
}

class _ImageButtonsState extends State<ImageButtons> {
  final List images = [
    'assets/images/house.png',
    'assets/images/kub.png',
    'assets/images/plus.png',
    'assets/images/search.png',
    'assets/images/user.png'
  ];
  int firstIndex = 0;

  void toogle(int newIndex) {
    firstIndex = newIndex;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(
          5,
          (index) => CategoryButton(
            image: images[index],
            isActive: index == firstIndex,
            onTap: () {
              toogle(index);
            },
          ),
        ),
      ),
    );
  }
}

class CategoryButton extends StatelessWidget {
  const CategoryButton({
    Key? key,
    this.isActive = false,
    required this.onTap,
    required this.image,
  }) : super(key: key);
  final bool isActive;
  final VoidCallback onTap;
  final String image;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Image.asset(
        image,
        height: 24,
        width: 24,
        color: isActive ? const Color(0xFF3A86FF) : const Color(0xFFBFC5CD),
      ),
    );
  }
}

class FirstScreen extends StatefulWidget {
  final VoidCallback increment;
  const FirstScreen({
    Key? key,
    required this.increment,
  }) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Что на странице Контантина кажется вам недопустимым?',
            style: TextStyle(
                color: Color(0xFF011936),
                fontSize: 16,
                fontWeight: FontWeight.w600),
          ),
          TextButton(
            style: TextButton.styleFrom(
                alignment: Alignment.centerLeft, padding: EdgeInsets.zero),
            onPressed: () => widget.increment(),
            child: const Text(
              'Спам',
              style: TextStyle(
                color: Color(0xFF011936),
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          TextButton(
            style: TextButton.styleFrom(
                alignment: Alignment.centerLeft, padding: EdgeInsets.zero),
            onPressed: () => widget.increment(),
            child: const Text(
              'Мошенничество',
              style: TextStyle(
                  color: Color(0xFF011936),
                  fontSize: 12,
                  fontWeight: FontWeight.w400),
            ),
          ),
          TextButton(
            style: TextButton.styleFrom(
                alignment: Alignment.centerLeft, padding: EdgeInsets.zero),
            onPressed: () => widget.increment(),
            child: const Text(
              'Оскорбления',
              style: TextStyle(
                  color: Color(0xFF011936),
                  fontSize: 12,
                  fontWeight: FontWeight.w400),
            ),
          ),
          TextButton(
            style: TextButton.styleFrom(
                alignment: Alignment.centerLeft, padding: EdgeInsets.zero),
            onPressed: () => widget.increment(),
            child: const Text(
              'Откровенное изображение',
              style: TextStyle(
                  color: Color(0xFF011936),
                  fontSize: 12,
                  fontWeight: FontWeight.w400),
            ),
          ),
          TextButton(
            style: TextButton.styleFrom(
                alignment: Alignment.centerLeft, padding: EdgeInsets.zero),
            onPressed: () => widget.increment(),
            child: const Text(
              'Проблема c профилем',
              style: TextStyle(
                  color: Color(0xFF011936),
                  fontSize: 12,
                  fontWeight: FontWeight.w400),
            ),
          ),
          TextButton(
            style: TextButton.styleFrom(
                alignment: Alignment.centerLeft, padding: EdgeInsets.zero),
            onPressed: () => widget.increment(),
            child: const Text(
              'Нарушение интеллектуальных прав',
              style: TextStyle(
                color: Color(0xFF011936),
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          TextButton(
            style: TextButton.styleFrom(
                alignment: Alignment.centerLeft, padding: EdgeInsets.zero),
            onPressed: () => widget.increment(),
            child: const Text(
              'Прочее',
              style: TextStyle(
                color: Color(0xFF011936),
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SecondScreen extends StatefulWidget {
  final VoidCallback increment;
  const SecondScreen({
    Key? key,
    required this.increment,
  }) : super(key: key);

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text(
            'Спам',
            style: TextStyle(
              color: Color(0xFF011936),
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          const Text(
            'Отправьте жалобу, если пользователь рассылает рекламные сообщения, комментарии или другим способом распространяет рекламу в непредназначенных для этого местах.',
            style: TextStyle(
              color: Color(0xFF011936),
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          const Text(
            'Комментарий (необязательно)',
            style: TextStyle(
              color: Color(0xFF808C9A),
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Container(
            color: const Color(0xFFF2F4F5),
            child: const Padding(
              padding: EdgeInsets.all(16.0),
              child: SizedBox(
                height: 16,
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Опишите причину жалобы',
                    hintStyle: TextStyle(
                      color: Color(0xFF808C9A),
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF3A86FF),
              ),
              onPressed: () => widget.increment(),
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: Text(
                  'Отправить жалобу',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FourthScreen extends StatefulWidget {
  final VoidCallback increment;
  const FourthScreen({Key? key, required this.increment}) : super(key: key);

  @override
  State<FourthScreen> createState() => _FourthScreenState();
}

class _FourthScreenState extends State<FourthScreen> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/IconStar.png',
            width: 64,
            height: 64,
          ),
          const SizedBox(
            height: 24,
          ),
          const Text(
            'Спасибо!',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Color(
                0xFF011936,
              ),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          const Text(
            'Модераторы скоро рассмотрят вашу жалобу.',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Color(0xFF011936),
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ElevatedButton(
                onPressed: () => widget.increment(),
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Text(
                    'Закрыть',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
