import 'package:flutter/material.dart';
import 'package:flutter_application_1/View_Splash/view_world_state.dart';

class DetailsCountry extends StatefulWidget {
   DetailsCountry({Key? key,
    required this.name,
    required this.image,
    required this.totalcases,
    required this.totaldeaths,
    required this.totalReserves,
    required this.actives,
    required this.critical,
    required this.todayReserves,
    required this.test,}) : super(key: key);

    String name,image;
    String totalcases,totaldeaths,totalReserves,actives,critical,todayReserves,test;

  @override
  State<DetailsCountry> createState() => _DetailsCountryState();
}

class _DetailsCountryState extends State<DetailsCountry> {
  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(title: Text(widget.name),
        centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
            Padding(
              padding: const EdgeInsets.only(top: 45),
              child: Card(child: Column(
                children: [
                  SizedBox(height: 40,),
                  ReUseableRow(title: 'name', value: widget.name),
                  ReUseableRow(title: 'Total Case', value: widget.totalcases),
                  ReUseableRow(title: 'Total death', value: widget.totaldeaths),
                  ReUseableRow(title: 'Total Recovered', value: widget.totalReserves),
                  ReUseableRow(title: 'Actives', value: widget.actives),
                  ReUseableRow(title: 'Criticals', value: widget.critical),
                  ReUseableRow(title: 'Today Recovered', value: widget.todayReserves),
                ],
              ),),
            ),
           CircleAvatar(
            radius : 50,
            backgroundImage: NetworkImage(widget.image),
            ) 
          ],)
        ]),
      );   
  }
}