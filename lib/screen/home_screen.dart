import 'dart:math';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final textstyle = TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w700,
    );
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: StreamBuilder<int>(
          // StreamBuilder는 stream을 닫는 것 까지 처리해준다
          stream: streamNumbers(),
          builder: (context, AsyncSnapshot<int> snapshot){

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'StreamBuilder',
                  style: textstyle,
                ),
                Text(
                  'ConState : ${snapshot.connectionState}',
                  style: textstyle,
                ),
                Text(
                  'Data : ${snapshot.data}',
                  style: textstyle,
                ),
                Text(
                  'Error : ${snapshot.error}',
                  style: textstyle,
                ),
                ElevatedButton(onPressed: (){
                  setState(() {

                  });
                }, child: Text(
                  'setState'
                ))
              ],
            );
          },
        ),
      ),
    );
  }

  Future<int> getNumber() async {
    await Future.delayed(Duration(seconds: 3));

    final random = Random();
    // throw Exception('에러가 발생했습니다.');
    return random.nextInt(100);
  }
  Stream<int> streamNumbers() async* {
    for(int i = 0; i < 10; i ++){
      await Future.delayed(Duration(seconds: 1));

      yield i;
    }
  }
}
