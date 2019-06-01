import 'package:flutter/material.dart';
import 'package:flutter_hackathon/models/hub.dart';
import 'package:flutter_hackathon/repositories/hub_repository.dart';

@immutable
class HubProfilePage extends StatefulWidget {
  int hubId;

  @override
  State<HubProfilePage> createState() => HubProfilePageState();
}

class HubProfilePageState extends State<HubProfilePage> {
  HubRepository _hubRepository = HubRepository();
  Hub hub;

  HubProfilePageState() {
    int hubId = 1; // this.widget.hubId;
    this.hub = this._hubRepository.getById(hubId);
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: ListView(children: <Widget>[
        Image.network(hub.photoUrl),
        Text(hub.name),
        Card(child: Column(
          children: <Widget>[
            ListTile(title: Text("Name"), subtitle: Text(hub.name),),
            ListTile(title: Text("Description"), subtitle: Text(hub.description),)
          ],
        )),
        Text("Teste"),

      ],)
    );
  }

}
