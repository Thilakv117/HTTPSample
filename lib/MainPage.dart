import 'package:flutter/material.dart';
import 'httpcall/httpresponse.dart'; // Assuming FetchData is defined here
import 'models/model.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  late var datas;
  bool isloaded=false; // Declare as Future<List>
List<TaskList> taskList=[];
  @override
  void initState() {
    super.initState();
   getData(); // FetchData should return a Future
  }

  getData()async{
    setState(() {
      isloaded=false;
    });
    datas =await fetchData();
    Iterable list = datas;
     taskList = list.map((data) => TaskList.fromJson(data)).toList();
    print(datas);
    setState(() {
      isloaded=true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Http Call"),
        centerTitle: true,
      ),
      body: isloaded?Column(children: [
      for(int i=0;i<taskList.length;i++)
      Text(taskList[i].title!)
      ],):Text("Loading...............")
    );
  }
}
