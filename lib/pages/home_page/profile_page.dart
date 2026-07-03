import 'package:flutter/material.dart';
import 'package:malina/themes/themData.dart' show AppColors;

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Профиль',
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: AppColors.backround1,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 75.0,

              backgroundColor: AppColors.textcolor1,
            ),
            const Text(
              'A.Nurtilek',
              style: TextStyle(
                fontSize: 40.0,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              'Flutter Developer',
              style: TextStyle(fontSize: 20.0, color: AppColors.textcolor1),
            ),
            const SizedBox(
              height: 15.0,
              width: 250.0,
              child: Divider(color: Colors.amber),
            ),
            const SizedBox(height: 20.0),
            MaterialButton(
              onPressed: () {},
              child: Container(
                margin: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 5.0),
                decoration: BoxDecoration(
                  color: Colors.teal.shade300,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListTile(
                  leading: const Icon(Icons.home_outlined, color: Colors.white),
                  title: Text(
                    'Bishkek,Kyrgyyzstan',
                    style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.normal,
                      color: Colors.grey.shade200,
                    ),
                  ),
                ),
              ),
            ),
            MaterialButton(
              highlightColor: Colors.black12,
              onPressed: () {},
              child: Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 5.0,
                  horizontal: 20.0,
                ),
                decoration: BoxDecoration(
                  color: Colors.teal.shade300,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListTile(
                  leading: const Icon(
                    Icons.email_outlined,
                    color: Colors.white,
                  ),
                  title: Text(
                    'nurtilekabdulahatov@gmail.com',
                    style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.normal,
                      color: Colors.grey.shade200,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
