import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFC0A9FF),
        title: Text("Harry Potter App"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //Image
            Image.network(
              "https://static.wikia.nocookie.net/esharrypotter/images/8/8d/PromoHP7_Harry_Potter.jpg/revision/latest/scale-to-width-down/1000?cb=20160903184919",
            ),
            //Stars
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.star),
                    Icon(Icons.star),
                    Icon(Icons.star),
                    Icon(Icons.star_border),
                    Icon(Icons.star_border),
                  ],
                ),
                Text("89 reviews"),
              ],
            ),
            //Text
            Text(
              "Harry Potter",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Icon(Icons.fitness_center, size: 32),
                    Text("Força"),
                    Text("9"),
                  ],
                ),
                Column(
                  children: [
                    Icon(Icons.auto_fix_normal, size: 32),
                    Text("Màgia"),
                    Text("10"),
                  ],
                ),
                Column(
                  children: [
                    Icon(Icons.speed, size: 32),
                    Text("Força"),
                    Text("8"),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
