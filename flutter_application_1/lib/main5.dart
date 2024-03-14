import 'package:flutter/material.dart';
import 'package:flutter_application_1/main6.dart';

class Main5 extends StatefulWidget {
  const Main5({Key? key}) : super(key: key);

  @override
  State<Main5> createState() => _Main5State();
}

class _Main5State extends State<Main5> {
  @override
  void dispose() {
    l1.clear(); // Sahifadan chiqishda ma'lumotlarni tozalash
    checkedList.clear();
    setState(() {}); // Ma'lumotlarni yangilash
    super.dispose();
  }

  TimeOfDay? t1 = TimeOfDay(hour: 15, minute: 15);
  DateTime _dateTime = DateTime.now();

  _showDateTimePicker() async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null) {
      final pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay(hour: 15, minute: 15),
      );
      if (pickedTime != null) {
        setState(() {
          _dateTime = DateTime(
            pickedDate.year,
            pickedDate.month,
            pickedDate.day,
            pickedTime.hour,
            pickedTime.minute,
          );
          t1 = pickedTime;
        });
      }
    }
  }

  List<String> l1 = [];
  List<bool> checkedList = [];
  String s1 = '';
  String s2 = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView.builder(
        itemCount: l1.length,
        itemBuilder: (context, index) {
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            color: Colors.white,
            child: InkWell(
              onTap: () {
                setState(() async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Main6(),
                    ),
                  );
                  setState(
                      () {}); // Refresh the state after returning from Main6
                });
              },
              child: ListTile(
                tileColor: Colors.black,
                textColor: Colors.white,
                title: Text(
                  l1[index],
                  style: TextStyle(
                    decoration:
                        checkedList[index] ? TextDecoration.lineThrough : null,
                  ),
                ),
                subtitle: Text(
                  _dateTime.toString().substring(0, 16),
                  style: TextStyle(
                    color: Colors.green,
                  ),
                ),
                trailing: Checkbox(
                  activeColor: Colors.green,
                  checkColor: Colors.black,
                  value: checkedList[index],
                  onChanged: (bool? value) {
                    setState(() {
                      checkedList[index] = value!;
                    });
                  },
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        backgroundColor: Colors.green,
        child: Icon(Icons.add, color: Colors.black),
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text(
                "Adding Work Default",
                style: TextStyle(color: Colors.green),
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    decoration: InputDecoration(
                      labelText: "Task",
                      hintStyle: TextStyle(color: Colors.white),
                    ),
                    onChanged: (value) {
                      setState(() {
                        s1 = value;
                      });
                    },
                  ),
                  TextField(
                    decoration: InputDecoration(
                      labelText: "Description",
                      hintStyle: TextStyle(color: Colors.white),
                    ),
                    onChanged: (value) {
                      setState(() {
                        s2 = value;
                      });
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {
                          _showDateTimePicker();
                        },
                        child: Text(
                          "Pick Date & Time",
                          style: TextStyle(color: Colors.green),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Close",
                    style: TextStyle(color: Colors.purple),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    if (s1.isNotEmpty && s2.isNotEmpty) {
                      setState(() {
                        l1.add(s1);
                        checkedList.add(false);
                        s1 = '';
                        s2 = '';
                      });
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Task successfully added!'),
                          backgroundColor: Colors.green,
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Please fill in all fields!'),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  },
                  child: Text(
                    "Add",
                    style: TextStyle(color: Colors.purple),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
