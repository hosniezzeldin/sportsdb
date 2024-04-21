import 'package:equatable/equatable.dart';

final class League extends Equatable {
  const League({required this.name});

  final String name;

  @override
  List<Object> get props => [name];

  factory League.fromMap(Map<String, dynamic> map) {
    return League(name: map['strLeague'] as String);
  }
}
