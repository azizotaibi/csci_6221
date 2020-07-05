import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class Tracker extends StatefulWidget {
  @override
  TrackerState createState() => TrackerState();
}

class TrackerState extends State<Tracker> {
  Map worldData;
  fetchWorldWideData() async {
    http.Response response = await http.get('https://corona.lmao.ninja/v2/all');
    setState(() {
      worldData = json.decode(response.body);
    });
  }

  List countryData;
  fetchCountryData() async {
    http.Response response =
        await http.get('https://corona.lmao.ninja/v2/countries?sort=deaths');
    setState(() {
      countryData = json.decode(response.body);
    });
  }

  List testingData;
  fetchTesting() async {
    http.Response response =
        await http.get('https://corona.lmao.ninja/v2/countries?sort=tests');
    setState(() {
      testingData = json.decode(response.body);
    });
  }
   
  
  List activeData;
  fetchActive() async {
    http.Response response =
        await http.get('https://corona.lmao.ninja/v2/countries?sort=active');
    setState(() {
      activeData = json.decode(response.body); 
    });
  }
   

  @override
  void initState() {
    fetchWorldWideData();
    fetchCountryData();
    fetchTesting();
  fetchActive();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
            child: Container(
              color: Colors.redAccent,
              height: 3.0,
            ),
            preferredSize: Size.fromHeight(4.0)),
        title:
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          Image.asset(
            'images/logo.png',
            fit: BoxFit.cover,
            height: 40.0,
          ),
        ]),
        //centerTitle: true,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              'Worldwide',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          worldData == null
              ? CircularProgressIndicator()
              : WorldwidePanel(
                  worldData: worldData,
                ),

          Container(
            child: Column(
              children: <Widget>[
                Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              'Most affected Countries',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 10,
            width: 10,
          ),
          countryData == null
              ? Container()
              : MostAffectedPanel(
                  countryData: countryData,
                )
              ],
            ),
          ),
         
        Container(
          child: Column(
            children: <Widget>[
               Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              'Top testing countries',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 10,
            width: 10,
          ),
          testingData == null
              ? Container()
              : Testing(
                  testingData: testingData,
                )
            ],
          ),
        ),

  
        Container(
          child: Column(
            children: <Widget>[
               Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              'Top Active Cases countries',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 10,
            width: 10,
          ),
          activeData == null
              ? Container()
              : StateView(
                  activedata: activeData,
                )
            ],
          ),
        ),
    
        ],
      )),
    );
  }
}

class WorldwidePanel extends StatelessWidget {
  final Map worldData;

  const WorldwidePanel({Key key, this.worldData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: GridView(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, childAspectRatio: 2),
      children: <Widget>[
        StatusPanel(
          title: 'CONFIRMED',
          panelColor: Colors.grey[400],
          textColor: Colors.black,
          count: worldData['cases'].toString(),
        ),
        StatusPanel(
          title: 'ACTIVE',
          panelColor: Colors.orangeAccent,
          textColor: Colors.black,
          count: worldData['active'].toString(),
        ),
        StatusPanel(
          title: 'RECOVERED',
          panelColor: Colors.green[300],
          textColor: Colors.black,
          count: worldData['recovered'].toString(),
        ),
        StatusPanel(
          title: 'DEATHS',
          panelColor: Colors.red[300],
          textColor: Colors.black,
          count: worldData['deaths'].toString(),
        ),
      ],
    ));
  }
}

class StatusPanel extends StatelessWidget {
  final Color panelColor;
  final Color textColor;
  final String title;
  final String count;

  const StatusPanel(
      {Key key, this.panelColor, this.textColor, this.title, this.count})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
   
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            color: panelColor,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                  spreadRadius: 0.1, blurRadius: 2.0, offset: Offset(1.0, 3.0)),
              BoxShadow(
                  color: Colors.grey[300],
                  spreadRadius: 0.1,
                  blurRadius: 25.0,
                  offset: Offset(0.0, 1.0))
            ]),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    title,
                    style: TextStyle(
                        inherit: true,
                        fontWeight: FontWeight.w700,
                        fontSize: 16.0),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    count,
                    style: TextStyle(
                        inherit: true,
                        fontWeight: FontWeight.w700,
                        fontSize: 16.0),
                  ),
                ],
              )
            ]),
      ),
    );
  }
}

class MostAffectedPanel extends StatelessWidget {
  final List countryData;

  const MostAffectedPanel({Key key, this.countryData}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
          child: SingleChildScrollView(
          child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              childAspectRatio: MediaQuery.of(context).size.height / 450,             // the size of the single container
              ),
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                              spreadRadius: 0.1,
                              blurRadius: 2.0,
                              offset: Offset(1.0, 3.0)),
                          BoxShadow(
                              color: Colors.grey[300],
                              spreadRadius: 0.1,
                              blurRadius: 25.0,
                              offset: Offset(0.0, 1.0))
                        ]),
                    child: Column(
                        mainAxisSize: MainAxisSize.min,
                        verticalDirection: VerticalDirection.down,
                        children: <Widget>[
                          Text(
                            countryData[index]['country'],
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Image.network(
                            countryData[index]['countryInfo']['flag'],
                            height: 35,
                            width: 65,
                          ),
                          Text(
                            'Deaths:' + countryData[index]['deaths'].toString(),
                            style: TextStyle(
                                color: Colors.red, fontWeight: FontWeight.bold, )
                          ),
                            Text(
                            'Today:' + countryData[index]['todayRecovered'].toString(),
                            style: TextStyle(
                                color: Colors.red, fontWeight: FontWeight.bold),
                          )
                        ]),
                  ),
                );
              },
              itemCount: 6,
            )));
  }
}

class Testing extends StatelessWidget {
  final List testingData;
  final String con;
  const Testing({Key key, this.testingData, this.con}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        child: SingleChildScrollView(
            child: GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
              childAspectRatio: MediaQuery.of(context).size.height / 400,             // the size of the single container


      ),
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                      spreadRadius: 0.1,
                      blurRadius: 2.0,
                      offset: Offset(1.0, 3.0)),
                  BoxShadow(
                      color: Colors.grey[300],
                      spreadRadius: 0.1,
                      blurRadius: 25.0,
                      offset: Offset(0.0, 1.0))
                ]),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                verticalDirection: VerticalDirection.down,
                children: <Widget>[
                  SizedBox(
                    height: 5,
                    width: 5,
                  ),
                  Text(
                    testingData[index]['country'],
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Image.network(
                    testingData[index]['countryInfo']['flag'],
                    height: 30,
                    width: 65,
                  ),
                  Text(
                    'Tests:' + testingData[index]['tests'].toString(),
                    style: TextStyle(
                        color: Colors.red, fontWeight: FontWeight.bold),
                  ),
                 /*  Text(
                    'Tests:' + testingData[index]['todayDeaths'].toString(),
                    style: TextStyle(
                        color: Colors.red, fontWeight: FontWeight.bold),
                  )*/
                ]),
          ),
        );
      },
      itemCount: 6,
    )));
  }
}


class StateView extends StatelessWidget{
  final List activedata;

  const StateView({ this.activedata}) ;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: SingleChildScrollView(
            child: GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
              childAspectRatio: MediaQuery.of(context).size.height / 400,             // the size of the single container
      ),
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                      spreadRadius: 0.1,
                      blurRadius: 2.0,
                      offset: Offset(1.0, 3.0)),
                  BoxShadow(
                      color: Colors.grey[300],
                      spreadRadius: 0.1,
                      blurRadius: 25.0,
                      offset: Offset(0.0, 1.0))
                ]),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                verticalDirection: VerticalDirection.down,
                children: <Widget>[
                  SizedBox(
                    height: 5,
                    width: 5,
                  ),
                  Text(
                    activedata[index]['country'],
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Image.network(
                    activedata[index]['countryInfo']['flag'],
                    height: 30,
                    width: 65,
                  ),
                  Text(
                    'Active Cases:' + activedata[index]['active'].toString(),
                    style: TextStyle(
                        color: Colors.red, fontWeight: FontWeight.bold),
                  ),
                  /*Text(
                    'Tests:' + activedata[index]['todayDeaths'].toString(),
                    style: TextStyle(
                        color: Colors.red, fontWeight: FontWeight.bold),
                  )*/
                ]),
          ),
        );
      },
      itemCount: 6,
    )));
  }
}