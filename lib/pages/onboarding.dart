import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:urban_eats/constants/const.dart';
import 'package:urban_eats/models/onboad_model.dart';
import 'package:animate_do/animate_do.dart';
import 'package:urban_eats/pages/main_page.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBlack,
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          PageView.builder(
            controller: _pageController,
            onPageChanged: (value) {
              setState(() => currentIndex = value);
            },
            itemCount: onboards.length,
            itemBuilder: (context, index) {
              return OnboardingPage(onboard: onboards[index]);
            },
          ),

          // Progress indicator
          Positioned(
            bottom: 170,
            left: 25,
            child: Row(
              children: List.generate(
                onboards.length,
                (index) => AnimatedContainer(
                  duration: Duration(milliseconds: 250),
                  height: 5,
                  width: currentIndex == index ? 50 : 30,
                  margin: EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                    color:
                        currentIndex == index ? Colors.white : Colors.white30,
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
          ),

          // Skip button
          Positioned(
            top: 50,
            right: 20,
            child: TextButton(
              onPressed: () => _goToHome(context),
              child: Text("Skip", style: TextStyle(color: Colors.white)),
            ),
          ),

          // Navigation button
          Positioned(
            bottom: 30,
            child: SizedBox(
              height: 75,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: MaterialButton(
                  onPressed: () {
                    if (currentIndex == onboards.length - 1) {
                      _goToHome(context);
                    } else {
                      _pageController.nextPage(
                        duration: Duration(milliseconds: 500),
                        curve: Curves.ease,
                      );
                    }
                  },
                  color: kOrange,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  minWidth: MediaQuery.of(context).size.width - 40,
                  child: Text(
                    currentIndex == onboards.length - 1
                        ? "Get Started"
                        : "Next",
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _goToHome(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    // await prefs.setBool('hasSeenOnboarding', true);

    if (context.mounted) {
      Navigator.of(
        context,
      ).pushReplacement(MaterialPageRoute(builder: (context) => MainPage()));
    }
  }
}

// Extracting a reusable widget for OnboardingPage
class OnboardingPage extends StatelessWidget {
  final Onboard onboard;
  const OnboardingPage({required this.onboard, super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: -70,
          left: 0,
          right: 0,
          child: FadeInDown(
            delay: Duration(microseconds: 500),
            child: Image.asset(
              onboard.image,
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
                    onboard.text1,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    onboard.text2,
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
