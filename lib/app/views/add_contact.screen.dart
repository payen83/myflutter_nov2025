import 'package:flutter/material.dart';

class AddContactScreen extends StatefulWidget {
  const AddContactScreen({super.key, required this.onAddContact});
  final Function(Map<String, String>) onAddContact;

  @override
  State<AddContactScreen> createState() => _AddContactScreenState();
}

class _AddContactScreenState extends State<AddContactScreen> {

  final formKey = GlobalKey();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final imageURLController = TextEditingController();

  @override
  void dispose(){
    nameController.dispose();
    phoneController.dispose();
    imageURLController.dispose();
    super.dispose();
  }

  void submitForm(){
    final contactData = {
      'name': nameController.text,
      'phone': phoneController.text,
      'imageURL': imageURLController.text
    };

    widget.onAddContact(contactData);

    nameController.clear();
    phoneController.clear();
    imageURLController.clear();

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Contact'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: 'Name',
                  hintText: 'Enter contact name',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person)
                ),
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: phoneController,
                decoration: InputDecoration(
                  labelText: 'Phone',
                  hintText: 'Enter phone number',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.call)
                ),
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: imageURLController,
                decoration: InputDecoration(
                  labelText: 'Image URL',
                  hintText: 'Enter image URL',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.image)
                ),
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: (){ 
                  submitForm(); 
                }, 
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.edit),
                    Text('Add Contact')
                  ],
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}