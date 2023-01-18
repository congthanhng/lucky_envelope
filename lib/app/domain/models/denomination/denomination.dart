class Denomination {
  final String name;
  final int value;

  Denomination({required this.name, required this.value});

  factory Denomination.fromJson(Map<String, dynamic> json) =>
      Denomination(name: json['name'] as String, value: json['value'] as int);

  Map<String, dynamic> toJson() => <String, dynamic>{
        'name': name,
        'value': value,
      };

  Denomination copyWith({String? name, int? value}) =>
      Denomination(name: name ?? this.name, value: value ?? this.value);
}
