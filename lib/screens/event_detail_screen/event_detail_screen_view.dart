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
    return Scaffold(
      body: Container(
        child: ListView(
          children: <Widget>[
            buildEventDetails(context),
          ],
        ),
      ),
    );
  }

  Widget buildEventDetails(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, top: 30),
      child: NeuCard(
        height: MediaQuery.of(context).size.height * 0.7,
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
                        Image.asset(
                          'assets/icons/schedule.png',
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
                        Image.asset(
                          'assets/icons/salary.png',
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
                width: MediaQuery.of(context).size.width * 0.8,
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
                    height: MediaQuery.of(context).size.height * 0.07,
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
