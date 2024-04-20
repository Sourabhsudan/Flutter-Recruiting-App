
import 'package:flutter/material.dart';
import 'package:talent_bridge/Constants/static_data.dart';
import 'package:talent_bridge/Models/jobs.dart';
import 'package:talent_bridge/Models/posts.dart';

class CreatePostScreen extends StatefulWidget {
  const CreatePostScreen({super.key});

  @override
  State<CreatePostScreen> createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  int selectedOption = 0;
  final _formKey = GlobalKey<FormState>();
  final Map<String, dynamic> _formData = {};

  void saveForm() {
    if (_formKey.currentState!.validate())
    {
      _formData['category'] = selectedOption == 0 ? 'job' : 'post';
      _formKey.currentState!.save();
      if (selectedOption == 0) {
        jobs.add(
          Job(
            title: _formData['title'],
            company: _formData['company'],
            location: _formData['location'],
            type: _formData['type'],
            description: _formData['description'],
            logo: _formData['logo'],
          ),
        );
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("Added Job")));
        Navigator.pop(context);
      } else {
        feeds.add(
          Feed(
              title: _formData['title'],
              description: _formData['description'],
              candidateId: '1',
              userName: ''),
        );
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("Added Feed")));
        Navigator.pop(context);
      }
    }
  }

  void switchCategory(int? value) {
    setState(() {
      selectedOption = value!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Create Post')),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Radio<int>(
                          value: 0,
                          groupValue: selectedOption,
                          onChanged: switchCategory,
                        ),
                        const Text("Job")
                      ],
                    ),
                    const SizedBox(width: 80),
                    Row(
                      children: [
                        Radio<int>(
                          value: 1,
                          groupValue: selectedOption,
                          onChanged: switchCategory,
                        ),
                        const Text("Post")
                      ],
                    )
                  ],
                ),
                if (selectedOption == 0) ...[
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Title',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) =>
                      value!.isEmpty ? 'Please enter a title' : null,
                      onSaved: (newValue) => _formData['title'] = newValue,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Description',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) =>
                      value!.isEmpty ? 'Please enter a description' : null,
                      onSaved: (newValue) =>
                      _formData['description'] = newValue,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Location',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) =>
                      value!.isEmpty ? 'Please enter a location' : null,
                      onSaved: (newValue) => _formData['location'] = newValue,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Company',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) =>
                      value!.isEmpty ? 'Please enter a company' : null,
                      onSaved: (newValue) => _formData['company'] = newValue,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Logo',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) =>
                      value!.isEmpty ? 'Please enter a logo' : null,
                      onSaved: (newValue) => _formData['logo'] = newValue,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Type',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) =>
                      value!.isEmpty ? 'Please enter a type' : null,
                      onSaved: (newValue) => _formData['type'] = newValue,
                    ),
                  ),
                ],
                if (selectedOption == 1) ...[
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Title',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) =>
                      value!.isEmpty ? 'Please enter a title' : null,
                      onSaved: (newValue) => _formData['title'] = newValue,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Description',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) =>
                      value!.isEmpty ? 'Please enter a description' : null,
                      onSaved: (newValue) =>
                      _formData['description'] = newValue,
                    ),
                  ),
                ],
                const SizedBox(height: 30),
                Center(
                  child: ElevatedButton(
                    onPressed: saveForm,
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.cyan,// Text color of the button
                      elevation: 4,  // Shadow elevation
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),  // Rounded corners
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),  // Padding inside the button
                    ),

                    child: const Text(
                      'Post',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
