import 'main.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

TextEditingController taskName = TextEditingController();
TextEditingController tarih = TextEditingController();
bool maviMi = true;
bool kirimiziMi = true;
bool yesilMi = true;
bool insanlar = true;
bool iconMu1 = false;
bool iconMu2 = false;
bool iconMu3 = false;

List<String> kisiler = <String>[
  "John",
  "Ali",
  "Ayşe",
  "Kane",
];

class AddTask extends StatefulWidget {
  AddTask({Key? key}) : super(key: key);

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  DateTime selectedDate = DateTime.now();
  TimeOfDay? time1 = TimeOfDay.now();
  TimeOfDay? time2 = TimeOfDay(minute: 00, hour: 12);

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/rainbow-vortex.png'),
                fit: BoxFit.cover),
          ),
          alignment: Alignment.topCenter,
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => MyHomePage(),
                      ));
                    },
                    icon: Icon(
                      Icons.chevron_left,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.75,
                  ),
                  CircleAvatar(
                    radius: 20.0,
                    backgroundImage: NetworkImage(
                        'https://as2.ftcdn.net/v2/jpg/01/12/82/29/1000_F_112822904_NthS7hI8qBDf1p6h16OuffGbVF9Dnww1.jpg'),
                    backgroundColor: Colors.transparent,
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Add Task",
                      style: GoogleFonts.publicSans(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 30),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                      ),
                      Row(children: [
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: IntrinsicHeight(
                            child: Row(children: [
                              VerticalDivider(
                                  width: 10,
                                  thickness: 2,
                                  indent: 0,
                                  endIndent: 0,
                                  color: Colors.blue),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(1, 0, 0, 0),
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.85,
                                  child: TextField(
                                    controller: taskName,
                                    decoration: const InputDecoration(
                                      labelText: 'Your Task Name ?',
                                      labelStyle: TextStyle(fontSize: 22),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ]),
                          ),
                        ),
                      ]),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.05,
                          ),
                          Text("RECENT MEET"),
                        ],
                      ),
                      Expanded(
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: kisiler.length,
                          separatorBuilder: (BuildContext context, int index) =>
                              const Padding(
                                  padding: EdgeInsets.fromLTRB(0, 0, 0, 0)),
                          itemBuilder: (context, index) => Container(
                            margin: EdgeInsets.fromLTRB(1, 0, 1, 0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              color: Colors.white,
                            ),
                            height: MediaQuery.of(context).size.height * 0.23,
                            width: MediaQuery.of(context).size.height * 0.1,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.001,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {});
                                  },
                                  child: Container(
                                    padding: EdgeInsets.fromLTRB(19, 0, 19, 0),
                                    height: MediaQuery.of(context).size.height *
                                        0.1,
                                    width:
                                        MediaQuery.of(context).size.width * 0.2,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Column(
                                      children: [
                                        CircleAvatar(
                                          radius: 20.0,
                                          backgroundImage: NetworkImage(
                                              'https://as2.ftcdn.net/v2/jpg/01/12/82/29/1000_F_112822904_NthS7hI8qBDf1p6h16OuffGbVF9Dnww1.jpg'),
                                          backgroundColor: Colors.transparent,
                                        ),
                                        Text(kisiler[index])
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.05,
                          ),
                          Text("DATE"),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.35,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                  elevation:
                                      MaterialStateProperty.all<double>(0),
                                  backgroundColor: MaterialStateProperty.all(
                                    Colors.white,
                                  )),
                              onPressed: () {
                                _selectDate(context);
                              },
                              child: Text(
                                "${selectedDate.toLocal()}".split(' ')[0],
                                style: GoogleFonts.roboto(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.03,
                          ),
                          Icon(
                            Icons.calendar_month,
                            size: 40,
                            color: Colors.black,
                          ),
                        ],
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: Divider(
                          height: 20,
                          thickness: 2,
                          indent: 0,
                          endIndent: 0,
                          color: Colors.grey[300],
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.05,
                          ),
                          Text("START TIME"),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.25,
                          ),
                          Text("END TIME"),
                        ],
                      ),
                      Row(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.38,
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                      elevation:
                                          MaterialStateProperty.all<double>(0),
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                        Colors.white,
                                      )),
                                  onPressed: () async {
                                    TimeOfDay? startTime = await showTimePicker(
                                      context: context,
                                      initialTime: time1!,
                                    );
                                    if (startTime != null) {
                                      setState(() {
                                        time1 = startTime;
                                      });
                                    }
                                  },
                                  child: Text(
                                    "${time1!.hour.toString()}: ${time1!.minute.toString()}",
                                    style: GoogleFonts.roboto(
                                        fontSize: 20,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.01,
                              ),
                              Icon(
                                Icons.arrow_drop_down,
                                size: 40,
                                color: Colors.black,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.38,
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                      elevation:
                                          MaterialStateProperty.all<double>(0),
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                        Colors.white,
                                      )),
                                  onPressed: () async {
                                    TimeOfDay? endTime = await showTimePicker(
                                      context: context,
                                      initialTime: time2!,
                                    );
                                    if (endTime != null) {
                                      setState(() {
                                        time2 = endTime;
                                      });
                                    }
                                  },
                                  child: Text(
                                    "${time2!.hour.toString()}: ${time2!.minute.toString()}",
                                    style: GoogleFonts.roboto(
                                        fontSize: 20,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.01,
                              ),
                              Icon(
                                Icons.arrow_drop_down,
                                size: 40,
                                color: Colors.black,
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.05,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.40,
                            child: Divider(
                              height: 20,
                              thickness: 2,
                              indent: 0,
                              endIndent: 0,
                              color: Colors.grey[300],
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.05,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.45,
                            child: Divider(
                              height: 20,
                              thickness: 2,
                              indent: 0,
                              endIndent: 0,
                              color: Colors.grey[300],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.05,
                          ),
                          Text("DESCRIPTION"),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          child: TextField(
                            controller: taskName,
                            decoration: const InputDecoration(
                              labelText: '',
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: Divider(
                          height: 20,
                          thickness: 2,
                          indent: 0,
                          endIndent: 0,
                          color: Colors.grey[300],
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.05,
                          ),
                          Text("CATAGORY"),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.05,
                          ),
                          Stack(clipBehavior: Clip.none, children: [
                            ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                  kirimiziMi
                                      ? Colors.red[100]
                                      : Colors.red[600],
                                ),
                                padding: MaterialStateProperty.all(
                                    EdgeInsets.all(8.0)),
                                textStyle: MaterialStateProperty.all(
                                    TextStyle(fontSize: 15)),
                              ),
                              child: Text(
                                'URGENT',
                                style: TextStyle(
                                  color: kirimiziMi ? Colors.red : Colors.white,
                                  fontSize: 22.0,
                                ),
                              ),
                              onPressed: () {
                                setState(() {
                                  kirimiziMi = !kirimiziMi;
                                  iconMu1 = !iconMu1;
                                });
                              },
                            ),
                            Positioned(
                              top: -5,
                              right: -10,
                              child: Visibility(
                                visible: iconMu1,
                                child: Icon(
                                  Icons.check_circle,
                                  color: Colors.black,
                                ),
                              ),
                            )
                          ]),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.05,
                          ),
                          Stack(clipBehavior: Clip.none, children: [
                            ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                  yesilMi
                                      ? Colors.green[100]
                                      : Colors.green[600],
                                ),
                                padding: MaterialStateProperty.all(
                                    EdgeInsets.all(8.0)),
                                textStyle: MaterialStateProperty.all(
                                    TextStyle(fontSize: 15)),
                              ),
                              child: Text(
                                'RUNNING',
                                style: TextStyle(
                                  color: yesilMi ? Colors.green : Colors.white,
                                  fontSize: 22.0,
                                ),
                              ),
                              onPressed: () {
                                setState(() {
                                  yesilMi = !yesilMi;
                                  iconMu2 = !iconMu2;
                                });
                              },
                            ),
                            Positioned(
                              top: -5,
                              right: -10,
                              child: Visibility(
                                visible: iconMu2,
                                child: Icon(
                                  Icons.check_circle,
                                ),
                              ),
                            )
                          ]),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.05,
                          ),
                          Stack(clipBehavior: Clip.none, children: [
                            ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                  maviMi ? Colors.blue[100] : Colors.blue[600],
                                ),
                                padding: MaterialStateProperty.all(
                                    EdgeInsets.all(8.0)),
                                textStyle: MaterialStateProperty.all(
                                    TextStyle(fontSize: 15)),
                              ),
                              child: Text(
                                'ONGOING',
                                style: TextStyle(
                                  color: maviMi ? Colors.blue : Colors.white,
                                  fontSize: 22.0,
                                ),
                              ),
                              onPressed: () {
                                setState(() {
                                  maviMi = !maviMi;
                                  iconMu3 = !iconMu3;
                                });
                              },
                            ),
                            Positioned(
                              top: -5,
                              right: -10,
                              child: Visibility(
                                visible: iconMu3,
                                child: Icon(
                                  Icons.check_circle,
                                ),
                              ),
                            )
                          ]),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30)),
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: MediaQuery.of(context).size.height * 0.07,
                        child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Color(0xff5a55cb))),
                          onPressed: () {},
                          child: Text(
                            "Create New Task",
                            style: GoogleFonts.publicSans(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                    ],
                  ),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(40),
                        topLeft: Radius.circular(40),
                      )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

/*
Stack(clipBehavior: Clip.none, children: [
                ElevatedButton(
                  child: Text(
                    'Button',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22.0,
                    ),
                  ),
                  onPressed: () {},
                ),
                Positioned(
                  top: -5,
                  right: -10,
                  child: Icon(
                    Icons.check_circle,
                  ),
                )
              ]),
*/

