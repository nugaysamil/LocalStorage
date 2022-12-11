import 'package:flutter/foundation.dart';

enum Cinsiyet {
  // ignore: constant_identifier_names
  KADIN,
  // ignore: constant_identifier_names
  ERKEK,
  // ignore: constant_identifier_names
  DIGER
}

enum Renkler {
  // ignore: constant_identifier_names
  KIRMIZI,
  // ignore: constant_identifier_names
  SARI,
  // ignore: constant_identifier_names
  MAVI,
  // ignore: constant_identifier_names
  PEMBE,
  // ignore: constant_identifier_names
  YESIL,
}

class UserInformation {
  final String isim;
  final Cinsiyet cinsiyet;
  final List<String> renkler;
  final bool ogrenciMi;

  UserInformation(this.isim, this.cinsiyet, this.renkler, this.ogrenciMi);

  Map<String, dynamic> toJson() {
    return {
      'isim': isim,
      'cinsiyet': describeEnum(cinsiyet),
      'renkler': renkler,
      'ogrenciMi': ogrenciMi
    };
  }

  UserInformation.fromJson(Map<String, dynamic> json)
      : isim = json['isim'],
        cinsiyet = Cinsiyet.values
            .firstWhere((element) => describeEnum(element).toString() == json['cinsiyet']),
        renkler = List<String>.from(json['renkler']),
        ogrenciMi = json['ogrenciMi'];
}
