import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Profile Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Text(
          widget.title,
        ),
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Expanded(
          flex: 1,
          child: Container(
            // Place as the child widget of a scaffold
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    "https://firebasestorage.googleapis.com/v0/b/flutterbricks-public.appspot.com/o/backgrounds%2Fgradienta-m_7p45JfXQo-unsplash.jpg?alt=media&token=adc01da9-3e54-48af-91c3-d1b303498618"),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: [
                const Expanded(
                    flex: 1,
                    child: Padding(
                      padding: EdgeInsets.only(top: 15),
                      child: CircleAvatar(
                          radius: 100,
                          foregroundImage: AssetImage("images/aa.jpg")),
                    )),
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        ProfileItem(
                          title: "Ad/Soyad",
                        ),
                        ProfileItem(
                          title: "Email",
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: ProfileItem(
                                title: "Yaş",
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: ProfileItem(
                                title: "Adres",
                              ),
                            ),
                          ],
                        ),
                        ProfileItem(
                          title: "İstekler",
                          icon: Icons.arrow_forward_ios_rounded,
                        ),
                        Row(
                          children: [
                            Expanded(
                                flex: 1, child: ProfileItem(title: "İlanlar")),
                            Expanded(
                                flex: 1,
                                child: ProfileItem(
                                  title: "Çıkış Yap",
                                  icon: Icons.logout,
                                ))
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ), // Place child here
          ),
        )
      ]),
    );
  }
}

class ProfileItem extends StatelessWidget {
  const ProfileItem({Key? key, required this.title, this.icon})
      : super(key: key);
  final String title;
  final IconData? icon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 2.5),
      child: Container(
          height: 60,
          width: MediaQuery.of(context).size.width,
          decoration: (BoxDecoration(
              color: Colors.white,
              border: Border.all(width: 2, color: Colors.white),
              borderRadius: BorderRadius.circular(40),
              gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [Colors.purple, Colors.blue]))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: Text(
                  title,
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 18),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 25),
                child: Icon(icon),
              )
            ],
          )),
    );
  }
}
