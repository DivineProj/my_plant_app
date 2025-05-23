class Plante {
  final int id;
  final String nomScientifique;
  final String nomFrancais;
  final String? nomFon;
  final String? nomMinan;
  final String categorie;
  final String? photo;
  final String? description;

  Plante({
    required this.id,
    required this.nomScientifique,
    required this.nomFrancais,
    this.nomFon,
    this.nomMinan,
    required this.categorie,
    this.photo,
    this.description,
  });

  factory Plante.fromJson(Map<String, dynamic> json) {
    return Plante(
      id: json['id'],
      nomScientifique: json['nom_scientifique'],
      nomFrancais: json['nom_francais'],
      nomFon: json['nom_fon'],
      nomMinan: json['nom_minan'],
      categorie: json['categorie'],
      photo: json['photo'],
      description: json['description'],
    );
  }

  
}
