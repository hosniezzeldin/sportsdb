import 'package:equatable/equatable.dart';

final class Team extends Equatable {
  const Team({required this.name});

  final String name;

  @override
  List<Object> get props => [name];

  factory Team.fromMap(Map<String, dynamic> map) {
    return Team(name: map['strTeam'] as String);
  }
}
