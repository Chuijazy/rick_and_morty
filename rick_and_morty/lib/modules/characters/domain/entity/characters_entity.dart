class CharactersEntity {
  final int id;
  final String name;
  final String image;
  final String status;
  final String species;
  final String gender;
  final String? type;

  CharactersEntity({
    required this.id,
    required this.name,
    required this.image,
    required this.status,
    required this.species,
    required this.gender,
    this.type,
  });
}
