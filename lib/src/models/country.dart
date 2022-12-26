class Country {
  final String name;
  final String code;
  final String phoneCode;
  final String flag;
  final String mask;

  Country({
    required this.name,
    required this.code,
    required this.phoneCode,
    required this.flag,
    required this.mask,
  });

  Country parseJson(Map<String, dynamic> json) {
    return Country(
      name: json['name'],
      code: json['code'],
      phoneCode: json['phoneCode'],
      flag: json['flag'],
      mask: json['mask'],
    );
  }
}
