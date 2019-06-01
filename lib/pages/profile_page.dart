import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  var phoneMask = new MaskedTextController(mask: '(00) 00000-0000');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Nome'
                ),
              ),
              
              Container(height: 20.0),
              
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'E-mail'
                ),
              ),

              Container(height: 20.0),
              
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Linkedin',
                  helperText: '@douglita'
                ),
              ),

              Container(height: 20.0),
              
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Celular',
                ),
                controller: phoneMask,
                keyboardType: TextInputType.number,
              ),

              Container(height: 20.0),

              Container(
                width: double.maxFinite,
                height: 60,
                child: RaisedButton.icon(
                  icon: Icon(Icons.save),
                  label: Text('Salvar'),
                  onPressed: () {},
                ),
              ),
              

            ],
          ),
        ), 
      ),
      floatingActionButton: FloatingActionButton(
        //onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
