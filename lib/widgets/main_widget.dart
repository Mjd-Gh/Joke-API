import 'package:flutter/material.dart';
import 'package:jokes_api/service/jokes_api.dart';

class MainWidget extends StatefulWidget {
  const MainWidget({super.key});

  @override
  State<MainWidget> createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FutureBuilder(
              future: JokeService().getJoke(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return Padding(
                    padding:
                        const EdgeInsets.only(left: 40.0, right: 40, top: 50),
                    child: Center(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 15),
                        height: MediaQuery.of(context).size.height * 0.3,
                        width: MediaQuery.of(context).size.width - 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color.fromARGB(255, 207, 236, 250),
                        ),
                        child: SingleChildScrollView(
                          child: Text(
                            snapshot.data!,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return const Center(
                      child: CircularProgressIndicator(
                    color: Colors.amber,
                  ));
                } else {
                  return const Text("Somthing went wrong");
                }
              },
            ),
            const SizedBox(
              height: 20,
            ),
            IconButton(
              onPressed: () {
                setState(() {});
              },
              icon: const CircleAvatar(
                backgroundColor: Colors.amber,
                radius: 100,
                child: Icon(
                  Icons.refresh,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
