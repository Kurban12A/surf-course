enum Countries { brazil, russia, turkish, spain, japan }

class Territory {
  final int areaInHectare;
  final List<String> crops;
  final List<AgriculturalMachinery> machineries;

  Territory(
    this.areaInHectare,
    this.crops,
    this.machineries,
  );
}

class AgriculturalMachinery {
  final String id;
  final DateTime releaseDate;

  AgriculturalMachinery(
    this.id,
    this.releaseDate,
  );

  /// Переопределяем оператор "==", чтобы сравнивать объекты по значению.
  @override
  bool operator ==(Object? other) {
    if (other is! AgriculturalMachinery) return false;
    if (other.id == id && other.releaseDate == releaseDate) return true;

    return false;
  }

  @override
  int get hashCode => id.hashCode ^ releaseDate.hashCode;

  // вывод списка отсортированный техники
  @override
  String toString() {
    return 'Сельхоз. техника: id=$id, releaseDate=${releaseDate.year}';
  }
  
  
}

final mapBefore2010 = <Countries, List<Territory>>{
  Countries.brazil: [
    Territory(
      34,
      ['Кукуруза'],
      [
        AgriculturalMachinery(
          'Трактор Степан',
          DateTime(2001),
        ),
        AgriculturalMachinery(
          'Культиватор Сережа',
          DateTime(2007),
        ),
      ],
    ),
  ],
  Countries.russia: [
    Territory(
      14,
      ['Картофель'],
      [
        AgriculturalMachinery(
          'Трактор Гена',
          DateTime(1993),
        ),
        AgriculturalMachinery(
          'Гранулятор Антон',
          DateTime(2009),
        ),
      ],
    ),
    Territory(
      19,
      ['Лук'],
      [
        AgriculturalMachinery(
          'Трактор Гена',
          DateTime(1993),
        ),
        AgriculturalMachinery(
          'Дробилка Маша',
          DateTime(1990),
        ),
      ],
    ),
  ],
  Countries.turkish: [
    Territory(
      43,
      ['Хмель'],
      [
        AgriculturalMachinery(
          'Комбаин Василий',
          DateTime(1998),
        ),
        AgriculturalMachinery(
          'Сепаратор Марк',
          DateTime(2005),
        ),
      ],
    ),
  ],
};

final mapAfter2010 = {
  Countries.turkish: [
    Territory(
      22,
      ['Чай'],
      [
        AgriculturalMachinery(
          'Каток Кирилл',
          DateTime(2018),
        ),
        AgriculturalMachinery(
          'Комбаин Василий',
          DateTime(1998),
        ),
      ],
    ),
  ],
  Countries.japan: [
    Territory(
      3,
      ['Рис'],
      [
        AgriculturalMachinery(
          'Гидравлический молот Лена',
          DateTime(2014),
        ),
      ],
    ),
  ],
  Countries.spain: [
    Territory(
      29,
      ['Арбузы'],
      [
        AgriculturalMachinery(
          'Мини-погрузчик Максим',
          DateTime(2011),
        ),
      ],
    ),
    Territory(
      11,
      ['Табак'],
      [
        AgriculturalMachinery(
          'Окучник Саша',
          DateTime(2010),
        ),
      ],
    ),
  ],
};

void main() {
  List<AgriculturalMachinery> allMachineries = [];

  // собираем все единицы техники из обоих хранилищ
  for (List<Territory> territories in mapBefore2010.values) {
    for (Territory territory in territories) {
      allMachineries.addAll(territory.machineries);
    }
  }

  for (List<Territory> territories in mapAfter2010.values) {
    for (Territory territory in territories) {
      allMachineries.addAll(territory.machineries);
    }
  }

  // 1. Вычисляем средний возраст всей техники
  int totalAge = 0;
  for (AgriculturalMachinery machinery in allMachineries) {
    totalAge += DateTime.now().year - machinery.releaseDate.year;
  }

  double averageAge = totalAge / allMachineries.length;
  print('Средний возраст всей техники: ${averageAge.truncate()} лет');
  
  // 2. Сортируем всю технику по возрасту
  allMachineries.sort(((a, b) => a.releaseDate.compareTo(b.releaseDate)));

  // Определяем 50% самой старой техники
  int halfLenght = (allMachineries.length / 2).ceil();
  List<AgriculturalMachinery> oldestMachineries = allMachineries.sublist(0, halfLenght);

  // Вычисляем средний возраст самой старой техники
  int totalOldestAge = 0;
  for (AgriculturalMachinery machinery in oldestMachineries) {
    totalOldestAge += DateTime.now().year - machinery.releaseDate.year;
  }

  double averageoldestAge = totalOldestAge / oldestMachineries.length;
  print('Средний возраст самой старой техники: ${averageoldestAge.truncate()} лет');
  print('');

  for (AgriculturalMachinery machinery in oldestMachineries) {
    print(machinery);
  }

}
