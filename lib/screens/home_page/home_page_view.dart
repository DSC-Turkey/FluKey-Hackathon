import 'package:flukey_hackathon/screens/event_detail_screen/event_detail_screen_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:neumorphic/neumorphic.dart';

class HomePageView extends StatefulWidget {
  @override
  _HomePageViewState createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            buildTopInfos(context),
            buildMidInfos(context),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 15,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  child: buildEventItem(context),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => EventDetailScreenView()));
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }

  Widget buildEventItem(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 10),
      child: NeuCard(
        height: MediaQuery.of(context).size.height * 0.4,
        curveType: CurveType.flat,
        bevel: 16,
        color: Colors.green,
        decoration: NeumorphicDecoration(borderRadius: BorderRadius.circular(32), color: Colors.white),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(32),
                topRight: Radius.circular(32),
              ),
              child: Image.network(
                'https://avatars.githubusercontent.com/u/17102578?s=460&u=8d0c2fa492d36b0c109e09d66213e4bd12d8fb6b&v=4',
                width: MediaQuery.of(context).size.width * 0.4,
                height: MediaQuery.of(context).size.height * 0.4,
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
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: Text(
                      'Flutter State Management',
                      maxLines: 6,
                      overflow: TextOverflow.ellipsis,
                      softWrap: false,
                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 16.0),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: Text(
                      'A conference about flutter and state management. Feel free to attend. Lorem ipsum and nothing else matter.',
                      maxLines: 6,
                      overflow: TextOverflow.ellipsis,
                      softWrap: false,
                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 12.0),
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
                          Text('Author'),
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
        height: MediaQuery.of(context).size.height * 0.2,
        curveType: CurveType.flat,
        bevel: 16,
        color: Colors.white,
        decoration: NeumorphicDecoration(borderRadius: BorderRadius.circular(24), color: Colors.grey.shade100),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Elon\nMusk',
                textAlign: TextAlign.left,
                style: TextStyle(fontWeight: FontWeight.w900, fontSize: 32),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage('https://ichef.bbci.co.uk/news/640/cpsprodpb/CE17/production/_116395725_55588050.jpg'),
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
                        ' : 4',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
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
          newCardFirst(context, 'SOLD\nTICKET', 5600, 'assets/icons/increase.svg'),
          newCardFirst(context, 'HELPED\nPEOPLE', 1234, 'assets/icons/influencer.svg'), //TODO burdaki iconu değiştir
        ],
      ),
    );
  }

  NeuCard newCardFirst(BuildContext context, String title, int ticketCount, String assetPath) {
    return NeuCard(
      alignment: Alignment.center,
      height: MediaQuery.of(context).size.height * 0.15,
      width: MediaQuery.of(context).size.height * 0.2,
      curveType: CurveType.flat,
      bevel: 16,
      color: Colors.white,
      decoration: NeumorphicDecoration(borderRadius: BorderRadius.circular(24), color: Colors.grey.shade100),
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
