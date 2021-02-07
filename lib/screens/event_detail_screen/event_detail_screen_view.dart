import 'package:flukey_hackathon/common/extensions.dart';
import 'package:flukey_hackathon/model/event_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:neumorphic/neumorphic.dart';
import 'package:url_launcher/url_launcher.dart';

class EventDetailScreenView extends StatelessWidget {
  final EventDetail eventDetailItem;
  EventDetailScreenView(this.eventDetailItem);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: Container(
          height: SizeExtension(context).dynamicHeight(0.05),
          width: SizeExtension(context).dynamicWidth(1),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              InkWell(
                child: Text(
                  'Return to home page',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                onTap: () {
                  Navigator.of(context).pop();
                  debugPrint('geri dönüldü');
                },
              ),
            ],
          ),
        ),
        body: Container(
          child: ListView(
            children: <Widget>[
              buildEventDetails(context, eventDetailItem),
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildEventDetails(BuildContext context, EventDetail eventDetail) {
  return Padding(
    padding: const EdgeInsets.only(left: 30, right: 30, top: 30),
    child: NeuCard(
      height: SizeExtension(context).dynamicHeight(0.8),
      curveType: CurveType.flat,
      bevel: 16,
      decoration: NeumorphicDecoration(borderRadius: BorderRadius.circular(32), color: Colors.grey.shade100),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Text(
              eventDetail.title,
              maxLines: 3,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              softWrap: false,
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.w800, fontSize: 24.0),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              NeuCard(
                curveType: CurveType.convex,
                bevel: 8,
                decoration: NeumorphicDecoration(borderRadius: BorderRadius.circular(64), color: Colors.grey.shade400),
                child: CircleAvatar(
                  radius: 64,
                  backgroundColor: Colors.white,
                  backgroundImage: NetworkImage(eventDetail.imageLink),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                      Text('${eventDetail.ticket} Ticket'),
                    ],
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: SizeExtension(context).dynamicWidth(0.8),
              child: Text(
                eventDetail.longComment,
                overflow: TextOverflow.clip,
                maxLines: 20,
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400, fontSize: 20.0),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30, top: 40, bottom: 16),
            child: InkWell(
              child: Container(
                child: NeuCard(
                  height: SizeExtension(context).dynamicHeight(0.07),
                  curveType: CurveType.flat,
                  decoration: NeumorphicDecoration(borderRadius: BorderRadius.circular(24), color: Colors.grey.shade200),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Center(
                      child: Text(
                        'Book',
                        style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ),
              onTap: () {
                _launchURL();
              },
            ),
          ),
        ],
      ),
    ),
  );
}

 void _launchURL() async {
  const url = 'https://meet.google.com';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
