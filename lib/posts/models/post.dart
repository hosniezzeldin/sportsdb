import 'package:equatable/equatable.dart';

final class Country extends Equatable {
  const Country({ required this.name});

  final String name;

  @override
  List<Object> get props => [name];

  factory Country.fromMap(Map<String,dynamic> map) {

    return Country(name: map['name_en'] as String);
  }
}
