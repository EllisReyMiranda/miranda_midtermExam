import 'package:flutter/material.dart';
import 'height_page.dart';

class RecordsPage extends StatefulWidget {
  @override
  _RecordsPageState createState() => _RecordsPageState();
}

class _RecordsPageState extends State<RecordsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('BMI Records')),
      body: bmiRecords.isEmpty
          ? Center(child: Text("No records available."))
          : ListView.builder(
              itemCount: bmiRecords.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text("BMI: ${bmiRecords[index]}"),
                  trailing: IconButton(
                    icon: Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      setState(() {
                        bmiRecords.removeAt(index);
                      });
                    },
                  ),
                );
              },
            ),
    );
  }
}
