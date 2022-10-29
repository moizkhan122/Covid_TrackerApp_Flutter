import 'package:flutter/material.dart';
import 'package:flutter_application_1/View_Splash/details_contries.dart';
import 'package:flutter_application_1/models/services/StateServices.dart';
import 'package:shimmer/shimmer.dart';

class Country_record extends StatefulWidget {
  const Country_record({Key? key}) : super(key: key);

  @override
  State<Country_record> createState() => _Country_recordState();
}

class _Country_recordState extends State<Country_record> {
  final searchController = TextEditingController();
  StateServices stateServices =  StateServices();
  @override
  Widget build(BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: TextField(
                      controller: searchController,
                      onChanged: ((value){
                        setState(() {
                          
                        });
                      }),
                      decoration: InputDecoration(
                      enabledBorder :InputBorder.none,
                      hintText: "Search for country")),
                  ),
                ),
              ),

              Expanded(child: FutureBuilder(
                future: stateServices.FetchCountryRecord(),
                builder: (context,AsyncSnapshot<List<dynamic>>snapshot){
                  if(!snapshot.hasData){
                    return ListView.builder(
                  itemCount: 4,//snapshot.data!.length
                  itemBuilder: (context,index){
                    return Shimmer.fromColors(
                       baseColor: Colors.grey.shade700,
                        highlightColor:  Colors.grey.shade100,
                        child: Column(children: [
                    ListTile(
                            title: Container(height: 10, width: 80,color: Colors.white,),
                            subtitle:  Container(height: 10, width: 80,color: Colors.white,),
                            leading: Container(height: 50, width: 50,color: Colors.white,),
                            ),
                          ],
                          ),
                        );
                      }
                    );
                  }
                  
                  
                  else{
                     return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context,index){

                  String name = snapshot.data![index]['country'];
                  if(searchController.text.isEmpty){

                    return GestureDetector(
                      onTap: (){
                        Navigator.push(context,
                         MaterialPageRoute(builder: (context) => DetailsCountry(
                          name:snapshot.data![index]['country'].toString(),
                           image: snapshot.data![index]['countryInfo']['flag'],
                            totalcases:snapshot.data![index]['cases'].toString(),
                             totaldeaths: snapshot.data![index]['deaths'].toString(),
                              totalReserves: snapshot.data![index]['recovered'].toString(),
                               actives:snapshot.data![index]['active'].toString(),
                                critical: snapshot.data![index]['critical'].toString(),
                                 todayReserves:snapshot.data![index]['todayRecovered'].toString(),
                                  test: snapshot.data![index]['country'].toString()))
                                  );
                      },
                      child: Column(children: [
                      ListTile(
                        title: Text(snapshot.data![index]['country']),
                        subtitle:  Text(snapshot.data![index]['cases'].toString()),
                        leading: Image(
                          height: 50,
                          width: 50,
                          image: NetworkImage(
                            snapshot.data![index]['countryInfo']['flag'],
                            )),
                      ),
                                      ],),
                    );
                  }else if(name.toLowerCase().contains(searchController.text.toLowerCase())){
                    return Column(children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                         MaterialPageRoute(builder: (context) => DetailsCountry(
                          name:snapshot.data![index]['country'].toString(),
                           image: snapshot.data![index]['countryInfo']['flag'],
                            totalcases:snapshot.data![index]['cases'].toString(),
                             totaldeaths: snapshot.data![index]['deaths'].toString(),
                              totalReserves: snapshot.data![index]['recovered'].toString(),
                               actives:snapshot.data![index]['active'].toString(),
                                critical: snapshot.data![index]['critical'].toString(),
                                 todayReserves:snapshot.data![index]['todayRecovered'].toString(),
                                  test: snapshot.data![index]['country'].toString()))
                                  );
                      },
                      child: ListTile(
                        title: Text(snapshot.data![index]['country']),
                        subtitle:  Text(snapshot.data![index]['cases'].toString()),
                        leading: Image(
                          height: 50,
                          width: 50,
                          image: NetworkImage(
                            snapshot.data![index]['countryInfo']['flag'],
                            )),
                      ),
                    ),
                  ],);
                  }else{
                    return Container();
                  }

                  
                });
                  }
               
              }))
            ],
          ),

        );
  }
}