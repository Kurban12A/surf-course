// Описание классов на примере вида спорта - Футбол.

// абстрактный класс Человек с общими свойствами
abstract class Human {
  final String name;
  final int age;
  final int height;
  final String? skinColor;
  final String gender;

  Human({
    required this.name, 
    required this.age, 
    required this.height, 
    required this.skinColor, 
    required this.gender,});
}

// дочерний класс Нападающий
class Forward extends Human {
  final int impactForce; // сила удара
  final int numberOfMatches; // количество матчей

  Forward({
    required this.impactForce,
    required this.numberOfMatches,
    required super.name, 
    required super.age, 
    required super.height, 
    required super.skinColor, 
    required super.gender,});

  // среднее число забитый мячей в матчах
  int get goalsScrored => numberOfMatches ~/ 2;

  @override
  String toString() {
    print('ЭТО НАПАДАЮЩИЙ');
    return '''
    Name:$name, 
    Age: $age, 
    Height: $height, 
    SkinColor: $skinColor, 
    Gender: $gender, 
    ImpactForce: $impactForce, 
    Matches: $numberOfMatches,
    Goals: $goalsScrored''';
  }

}

// реализация класса Вратарь
class Goalkeeper implements Human, Forward {
  @override
  int get age => 20;

  @override
  String get gender => 'male';

  @override
  int get height => 190;

  @override
  int get impactForce => 60;

  @override
  String get name => 'Da silva';

  @override
  int get numberOfMatches => 34;

  @override
  String? get skinColor => 'Black';
  

  @override
  int get goalsScrored => 0;

  @override
  String toString() {
    print('ЭТО ВРАТАРЬ');
    return '''
    Name:$name, 
    Age: $age, 
    Height: $height, 
    SkinColor: $skinColor, 
    Gender: $gender, 
    ImpactForce: $impactForce, 
    Matches: $numberOfMatches''';
  }
}

// класс Тренер
class Coach {
  final int awards;
  Goalkeeper goalkeeper;
  Forward forward;

  Coach({required this.goalkeeper, required this.forward, required this.awards});
  
  @override
  String toString() {
    print('ЭТО ТРЕНЕР');
    return '''
    Awards: $awards,
    Team: ${[goalkeeper.name, forward.name]} and other players...
    ''';
  }
}


void main() {

  Forward forward = Forward(
    impactForce: 50, 
    numberOfMatches: 43, 
    name: 'Ronaldo', 
    age: 34, 
    height: 180, 
    skinColor: 'Brown', 
    gender: 'male',);

  Goalkeeper goalkeeper = Goalkeeper();

  print(goalkeeper);
  print('');
  print(forward);
  print('');
  Coach coach = Coach(goalkeeper: goalkeeper, forward: forward, awards: 4);
  print(coach);
}