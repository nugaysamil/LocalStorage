import 'package:shared_preferences/shared_preferences.dart';
import 'package:storage/MODEL/my_models.dart';
import 'package:storage/MODEL/services/local_storage_service.dart';

class SharedPreferenceService implements LocalStorageService {
  late final SharedPreferences preferences;
  SharedPreferenceService() {
    init();
  }

  Future<void> init() async {
    preferences = await SharedPreferences.getInstance();
  }

  Future<UserInformation> verileriOku() async {
    final preferences = await SharedPreferences.getInstance();
    // ignore: no_leading_underscores_for_local_identifiers
    var _isim = preferences.getString('isim') ?? '';
    var _ogrenci = preferences.getBool('ogrenci') ?? false;
    preferences.getInt('cinsiyet');
    var _cinsiyet = Cinsiyet.values[preferences.getInt('_cinsiyet') ?? 0];
    var _renkler = preferences.getStringList('renkler') ?? <String>[];

    return UserInformation(_isim, _cinsiyet, _renkler, _ogrenci);
  }

  Future<void> verileriKaydet(UserInformation userInformation) async {
    final _name = userInformation.isim;

    preferences.setString('isim', _name);
    preferences.setBool('Ogrenci', userInformation.ogrenciMi);
    preferences.setInt('Cinsiyet', userInformation.cinsiyet.index);
    preferences.setStringList('renkler', userInformation.renkler);
  }
}
