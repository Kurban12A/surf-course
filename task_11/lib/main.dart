import 'package:flutter/material.dart';
import 'package:task_11/theme_data.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key,});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorThemeData.bacgroundColor,
      body: const CustomScrollView(
        slivers: [
          _ImageSliverAppBar(),
          InformationBlock(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: const Color.fromARGB(255, 200, 200, 200),
        selectedItemColor: ColorThemeData.firstAccentColor,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Person',
          ),
        ],
      ),
    );
  }
}

class _ImageSliverAppBar extends StatelessWidget {
  const _ImageSliverAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SliverAppBar(
      snap: false,
      pinned: false,
      floating: false,
      foregroundColor: Colors.white,
      surfaceTintColor: Colors.transparent,
      flexibleSpace: FlexibleSpaceBar(
          collapseMode: CollapseMode.pin, background: ImageAppBar()),
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(250),
        child: SizedBox(),
      ),
    );
  }
}

class ImageAppBar extends StatelessWidget {
  const ImageAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
     final textStyle = GoogleFonts.playfairDisplay(
      textStyle: const TextStyle(
        fontStyle: FontStyle.italic,
        fontSize: 25,
        fontWeight: FontWeight.bold,
    ));

    const imageBoxDecoration = BoxDecoration(
        image: DecorationImage(
            image: AssetImage('lib/asset/main_foto.jpg'), 
            fit: BoxFit.cover));

    return Stack(
      children: [
        Container(decoration: imageBoxDecoration),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 50),
          child: Text(MocksTextApp.name, style: textStyle),
        ),
        const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 100,
            ),
            BaseContainer(
              icon: Icons.palette,
              color: ColorThemeData.firstAccentColor,
              text: MocksTextApp.uxDesigner,
            ),
            SizedBox(
              height: 10,
            ),
            BaseContainer(
              icon: Icons.equalizer,
              color: ColorThemeData.secondAccentColor,
              text: MocksTextApp.bussinesAnalyst,
            ),
            SizedBox(
              height: 10,
            ),
            BaseContainer(
              icon: Icons.school,
              color: ColorThemeData.thirdAccentColor,
              text: MocksTextApp.flutterDev,
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}

class BaseContainer extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color color;

  const BaseContainer({
    super.key,
    required this.icon,
    required this.text,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        fontFamily: 'Roboto');

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        height: 30,
        width: 170,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: ColorThemeData.containerColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: color),
            const SizedBox(
              width: 5,
            ),
            Text(
              text,
              style: textStyle,
            ),
          ],
        ),
      ),
    );
  }
}

class InformationBlock extends StatelessWidget {
  const InformationBlock({super.key});

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BaseRowWidget(
                  text1: 'Возраст',
                  text2: '32',
                ),
                BaseRowWidget(
                  text1: 'Опыт работы',
                  text2: '9',
                ),
                BaseRowWidget(
                  text1: 'Образование',
                  text2: '2',
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Header(MocksTextApp.categoryAboutMe),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: ExpandedTextWidget(text: MocksTextApp.longTextAboutMe),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Header(MocksTextApp.categoryHobbies),
          ),
          SizedBox(
            height: 10,
          ),
          CustomImageSlider(
            images: MocksTextApp.galleryImages,
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Header(MocksTextApp.categoryDevExp),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: ExpandedTextWidget(text: MocksTextApp.longTextDevExp),
          ),
        ],
      ),
    );
  }
}

class BaseRowWidget extends StatelessWidget {
  final String text1;
  final String text2;

  const BaseRowWidget({
    super.key,
    required this.text1,
    required this.text2,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          text1,
          style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: ColorThemeData.bodyTextColor),
        ),
        Text(
          text2,
          style: const TextStyle(
              fontSize: 18, color: ColorThemeData.bodyTextColor),
        ),
      ],
    );
  }
}

class Header extends StatelessWidget {
  final String title;
  const Header(this.title, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 18,
        color: ColorThemeData.bodyTextColor,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}

class BodyText extends StatelessWidget {
  final String title;
  const BodyText(this.title, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      maxLines: 5,
      overflow: TextOverflow.ellipsis,
      title,
      style: const TextStyle(fontSize: 14, color: ColorThemeData.bodyTextColor),
    );
  }
}

// раскрывающийся текст
class ExpandedTextWidget extends StatefulWidget {
  final String text;
  const ExpandedTextWidget({
    super.key,
    required this.text,
  });

  @override
  State<ExpandedTextWidget> createState() => _ExpandedTextWidgetState();
}

class _ExpandedTextWidgetState extends State<ExpandedTextWidget> {
  String? firstHalf;
  String? secondHalf;
  bool flag = true;

  @override
  void initState() {
    super.initState();
    if (widget.text.length > 200) {
      firstHalf = widget.text.substring(0, 200);
      secondHalf = widget.text.substring(201, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
      color: ColorThemeData.bodyTextColor,
      fontSize: 14,
      fontWeight: FontWeight.normal,
    );

    return Container(
        child: secondHalf?.length == ''
            ? Text(
                widget.text,
                style: const TextStyle(
                    color: ColorThemeData.bodyTextColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w300),
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(style: textStyle, flag ? '${firstHalf!}...' : widget.text),
                  InkWell(
                    onTap: () {
                      setState(() {
                        flag = !flag;
                      });
                    },
                    child: Row(
                      children: [
                        const Text(
                          'Подробнее',
                          style:
                              TextStyle(color: ColorThemeData.firstAccentColor),
                        ),
                        Icon(
                          flag
                              ? Icons.keyboard_arrow_down_rounded
                              : Icons.keyboard_arrow_up_rounded,
                          color: ColorThemeData.firstAccentColor,
                        )
                      ],
                    ),
                  )
                ],
              ));
  }
}

class CustomImageSlider extends StatelessWidget {
  final List<String> images;

  const CustomImageSlider({
    required this.images,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              const SizedBox(width: 20),
              ...images.map(
                (e) => SizedBox(
                  height: 150,
                  width: 150,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(e),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(7),
                          boxShadow: const [
                            BoxShadow(
                                offset: Offset(0, -2),
                                blurRadius: 8.0,
                                color: ColorThemeData.shadow)
                          ]),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 20),
            ],
          ),
        ),
      ],
    );
  }
}
