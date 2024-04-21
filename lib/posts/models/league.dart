import 'package:equatable/equatable.dart';

final class League extends Equatable {
  const League({required this.id, required this.name});

  final String name;
  final String id;

  @override
  List<Object> get props => [id, name];

  factory League.fromMap(Map<String, dynamic> map) {
    return League(
      name: map['strLeague'] as String,
      id: map['idLeague'] as String,
    );
  }
}
