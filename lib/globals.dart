import 'package:flutter/cupertino.dart';

String baseUrl = 'http://refqtest.ultrawares.com/api/warshatkom';
String mainCategories = '/categories';
String subCategories = '/sub/';
String cities = '/cites';
String watermark = '';
// من أجل صفحة خدماتنا
List<Widget> iconList = [
  Image.asset('assets/gif/cladding.png',),
  Image.asset('assets/gif/contracts.png',),
  Image.asset('assets/gif/maintenance.png',),
];

List<ImgObj> imageList = [
  ImgObj(
    asset: 'assets/temp/electricity.jpg',
    fit: BoxFit.cover,
  ),
  ImgObj(
    asset: 'assets/temp/sanitary.png',
    fit: BoxFit.cover,
    //onClick: () {},
  ),
  ImgObj(
    asset: 'assets/temp/paint.jpg',
    fit: BoxFit.cover,
    //onClick: () {},
  ),
  ImgObj(
    asset: 'assets/temp/wood.jpg',
    fit: BoxFit.cover,
    //onClick: () {},
  ),
  ImgObj(
    asset: 'assets/temp/wall_paper.jpg',
    fit: BoxFit.cover,
    //onClick: () {},
  ),
  ImgObj(
    asset: 'assets/temp/floor.jpg',
    fit: BoxFit.cover,
    //onClick: () {},
  ),
  ImgObj(
    asset: 'assets/temp/gypsum_board.jpg',
    fit: BoxFit.cover,
    //onClick: () {},
  ),
  ImgObj(
    asset: 'assets/temp/blacksmith.jpg',
    fit: BoxFit.cover,
    //onClick: () {},
  ),
  ImgObj(
    asset: 'assets/temp/aluminium.jpg',
    fit: BoxFit.cover,
    //onClick: () {},
  ),
  ImgObj(
    asset: 'assets/temp/condition.jpg',
    fit: BoxFit.cover,
    //onClick: () {},
  ),
  ImgObj(
    asset: 'assets/temp/internet.jpg',
    fit: BoxFit.cover,
    //onClick: () {},
  ),
  ImgObj(
    asset: 'assets/temp/dish.jpg',
    fit: BoxFit.cover,
    //onClick: () {},
  ),
  ImgObj(
    asset: 'assets/temp/tractor.jpg',
    fit: BoxFit.cover,
    //onClick: () {},
  ),
  ImgObj(
    asset: 'assets/temp/clean.jpg',
    fit: BoxFit.cover,
    //onClick: () {},
  ),
  ImgObj(
    asset: 'assets/temp/move.jpg',
    fit: BoxFit.cover,
    //onClick: () {},
  ),
  ImgObj(
    asset: 'assets/temp/solar.jpg',
    fit: BoxFit.cover,
    //onClick: () {},
  ),
  ImgObj(
    asset: 'assets/logo/logo.png',
    fit: BoxFit.cover,
    //onClick: () {},
  ),
];

/*List<Country> countries = [
    const Country(
      name: "Syrian Arab Republic",
      nameTranslations: {
        "sk": "Sýria",
        "se": "Syria",
        "pl": "Syria",
        "no": "Syria",
        "ja": "シリア",
        "it": "Siria",
        "zh": "叙利亚",
        "nl": "Syrië",
        "de": "Syrien",
        "fr": "Syrie",
        "es": "Siria",
        "en": "Syria",
        "pt_BR": "Síria",
        "sr-Cyrl": "Сирија",
        "sr-Latn": "Sirija",
        "zh_TW": "敘利亞",
        "tr": "Suriye",
        "ro": "Siria",
        "ar": "سوريا",
        "fa": "سوریه",
        "yue": "阿拉伯敘利亞共和國"
      },
      flag: "🇸🇾",
      code: "SY",
      dialCode: "963",
      minLength: 9,
      maxLength: 9,
    ),
    const Country(
      name: "United Arab Emirates",
      nameTranslations: {
        "sk": "Spojené arabské emiráty",
        "se": "Ovttastuvvan Arábaemiráhtat",
        "pl": "Zjednoczone Emiraty Arabskie",
        "no": "De forente arabiske emirater",
        "ja": "アラブ首長国連邦",
        "it": "Emirati Arabi Uniti",
        "zh": "阿拉伯联合酋长国",
        "nl": "Verenigde Arabische Emiraten",
        "de": "Vereinigte Arabische Emirate",
        "fr": "Émirats arabes unis",
        "es": "Emiratos Árabes Unidos",
        "en": "United Arab Emirates",
        "pt_BR": "Emirados Árabes Unidos",
        "sr-Cyrl": "Уједињени Арапски Емирати",
        "sr-Latn": "Ujedinjeni Arapski Emirati",
        "zh_TW": "阿拉伯聯合大公國",
        "tr": "Birleşik Arap Emirlikleri",
        "ro": "Emiratele Arabe Unite",
        "ar": "الإمارات العربية المتحدة",
        "fa": "امارات متحده عربی",
        "yue": "阿拉伯聯合酋長國"
      },
      flag: "🇦🇪",
      code: "AE",
      dialCode: "971",
      minLength: 9,
      maxLength: 9,
    ),
  ];*/

class ImgObj {
  String asset;
  BoxFit fit;
  ImgObj({required this.asset, required this.fit});
}
