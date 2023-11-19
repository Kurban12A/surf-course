/// Описание классов на примере вида спорта - Футбол.

/// абстрактный класс Человек с общими свойствами
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

/// дочерний класс Нападающий
class Forward extends Human {
  final int impactForce; /// сила удара
  final int numberOfMatches; /// количество матчей

  Forward({
    required this.impactForce,
    required this.numberOfMatches,
    required super.name, 
    required super.age, 
    required super.height, 
    required super.skinColor, 
    required super.gender,});

  /// среднее число забитый мячей в матчах
  int get goalsScrored => numberOfMatches ~/ 2;

  @override
  String toString() {
    return '''
    'ЭТО НАПАДАЮЩИЙ'
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

/// реализация класса Вратарь
class Goalkeeper extends Human {

  Goalkeeper({
    required super.name, 
    required super.age, 
    required super.height, 
    required super.skinColor, 
    required super.gender}) ;

  @override
  String toString() {
    return '''
    'ЭТО ВРАТАРЬ'
    Name:$name, 
    Age: $age, 
    Height: $height, 
    SkinColor: $skinColor, 
    Gender: $gender''';
  }
}

/// класс Тренер
class Coach {
  final int awards;
  final List<Human> team;

  Coach({
    required this.awards, 
    required this.team});
  
  @override
  String toString() {
    String playerName = team.map((players) => players.name).join(', ');
    return '''
    'ЭТО ТРЕНЕР'
    Awards: $awards,
    Team: $playerName and other players...
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

  Goalkeeper goalkeeper = Goalkeeper(
    name: 'Da silva', 
    age: 32, 
    height: 190, 
    skinColor: 'White', 
    gender: 'male');

  List<Human> team = [forward, goalkeeper];

  Coach coach = Coach(awards: 4, team: team);

  print(forward);
  print('');
  print(goalkeeper);
  print('');
  print(coach);

}