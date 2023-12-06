import 'package:flutter/material.dart';

/// Abstract base class for text animations.
abstract class AnimateddText {
  /// Return the remaining Duration for the Animation (when applicable).
  Duration? get remaining;

  /// Initialize the Animation.
  void initAnimation(AnimationController controller);

  /// Utility method to create a styled [Text] widget using the [textAlign] and
  /// [textStyle], but you can specify the [data].
  Widget textWidget(String data);

  /// Widget showing the complete text (when animation is complete or paused).
  /// By default, it shows a Text widget, but this may be overridden.
  Widget completeText(BuildContext context);

  /// Widget showing animated text, based on animation value(s).
  Widget animatedBuilder(BuildContext context, Widget? child);

  AnimateddText({
    required this.text,
    this.textAlign = TextAlign.start,
    this.textStyle,
    required this.duration,
  }) : textCharacters = text.characters;

  /// Text for [Text] widget.
  final String text;

  /// [TextAlign] property for [Text] widget.
  ///
  /// By default it is set to [TextAlign.start]
  final TextAlign textAlign;

  /// [TextStyle] property for [Text] widget.
  final TextStyle? textStyle;

  /// The Duration for the Animation Controller.
  ///
  /// This will set the total duration for the animated widget.
  /// For example, if you want the text animation to take 3 seconds,
  /// then you have to set [duration] to 3 seconds.
  final Duration duration;

  /// Same as [text] but as [Characters].
  ///
  /// Need to use character length, not String length, to propertly support
  /// Unicode and Emojis.
  final Characters textCharacters;
}

class TyperAnimatedText extends AnimateddText {
  TyperAnimatedText(
    String text, {
    TextAlign textAlign = TextAlign.start,
    TextStyle? textStyle,
    this.speed = const Duration(milliseconds: 40),
    this.curve = Curves.linear,
  }) : super(
          text: text,
          textAlign: textAlign,
          textStyle: textStyle,
          duration: speed * text.characters.length,
        );

  /// The [Duration] of the delay between the apparition of each characters
  ///
  /// By default it is set to 40 milliseconds.
  final Duration speed;

  /// The [Curve] of the rate of change of animation over time.
  ///
  /// By default it is set to Curves.line
  final Curve curve;

  late Animation<double> _typingText;

/// Widget showing animated text, based on animation value(s).
  @override
  Widget animatedBuilder(BuildContext context, Widget? child) {
    /// Output of CurveTween is in the range [0, 1] for majority of the curves.
    /// It is converted to [0, textCharacters.length].
    final count =
        (_typingText.value.clamp(0, 1) * textCharacters.length).round();
    assert(count <= textCharacters.length);
    return textWidget(textCharacters.take(count).toString());
  }

 /// Widget showing the complete text (when animation is complete or paused).
  /// By default, it shows a Text widget, but this may be overridden.
  @override
  Widget completeText(BuildContext context) {
    return textWidget(text);
  }

  @override
  void initAnimation(AnimationController controller) {
    _typingText = CurveTween(curve: curve).animate(controller);
  }

  @override
  Duration? get remaining =>
      speed * (textCharacters.length - _typingText.value);

  @override
  Widget textWidget(String data) {
    return Text(
      data,
      textAlign: textAlign,
      style: textStyle,
    );
  }
}
