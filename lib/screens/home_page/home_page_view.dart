import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flukey_hackathon/bloc/authentication/authentication_bloc.dart';
import 'package:flukey_hackathon/bloc/login/login_bloc.dart';
import 'package:flukey_hackathon/common/extensions.dart';
import 'package:flukey_hackathon/model/event_model.dart';
import 'package:flukey_hackathon/screens/event_detail_screen/event_detail_screen_view.dart';
import 'package:flukey_hackathon/services/firebase_service.dart';
import 'package:flukey_hackathon/services/service_locator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:neumorphic/neumorphic.dart';

class HomePageView extends StatefulWidget {
  @override
  _HomePageViewState createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  List<EventDetail> eventList = <EventDetail>[];
  final String localJsonPath = 'assets/data/dummy_datas.json';

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> loadLocalJson() async {
    var data = await rootBundle.loadString(localJsonPath);
    List<dynamic> decodedJson = json.decode(data);
    eventList = decodedJson.map((user) => EventDetail.fromMap(user)).toList();
    setState(() {
      return eventList;
    });
  }

  @override
  void initState() {
    super.initState();
    loadLocalJson();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              buildTopInfos(context),
              buildMidInfos(context),
              listItems(context, eventList)
            ],
          ),
        ),
      ),
    );
  }

  Widget listItems(BuildContext context, List<EventDetail> list) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: eventList.length,
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          child: buildEventItem(context, eventList[index]),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => EventDetailScreenView(eventList[index])));
          },
        );
      },
    );
  }

  Widget buildEventItem(BuildContext context, EventDetail eventDetail) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 10),
      child: NeuCard(
        height: SizeExtension(context).dynamicHeight(0.4),
        curveType: CurveType.flat,
        bevel: 16,
        color: Colors.green,
        decoration: NeumorphicDecoration(
            borderRadius: BorderRadius.circular(32), color: Colors.white),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(32),
                topRight: Radius.circular(32),
              ),
              child: Image.network(
                eventDetail.imageLink,
                height: SizeExtension(context).dynamicHeight(0.4),
                width: SizeExtension(context).dynamicWidth(0.4),
                fit: BoxFit.fitHeight,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: SizeExtension(context).dynamicWidth(0.3),
                    child: Text(
                      eventDetail.title,
                      maxLines: 6,
                      overflow: TextOverflow.ellipsis,
                      softWrap: false,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 16.0),
                    ),
                  ),
                  SizedBox(
                    width: SizeExtension(context).dynamicWidth(0.3),
                    child: Text(
                      eventDetail.comment,
                      maxLines: 6,
                      overflow: TextOverflow.ellipsis,
                      softWrap: false,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 12.0),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/icons/speaker.svg',
                            height: 24,
                            width: 24,
                          ),
                          SizedBox(width: 3),
                          Text(eventDetail.author),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/icons/salary.svg',
                            height: 24,
                            width: 24,
                          ),
                          SizedBox(width: 3),
                          eventDetail.ticket == 0
                              ? Text('Free')
                              : Text('${eventDetail.ticket} Ticket'),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/icons/hourglass.svg',
                            height: 24,
                            width: 24,
                          ),
                          SizedBox(width: 3),
                          Text(eventDetail.duration),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/icons/schedule.svg',
                            height: 24,
                            width: 24,
                          ),
                          SizedBox(width: 3),
                          Text(eventDetail.date),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildTopInfos(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, top: 40, bottom: 16),
      child: NeuCard(
        height: SizeExtension(context).dynamicHeight(0.2),
        curveType: CurveType.flat,
        bevel: 16,
        color: Colors.white,
        decoration: NeumorphicDecoration(
            borderRadius: BorderRadius.circular(24),
            color: Colors.grey.shade100),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                _auth.currentUser.displayName ?? "Cihat İ. Dede",
                textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.headline6,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(_auth.currentUser.photoURL),
                    radius: 36,
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/ticket.svg',
                        height: 30,
                        width: 30,
                      ),
                      Text(
                        '  2',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 24),
                      )
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildMidInfos(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          newCardFirst(
              context, 'SOLD\nTICKET', 5600, 'assets/icons/increase.svg'),
          newCardFirst(context, 'HELPED\nPEOPLE', 1234,
              'assets/icons/influencer.svg'), //TODO burdaki iconu değiştir
        ],
      ),
    );
  }

  NeuCard newCardFirst(
      BuildContext context, String title, int ticketCount, String assetPath) {
    return NeuCard(
      alignment: Alignment.center,
      height: SizeExtension(context).dynamicHeight(0.15),
      width: SizeExtension(context).dynamicWidth(0.36),
      curveType: CurveType.flat,
      bevel: 16,
      color: Colors.white,
      decoration: NeumorphicDecoration(
          borderRadius: BorderRadius.circular(24), color: Colors.grey.shade100),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  title,
                  style: TextStyle(fontWeight: FontWeight.w300, fontSize: 16),
                ),
                SvgPicture.asset(
                  '$assetPath',
                  height: 32,
                  width: 32,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Text(
                '$ticketCount',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 26,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
