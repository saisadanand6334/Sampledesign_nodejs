import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:renting_car/apis/regi_api.dart';
import 'package:renting_car/files/login.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool _isLoading = false;
  bool  check = false ;
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final _formkey =GlobalKey<FormState>();
  void UserRegistration()async {
    setState(() {
      _isLoading = true;
    });
    var data = {
      "name": nameController.text.trim(),
      "address": addressController.text.trim(),
      "phone": phoneController.text.trim(),
      "email": emailController.text.trim(),
      "username": usernameController.text.trim(),
      "password": passwordController.text.trim(),
    };
    print(data);
    var res = await Api2().authData(data,'/register');
    var body = json.decode(res.body);
    print(body);

    if (body['success'] == true) {
      Fluttertoast.showToast(
          msg: body['message'].toString(), backgroundColor: Colors.grey);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Log(),));
    }
    else {
      Fluttertoast.showToast(
          msg: body['message'].toString(), backgroundColor: Colors.grey);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
        appBar: AppBar(backgroundColor: Colors.orange,
          title: Center(
            child: Text('Register App',
              style: TextStyle(fontSize: 40,
                  fontWeight: FontWeight.w700,
                  color: Colors.black),),
          ),
          leading:IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back_sharp)),
        ),


        body: Padding(
          padding: const EdgeInsets.all( 10),
          child: SingleChildScrollView(
            child: Form(
              key: _formkey,
              autovalidateMode: AutovalidateMode.always,
              child: Column(
                children: [
                  TextFormField(
                    controller: nameController,
                    decoration: InputDecoration(
                      label: Center(
                        child: Text('  NAME',style: TextStyle(fontSize: 20,
                          fontWeight: FontWeight.normal,
                        ),),
                      ),
                      border: OutlineInputBorder(),

                    ),),
                  SizedBox(height: 20,),
                  TextFormField(
                    controller: addressController,
                    decoration: InputDecoration(
                        label:Center(
                          child: Text('ADDRESS',style: TextStyle(fontSize: 20,
                            fontWeight: FontWeight.normal,
                          ),
                          ),
                        ),
                        border: OutlineInputBorder()),
                  ),
                  SizedBox(height: 20,),
                  TextField(
                    controller: phoneController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      label: Center(
                        child: Text('Phone Number',style: TextStyle(fontSize: 20,
                          fontWeight: FontWeight.normal,
                        ),),
                      ),
                      border: OutlineInputBorder(),
                    ),),
                  SizedBox(height: 20,),
                  TextField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      label:Center(
                        child: Text('EMAIL ID',
                          style: TextStyle(fontSize: 20,fontWeight: FontWeight.normal,
                          ),),
                      ) ,
                      border: OutlineInputBorder(),),
                  ),
                  SizedBox(height: 20,),
                  TextField(
                    controller: usernameController,
                    decoration: InputDecoration(
                      label: Center(
                        child: Text('USER NAME',style: TextStyle(fontSize: 20,
                            fontWeight: FontWeight.normal),),
                      ),
                      border: OutlineInputBorder(),),
                  ),
                  SizedBox(height: 20,),
                  TextField (
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      label: Center(
                        child: Text('PASSWORD',style: TextStyle(fontSize: 20,
                          fontWeight: FontWeight.normal,
                        ),
                        ),
                      ),
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(Icons.remove_red_eye),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Checkbox(
                          checkColor: Colors.black,
                          value: check,
                          onChanged: (bool? value) {
                            setState(() {
                              check = value!;
                            });
                          }),
                      Text(
                        "I agree with",
                        style: TextStyle(color: Colors.black),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text("Terms and Conditions"),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Container(
                      height: 40,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        color: Colors.orangeAccent,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: TextButton(
                        onPressed: () {
                          UserRegistration();
                        },
                        child: Text(
                          "CREATE ACCOUNT",
                          style: TextStyle(color: Colors.black,fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account?",
                        style: TextStyle(color: Colors.black),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Log()));
                        },
                        child: Text("Login now",
                            style: TextStyle(color: Colors.blue)),
                      )
                    ],
                  ),


                ],
              ),
            ),
          ),
        )

    );
  }
}