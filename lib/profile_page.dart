import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String name = 'CIPPI';
  String year = 'third year';
  List<String> skills = ['Java', 'Flutter', 'Node js'];
  List<String> interests = ['Fast-api', 'python'];
  File? _image;

  final ImagePicker _picker = ImagePicker();

  void _editName() {
    TextEditingController nameController = TextEditingController(text: name);
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Edit Name'),
          content: TextField(
            controller: nameController,
            decoration: InputDecoration(hintText: "Enter your name"),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  name = nameController.text;
                });
                Navigator.of(context).pop();
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }

  void _editYear() {
    TextEditingController yearController = TextEditingController(text: year);
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Edit Year'),
          content: TextField(
            controller: yearController,
            decoration: InputDecoration(hintText: "Enter your year"),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  year = yearController.text;
                });
                Navigator.of(context).pop();
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }

  void _addSkill(String skill) {
    setState(() {
      skills.add(skill);
    });
  }

  void _showAddSkillDialog() {
    TextEditingController skillController = TextEditingController();
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add Skill'),
          content: TextField(
            controller: skillController,
            decoration: InputDecoration(hintText: "Enter a new skill"),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                if (skillController.text.isNotEmpty) {
                  _addSkill(skillController.text);
                }
                Navigator.of(context).pop();
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }

  void _addInterest(String interest) {
    setState(() {
      interests.add(interest);
    });
  }

  void _showAddInterestDialog() {
    TextEditingController interestController = TextEditingController();
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add Interest'),
          content: TextField(
            controller: interestController,
            decoration: InputDecoration(hintText: "Enter a new interest"),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                if (interestController.text.isNotEmpty) {
                  _addInterest(interestController.text);
                }
                Navigator.of(context).pop();
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: _pickImage,
                    child: CircleAvatar(
                      radius: 40,
                      backgroundImage: _image != null
                          ? FileImage(_image!)
                          : AssetImage('assets/profile_image.png')
                              as ImageProvider,
                      backgroundColor: Color.fromARGB(255, 49, 0, 128),
                      child: _image == null
                          ? Icon(
                              Icons.upload, // Upload icon
                              color: Colors.white,
                              size: 24, // Adjust the size as needed
                            )
                          : null,
                    ),
                  ),
                  SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: _editName,
                        child: Text(
                          name,
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ),
                      GestureDetector(
                        onTap: _editYear,
                        child: Text(
                          year,
                          style: TextStyle(fontSize: 18, color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Skill set:',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
              SizedBox(height: 10),
              Wrap(
                spacing: 8.0,
                children: skills
                    .map((skill) => Chip(
                        label:
                            Text(skill, style: TextStyle(color: Colors.white)),
                        backgroundColor: Color.fromARGB(255, 49, 0, 128)))
                    .toList(),
              ),
              SizedBox(height: 10),
              ElevatedButton.icon(
                onPressed: _showAddSkillDialog,
                icon: Icon(Icons.add, color: Colors.white),
                label: Text('Add Skill', style: TextStyle(color: Colors.white)),
                style: ElevatedButton.styleFrom(backgroundColor:Color.fromARGB(255, 49, 0, 128)),
              ),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Interested:',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
              SizedBox(height: 10),
              Wrap(
                spacing: 8.0,
                children: interests
                    .map((interest) => Chip(
                        label: Text(interest,
                            style: TextStyle(color: Colors.white)),
                        backgroundColor: Color.fromARGB(255, 49, 0, 128)))
                    .toList(),
              ),
              SizedBox(height: 10),
              ElevatedButton.icon(
                onPressed: _showAddInterestDialog,
                icon: Icon(Icons.add, color: Colors.white),
                label:
                    Text('Add Interest', style: TextStyle(color: Colors.white)),
                style: ElevatedButton.styleFrom(backgroundColor: Color.fromARGB(255, 49, 0, 128)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
