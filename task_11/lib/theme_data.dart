import 'package:flutter/material.dart';

abstract class ColorThemeData {
  static const bacgroundColor = Color(0xFF1E1D1E);
  static const firstAccentColor = Color(0xFFAE91FF);
  static const secondAccentColor = Color(0xFF1AEA86);
  static const thirdAccentColor = Color(0xFFF0E70E);
  static const forthAccentColor = Color(0xFFFF6F91);
  static const textColor = Color(0xFFAE91FF);
  static const containerColor = Colors.white;
  static const bodyTextColor = Colors.white;
  static const shadow = Color(0x80946FFF);
}

abstract class MocksTextApp {
  static const name = 'Цмиханов\nКурбан';
  static const uxDesigner = 'UX/UI дизайнер';
  static const bussinesAnalyst = 'Бизнес-аналитик';
  static const flutterDev = 'Junior Flutter Dev';
  static const categoryAboutMe = 'О себе';
  static const categoryHobbies = 'Увлечения';
  static const categoryDevExp = 'Опыт в разработке';

  static const longTextAboutMe = 
    'Привет! Меня зовут Курбан, мне 32 года. Я закончил в 2014 году РУЭ. им. Плеханова. Также получил 2 образования в области "Информационной безопасности. Начал работать в Пенсионном фонде России в Департаменте федеральных государственных проектов и дорос в должности до руководителя отдела. Дальше я перешел в страховую компанию Макс на должность бизнес-аналитика и продолжаю рабоать в этом направлении. Но также учусь и хочу стать мобильным разработчиком на Flutter.';

  static const longTextDevExp = 'Мой путь в обучении началася с языка Python, на нем я написал небольшой сайт портфоли с формой обратной связи. Спустя какое-то время я обучился UX/UI дизайну --> мои работы https://www.behance.net/2f3b9b7e. И с того момент заинтересовался мобильным дизайном и разработкой и стал выбирать языки и открыл для себя Dart/Flutter, спустя несколько месяцев самостоятельного обучения сделал в фигме дизайн приложения и начал верстать (ссылка на макет https://www.figma.com/file/kvwHQajA9ANFLYcDUUd7b4/MyProject_Flutter?type=design&node-id=0%3A1&mode=design&t=BJzmoDUrHFgYa6Mh-1) Проект на гите https://github.com/Kurban12A/travel-tour-app-project-flutter';

  static const galleryImages = [
      'https://fitkarhula.vilkasstore.com/WebRoot/vilkasfi02/Shops/2017012402/Products/kuntosali_247_54721092_1000x1000_1000x1000.jpg',
      'https://sun6-21.userapi.com/s/v1/ig2/fd6S_U7iamh6SaOFF305d9zOPskCdhtQHGihvrAh7Z_SlOQV0Prfa23PnGfZTXKltWzEZFxUUR8u-cw5L7wSt04a.jpg?size=1019x1019&quality=95&crop=371,46,1019,1019&ava=1',
      'https://i5.photo.2gis.com/images/branch/0/30258560080711599_6a9f.jpg',
      'https://sun6-21.userapi.com/s/v1/ig2/YcRnPhhzgkjB6sZGtXX_LdLuT2Lv_2AmgJ7JtijX_s2Z6UnwqMnPlOdBpG0UXhMIeDKEzJzTzfJvF9-wQwAvtN8a.jpg?size=1406x1406&quality=95&crop=479,0,1406,1406&ava=1',
  ];  
}


