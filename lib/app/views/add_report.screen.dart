import 'package:flutter/material.dart';

class AddReportScreen extends StatelessWidget {
  const AddReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Report'),),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(8),
              child: TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Title'),
                  hintText: 'Enter title'
                ),
                keyboardType: TextInputType.text),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Date'),
                  hintText: 'Select date',
                  suffixIcon: Icon(Icons.calendar_month)
                ),
                onTap: (){},
              )
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: ButtonTheme(
                alignedDropdown: true,
                child: DropdownButtonFormField(
                  initialValue: null,
                  items: [], 
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Category'
                  ),
                  onChanged: (value){}
                )
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: GestureDetector(
                onTap: (){},
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey, width: 1)
                  ),
                  child: const Icon(Icons.add_a_photo, size: 40),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: ElevatedButton(
                onPressed: (){}, 
                child: Text('Submit Report')
              ),
            )
          ],
        ),
      ),
    );
  }
}