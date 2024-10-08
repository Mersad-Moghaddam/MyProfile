import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode themeMode = ThemeMode.dark;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: themeMode == ThemeMode.dark
            ? MyAppThemeConfig.dark().getTheme()
            : MyAppThemeConfig.light().getTheme(),
        home: MyHomePage(toggleThemeMode: () {
          setState(() {
            themeMode =
                themeMode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
          });
        }));
  }
}

class MyAppThemeConfig {
  final primaryColor = Colors.pink.shade500;
  final Color primaryTextColor;
  final Color secondaryTextColor;
  final Color surfaceColor;
  final Color backgroundColor;
  final Color appBarColor;
  final Brightness brightness;
  final Color divider;
  final Color iconTheme;

  MyAppThemeConfig.dark()
      : primaryTextColor = Colors.white,
        iconTheme = Colors.white,
        divider = Colors.white12,
        secondaryTextColor = Colors.white70,
        surfaceColor = const Color(0x0dffffff),
        backgroundColor = const Color.fromARGB(255, 30, 30, 30),
        appBarColor = Colors.black,
        brightness = Brightness.dark;

  MyAppThemeConfig.light()
      : primaryTextColor = Colors.grey.shade900,
        iconTheme = Colors.black,
        divider = Colors.black26,
        secondaryTextColor = Colors.grey.shade900.withOpacity(0.8),
        surfaceColor = const Color(0x30000000),
        backgroundColor = Colors.white,
        appBarColor = const Color.fromARGB(26, 0, 0, 0),
        brightness = Brightness.light;
  ThemeData getTheme() {
    return ThemeData(
      // colorScheme: ColorScheme.fromSeed(
      //     seedColor: Colors.deepPurple, brightness: brightness),
      primarySwatch: Colors.pink,
      brightness: Brightness.dark,
      primaryColor: primaryColor,
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(primaryColor))),
      useMaterial3: true,
      scaffoldBackgroundColor: backgroundColor,
      //brightness: Brightness.dark,
      textTheme: GoogleFonts.latoTextTheme(TextTheme(
          bodySmall: TextStyle(fontSize: 13, color: secondaryTextColor),
          bodyMedium: TextStyle(fontSize: 15, color: primaryTextColor),
          bodyLarge: TextStyle(fontSize: 13, color: secondaryTextColor),
          headlineSmall:
              TextStyle(fontWeight: FontWeight.bold, color: primaryTextColor),
          headlineMedium:
              TextStyle(fontWeight: FontWeight.bold, color: primaryTextColor),
          headlineLarge: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: primaryTextColor))),
      dividerTheme: DividerThemeData(
        color: divider,
      ),
      inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none),
          filled: true,
          fillColor: surfaceColor,
          labelStyle:
              TextStyle(color: secondaryTextColor, fontWeight: FontWeight.bold),
          prefixIconColor: secondaryTextColor),
      appBarTheme: AppBarTheme(
          backgroundColor: appBarColor,
          iconTheme: IconThemeData(color: iconTheme),
          titleTextStyle: TextStyle(
              color: primaryTextColor,
              fontWeight: FontWeight.bold,
              fontSize: 18)),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.toggleThemeMode});

  final Function() toggleThemeMode;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

enum Skills {
  flutter,
  dart,
  androidStudio,
  fireBase,
}

class _MyHomePageState extends State<MyHomePage> {
  Skills skill = Skills.flutter;
  void updateSkill(Skills type) {
    setState(() {
      skill = type;
    });
  }

  final String resume =
      """I am Mersad, a Bachelor’s student in Computer Engineering and a member of the Student Scientific Association at Sadjad Industrial University.
Software developer in the area of developing quality and reliable software and implementing UI with the Flutter framework.
I have experience in State Management in Flutter (Provider & GetX etc ), Firebase, and Sqlite database.""";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "My Profile",
          ),
          actions: [
            const Icon(
              CupertinoIcons.chat_bubble,
              //color: Colors.white,
            ),
            const SizedBox(
              width: 4,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: InkWell(
                onTap: widget.toggleThemeMode,
                child: const Icon(
                  CupertinoIcons.sun_max_fill,
                  //color: Colors.white,
                ),
              ),
            )
          ],
        ),
        body: Scaffold(
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                Row(
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(30),
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.asset(
                                  "assets/images/mersad.png",
                                  width: 80,
                                  height: 80,
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.all(15.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Mersad Moghaddam",
                                      // style: TextStyle(
                                      //     fontWeight: FontWeight.bold,
                                      //     color: Colors.white),
                                    ),
                                    Text(
                                      "Flutter Developer",
                                      //style: TextStyle(color: Colors.white),
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          CupertinoIcons.phone_circle,
                                          color: Colors.redAccent,
                                        ),
                                        SizedBox(
                                          width: 7,
                                        ),
                                        Text(
                                          "+989159724659",
                                          //style: TextStyle(color: Colors.white70),
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          CupertinoIcons.location_solid,
                                          color: Colors.grey,
                                        ),
                                        Text(
                                          "Mashhad, Iran",
                                          //style: TextStyle(color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const Divider(),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
                        child: Text(
                          resume,
                          style: const TextStyle(
                              //color: Colors.white70,
                              ),
                        ),
                      ),
                    )
                  ],
                ),
                const Divider(),
                const Padding(
                  padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                  child: Row(
                    children: [
                      Text(
                        "Skills",
                        // style: TextStyle(
                        //     color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      Icon(
                        CupertinoIcons.chevron_down,
                        color: Colors.white,
                        weight: 50,
                        size: 15,
                      )
                    ],
                  ),
                ),
                Center(
                  child: Wrap(
                    spacing: 30,
                    runSpacing: 8,
                    direction: Axis.horizontal,
                    children: [
                      Skill(
                          onTap: () {
                            updateSkill(Skills.flutter);
                          },
                          type: Skills.flutter,
                          title: "flutter",
                          imagePath: "assets/images/flutter.png",
                          shadowColor: Colors.lightBlueAccent,
                          isActive: skill == Skills.flutter),
                      Skill(
                          onTap: () {
                            updateSkill(Skills.dart);
                          },
                          type: Skills.dart,
                          title: "Dart",
                          imagePath: "assets/images/Dart (1).png",
                          shadowColor: Colors.blue,
                          isActive: skill == Skills.dart),
                      Skill(
                          onTap: () {
                            updateSkill(Skills.androidStudio);
                          },
                          type: Skills.androidStudio,
                          title: "Android Studio",
                          imagePath: "assets/images/Android_Studio.png",
                          shadowColor: Colors.green,
                          isActive: skill == Skills.androidStudio),
                      Skill(
                          onTap: () {
                            updateSkill(Skills.fireBase);
                          },
                          type: Skills.fireBase,
                          title: "FireBase",
                          imagePath: "assets/images/firebase.png",
                          shadowColor: Colors.yellow,
                          isActive: skill == Skills.fireBase),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Divider(),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Personal Information",
                        // style: TextStyle(
                        //   color: Colors.white,
                        //   fontWeight: FontWeight.bold,
                        // ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const TextField(
                        decoration: InputDecoration(
                            labelText: "Email",
                            prefixIcon: Icon(CupertinoIcons.at)),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const TextField(
                        decoration: InputDecoration(
                            labelText: "Password",
                            prefixIcon: Icon(CupertinoIcons.lock_fill)),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                            onPressed: () {},
                            child: const Text(
                              "Save",
                              //style: TextStyle(color: Colors.white),
                            )),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

class Skill extends StatelessWidget {
  final Skills type;
  final String title;
  final String imagePath;
  final Color shadowColor;
  final bool isActive;
  final Function() onTap;
  const Skill(
      {super.key,
      required this.title,
      required this.imagePath,
      required this.shadowColor,
      required this.isActive,
      required this.type,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: onTap,
      child: Container(
        width: 90,
        height: 90,
        decoration: isActive
            ? BoxDecoration(
                color: Colors.white10, borderRadius: BorderRadius.circular(12))
            : null,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: isActive
                  ? BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: shadowColor.withOpacity(0.5), blurRadius: 40)
                      ],
                    )
                  : null,
              child: Image.asset(
                imagePath,
                width: 40,
                height: 40,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              textAlign: TextAlign.center,
              title,
              //style: const TextStyle(color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
