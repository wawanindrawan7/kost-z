import 'dart:convert';

KosanResult kosanResultFromJson(String str) =>
    KosanResult.fromJson(json.decode(str));

String kosanResultToJson(KosanResult data) => json.encode(data.toJson());

class KosanResult {
  KosanResult({
    required this.kosan,
  });

  List<Kosan> kosan;

  factory KosanResult.fromJson(Map<String, dynamic> json) => KosanResult(
        kosan: List<Kosan>.from(json["kosan"].map((x) => Kosan.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "kosan": List<dynamic>.from(kosan.map((x) => x.toJson())),
      };
}

class Kosan {
  Kosan({
    required this.id,
    required this.nama,
    required this.lokasi,
    required this.fasilitas,
    required this.deskripsi,
    required this.thumbnail,
    required this.maps,
    required this.noHp,
    required this.rating,
    required this.photo,
  });

  int id;
  String nama;
  String lokasi;
  String fasilitas;
  String deskripsi;
  String thumbnail;
  String maps;
  String noHp;
  int rating;
  List<Photo> photo;

  factory Kosan.fromJson(Map<String, dynamic> json) => Kosan(
        id: json["id"],
        nama: json["nama"],
        lokasi: json["lokasi"],
        fasilitas: json["fasilitas"],
        deskripsi: json["deskripsi"],
        thumbnail: json["thumbnail"],
        maps: json["maps"],
        noHp: json["no_hp"],
        rating: json["rating"],
        photo: List<Photo>.from(json["photo"].map((x) => Photo.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nama": nama,
        "lokasi": lokasi,
        "fasilitas": fasilitas,
        "deskripsi": deskripsi,
        "thumbnail": thumbnail,
        "maps": maps,
        "no_hp": noHp,
        "rating": rating,
        "photo": List<dynamic>.from(photo.map((x) => x.toJson())),
      };
}

class Photo {
  Photo({
    required this.id,
    required this.url,
    required this.kosanId,
  });

  int id;
  String url;
  int kosanId;

  factory Photo.fromJson(Map<String, dynamic> json) => Photo(
        id: json["id"],
        url: json["url"],
        kosanId: json["kosan_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "url": url,
        "kosan_id": kosanId,
      };
}
