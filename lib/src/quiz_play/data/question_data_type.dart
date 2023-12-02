// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class QuestionDataType {
  final int id;
  final String question;
  final List<String> options;
  final String answer;
  final String br;
  final int level;
  QuestionDataType({
    required this.id,
    required this.question,
    required this.options,
    required this.answer,
    required this.br,
    required this.level,
  });

  QuestionDataType copyWith({
    int? id,
    String? question,
    List<String>? options,
    String? answer,
    String? br,
    int? level,
  }) {
    return QuestionDataType(
      id: id ?? this.id,
      question: question ?? this.question,
      options: options ?? this.options,
      answer: answer ?? this.answer,
      br: br ?? this.br,
      level: level ?? this.level,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'question': question,
      'options': options,
      'answer': answer,
      'br': br,
      'level': level,
    };
  }

  factory QuestionDataType.fromMap(Map<String, dynamic> map) {
    return QuestionDataType(
      id: map['id'] as int,
      question: map['question'] as String,
      options: List<String>.from((map['options'] as List<String>)),
      answer: map['answer'] as String,
      br: map['br'] as String,
      level: map['level'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory QuestionDataType.fromJson(String source) =>
      QuestionDataType.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'QuestionDataType(id: $id, question: $question, options: $options, answer: $answer, br: $br, level: $level)';
  }

  @override
  bool operator ==(covariant QuestionDataType other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.question == question &&
        listEquals(other.options, options) &&
        other.answer == answer &&
        other.br == br &&
        other.level == level;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        question.hashCode ^
        options.hashCode ^
        answer.hashCode ^
        br.hashCode ^
        level.hashCode;
  }
}
