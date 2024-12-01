import 'package:flutter/material.dart';
import 'result_page.dart';

class HeightPage extends StatefulWidget {
  final double weight;

  HeightPage({required this.weight});

  @override
  _HeightPageState createState() => _HeightPageState();
}

class _HeightPageState extends State<HeightPage> {
  double? height;
  final heightController = TextEditingController();

  @override
  void dispose() {
    heightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Enter Height')),
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
              Text("Enter your height (cm)", style: TextStyle(fontSize: 20)),
              SizedBox(height: 20),
              Container(
                width: 200,
                child: TextField(
                  controller: heightController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Height',
                  ),
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    setState(() {
                      height = double.tryParse(value);
                    });
                  },
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: height != null
                    ? () {
                        double bmi = calculateBMI(widget.weight, height!);
                        saveBMIRecord(bmi); // Save the BMI to records
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ResultPage(bmi: bmi),
                          ),
                        );
                      }
                    : null,
                child: Text("Calculate BMI"),
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

  double calculateBMI(double weight, double heightCm) {
    double heightM = heightCm / 100;
    return weight / (heightM * heightM);
  }

  void saveBMIRecord(double bmi) {
    bmiRecords.add(bmi.toStringAsFixed(1));
  }
}

List<String> bmiRecords = [];
