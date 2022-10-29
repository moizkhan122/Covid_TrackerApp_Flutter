import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/View_Splash/country_recordData.dart';
import 'package:flutter_application_1/models/WorldStateModel.dart';
import 'package:flutter_application_1/models/services/StateServices.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pie_chart/pie_chart.dart';

class world_State extends StatefulWidget {
  const world_State({Key? key}) : super(key: key);

  @override
  State<world_State> createState() => _world_StateState();
}

class _world_StateState extends State<world_State> with SingleTickerProviderStateMixin{

   late AnimationController animationController;

  @override
  void dispose() {
    // TODO: implement dispose
    animationController.dispose();
  }

  @override
  void initState(){
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
      )..repeat();
  }
  final colorList = <Color>[
  const  Color(0xff4285F4),
  const  Color(0xff1aa260),
  const  Color(0xffde5246),
  ];
  @override
  Widget build(BuildContext context) {
    StateServices getWorldRecorddata = new StateServices();
      return Scaffold(
        body: SafeArea(
          child: Padding(
          padding: EdgeInsets.all(20),
          child : Column(children:[
            SizedBox(height: 20),

            FutureBuilder(
              future: getWorldRecorddata.FetchWorldStateRecord(),
              builder: (context,AsyncSnapshot<WorldStateModel>snapshot){
              if(!snapshot.hasData){
                return Expanded(
                  child: SpinKitFadingCircle(
                    color: Colors.white,
                    size: 50,
                    controller: animationController,));
              }
              else{
                return Column(children:[
                        PieChart(dataMap:{
                          //pie chart get double value
              'Totals' : double.parse(snapshot.data!.cases.toString()),
              'Recovered' : double.parse(snapshot.data!.recovered.toString()),
              'Death' : double.parse(snapshot.data!.deaths.toString()),
            },
            chartValuesOptions: ChartValuesOptions(
              showChartValuesInPercentage: true
            ),
            chartRadius: MediaQuery.of(context).size.width/3.2,
            legendOptions: LegendOptions(
              legendPosition: LegendPosition.left
            ),
            animationDuration: Duration(milliseconds: 1200),
            chartType: ChartType.ring,
            colorList: colorList,
            ),
                         Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: Card(child: Column(
                children: [
                ReUseableRow(title:"Total",value:snapshot.data!.cases.toString(),),
                ReUseableRow(title:"Death",value:snapshot.data!.deaths.toString(),),
                ReUseableRow(title:"Recovered",value:snapshot.data!.recovered.toString(),),
                ReUseableRow(title:"Active",value:snapshot.data!.active.toString(),),
                ReUseableRow(title:"Critical",value:snapshot.data!.critical.toString(),),
                ReUseableRow(title:"Todays Death",value:snapshot.data!.todayDeaths.toString(),),
                ReUseableRow(title:"Today Recovered",value:snapshot.data!.todayRecovered.toString(),),
              ]),),
            ),
                        GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: ((context) => Country_record())));
            },
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.green),
              child: Center(child: Text("Track Countries",style: TextStyle(fontSize: 20),),),),
                    )
                ],);
              }
            }),
          
          ],)
          ),
      )
      );
  }
}
class ReUseableRow extends StatelessWidget {
  const ReUseableRow({Key? key, required this.title, required this.value,}) : super(key: key);
  final String title,value;

  @override
  Widget build(BuildContext context) {
        return Padding(
          padding: const EdgeInsets.only(left: 10,right: 10,top: 15,bottom: 7),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Text(title),
              Text(value),
            ]),
            SizedBox(height: 8,),
            //Divider(),//space evenly in column
          ],),
        );   
  }
}