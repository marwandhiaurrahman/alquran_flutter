import 'dart:convert';

class Ayat {
  Ayat({
    required this.nomor,
    required this.nama,
    required this.namaLatin,
    required this.jumlahAyat,
    required this.tempatTurun,
    required this.arti,
    required this.deskripsi,
    required this.audio,
    required this.status,
    required this.ayat,
  });

  int nomor;
  String nama;
  String namaLatin;
  int jumlahAyat;
  String tempatTurun;
  String arti;
  String deskripsi;
  String audio;
  bool status;
  List<AyatElement> ayat;

  factory Ayat.fromRawJson(String str) => Ayat.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Ayat.fromJson(Map<String, dynamic> json) => Ayat(
        nomor: json["nomor"],
        nama: json["nama"],
        namaLatin: json["nama_latin"],
        jumlahAyat: json["jumlah_ayat"],
        tempatTurun: json["tempat_turun"],
        arti: json["arti"],
        deskripsi: json["deskripsi"],
        audio: json["audio"],
        status: json["status"],
        ayat: List<AyatElement>.from(
            json["ayat"].map((x) => AyatElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "nomor": nomor,
        "nama": nama,
        "nama_latin": namaLatin,
        "jumlah_ayat": jumlahAyat,
        "tempat_turun": tempatTurun,
        "arti": arti,
        "deskripsi": deskripsi,
        "audio": audio,
        "status": status,
        "ayat": List<dynamic>.from(ayat.map((x) => x.toJson())),
      };
}

class AyatElement {
  AyatElement({
    required this.id,
    required this.surah,
    required this.nomor,
    required this.ar,
    required this.tr,
    required this.idn,
  });

  int id;
  int surah;
  int nomor;
  String ar;
  String tr;
  String idn;

  factory AyatElement.fromRawJson(String str) =>
      AyatElement.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AyatElement.fromJson(Map<String, dynamic> json) => AyatElement(
        id: json["id"],
        surah: json["surah"],
        nomor: json["nomor"],
        ar: json["ar"],
        tr: json["tr"],
        idn: json["idn"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "surah": surah,
        "nomor": nomor,
        "ar": ar,
        "tr": tr,
        "idn": idn,
      };
}

class SuratSenya {
  SuratSenya({
    required this.id,
    required this.nomor,
    required this.nama,
    required this.namaLatin,
    required this.jumlahAyat,
    required this.tempatTurun,
    required this.arti,
    required this.deskripsi,
    required this.audio,
  });

  int id;
  int nomor;
  String nama;
  String namaLatin;
  int jumlahAyat;
  String tempatTurun;
  String arti;
  String deskripsi;
  String audio;

  factory SuratSenya.fromRawJson(String str) =>
      SuratSenya.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SuratSenya.fromJson(Map<String, dynamic> json) => SuratSenya(
        id: json["id"],
        nomor: json["nomor"],
        nama: json["nama"],
        namaLatin: json["nama_latin"],
        jumlahAyat: json["jumlah_ayat"],
        tempatTurun: json["tempat_turun"],
        arti: json["arti"],
        deskripsi: json["deskripsi"],
        audio: json["audio"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nomor": nomor,
        "nama": nama,
        "nama_latin": namaLatin,
        "jumlah_ayat": jumlahAyat,
        "tempat_turun": tempatTurun,
        "arti": arti,
        "deskripsi": deskripsi,
        "audio": audio,
      };
}
