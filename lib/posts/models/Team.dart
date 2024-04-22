import 'package:equatable/equatable.dart';

final class Team extends Equatable {
  const Team({required this.name, this.badge});

  final String name;
  final String? badge;

  @override
  List<Object> get props => [name];

  factory Team.fromMap(Map<String, dynamic> map) {
    return Team(
        name: map['strTeam'] as String, badge: map['strTeamBadge'] as String);
  }
}
