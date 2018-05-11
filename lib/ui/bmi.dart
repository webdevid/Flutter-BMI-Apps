import 'package:flutter/material.dart';

class Bmi extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return new BmiState();
  }

 
  
}

class BmiState extends State<Bmi> {

  final TextEditingController _ageController = new TextEditingController();
  final TextEditingController _heightController = new TextEditingController();
  final TextEditingController _weightController = new TextEditingController();

  String _finalText   = "";
  String _finalResult = "";

  double _bmiResult = 0.0;

  // ignore: missing_method_parameters
  void _calculateBmi(){
    setState(() {

      _bmiResult = formulaBmi(_ageController.text, _heightController.text, _weightController.text);

      _finalText = "Your BMI: ${_bmiResult.toStringAsFixed(2)}";

      if(_bmiResult < 17.0){
        _finalResult = "Kurus";
      }else if(_bmiResult > 17.0 && _bmiResult < 23.0 ){
        _finalResult = "Normal";
      }else if(_bmiResult > 23.0 && _bmiResult < 27.0){
        _finalResult = "Gemuk";
      }else{
        _finalResult = "Obesitas";
      }

    });
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        centerTitle: true,
        title: new Text("Body Mass Index"),
        backgroundColor: Colors.red,
      ),
      body: new Center(
        child: new ListView(
          children: <Widget>[
            new Container(
              margin: new EdgeInsets.all(30.0),
              child: new Column(
                children: <Widget>[
                  new Image.asset("images/bmilogo.png"),
                  new TextField(
                    decoration: new InputDecoration(
                        labelText: "Age",
                        hintText: "in Year",
                        icon: new Icon(Icons.person_outline)
                    )
                    ,
                    controller: _ageController,
                    keyboardType: TextInputType.number,
                  ),
                  new TextField(
                    decoration: new InputDecoration(
                        labelText: "Height",
                        hintText: "in Centimeter",
                        icon: new Icon(Icons.accessibility)
                    )
                    ,
                    controller: _heightController,
                    keyboardType: TextInputType.number,
                  ),
                  new TextField(
                    decoration: new InputDecoration(
                        labelText: "Body Weight",
                        hintText: "in Kg",
                        icon: new Icon(Icons.local_bar)
                    )
                    ,
                    controller: _weightController,
                    keyboardType: TextInputType.number,
                  ),
                ],
              ),
            ),

            new Center(
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Padding(padding: new EdgeInsets.all( 20.0 )),
                  new FlatButton(
                      onPressed: _calculateBmi,
                      child: new Text("Calculate",
                        style: new TextStyle(
                            fontSize: 22.0,
                            color: Colors.white),),
                      color: Colors.redAccent,
                  ),
                  new Padding(padding: new EdgeInsets.all( 20.0 )),

                ],
              ),
            ),

            new Center(
              child: new Container(
                margin: new EdgeInsets.all(30.0),
                child: new Column(
                  children: <Widget>[
                    new Text("$_finalText",
                      style: new TextStyle(
                        fontSize: 32.0,
                        color: Colors.green
                      ),),
                    new Text("$_finalResult",
                      style: new TextStyle(
                        fontSize: 30.0,
                        color: Colors.red
                      ),
                    )
                  ],
                )
              ),
            )



          ],
        ),
      ),
    );
  }

  double formulaBmi(String age, String height, String weight) {

    if(int.parse(age).toString().isNotEmpty && int.parse(age) > 0 && int.parse(height).toString().isNotEmpty && int.parse(height) > 0 && int.parse(weight).toString().isNotEmpty && int.parse(weight) > 0
    ){
      print(int.parse(weight));
      print(int.parse(height));

      return ( int.parse(weight) / ( int.parse(height) * int.parse(height)) ) * 10000.0;
    }else{
      return 0.0;
    }

  }
  
}