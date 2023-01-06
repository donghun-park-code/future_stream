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
        child: FutureBuilder(
          // FutureBuilder가 자동으로 업데이트해줌(setstate가 없어도)
          future: getNumber(),
          builder: (context, snapshot){
            if(snapshot.hasData){
              // 데이터가 있을때 위젯 렌더링
            }
            if(snapshot.hasError){
              // 에러가 났을때 위젯 렌더링
            }
            // 로딩중일때 위젯 렌더링
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'FutureBuilder',
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
}
