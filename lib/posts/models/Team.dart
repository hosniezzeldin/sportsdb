import 'package:equatable/equatable.dart';

final class Team extends Equatable {
  const Team({required this.name, this.badge, this.desc});

  final String name;
  final String? badge;
  final String? desc;

  @override
  List<Object> get props => [name];

  factory Team.fromMap(Map<String, dynamic> map) {
    return Team(
        name: map['strTeam'] as String,
        badge: map['strTeamBadge'] as String?,
        desc: map['strDescriptionEN'] as String?);
  }
}
