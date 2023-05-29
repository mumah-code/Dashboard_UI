import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // Application name
      title: 'Dashboard',
      // Application theme data, you can set the colors for the application as
      // you want
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // A widget which will be started on application startup
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(50),
                topRight: Radius.circular(50),
              ),
            ),
            child: Column(
              children: [
                const SizedBox(height: 60),
                ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 30),
                  //leading: Icon(Icons.dashboard),
                  title: Text(
                    "Hello, Md. Mubin",
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          color: Colors.white,
                        ),
                  ),
                  subtitle: Text(
                    "Good Morning!",
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: Colors.white54,
                        ),
                  ),
                  trailing: const CircleAvatar(
                    radius: 25,
                    backgroundImage: AssetImage('lib/myphoto.png'),
                  ),
                ),
                const SizedBox(
                  height: 30,
                )
              ],
            ),
          ),
          SafeArea(
            child: Container(
              color: Theme.of(context).primaryColor,
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(200),
                    )),
                child: GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  crossAxisSpacing: 40,
                  mainAxisSpacing: 30,
                  children: [
                    dashBoardItem('videos', CupertinoIcons.play_rectangle,
                        Colors.deepOrange),
                    dashBoardItem(
                        'Analytics', CupertinoIcons.graph_circle, Colors.green),
                    dashBoardItem(
                        'Audience', CupertinoIcons.person_2, Colors.purple),
                    dashBoardItem(
                        'Comments', CupertinoIcons.chat_bubble_2, Colors.brown),
                    dashBoardItem('Revenue', CupertinoIcons.money_dollar_circle,
                        Colors.indigo),
                    dashBoardItem(
                        'Upload', CupertinoIcons.add_circled, Colors.teal),
                    dashBoardItem(
                        'About', CupertinoIcons.question_circle, Colors.blue),
                    dashBoardItem(
                        'Contact', CupertinoIcons.phone, Colors.pinkAccent),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  dashBoardItem(String title, IconData iconData, Color background) => Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  offset: const Offset(0, 5),
                  color: Theme.of(context).primaryColor.withOpacity(.2),
                  spreadRadius: 2,
                  blurRadius: 5)
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: background,
                shape: BoxShape.circle,
              ),
              child: Icon(iconData, color: Colors.white),
            ),
            const SizedBox(height: 8),
            Text(title.toUpperCase()),
          ],
        ),
      );
}
