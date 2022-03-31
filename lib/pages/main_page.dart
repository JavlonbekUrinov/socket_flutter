import 'package:flutter/material.dart';
import 'package:socket_flutter/service/socket_serivce.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);
static const String id = "main_page";
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    SocketService.closeSocketChannel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Socket"),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: StreamBuilder(
          stream: SocketService.channel.stream,
          builder: (context , snapshot){
            return Center(
              child: Text(
                snapshot.hasData ? "${snapshot.data}" :" No Data",style: TextStyle(fontSize: 22),
              ),
            );
          },
        ),
      ),
    );
  }
}
