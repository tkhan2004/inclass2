import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentIndex = 0;

  final List<Map<String, String>> onboardingData = [
    {
      'image': 'assets/images/anh4.png',
      'title': 'Easy Time Management',
      'desc':
          'With management based on priority and daily tasks, it will give you convenience in managing and determining the tasks that must be done first',
    },
    {
      'image': 'assets/images/anh2.png',
      'title': 'Increase Work Effectiveness',
      'desc':
          'Time management and the determination of more important tasks will give your job statistics better and always improve',
    },
    {
      'image': 'assets/images/bro.png',
      'title': 'Reminder Notification',
      'desc':
          'The advantage of this application is that it also provides reminders for you so you don’t forget to keep doing your assignments well and according to the time you have set',
    },
  ];

  void nextPage() {
    if (currentIndex < onboardingData.length - 1) {
      setState(() {
        currentIndex++;
      });
    } else {
      // Đến trang login/home sau khi "Get Started"
      // Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const HomeScreen()));
    }
  }

  void prevPage() {
    if (currentIndex > 0) {
      setState(() {
        currentIndex--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final data = onboardingData[currentIndex];

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          TextButton(
            onPressed: () {
              setState(() {
                currentIndex = onboardingData.length - 1;
              });
            },
            child: const Text("Skip", style: TextStyle(color: Colors.blue)),
          ),
        ],
      ),
      body: Column(
        children: [
          // Indicator
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              onboardingData.length,
              (index) => Container(
                margin: const EdgeInsets.all(4),
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: index == currentIndex ? Colors.blue : Colors.grey,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Image.asset(data['image']!, height: 250),
          const SizedBox(height: 20),
          Text(
            data['title']!,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              data['desc']!,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16),
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0), // Lề 2 bên
            child: Row(
              children: [
                if (currentIndex > 0)
                  Expanded(
                    child: ElevatedButton(
                      onPressed: prevPage,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.blue,
                        side: const BorderSide(color: Colors.blue),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: const Text(
                        'Back',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )
                else
                  const Expanded(child: SizedBox()), // Giữ layout đều

                const SizedBox(width: 20),

                Expanded(
                  child: ElevatedButton(
                    onPressed: nextPage,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text(
                      currentIndex == onboardingData.length - 1
                          ? 'Get Started'
                          : 'Next',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
