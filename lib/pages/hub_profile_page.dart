import 'package:flutter/material.dart';
import 'package:flutter_hackathon/models/hub.dart';
import 'package:flutter_hackathon/repositories/hub_repository.dart';

@immutable
class HubProfilePage extends StatefulWidget {
  int hubId;
  HubProfilePage({this.hubId});
  @override
  State<HubProfilePage> createState() => HubProfilePageState(hubId);
}

class HubProfilePageState extends State<HubProfilePage> {
  HubRepository _hubRepository = HubRepository();
  Hub hub;

  HubProfilePageState(int hubid) {
    // this.widget.hubId;
    this.hub = this._hubRepository.getById(hubid);
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: ListView(children: <Widget>[
        Image.network(hub.photoUrl),
        Card(child: Column(
          children: <Widget>[
            ListTile(title: Text("Name"), subtitle: Text(hub.name),),
            ListTile(title: Text("Description"), subtitle: Text(hub.description),)
          ],
        )),
        Container(
          height: 400,
            child: UsersComponent())
      ],)
    );
  }

}


class UsersComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.event), text: 'Events',),
              Tab(icon: Icon(Icons.people), text: 'Users',),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Icon(Icons.directions_car),
            Icon(Icons.directions_transit),
          ],
        ),
      ),
    );
  }
}
