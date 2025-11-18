import 'package:flutter/material.dart';

class EditContactScreen extends StatefulWidget {
  const EditContactScreen({
    super.key,
    required this.contact,
    required this.contactIndex,
    required this.onEditContact
  });

  final Map<String, String> contact;
  final int contactIndex;
  final Function(int, Map<String, String>) onEditContact;

  @override
  State<EditContactScreen> createState() => _EditContactScreenState();
}

class _EditContactScreenState extends State<EditContactScreen> {
  final formKey = GlobalKey<FormState>();
  late final TextEditingController nameController;
  late final TextEditingController phoneController;
  late final TextEditingController imageURLController;

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    imageURLController.dispose();
    super.dispose();
  }

  @override
  void initState(){
    super.initState();
    nameController = TextEditingController(text: widget.contact['name']);
    phoneController = TextEditingController(text: widget.contact['phone']);
    imageURLController = TextEditingController(text: widget.contact['imageURL']);
  }

  void submitForm() {
    if (formKey.currentState!.validate()) {
      final contactData = {
        'name': nameController.text,
        'phone': phoneController.text,
        'imageURL': imageURLController.text,
      };

      widget.onEditContact(widget.contactIndex, contactData);

      nameController.clear();
      phoneController.clear();
      imageURLController.clear();

      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Contacts'),
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
                  prefixIcon: Icon(Icons.person),
                ),
                textInputAction: TextInputAction.next,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Please enter a name";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: phoneController,
                decoration: InputDecoration(
                  labelText: 'Phone',
                  hintText: 'Enter phone number',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.call),
                ),
                textInputAction: TextInputAction.next,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Please enter phone number";
                  }
                  if (!RegExp(r'^\d{8}$').hasMatch(value)) {
                    return 'Please enter a valid phone number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: imageURLController,
                decoration: InputDecoration(
                  labelText: 'Image URL',
                  hintText: 'Enter image URL',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.image),
                ),
                textInputAction: TextInputAction.next,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Please enter image URL";
                  }
                  try {
                    Uri.parse(value);
                  } catch (e) {
                    return 'Please enter valid URL';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  submitForm();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Icon(Icons.edit), Text('Save Changes')],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}