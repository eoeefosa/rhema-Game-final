import 'package:flutter/material.dart';

class LevelBook extends ChangeNotifier {
  static const leveltitles = [
    'Genesis',
    'Exodus',
    'Leviticus',
    'Numbers',
    'Deuteronomy',
    'Joshua',
    'Judges',
    'Ruth',
    '1 Samuel',
    '2 Samuel',
    '1 Kings',
    '2 Kings',
    '1 Chronicles',
    '2 Chronicles',
    'Ezra',
    'Nehemiah',
    'Esther',
    'Job',
    'Psalms',
    'Proverbs',
    'Ecclesiastes',
    'Song of Solomon',
    'Isaiah',
    'Jeremiah',
    'Lamentations',
    'Ezekiel',
    'Daniel',
    'Hosea',
    'Joel',
    'Amos',
    'Obadiah',
    'Jonah',
    'Micah',
    'Nahum',
    'Habakkuk',
    'Zephaniah',
    'Haggai',
    'Zechariah',
    'Malachi',
    'Matthew',
    'Mark',
    'Luke',
    'John',
    'Acts',
    'Romans',
    '1 Corinthians',
    '2 Corinthians',
    'Galatians',
    'Ephesians',
    'Philippians',
    'Colossians',
    '1 Thessalonians',
    '2 Thessalonians',
    '1 Timothy',
    '2 Timothy',
    'Titus',
    'Philemon',
    'Hebrews',
    'James',
    '1 Peter',
    '2 Peter',
    '1 John',
    '2 John',
    '3 John',
    'Jude',
    'Revelation',
  ];

  int get lastbook => leveltitles.length;
  int currentbook = 0;
  int get previousbook => currentbook - 1;
  int get nextbook => (currentbook + 1) % leveltitles.length;

  String get currentTitle => leveltitles[currentbook];
  String get nextTitle => leveltitles[nextbook];
  String get previousTitle => previousbook < 0 ? "" : leveltitles[previousbook];

  void getnextbook() {
    if ((currentbook + 1) < lastbook) {
      currentbook++;
    }
    notifyListeners();
  }

  bool get thereIspreviousbook => currentbook == 0 ? false : true;
  bool get thereIsnextBook => currentbook+1 == leveltitles.length ? false : true;

  void getpreviousbook() {
    if (currentbook > 0) {
      currentbook--;
    }
    notifyListeners();
  }
}
