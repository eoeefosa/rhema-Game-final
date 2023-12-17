import 'dart:convert';
import 'dart:math';

import 'package:flutter/foundation.dart';

class Question {
  final int id;
  final String question;
  final List<String> options;
  final String answer;
  final String bibleReference;
  final int level;
  Question({
    required this.id,
    required this.question,
    required this.options,
    required this.answer,
    required this.bibleReference,
    required this.level,
  });

  Question clear50() {
    List<String> updatedOptions = List.from(options);

    // Get a list of indices of wrong options
    List<int> indicesOfWrongOptions = updatedOptions
        .asMap()
        .entries
        .where((entry) => entry.value != answer)
        .map((entry) => entry.key)
        .toList();

    // Ensure there are at least two wrong options to clear
    if (indicesOfWrongOptions.length >= 2) {
      // Shuffle the list of wrong options
      indicesOfWrongOptions.shuffle();

      // Leave the first wrong option and clear the rest
      for (int i = 0; i < indicesOfWrongOptions.length; i++) {
        if (i != 0) {
          updatedOptions[indicesOfWrongOptions[i]] = "";
        }
      }
    }

    return Question(
      id: id,
      question: question,
      options: updatedOptions,
      answer: answer,
      bibleReference: bibleReference,
      level: level,
    );
  }

  Question copyWith({
    int? id,
    String? question,
    List<String>? options,
    String? answer,
    String? bibleReference,
    int? level,
  }) {
    return Question(
      id: id ?? this.id,
      question: question ?? this.question,
      options: options ?? this.options,
      answer: answer ?? this.answer,
      bibleReference: bibleReference ?? this.bibleReference,
      level: level ?? this.level,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'question': question,
      'options': options,
      'answer': answer,
      'bibleReference': bibleReference,
      'level': level,
    };
  }

  factory Question.fromMap(Map<String, dynamic> map) {
    return Question(
      id: map['id'] as int,
      question: map['question'] as String,
      options: List<String>.from((map['options'] as List<String>)),
      answer: map['answer'] as String,
      bibleReference: map['BR'] as String,
      level: map['level'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Question.fromJson(String source) =>
      Question.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Question(id: $id, question: $question, options: $options, answer: $answer, bibleReference: $bibleReference, level: $level)';
  }

  @override
  bool operator ==(covariant Question other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.question == question &&
        listEquals(other.options, options) &&
        other.answer == answer &&
        other.bibleReference == bibleReference &&
        other.level == level;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        question.hashCode ^
        options.hashCode ^
        answer.hashCode ^
        bibleReference.hashCode ^
        level.hashCode;
  }
}
