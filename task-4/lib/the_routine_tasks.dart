class Taxi {
  final String nameCar;
  final String carNumber;
  final String colorCar;
  final int price;

  Taxi({
    required this.nameCar, 
    required this.carNumber, 
    required this.colorCar, 
    required this.price});


  @override
  String toString() {
    var aboutTaxi = '''

    Машина: $nameCar 
    Номер: $carNumber 
    Цвет: $colorCar 
    Цена: $price''';
    return aboutTaxi;
  }
}


void main() {
  bool isTaxiArrived = false;
  // если изменить значение больше 3 то поедеим на метро
  int numberOfAttempts = 2;
  // Максимальное количество попыток
  int maxAttempts = 3; 

  print("Вызываю такси...");

  while (!isTaxiArrived && numberOfAttempts < maxAttempts ) {
    numberOfAttempts++;
    print("Попытка номер $numberOfAttempts");
    acceptCar();
    

    if (numberOfAttempts > maxAttempts) {
      print("Такси не приехало. Поеду на метро.");
      break;
    }

    print('Ищем машину');
    
    // Предположим, что здесь происходит проверка, приехало ли такси
    isTaxiArrived = true;
    if (isTaxiArrived) {
      waitingTaxi();
      print("Такси еще не приехало. Ждем...");
    }

  }
  // если такси не приехало отправляемся на метро
  if (!isTaxiArrived) {
    print('Все такси заняты');
    goToMetro();
  }
}

// ожидание машины
void waitingTaxi() async {
    await Future.delayed(Duration(seconds: 5));
    print("Такси приехало! Можете отправляться.");
    simulatedTripForTaxi();
}

// симуляция поездки на такси
void simulatedTripForTaxi() async {
  await Future.delayed(Duration(seconds: 3));
  print('Приехал на работу вовремя, настроение отличное');
}

  // подтверждение машины
void acceptCar() async {
  await Future.delayed(Duration(seconds: 2));
  print('К вам приедет:  ${Taxi(nameCar: 'Reno', carNumber: '1234', colorCar: 'Yellow', price: 500)}');
}

// поехал на метро
void goToMetro() {
  print("Поехал на метро.");
  simulatedTripForSuvway();
}

// симуляция поездки на метро
void simulatedTripForSuvway() async {
  await Future.delayed(Duration(seconds: 3));
  print('Опоздал на работу на 1 час, получил выговор от руководства');
}

