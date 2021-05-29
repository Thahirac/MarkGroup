import 'package:flutter/material.dart';

class hollyday extends StatefulWidget {
  /*const hollyday({Key key}) : super(key: key);*/

  @override
  _hollydayState createState() => _hollydayState();
}

class _hollydayState extends State<hollyday> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 50, top: 6),
          child: Text("Holiday Calender"),
        ),
        backgroundColor: Colors.indigo.shade400,
      ),
      body: ListView(
        children: [


          SizedBox(
            height: 5,
          ),
          Container(
              alignment: Alignment.center,
              margin: EdgeInsets.all(10),
              height: 90,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(17), //border corner radius
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5), //color of shadow
                    spreadRadius: 5, //spread radius
                    blurRadius: 7, // blur radius
                    offset: Offset(0, 2), // changes position of shadow
                    //first paramerter of offset is left-right
                    //second parameter is top to down
                  ),
                  //you can set more BoxShadow() here
                ],
              ),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '15',
                          style: TextStyle(
                            fontSize: 28,
                          ),
                        ),
                        Text(
                          'Mon',
                          style: TextStyle(fontSize: 17, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 9,
                  ),
                  VerticalDivider(
                    thickness: 2,
                    color: Colors.black26,
                    indent: 17,
                    endIndent: 17,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Eid Mubarak',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Text(
                          '2022-05-01',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black38),
                        ),
                      ],
                    ),
                  ),
                ],
              )),




        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          /*Navigator.push(context, MaterialPageRoute(builder: (context)=>hollyday()));*/
        },
        child: const Icon(
          Icons.add_outlined,
          size: 30,
        ),
        backgroundColor: Colors.indigo.shade400,
      ),
    );
  }
}