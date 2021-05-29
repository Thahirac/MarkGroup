import 'package:flutter/material.dart';
import 'package:markgroup/view/HomePage.dart';

class loginpage extends StatefulWidget {
  @override
  _loginpageState createState() => _loginpageState();

  final Key = GlobalKey<FormState>();

  /*final Key = GlobalKey<FormState>();

  TextEditingController mobilecontroller=new TextEditingController();
  TextEditingController passcontroller=new TextEditingController();*/

}

class _loginpageState extends State<loginpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        /*key: Key,*/
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 80, left: 10, right: 10),
              child: Container(
                width: 380,height: 260,
                child: Image.asset("images/loginlogo.png",height: 260,width: 380,),
              ),
            ),


            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Container(
                height: 50,
                child:

                    TextFormField(
                      /*controller: mobilecontroller,*/
                     /* validator: (value) {
                        if (value.isEmpty) {
                          return "Enter Mobile Number";
                        } else {
                          return null;
                        }
                      },*/
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(13)),
                        labelText: "Mobile Number",
                        labelStyle: TextStyle(color: Colors.grey),
                      ),
                    ),

              ),
            ),

            SizedBox(
              height: 25,
            ),

            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Container(
                height: 50,
                child:

                    TextFormField(
                      obscureText: true,
                    /*  controller: passcontroller,
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Enter Password";
                        } else {
                          return null;
                        }
                      },*/
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        labelText: "Password",
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(13)),
                        labelStyle: TextStyle(color: Colors.grey),
                      ),
                    ),

              ),
            ),


            SizedBox(
              height: 25,
            ),


            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  textColor: Colors.white,
                  color: Colors.indigo[400],
                  child: Center(
                      child: Text(
                        "Signin",
                        style: TextStyle(fontSize: 15),
                      )),
                  onPressed: () {

                    Navigator.push(context, MaterialPageRoute(builder: (context)=>home()));


                  /*  if (Key.currentState.validate()) {

                      login(context);

                    }*/

                  }
                  ),
            ),


            SizedBox(
              height: 18,
            ),


            Center(
              child: Text(
                "Forgot Password",
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline
                ),
              ),
            ),


          ],
        ),
      ),

    );
  }
}

