import 'dart:math';
import 'package:dart_random_choice/dart_random_choice.dart';

class Game{
  static int tries = 0;
  static List<String> selectedcharacters = [];
  static Map<String,String>wordclue = {
    "animal" : "Dog",
    "Nolan" : "interstellar",
    "Boys" : "homelander",
    "I will let the lazy people to do all the tough tsk" : "steve jobs",
    "Planet name in Avatar movie":"pandora"
   };
  static var choice = randomChoice(wordclue.entries);
  static String word = choice.value; 
  static String clues = choice.key;
}



