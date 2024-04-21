import 'package:equatable/equatable.dart';

final class Season extends Equatable {
  const Season({required this.name});

  final String name;

  @override
  List<Object> get props => [name];

  factory Season.fromMap(Map<String, dynamic> map) {
    return Season(name: map['strSeason'] as String);
  }
}
