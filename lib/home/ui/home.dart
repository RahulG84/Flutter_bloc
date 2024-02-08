import 'package:am_block_poc/home/bloc/home_bloc.dart';
import 'package:am_block_poc/profile/ui/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/counter_data.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    // TODO: implement initState
    homeBloc.add(HomeInitialEvent());
    super.initState();
  }

  HomeBloc homeBloc = HomeBloc();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
        bloc: homeBloc,
        listenWhen: (previous, current) => current is HomeActionState,
        buildWhen: (previous, current) => current is! HomeActionState,
        listener: (context, state) {
          if (state is HomeNavigateToProfilePageActionState) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Profile(),
              ),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.green,
              title: const Text('Simple Counter App With Bloc'),
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    controller: CounterData.name,
                    decoration: const InputDecoration(
                      hintText: 'Enter Name',
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5.00)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5.00)),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      homeBloc.add(SubmitButtonNavigateEvent());
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(400, 60),
                      backgroundColor: Colors.blue,
                    ),
                    child: const Text(
                      'Enter',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    CounterData.count.toString(),
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            homeBloc.add(DecreaseButtonClickEvent());
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(100, 40),
                          backgroundColor: Colors.blue,
                        ),
                        child: const Text(
                          '-',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            homeBloc.add(IncreaseButtonClickEvent());
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(100, 40),
                          backgroundColor: Colors.blue,
                        ),
                        child: const Text(
                          '+',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }
}
