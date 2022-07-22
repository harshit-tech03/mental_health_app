import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;

  final Function resetHandler;

  Result(this.resultScore, this.resetHandler);

  String get resultPhrase {
    var resultText = 'You did it!';
    if(resultScore <=9 ){
      resultText = 'You had an impressive day. Keep spreading positive vibes!';
    }
    else if (resultScore <= 16){
      resultText = 'You had a good day. You had achieved it.';
    }
    else if( resultScore <= 23){
      resultText = 'Don\'t be hard on yourself. Tomorrow will be great';
    }
    else{
      resultText = 'You had a hard day. Tomorrow will be good.';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child : Column(
        children: [
          Padding(

            padding: EdgeInsets.all(40.0),
            child:
              Text(
                resultPhrase,
                style: TextStyle(fontSize: 36,fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
          ),
          FlatButton(
            color: Colors.black,
            onPressed: resetHandler,
            textColor: Colors.white,
            autofocus: true,
            clipBehavior: Clip.hardEdge,
            hoverColor: Colors.white,
            height:  50.0,
            highlightColor: Colors.red,
            mouseCursor: MouseCursor.defer,
            shape: const Border.symmetric(),
            child: const Text(
                'Restart Quiz',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            ),
        ],
      ),
  );
  }
}
