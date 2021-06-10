import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:markgroup/models/Loginmodel.dart';
import 'package:markgroup/view/Hollyday_page.dart';
import 'package:markgroup/view/NottificationPage.dart';
import 'dart:convert';
import '';

class home extends StatefulWidget {
  const home({Key key}) : super(key: key);

  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  var status;
  var message;
  Data obj_data;
  var token;
  var user_type;
  List<UserProfile> getlist = List<UserProfile>();
  bool b = false;
  Future future;
  var emp_id;
  var emp_firstname;
  var emp_lastname;
  var emp_username;
  var emp_password;
  var emp_phone;
  var emp_email;
  var emp_image;
  var emp_joindate;
  var emp_department;
  var emp_designation;
  var emp_salary;
  var created_at;
  var updated_at;
  var id;
  var des_name;
  var dep_id;

  Future<Login> logingCalling() async {
    Login obj_login;

    var url = Uri.parse(
        "https://run.mocky.io/v3/623852f0-0cd9-471a-ab2e-b3c339de5242");

    var response = await http.get(url);
    if (response.statusCode == 200) {
      b = true;
      var data = json.decode(response.body);
      obj_login = Login.fromJson(data);
    } else {
      print('no response');
    }
    return obj_login;
  }

  login_1() async {
    Login obj_2;
    obj_2 = await logingCalling();

    setState(() {
      status = obj_2.status;
      message = obj_2.message;
      obj_data = obj_2.data;
      token = obj_data.token;
      user_type = obj_data.userType;
      var k = obj_data.userProfile;
      for (int i = 0; i < k.length; i++) {
        getlist.add(k[i]);
      }
      if (getlist.isNotEmpty) {
        emp_id = getlist[0].empId;
        emp_firstname = getlist[0].empFirstname;
        emp_lastname = getlist[0].empLastname;
        emp_username = getlist[0].empUsername;
        emp_password = getlist[0].empPassword;
        emp_phone = getlist[0].empPhone;
        emp_email = getlist[0].empEmail;
        emp_image = getlist[0].empImage;
        emp_joindate = getlist[0].empJoindate;
        emp_department = getlist[0].empDepartment;
        emp_designation = getlist[0].empDesignation;
        emp_salary = getlist[0].empSalary;
        created_at = getlist[0].createdAt;
        updated_at = getlist[0].updatedAt;
        id = getlist[0].id;
        des_name = getlist[0].desName;
        dep_id = getlist[0].depId;

        print(emp_username);
        print(emp_email);
      }
    });
  }

  @override
  void initState() {
    future = login_1();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(builder: (context, sapshot) {
      if (b) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            actions: <Widget>[
              IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => nottification()));
                },
                icon: Icon(
                  Icons.notifications,
                  size: 25,
                  color: Colors.white,
                ),
              ),
            ],
            backgroundColor: Colors.indigo[300],
          ),
          drawer: Drawer(
            child: Container(
              child: ListView(
                children: [
                  Container(
                    height: 230,
                    child: ListTile(
                      title: CircleAvatar(
                        child: ClipOval(
                          child: Image.asset("images/pic.jpg", fit: BoxFit.fill),
                        ),
                        backgroundColor: Colors.white,
                        radius: 70,
                      ),
                      subtitle: Center(
                          child: Column(
                        children: [
                          Text(
                            emp_firstname,
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(des_name, style: TextStyle(fontSize: 17, color: Colors.white70),),
                        ],
                      )),
                      tileColor: Colors.indigo.shade300,
                    ),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.people_rounded,
                      size: 20,
                      color: Colors.blue,
                    ),
                    title: Text(
                      "Attendence",
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.money,
                      size: 20,
                      color: Colors.green,
                    ),
                    title: Text(
                      "Daily Expanse",
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.request_page,
                      size: 20,
                      color: Colors.brown,
                    ),
                    title: Text(
                      "Material Request",
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.leave_bags_at_home,
                      size: 20,
                      color: Colors.deepOrangeAccent,
                    ),
                    title: Text(
                      "Apply Leave",
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => hollyday()));
                    },
                    child: ListTile(
                      leading: Icon(
                        Icons.calendar_today,
                        size: 20,
                        color: Colors.yellow.shade700,
                      ),
                      title: Text(
                        "Holiday Calender",
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.bookmark_border,
                      size: 20,
                      color: Colors.blueAccent,
                    ),
                    title: Text(
                      "Purchase Order",
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.logout,
                      size: 20,
                      color: Colors.black54,
                    ),
                    title: Text(
                      "Logout",
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                ],
              ),
            ),
          ),
          body: SafeArea(
            child: Stack(
              children: [
                Positioned(
                    child: Container(
                  height: 315,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30)),
                      color: Colors.indigo[300]),
                  child: Center(
                    child: Column(
                      children: [
                        CircleAvatar(
                          child: ClipOval(
                            child: Image.asset("images/pic.jpg", fit: BoxFit.fill),
                          ),
                          backgroundColor: Colors.white,
                          radius: 70,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          emp_firstname,
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          des_name,
                          style: TextStyle(fontSize: 17, color: Colors.white70),
                        ),
                      ],
                    ),
                  ),
                )),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => hollyday()));
            },
            child: const Icon(
              Icons.add_outlined,
              size: 30,
            ),
            backgroundColor: Colors.indigo.shade300,
          ),
        );
      } else {
        return Scaffold(
            body: Container(
          child: Center(
            child: SizedBox(
              height: 40,
              width: 40,
              child: CircularProgressIndicator(),
            ),
          ),
        ));
      }
    });
  }
}

/*

import 'package:flutter/material.dart';
import 'package:markgroup/models/Loginmodel.dart';
import 'package:markgroup/view/Hollyday_page.dart';
import 'package:markgroup/view/NottificationPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class home extends StatefulWidget {

*/
/*const home({Key key}) : super(key: key);*/ /*



 // String empFirstname;
// home({Key key,this.empFirstname});

  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {


*/
/*  List<UserProfile> profile=[];


  void getdata() async{

    final prefs = await SharedPreferences.getInstance();

    profile= prefs.getStringList('profile').cast<UserProfile>();

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
  }*/ /*



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       elevation: 0,
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>nottification()));
            },
            icon: Icon(Icons.notifications, size: 25, color: Colors.white,),
          )
        ],
        backgroundColor: Colors.indigo[300],
      ),


      drawer: Drawer(

        child: Container(

          child: ListView(
            children: [


              Container(
                height: 230,
                child: ListTile(
                  title: CircleAvatar(
                    child: ClipOval(
                      child: Image.asset("images/pic.jpg", fit: BoxFit.fill),
                    ),
                    backgroundColor: Colors.transparent,
                    radius: 70,
                  ),
                  subtitle: Center(child: Column(
                    children: [
                      Text("pageen",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
                      SizedBox(height: 5,),
                      Text("Supervisor civil",style: TextStyle(fontSize: 17,color: Colors.white70),),
                    ],
                  )),
                  tileColor: Colors.indigo.shade300,

                ),
              ),

              ListTile(
                leading: Icon(Icons.people_rounded,size: 20,color: Colors.blue,),
                title: Text("Attendence",style: TextStyle(fontSize: 15),),


              ),
              ListTile(
                leading: Icon(Icons.money,size: 20,color: Colors.green,),
                title: Text("Daily Expanse",style: TextStyle(fontSize: 15),),


              ),


              ListTile(
                leading: Icon(Icons.request_page,size: 20,color: Colors.brown,),
                title: Text("Material Request",style: TextStyle(fontSize: 15),),


              ),


              ListTile(
                leading: Icon(Icons.leave_bags_at_home,size: 20,color: Colors.deepOrangeAccent,),
                title:  Text("Apply Leave",style: TextStyle(fontSize: 15),),


              ),
              GestureDetector(
                onTap: (){

 Navigator.push(context, MaterialPageRoute(builder: (context)=>hollyday()));

                },
                child: ListTile(
                  leading: Icon(Icons.calendar_today,size: 20,color: Colors.yellow.shade700,),
                  title: Text("Holiday Calender",style: TextStyle(fontSize: 15),),


                ),
              ),
              ListTile(
                leading: Icon(Icons.bookmark_border,size: 20,color: Colors.blueAccent,),
                title: Text("Purchase Order",style: TextStyle(fontSize: 15),),


              ),
              ListTile(
                leading: Icon(Icons.logout,size: 20,color: Colors.black54,),
                title: Text("Logout",style: TextStyle(fontSize: 15),),


              ),


            ],
          ),

        ),

      ),


      body: SafeArea(
        child: Stack(
          children: [
            Positioned(

                child: Container(

                  height: 315,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30)),
                      color: Colors.indigo[300]),

                  child: Center(
                    child: Column(
                      children: [
                        CircleAvatar(
                          child: ClipOval(
                            child: Image.asset("images/pic.jpg", fit: BoxFit.fill),
                          ),
                          backgroundColor: Colors.transparent,
                          radius: 70,
                        ),
                        SizedBox(height: 5,),
                        Text("prageen",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
                        SizedBox(height: 5,),
                        Text("Supervisor civil",style: TextStyle(fontSize: 17,color: Colors.white70),),

                      ],
                    ),
                  ),

                )),

          ],
        ),

      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>hollyday()));
        },
        child: const Icon(Icons.add_outlined,size: 30,),
        backgroundColor: Colors.indigo.shade300,
      ),




    );
  }
}

*/
