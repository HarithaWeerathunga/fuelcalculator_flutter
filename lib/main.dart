import 'package:flutter/material.dart';

void main() => runApp(FuelCalculator());

class FuelCalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fuel Cal',
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {

  final currencyTypes = ['LKR', 'Dollar', 'Pounds'];
  String currency = 'LKR';

  String resultText = "";

  TextEditingController distanceController = TextEditingController();
  TextEditingController fuelUnitController = TextEditingController();
  TextEditingController fuelPriceCOntroller = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fuel Calculator"),
        leading: Icon(Icons.directions_car, color: Colors.red,),
      ),
      body: Container(
        padding: EdgeInsets.all(17),
        child: Column(
          children: <Widget>[
            TextField(
              controller: fuelUnitController,
              decoration: InputDecoration(
                labelText: "Distance Per Fuel Unit",
                hintText: "eg: 5"
              ),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: distanceController,
              decoration: InputDecoration(
                labelText: "Distance Travelled",
                hintText: "eg: 35"
              ),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: fuelPriceCOntroller,
              decoration: InputDecoration(
                labelText: "Price Per Fuel Unit",
                hintText: "eg: 180"
              ),
              keyboardType: TextInputType.number,
            ),
            DropdownButton<String>(
              items: currencyTypes.map((String value){
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              value: currency,
              onChanged: (String value){
                onDropDownChanged(value);
              },
            ),
            RaisedButton(
              color: Colors.red,
              child: Text('Calculate Total'),
              onPressed: (){
                setState(() {
                  resultText = calculateFuelPrice();
                });
              },
            ),
            Text(resultText)
          ],
        ),
      ),
    );
  }

  onDropDownChanged(String value){
    setState(() {
      this.currency = value;
    });
  }

  String calculateFuelPrice(){

    double distanceTravelled = double.parse(distanceController.text);
    double fuelUnit = double.parse(fuelUnitController.text);
    double priceFuel = double.parse(fuelPriceCOntroller.text);


    double totalCost = (distanceTravelled/fuelUnit) * priceFuel;
    String resultText = "Total Cost" + totalCost.toString() + " "+currency;

    return resultText;

  }
}