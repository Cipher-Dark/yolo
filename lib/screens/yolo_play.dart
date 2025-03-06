import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'package:yolo/provider/yolo_provider.dart';
import 'package:yolo/widgets/custom_button.dart';

class YoloPlay extends StatefulWidget {
  const YoloPlay({super.key});

  @override
  State<YoloPlay> createState() => _YoloPlayState();
}

class _YoloPlayState extends State<YoloPlay> {
  bool _isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFF0D0D0D),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "select payment mode",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                "choose your preferred payment method to make payment.",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 20),
              Row(
                spacing: 20,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _isSelected = !_isSelected;
                      });
                    },
                    child: CustomButton(
                      title: "pay",
                      isSelected: !_isSelected,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _isSelected = !_isSelected;
                      });
                    },
                    child: CustomButton(
                      title: "card",
                      isSelected: _isSelected,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              !_isSelected ? DebitCard() : Container(),
            ],
          ),
        ),
      ),
    );
  }
}

class DebitCard extends StatefulWidget {
  const DebitCard({super.key});

  @override
  State<DebitCard> createState() => _DebitCardState();
}

class _DebitCardState extends State<DebitCard> {
  @override
  Widget build(BuildContext context) {
    return Consumer<YoloProvider>(
      builder: (provider, value, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 20,
          children: [
            Text(
              "YOUR DIGITAL DEBIT CARD",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                value.getHideCard
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(0),
                        child: Image.asset(
                          "assets/freez.png",
                          fit: BoxFit.fill,
                        ),
                      ).animate().blur()
                    : Container(
                        padding: EdgeInsets.all(10),
                        height: 296,
                        width: 186,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.white.withValues(alpha: .2),
                              spreadRadius: 1.5,
                              blurRadius: 5,
                            ),
                          ],
                          color: Colors.black,
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Image.asset("assets/yolo.png"),
                                Image.asset("assets/yesbank.png"),
                              ],
                            ),
                            SizedBox(height: 40),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      "6463\n8272\n7272\n7272",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    RichText(
                                      textAlign: TextAlign.center,
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text: "expiry\n",
                                            style: TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.grey,
                                            ),
                                          ),
                                          TextSpan(
                                            text: "01/28",
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 20),
                                    Row(
                                      children: [
                                        Column(
                                          children: [
                                            Text(
                                              "cvv",
                                              style: TextStyle(
                                                fontSize: 10,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.grey,
                                              ),
                                            ),
                                            value.getHideCvv
                                                ? Image.asset("assets/hide.png")
                                                : Text(
                                                    "123",
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight: FontWeight.w400,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                          ],
                                        ),
                                        SizedBox(width: 20),
                                        GestureDetector(
                                          onTap: () {
                                            value.setHideCvv();
                                          },
                                          child: Icon(
                                            value.getHideCvv ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                                            color: Color(0XFFA90808),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 20),
                            Row(
                              children: [
                                Icon(Icons.file_copy_outlined, color: Color(0XFFA90808)),
                                SizedBox(width: 5),
                                Text(
                                  "copy details",
                                  style: TextStyle(
                                    color: Color(0XFFA90808),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 40),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Image.asset("assets/rupee.png"),
                              ],
                            ),
                          ],
                        ),
                      ).animate().scale(),
                Container(
                  height: 296,
                  width: 130,
                  alignment: Alignment.center,
                  child: GestureDetector(
                    onTap: () {
                      value.setHideCard();
                    },
                    child: Column(
                      spacing: 20,
                      children: [
                        SizedBox(height: 296 / 5),
                        Image.asset(
                          "assets/ice.png",
                          color: value.getHideCard ? Color(0XFFA90808) : Colors.white,
                        ),
                        Text(
                          "freeze",
                          style: TextStyle(
                            color: value.getHideCard ? Color(0XFFA90808) : Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        );
      },
    );
  }
}
