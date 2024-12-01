import 'package:flutter/material.dart';
import 'height_page.dart';

class WeightPage extends StatefulWidget {
  @override
  _WeightPageState createState() => _WeightPageState();
}

class _WeightPageState extends State<WeightPage> {
  double? weight;
  final weightController = TextEditingController();

  @override
  void dispose() {
    weightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Enter Weight')),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue[100]!, Colors.pink[100]!],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Enter your weight (kg)", style: TextStyle(fontSize: 20)),
              SizedBox(height: 20),
              Container(
                width: 200,
                child: TextField(
                  controller: weightController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Weight',
                  ),
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    setState(() {
                      weight = double.tryParse(value);
                    });
                  },
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: weight != null
                    ? () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HeightPage(weight: weight!),
                          ),
                        );
                      }
                    : null,
                child: Text("Next"),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  backgroundColor: Colors.deepPurple,
                  foregroundColor: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
