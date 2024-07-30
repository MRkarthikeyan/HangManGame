import 'package:flutter/material.dart';
import 'package:flutter_application_1/figure_imag.dart';
import 'package:flutter_application_1/game.dart';
import 'package:flutter_application_1/keyword.dart';

class MainScreen extends StatefulWidget {
 MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    String word = Game.word;
    String clue = Game.clues;
    
   // print('word');
    List<String> alphabets =[
 "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"
 ];
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 72, 72, 72) ,
     appBar: AppBar(
      backgroundColor: Color.fromARGB(255, 21, 22, 24),
      title: Center(
        child: Text('HangMan',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 34
        ),
        ),
      ),
     ),
   body:
    Game.tries==8? Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Gamer Over!',style: TextStyle(fontSize: 55,fontWeight: FontWeight.bold),),
              Text('you killed him',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
          Image.asset('asset/jump-hanging.gif',
          height: 300,
          width: 300,
          ),
          SizedBox(
            height: 50,
            width: 200,
            child: ElevatedButton(onPressed: (){
              Color.fromARGB(0, 120, 85, 110);
              setState(() {
                Game.tries=0;
                Game.selectedcharacters.clear();
              });
            }, 
            child:
            Center(
              child: 
              Text('Wanted to try again bastard!!!',
              style: 
              TextStyle(fontWeight: FontWeight.bold,
              color: Colors.black
              ),
              ),
            )
            ),
          )
          
            ],
          )
        ],
      ),
    ) 
    :Column(
     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(clue,style:TextStyle(fontWeight: FontWeight.bold,fontSize: 24) ),
        Stack(
          children: [
            FigureImg(Game.tries>=0, 'asset/hang.png'),
            FigureImg(Game.tries>=1, 'asset/head.png'),
            FigureImg(Game.tries>=2, 'asset/body (1).png'),
            FigureImg(Game.tries>=3, 'asset/la.png'),
            FigureImg(Game.tries>=4, 'asset/ra.png'),
            FigureImg(Game.tries>=6, 'asset/rl.png'),
            FigureImg(Game.tries>=7, 'asset/ll.png'),
          ],
        ),
        Row(
         mainAxisAlignment: MainAxisAlignment.center,
          children:
            word.split(''). map((e) => 
            Expanded(
              child: letter(
                e.toUpperCase(),
                !Game.selectedcharacters.contains(e.toUpperCase())),
            ))
            .toList(),
            
        ),
        SizedBox(width: double.infinity,
        child: GridView.count(
          shrinkWrap: true,
          crossAxisCount:9,
       mainAxisSpacing: 4,
       crossAxisSpacing: 4,
       padding: EdgeInsets.all(10),
       children: alphabets.map((e) {
        return RawMaterialButton(
          onPressed: (){  
            Game.selectedcharacters.contains(e) ? null : 
              setState(() {
                Game.selectedcharacters.add(e);
                print(Game.selectedcharacters);
                print(word.split(''));
                if (!word.toLowerCase().split('').contains(e.toLowerCase())) {
                  Game.tries++;
                }
              
            });
           
           
        },
        shape: RoundedRectangleBorder(
          borderRadius:  BorderRadius.circular(4),
        ) ,
        child: Text(e,
        style: TextStyle(
          color: Colors.white
        ),
        ),
        fillColor: Game.selectedcharacters.contains(e)?Colors.black87:const Color.fromARGB(255, 74, 56, 31),
        );
       }
       ).toList(),
       ),
        ),
       ],
    ),
    );
  }
}