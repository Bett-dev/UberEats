import 'package:flutter/material.dart';
import 'package:urban_eats/constants/const.dart';
import 'package:urban_eats/models/onboad_model.dart';
import 'package:animate_do/animate_do.dart';
import 'package:urban_eats/pages/homepage.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBlack,
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          PageView.builder(
            onPageChanged: (value) {
              setState(() {
                currentIndex = value;
              });
            },
            itemCount: onboards.length,
            itemBuilder: (context, index) {
              return Stack(
                children: [
                  Positioned(
                    top: -70,
                    left: 0,
                    right: 0,
                    child: FadeInDown(
                      delay: Duration(microseconds: 500),
                      child: Image.asset(
                        onboards[index].image,
                        width: 600,
                        height: 600,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height / 1.9,
                    child: FadeInUp(
                      delay: Duration(microseconds: 500),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              onboards[index].text1,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 50,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              onboards[index].text2,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
          Positioned(
            bottom: 170,
            left: 25,
            child: FadeInUp(
              delay: Duration(microseconds: 500),
              child: Row(
                children: [
                  ...List.generate(
                    onboards.length,
                    (index) => AnimatedContainer(
                      duration: Duration(milliseconds: 250),
                      height: 5,
                      width: 50,
                      margin: EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                        color:
                            currentIndex == index
                                ? Colors.white
                                : Colors.white30,
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 30,
            child: FadeInUp(
              delay: Duration(microseconds: 500),
              child: SizedBox(
                height: 75,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Homepage()),
                      );
                    },
                    color: kOrange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    minWidth: MediaQuery.of(context).size.width - 70,
                    child: Center(
                      child: Text(
                        'Get Started',
                        style: TextStyle(color: Colors.white, fontSize: 24),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
