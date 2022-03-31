import 'package:flutter/material.dart';
import 'package:socket_flutter/service/socket_serivce.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
static const String id = "home_page";
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var response = "No Data";

  _initSocketService(){
    SocketService.connectSocketChannel();

    SocketService.channel.stream.listen((data) {
      setState(() {
        response = data.toString();
      });
    },
    onError: (error){
      setState(() {
        response = error.toString();
      });
    }
    );
  }



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initSocketService();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Socket"),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
      child: Center(
        child: Text(response,style: const TextStyle(fontSize: 22),),
      ),
      ),
    );
  }
}
