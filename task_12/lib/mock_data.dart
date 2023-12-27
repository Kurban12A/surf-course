import 'package:flutter/material.dart';

abstract class MocksDataText {
  static const appBarTitle = 'Чек № 56';
  static const appBarLowText = '24.02.2023 в 12.23';
  static const heading = 'Список покупок';
  static const headingModal = 'Сортировка';
  static const buttonText = 'Готово';
  static const cart = 'В вашей покупке';
  static const discount = 'Скидка 5%';
  static const total = 'Итого';

  static const bottonNavBarCatalog = 'Каталог';
  static const bottonNavBarSearch = 'Поиск';
  static const bottonNavBarCart = 'Корзина';
  static const bottonNavBarPersonal = 'Личное';

  static const plug = 'Здесь пока ничего нет';
}

abstract class MainColorTheme {
  static const accentColor = Color.fromARGB(255, 66, 195, 70);
  static const secondaryColor = Colors.red;
  static const backgroundColor = Colors.white;
  static const iconsColor = Colors.black54;
  static const iconsTextColor = Colors.black54;
  static const iconColorButton = Color.fromARGB(135, 215, 211, 211);
  static const divaderColor = Color.fromARGB(255, 228, 226, 226);
}

abstract class BottomIcons {
  static const catalog = Icon(Icons.list_alt_rounded);
  static const search = Icon(Icons.search);
  static const cart = Icon(Icons.shopping_bag_outlined);
  static const personal = Icon(Icons.person_outline);
}


abstract class SortMockData {
  static const sort = 'Сортировка';
  static const buttonBottomSheet = 'Готово';
  static const categoryName = 'По имени';
  static const categoryPrice = 'По цене';
  static const categoryType = 'По типу';
  static const noSort = 'Без сортировки';
  static const nameToFromA = 'По имени от А до Я';
  static const reversenameToFromA = 'По имени от Я до А';
  static const lowToHighPrice = 'По возрастанию';
  static const highToLowPrice = 'По убыванию';
  static const typeFromA = 'По типу от А до Я';
  static const reverseTypeFromA = 'По типу от Я до А';
}