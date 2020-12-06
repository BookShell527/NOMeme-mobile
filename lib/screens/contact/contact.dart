import 'package:NOMeme/shared/constant.dart';
import 'package:flutter/material.dart';

class Contact extends StatefulWidget {
  @override
  _ContactState createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  final _formkey = GlobalKey<FormState>();

  String email = '';
  String name = '';
  String message = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contact Us"),
        backgroundColor: Colors.blue,
        centerTitle: true
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
        child: Form(
          key: _formkey,
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.0),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: "Enter your email"),
                onChanged: (value) {
                  setState(() => email = value);
                },
                validator: (value) => value.isEmpty ? "Enter an email" : null,
              ),
              SizedBox(height: 20.0),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: "Enter your name"),
                onChanged: (value) {
                  setState(() => name = value);
                },
                validator: (value) => value.isEmpty ? "Enter your name" : null,
              ),
              SizedBox(height: 20.0),
              TextField(
                keyboardType: TextInputType.multiline,
                maxLines: null,
                minLines: 4,
                decoration: textInputDecoration.copyWith(hintText: "Your message"),
                onChanged: (value) {
                  setState(() => message = value);
                }
              ),
              RaisedButton(
                color: Colors.blue,
                child: Text('Send message', style: TextStyle(color: Colors.white)),
                onPressed: () async {
                  if (_formkey.currentState.validate()) {
                    print(name);
                    print(email);
                    print(message);
                  }
                }
              ),
              SizedBox(height: 12.0),
              Text(error, style: TextStyle(color: Colors.red, fontSize: 14.0))
            ],
          ),
        )
      )
    );
  }
}
