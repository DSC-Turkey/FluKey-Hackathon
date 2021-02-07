import 'package:flukey_hackathon/common/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:neumorphic/neumorphic.dart';

class EventDetailScreenView extends StatefulWidget {
  @override
  _EventDetailScreenViewState createState() => _EventDetailScreenViewState();
}

class _EventDetailScreenViewState extends State<EventDetailScreenView> {
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
              buildEventDetails(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildEventDetails(BuildContext context) {
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
                'Flutter State Management',
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
                    backgroundImage:
                        NetworkImage('https://avatars.githubusercontent.com/u/17102578?s=460&u=8d0c2fa492d36b0c109e09d66213e4bd12d8fb6b&v=4'),
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
                        Text('Author'),
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
                        Text('45 Min'),
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
                        Text('February, 12'),
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
                        Text('1 Ticket'),
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
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
                  overflow: TextOverflow.clip,
                  maxLines: 20,
                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400, fontSize: 16.0),
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
                  debugPrint('Book');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
