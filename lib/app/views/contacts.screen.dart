import 'package:flutter/material.dart';
import 'package:myflutter_nov2025/app/views/add_contact.screen.dart';

class ContactsScreen extends StatefulWidget {
  const ContactsScreen({super.key});

  @override
  State<ContactsScreen> createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
  final List<Map<String, String>> contacts = [
    { 'name': 'Ali bin Abu',
      'phone': '603-20433401',
      'imageURL': 'https://upload.wikimedia.org/wikipedia/commons/7/7c/Profile_avatar_placeholder_large.png',
    },
    { 'name': 'Wong Siew Lan',
      'phone': '605-54503241',
      'imageURL': 'https://upload.wikimedia.org/wikipedia/commons/0/03/Twitter_default_profile_400x400.png',
    },
    { 'name': 'Muthusamy a/l Rajugopal',
      'phone': '607-89900321',
      'imageURL': 'https://upload.wikimedia.org/wikipedia/commons/7/7c/Profile_avatar_placeholder_large.png',
    },
  ];

  void addNewContact(Map<String, String> contactData){
    setState(() {
      contacts.add(contactData);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact List'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          final contact = contacts[index];
          return ContactItem(contact: contact);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(
            context, 
            MaterialPageRoute(builder: (context) => AddContactScreen(onAddContact: addNewContact))
          );
        },
        shape: const CircleBorder(),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        child: const Icon(Icons.add)
      ),
    );
  }
}

class ContactItem extends StatelessWidget {
  const ContactItem({
    super.key,
    required this.contact,
  });

  final Map<String, String> contact;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(contact['name']!, style: TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(contact['phone']!),
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.network(
          contact['imageURL']!,
          width: 40,
          height: 40,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
