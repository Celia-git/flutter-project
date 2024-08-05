
import 'package:flutter/material.dart';
import 'background.dart' as background;
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_analytics/firebase_analytics.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

// Stateless App class
class MyApp extends StatelessWidget {

  const MyApp({super.key});
  static FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  static FirebaseAnalyticsObserver observer =
      FirebaseAnalyticsObserver(analytics: analytics);
  // Widget as Application Root

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My New Android App!",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: const HomePage(title: "Home Page"),
    );
  }
}

// Home Page Stateful Widget
class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});
  final String title;
  @override
  _HomePage createState() => _HomePage();
}

// Home Page class
class _HomePage extends State<HomePage> {
  final String defaultImage = "abstract";
  final FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  String? image = background.Background.image;

  @override
  @protected
  @mustCallSuper
  // Refresh Home page each time dependencies are altered
  void didChangeDependencies() {
    super.didChangeDependencies();
    _setImage();
  }

  // Set background image on Home Page
  void _setImage() {
    image = background.Background.image;
    setState(() {});
    analytics.setAnalyticsCollectionEnabled(true);

    // Log the change image event
    analytics.logEvent(
      name: 'image_change',
      parameters: {
        'image_value': "$image",
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: DecoratedBox(
          // Background Image
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/$image.jpg"),
                  fit: BoxFit.cover),
            ),
            // Content
            child: Column(children: [
              // Change background button
              TextButton(
                  onPressed: () {
                    background.Background.image = defaultImage;
                    didChangeDependencies();
                  },
                  style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.deepOrange,
                      textStyle: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold)),
                  child: Text("Reset background to $defaultImage")),
              // Swipe Controls
              Expanded(child: GestureDetector(onPanUpdate: (details) {
                // Swipe right: go back
                if (details.delta.dx > 10) {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const FifthPage(title: "Fifth Page");
                  }));
                }
                // Swipe left: go forward
                else if (details.delta.dx < -10) {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const SecondPage(title: "Second Page");
                  }));
                }
              }))
            ])));
  }
}

// Second Page Class
class SecondPage extends StatelessWidget {
  const SecondPage({super.key, required this.title});
  final String image = "cove";

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: DecoratedBox(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/$image.jpg"),
                  fit: BoxFit.cover),
            ),
            child: Column(children: [
              ChangeBackgroundButton(image: image),
              Expanded(child: GestureDetector(onPanUpdate: (details) {
                // Swipe right: go back
                if (details.delta.dx > 10) {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const HomePage(title: "Home Page");
                  }));
                }
                // Swipe left: go forward
                else if (details.delta.dx < -10) {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const ThirdPage(title: "Third Page");
                  }));
                }
              }))
            ])));
  }
}

// Third Page Class
class ThirdPage extends StatelessWidget {
  const ThirdPage({super.key, required this.title});
  final String title;
  final String image = "mountains";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: DecoratedBox(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/$image.jpg"),
                  fit: BoxFit.cover),
            ),
            child: Column(children: [
              ChangeBackgroundButton(image: image),
              Expanded(child: GestureDetector(onPanUpdate: (details) {
                // Swipe right: go back
                if (details.delta.dx > 10) {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const SecondPage(title: "Second Page");
                  }));
                }
                // Swipe left: go forward
                else if (details.delta.dx < -10) {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const FourthPage(title: "Fourth Page");
                  }));
                }
              }))
            ])));
  }
}

// Fourth Page Class
class FourthPage extends StatelessWidget {
  const FourthPage({super.key, required this.title});
  final String title;
  final String image = "road";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: DecoratedBox(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/$image.jpg"),
                  fit: BoxFit.cover),
            ),
            child: Column(children: [
              ChangeBackgroundButton(image: image),
              Expanded(child: GestureDetector(onPanUpdate: (details) {
                // Swipe right: go back
                if (details.delta.dx > 10) {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const ThirdPage(title: "Third Page");
                  }));
                }
                // Swipe left: go forward
                else if (details.delta.dx < -10) {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const FifthPage(title: "Fifth Page");
                  }));
                }
              }))
            ])));
  }
}

// Fourth Page Class
class FifthPage extends StatelessWidget {
  const FifthPage({super.key, required this.title});
  final String title;
  final String image = "waves";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: DecoratedBox(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/$image.jpg"),
                  fit: BoxFit.cover),
            ),
            child: Column(children: [
              ChangeBackgroundButton(image: image),
              Expanded(child: GestureDetector(onPanUpdate: (details) {
                // Swipe right: go back
                if (details.delta.dx > 10) {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const FourthPage(title: "Fourth Page");
                  }));
                }
                // Swipe left: go forward
                else if (details.delta.dx < -10) {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const HomePage(title: "Home Page");
                  }));
                }
              }))
            ])));
  }
}

class ChangeBackgroundButton extends StatelessWidget {
  String image;

  ChangeBackgroundButton({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    // Text Button To Change background.Background.image
    return TextButton(
        onPressed: () {
          background.Background.image = image;
        },
        style: TextButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.deepOrange,
            textStyle:
            const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        child: Text("Set $image as home page background"));
  }
}
