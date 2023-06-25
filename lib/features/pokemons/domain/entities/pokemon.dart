import 'package:equatable/equatable.dart';

class Pokemon extends Equatable {
  final String name;
  final String url;

  const Pokemon({
    required this.name,
    required this.url,
  });

  String get imageUrl {
    final id = url.toString().split('/').reversed.elementAt(1);
    return 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$id.png';
  }

  @override
  List<Object?> get props => [name, url];
}
