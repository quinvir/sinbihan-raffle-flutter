class Winner {
  final int number;
  final String prize;
  final String type;
  final String createdAt;
  final String dong;
  final String ho;

  Winner({
    required this.number,
    required this.prize,
    required this.type,
    required this.createdAt,
    required this.dong,
    required this.ho,
  });

  factory Winner.fromJson(Map<String, dynamic> json) {
    final meta = json['meta'] as Map<String, dynamic>;
    return Winner(
      number: json['number'],
      prize: json['prize'],
      type: json['type'],
      createdAt: json['createdAt'],
      dong: meta['value0'],
      ho: meta['value1'],
    );
  }
}