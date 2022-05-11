import 'package:flutter/material.dart';
import 'package:mohaned_assigment/e_commerce_assigment/login_page.dart';
import 'package:mohaned_assigment/e_commerce_assigment/slider_page.dart';
import 'package:mohaned_assigment/main.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.orange, title: const Text("Home Page")),
      body: GridView.count(
        primary: false,
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 2,
        children: <Widget>[
          InkWell(
            onTap: () => _goToSlider(context),
            child: Container(
              padding: const EdgeInsets.all(8),
              child: const Text("Samsung"),
              color: Colors.orange[100],
            ),
          ),
          InkWell(
            onTap: () => _goToSlider(context),
            child: Container(
              padding: const EdgeInsets.all(8),
              child: const Text('Iphone'),
              color: Colors.orange[200],
            ),
          ),
          InkWell(
            onTap: ()=>_goToSlider(context),
            child: Container(
              padding: const EdgeInsets.all(8),
              child: const Text('Hawaii'),
              color: Colors.orange[300],
            ),
          ),
          InkWell(
            onTap: ()=>_goToSlider(context),
            child: Container(
              padding: const EdgeInsets.all(8),
              child: const Text('Oppo'),
              color: Colors.orange[400],
            ),
          ),
          InkWell(
            onTap: ()=>_goToSlider(context),
            child: Container(
              padding: const EdgeInsets.all(8),
              child: const Text('redmi'),
              color: Colors.orange[500],
            ),
          ),
          InkWell(
            onTap: ()=>_goToSlider(context),
            child: Container(
              padding: const EdgeInsets.all(8),
              child: const Text('xiaomi'),
              color: Colors.orange[600],
            ),
          ),
        ],
      ),
      drawer: Drawer(),
    );
  }



  void _goToSlider(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (_) => SliderPageView()));
  }
}
class Drawer extends StatelessWidget {
  const Drawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width / 1.3,
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          const SizedBox(
            height: 80,
            child: DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.orange,
              ),
              child: Center(
                  child: Text(
                    'Drawer Menu',
                    style: TextStyle(color: Colors.white),
                  )),
            ),
          ),
          ListTile(
            title: const Text('Shop'),
            onTap: () {
              // Update the state of the app
              // ...
              Navigator.pop(context);
              MyApp.navigatorKey.currentState?.push(
                  MaterialPageRoute(builder: (_) => SliderPageView()));
            },
          ),
          ListTile(
            title: const Text('Orders'),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
              MyApp.navigatorKey.currentState?.push(
                  MaterialPageRoute(builder: (_) => SliderPageView()));
            },
          ),
          ListTile(
            title: const Text('Manage Product'),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
              MyApp.navigatorKey.currentState?.push(
                  MaterialPageRoute(builder: (_) => SliderPageView()));
            },
          ),

          ListTile(
            title: const Text('Categories'),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
              MyApp.navigatorKey.currentState?.push(
                  MaterialPageRoute(builder: (_) => SliderPageView()));

            },
          ),
          ListTile(
            title: const Text('Logout'),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (_) => LoginPageView() ));
              });
            },
          ),
        ],
      ),
    );
  }

}
