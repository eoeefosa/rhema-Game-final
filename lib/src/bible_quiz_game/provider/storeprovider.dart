class StoreProvider {
  final int addtimevalue;
  final int hint;
  final int adswatchvalue;
  final int clearwrongValaue;

  const StoreProvider({
    required this.addtimevalue,
    required this.hint,
    required this.adswatchvalue,
    required this.clearwrongValaue,
  });

  StoreProvider copyWith({
    int? addtimevalue,
    int? hint,
    int? adswatchvalue,
    int? clearwrongValaue,
  }) {
    return StoreProvider(
      addtimevalue: addtimevalue ?? this.addtimevalue,
      hint: hint ?? this.hint,
      adswatchvalue: adswatchvalue ?? this.adswatchvalue,
      clearwrongValaue: clearwrongValaue ?? this.clearwrongValaue,
    );
  }
}
