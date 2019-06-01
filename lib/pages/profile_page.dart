import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  var phoneMask = new MaskedTextController(mask: '(00) 00000-0000');
  static final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Name',
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Enter your name';
                    }
                  },
                ),
                
                Container(height: 20.0),
                
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Email'
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Enter your email';
                    }
                  },
                ),

                Container(height: 20.0),
                
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Linkedin',
                    helperText: '@douglita'
                  ),
                ),

                Container(height: 20.0),
                
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Celular',
                  ),
                  controller: phoneMask,
                  keyboardType: TextInputType.number,
                ),
              ],
            ),
          ),
        ), 
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Increment',
        child: Icon(Icons.save),
        onPressed: () {
          if (_formKey.currentState.validate()) {
            _showDialog();
            // Scaffold
            //   .of(context)
            //   .showSnackBar(SnackBar(content: Text('Processing Data')));
          } else {
          }
        },
      ),
    );
  }

  void _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Success"),
          content: new Text("Enjoy the community!"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Ok"),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
