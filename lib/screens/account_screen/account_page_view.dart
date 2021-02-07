import 'package:flukey_hackathon/common/extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:neumorphic/neumorphic.dart';

class AccountPageView extends StatefulWidget {
  @override
  _AccountPageViewState createState() => _AccountPageViewState();
}

class _AccountPageViewState extends State<AccountPageView> {
  int ticketCount = 1;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[buildUserDetails(context)],
          ),
        ),
      ),
    );
  }

  Widget buildUserDetails(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, top: 30),
      child: NeuCard(
        height: SizeExtension(context).dynamicHeight(0.85),
        curveType: CurveType.flat,
        bevel: 16,
        decoration: NeumorphicDecoration(borderRadius: BorderRadius.circular(32), color: Colors.grey.shade100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            topTitle(context),
            SizedBox(
              height: SizeExtension(context).dynamicHeight(0.02),
            ),
            middleWidgets(context),
            SizedBox(
              height: SizeExtension(context).dynamicHeight(0.03),
            ),
            NeuCard(
              width: SizeExtension(context).dynamicWidth(0.8),
              height: SizeExtension(context).dynamicHeight(0.34),
              curveType: CurveType.flat,
              bevel: 8,
              decoration: NeumorphicDecoration(borderRadius: BorderRadius.circular(16), color: Colors.grey.shade100),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      'assets/icons/ticket.svg',
                      height: 40,
                      width: 40,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    bottomMiddleElements(),
                    SizedBox(
                      height: 30,
                    ),
                    bottomBuyElements(context),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row bottomBuyElements(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Total: ₺ ${ticketCount * 30}',
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 24),
        ),
        InkWell(
          child: NeuCard(
            width: SizeExtension(context).dynamicWidth(0.2),
            height: SizeExtension(context).dynamicWidth(0.08),
            curveType: CurveType.emboss,
            bevel: 8,
            decoration: NeumorphicDecoration(borderRadius: BorderRadius.circular(16), color: Colors.greenAccent),
            child: Center(
              heightFactor: 1,
              child: Text(
                'Buy',
                style: TextStyle(fontWeight: FontWeight.w800, fontSize: 24),
              ),
            ),
          ),
          onTap: () {
            print('buy');
          },
        ),
      ],
    );
  }

  Row bottomMiddleElements() {
    return Row(
      children: [
        SizedBox(
          width: 30,
        ),
        Flexible(
          child: Text(
            'By using tickets you can attend different variety of lectures and presentations while helping others because more than %90 of the income goes to helpless people.',
            overflow: TextOverflow.clip,
            maxLines: 25,
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w900, fontSize: 14.0),
          ),
        ),
        SizedBox(
          width: 30,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              child: NeuCard(
                curveType: CurveType.flat,
                bevel: 8,
                decoration: NeumorphicDecoration(borderRadius: BorderRadius.circular(64), color: Colors.grey.shade200),
                child: Icon(Icons.add),
              ),
              onTap: () {
                setState(() {
                  ticketCount++;
                });
              },
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              '$ticketCount',
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 24),
            ),
            SizedBox(
              height: 5,
            ),
            InkWell(
              child: NeuCard(
                curveType: CurveType.flat,
                bevel: 8,
                decoration: NeumorphicDecoration(borderRadius: BorderRadius.circular(64), color: Colors.grey.shade200),
                child: Icon(Icons.remove),
              ),
              onTap: () {
                setState(() {
                  ticketCount > 0 ? ticketCount-- : ticketCount = 0;
                });
              },
            ),
          ],
        ),
      ],
    );
  }

  Row middleWidgets(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        leftTop(context),
        rightTop(context),
      ],
    );
  }

  Column rightTop(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            Text(
              'Cihat İ. Dede',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24),
            ),
            SizedBox(
              height: SizeExtension(context).dynamicHeight(0.02),
            ),
            NeuCard(
              width: SizeExtension(context).dynamicWidth(0.4),
              height: SizeExtension(context).dynamicHeight(0.3),
              curveType: CurveType.flat,
              bevel: 8,
              decoration: NeumorphicDecoration(borderRadius: BorderRadius.circular(16), color: Colors.grey.shade100),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Afforded',
                      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                    ),
                    Text(
                      '14',
                      style: TextStyle(fontWeight: FontWeight.w800, fontSize: 24),
                    ),
                    Text(
                      "people's daily expenses",
                      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                    ),
                    SizedBox(
                      height: SizeExtension(context).dynamicHeight(0.02),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SvgPicture.asset(
                          'assets/icons/badge.svg',
                          height: 48,
                          width: 48,
                        ),
                        SvgPicture.asset(
                          'assets/icons/social-care.svg',
                          height: 48,
                          width: 48,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Column leftTop(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        NeuCard(
          curveType: CurveType.convex,
          bevel: 8,
          decoration: NeumorphicDecoration(borderRadius: BorderRadius.circular(64), color: Colors.grey.shade400),
          child: CircleAvatar(
            radius: 60,
            backgroundColor: Colors.white,
            backgroundImage: NetworkImage('https://pbs.twimg.com/profile_images/1334383913788203008/ePY4Pua-_400x400.jpg'),
          ),
        ),
        SizedBox(
          height: SizeExtension(context).dynamicHeight(0.05),
        ),
        NeuCard(
          width: SizeExtension(context).dynamicWidth(0.3),
          height: SizeExtension(context).dynamicHeight(0.07),
          curveType: CurveType.flat,
          bevel: 8,
          decoration: NeumorphicDecoration(borderRadius: BorderRadius.circular(16), color: Colors.grey.shade100),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SvgPicture.asset(
                    'assets/icons/ticket.svg',
                    height: 24,
                    width: 24,
                  ),
                  Text(
                    'Current: 2',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'Total Spent: 18',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Padding topTitle(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: NeuCard(
        width: SizeExtension(context).dynamicWidth(0.8),
        height: SizeExtension(context).dynamicHeight(0.06),
        curveType: CurveType.flat,
        bevel: 4,
        decoration: NeumorphicDecoration(borderRadius: BorderRadius.circular(16), color: Colors.grey.shade100),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'My Profile',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
