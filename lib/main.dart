import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taskapp/addtask.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';

List<String> baslik = <String>[
  "URGENT",
  "RUNNING",
  "ONGOING",
];

List<String> metinler = <String>[
  "New Map UI Design Project",
  "Application Design Meeting",
  "Web Design Meeting",
];

List<Color> renkler = <Color>[Colors.red, Colors.green, Colors.blue];

List<String> gunler = <String>[
  "MON",
  "TUE",
  "WED",
  "THU",
  "FRI",
  "SAT",
  "SUN",
];
String ui = "Website UI Design for £500";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DatePickerController _controller = DatePickerController();

  DateTime _selectedValue = DateTime.now();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: Color(0xfff1f3ff),
        elevation: 0,
        title: Text(
          "Task",
          style: GoogleFonts.publicSans(
              color: Color.fromARGB(255, 6, 29, 63),
              fontSize: 30,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Color(0xfff1f3ff),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.chevron_left,
                      color: Color.fromARGB(255, 6, 29, 63),
                      size: 40,
                    ),
                  ),
                  Text(
                    "Task",
                    style: GoogleFonts.publicSans(
                        color: Color.fromARGB(255, 6, 29, 63),
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.6,
                  ),
                  CircleAvatar(
                    radius: 25.0,
                    backgroundImage: NetworkImage(
                        'https://as2.ftcdn.net/v2/jpg/01/12/82/29/1000_F_112822904_NthS7hI8qBDf1p6h16OuffGbVF9Dnww1.jpg'),
                    backgroundColor: Colors.transparent,
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.05,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "May 01, 2020",
                        style: GoogleFonts.roboto(
                            color: Color.fromARGB(255, 101, 104, 109),
                            fontSize: 18,
                            fontWeight: FontWeight.normal),
                      ),
                      Text(
                        "Today",
                        style: GoogleFonts.libreFranklin(
                            color: Color.fromARGB(255, 6, 29, 63),
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.32,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.06,
                    width: MediaQuery.of(context).size.width * 0.33,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => AddTask(),
                        ));
                      },
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Color(0xfff6684d),
                          borderRadius: BorderRadiusDirectional.circular(10.0),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.01,
                            ),
                            Text(
                              "Add Task",
                              style: GoogleFonts.publicSans(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                child: Container(
                  child: DatePicker(
                    DateTime.now(),
                    width: 60,
                    height: 80,
                    controller: _controller,
                    initialSelectedDate: DateTime.now(),
                    selectionColor: Colors.black,
                    selectedTextColor: Colors.white,
                    onDateChange: (date) {
                      // New date selected
                      setState(() {
                        _selectedValue = date;
                      });
                    },
                  ),
                ),
              ),
              Expanded(
                child: ListView.separated(
                  scrollDirection: Axis.vertical,
                  itemCount: 3,
                  separatorBuilder: (BuildContext context, int index) =>
                      const Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 0)),
                  itemBuilder: (context, index) => Container(
                    margin: EdgeInsets.fromLTRB(1, 0, 1, 0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Color(0xfff1f3ff),
                    ),
                    height: MediaQuery.of(context).size.height * 0.23,
                    width: MediaQuery.of(context).size.height * 0.5,
                    child: Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(19, 15, 19, 0),
                          height: MediaQuery.of(context).size.height * 0.22,
                          width: MediaQuery.of(context).size.width * 0.9,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    baslik[index],
                                    style: GoogleFonts.publicSans(
                                        color: renkler[index],
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Divider(
                                    height: 20,
                                    thickness: 2,
                                    indent: 0,
                                    endIndent: 0,
                                    color: Colors.grey[300],
                                  ),
                                  IntrinsicHeight(
                                    child: Row(
                                      children: [
                                        VerticalDivider(
                                            width: 10,
                                            thickness: 4,
                                            indent: 0,
                                            endIndent: 0,
                                            color: renkler[index]),
                                        Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Text(
                                            metinler[index],
                                            style: GoogleFonts.publicSans(
                                                color: Colors.blue[900],
                                                fontSize: 20,
                                                fontWeight: FontWeight.normal),
                                          ),
                                        ),
                                        // SizedBox(
                                        //   width: MediaQuery.of(context)
                                        //           .size
                                        //           .width *
                                        //       0.01,
                                        // ),
                                        Spacer(),
                                        IconButton(
                                            onPressed: () {},
                                            icon: Icon(Icons.more_vert))
                                      ],
                                    ),
                                  ),
                                  Row(children: [
                                    IntrinsicHeight(
                                      child: Row(children: [
                                        VerticalDivider(
                                            width: 10,
                                            thickness: 4,
                                            indent: 0,
                                            endIndent: 0,
                                            color: renkler[index]),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              5, 0, 2, 0),
                                          child: Text(
                                            ui,
                                            style: GoogleFonts.publicSans(
                                                color: Colors.grey[400],
                                                fontSize: 15,
                                                fontWeight: FontWeight.normal),
                                          ),
                                        ),
                                      ]),
                                    ),
                                  ]),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.03,
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.timer,
                                          color: Colors.grey[600]),
                                      Text("10-11 AM"),
                                      SizedBox(
                                        width: 40,
                                      ),
                                      Icon(Icons.person,
                                          color: Colors.grey[600]),
                                      Text(
                                        "2 Persons",
                                        style: GoogleFonts.publicSans(
                                            color: Colors.black,
                                            fontWeight: FontWeight.normal),
                                      ),
                                      SizedBox(
                                        width: 40,
                                      ),
                                      Icon(Icons.share,
                                          color: Colors.grey[600]),
                                      Text("Share"),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
