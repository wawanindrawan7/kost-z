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
    required this.deskripsi,
    required this.thumbnail,
    required this.maps,
    required this.noHp,
    required this.rating,
    required this.fasilitas,
    required this.photo,
  });

  int id;
  String nama;
  String lokasi;
  String deskripsi;
  String thumbnail;
  String maps;
  String noHp;
  int rating;
  List<Fasilitas> fasilitas;
  List<Photo> photo;

  factory Kosan.fromJson(Map<String, dynamic> json) => Kosan(
        id: json["id"],
        nama: json["nama"],
        lokasi: json["lokasi"],
        deskripsi: json["deskripsi"],
        thumbnail: json["thumbnail"],
        maps: json["maps"],
        noHp: json["no_hp"],
        rating: json["rating"],
        fasilitas: List<Fasilitas>.from(
            json["fasilitas"].map((x) => Fasilitas.fromJson(x))),
        photo: List<Photo>.from(json["photo"].map((x) => Photo.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nama": nama,
        "lokasi": lokasi,
        "deskripsi": deskripsi,
        "thumbnail": thumbnail,
        "maps": maps,
        "no_hp": noHp,
        "rating": rating,
        "fasilitas": List<dynamic>.from(fasilitas.map((x) => x.toJson())),
        "photo": List<dynamic>.from(photo.map((x) => x.toJson())),
      };
}

class Fasilitas {
  Fasilitas({
    required this.id,
    required this.nama,
    required this.kosanId,
  });

  int id;
  String nama;
  int kosanId;

  factory Fasilitas.fromJson(Map<String, dynamic> json) => Fasilitas(
        id: json["id"],
        nama: json["nama"],
        kosanId: json["kosan_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nama": nama,
        "kosan_id": kosanId,
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
