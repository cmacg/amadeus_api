class Gate {
  /// The main gate number
  final String mainGate;

  Gate({required this.mainGate});

  Gate.fromJson(Map<String, dynamic> json) : mainGate = json['mainGate'];
}
