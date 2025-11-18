import 'package:flutter/material.dart';
import 'package:myflutter_nov2025/main.dart';

class LayoutDemo extends StatelessWidget {
  const LayoutDemo({super.key});

  
  @override
  Widget build(BuildContext context) {
    String description = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged";

    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Layout Demo'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          TextButton(
            onPressed: (){
              Navigator.push(
                context, 
                MaterialPageRoute(
                  builder: (context) => MyHomePage(title: 'Welcome to my app')
                )
              );
            }, 
            child: Text('Home')
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              'assets/images/lake.jpg', 
              width: 600, 
              height: 240,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 8),
                          child: Text(
                            'Sunway Nexis Campground', 
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Text('Kota Damansara, Selangor', style: TextStyle(color: Colors.grey),)
                      ],
                    )
                  ),
                  Icon(Icons.star, color: Colors.redAccent,),
                  Text('41')
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ButtonWithText(label: 'CALL', icon: Icons.call,),
                  ButtonWithText(label: 'ROUTE', icon: Icons.near_me),
                  ButtonWithText(label: 'SHARE', icon: Icons.share)
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(description, softWrap: true, textAlign: TextAlign.justify,),
            )
          ],
        ),
      ),
    );
  }
}

class ButtonWithText extends StatelessWidget {
  const ButtonWithText({
    super.key,
    required this.icon,
    required this.label
  });

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: Colors.blue,),
        Text(label, 
          style: TextStyle(
            fontSize: 12, 
            fontWeight: 
            FontWeight.w400, 
            color: Colors.blue
          ),
        )
      ],
    );
  }
}