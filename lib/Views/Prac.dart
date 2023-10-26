import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;


class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  var data;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  getdata() async{
    var responce = await http.get(Uri.parse('https://g04d40198f41624-i0czh1rzrnvg0r4l.adb.me-dubai-1.oraclecloudapps.com/ords/courage/product/record/'));
    var jsondata = jsonDecode(responce.body.toString());
    if(responce.statusCode == 200){
      Fluttertoast.showToast(msg: "PASS",toastLength: Toast.LENGTH_LONG);
      data = jsondata;
    }else{
      Fluttertoast.showToast(msg: "FAIL",toastLength: Toast.LENGTH_LONG);
      data = "NOOOOOOOOOOOOO";
    }
  }
  getshopdata() async{
    var responce = await http.get(Uri.parse('https://g04d40198f41624-i0czh1rzrnvg0r4l.adb.me-dubai-1.oraclecloudapps.com/ords/courage/AddAhop/record/'));
    var jsondata = jsonDecode(responce.body.toString());
    if(responce.statusCode == 200){
      Fluttertoast.showToast(msg: "PASS",toastLength: Toast.LENGTH_LONG);
      data = jsondata;
    }else{
      Fluttertoast.showToast(msg: "FAIL",toastLength: Toast.LENGTH_LONG);
      data = "NOOOOOOOOOOOOO";
    }
  }

  getownerdata() async{
    var responce = await http.get(Uri.parse('https://g04d40198f41624-i0czh1rzrnvg0r4l.adb.me-dubai-1.oraclecloudapps.com/ords/courage/Shop/record/'));
    var jsondata = jsonDecode(responce.body.toString());
    if(responce.statusCode == 200){
      Fluttertoast.showToast(msg: "PASS",toastLength: Toast.LENGTH_LONG);
      data = jsondata;
    }else{
      Fluttertoast.showToast(msg: "FAIL",toastLength: Toast.LENGTH_LONG);
      data = "NOOOOOOOOOOOOO";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up Api'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(data.toString()),
            SizedBox(height: 20,),
            Container(
              height: 40,
              width: 400,
              child: ElevatedButton(
                onPressed: (){
                  getdata();
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.green, // Background color of the button
                  onPrimary: Colors.black, // Text color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14.0), // Border radius
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Get Data',
                      style: TextStyle(fontSize: 18),
                    ),
                    Icon(Icons.arrow_forward), // Arrow icon
                  ],
                ),
              ),
            ),
            Container(
              height: 40,
              width: 400,
              child: ElevatedButton(
                onPressed: (){
                  getshopdata();
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.green, // Background color of the button
                  onPrimary: Colors.black, // Text color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14.0), // Border radius
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Shop Data',
                      style: TextStyle(fontSize: 18),
                    ),
                    Icon(Icons.arrow_forward), // Arrow icon
                  ],
                ),
              ),
            ),
            Container(
              height: 40,
              width: 400,
              child: ElevatedButton(
                onPressed: (){
                  getownerdata();
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.green, // Background color of the button
                  onPrimary: Colors.black, // Text color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14.0), // Border radius
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Owner Data',
                      style: TextStyle(fontSize: 18),
                    ),
                    Icon(Icons.arrow_forward), // Arrow icon
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}