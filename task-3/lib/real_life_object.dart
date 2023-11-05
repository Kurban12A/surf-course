class Phone {
  final String model;
  String color = 'white';
  static const String manufacturer = 'Apple';
  Camera camera;
  int? price;
  final String _serialNumber;
  
  Phone(
    this._serialNumber, 
    {
    required this.model,
    required this.color,
    required this.camera,
    });

  Phone.black(
    this._serialNumber, 
    {
      required this.model, 
      required this.color,
      required this.camera,
    });


    void openConnection() {
      // реализация открытия соединения
      print('успешное соединение');
    }

    void openCamera() {
      // реализация доступа к камере
      print('доступ предоствлен');
    }

    void call () {
      openConnection();
      print('Звонок с ипользованием телефона\n производства: $manufacturer\n номер: $_serialNumber,\n модель: $model,\n цвет: $color,');
    }

    void videoCall() {
      openCamera();
      print('Видеовонок с ипользованием телефона\n номер: $_serialNumber,\n модель: $model,\n цвет: $color,\n и камерой\n $camera');
    } 
}


class Camera {
  final String nameCamera;
  final int pixels;
  final String serialNumer;

  Camera(
    {
    required this.nameCamera, 
    required this.pixels, 
    required this.serialNumer,
    }); 

  
  @override
  String toString() {

    var aboutCamera = '''название: $nameCamera количество пикселей: $pixels номер: $serialNumer'''; 

    return aboutCamera;
  }
  
}


void main() {
  Phone myPhone = Phone('1234', model: 'A12', color: 'white', camera: Camera(
    nameCamera: 'APLCam', pixels: 12, serialNumer: '123'));

  Phone blackPhone = Phone.black('1234', model: 'A12', color: 'black', camera: Camera(
    nameCamera: 'APLCam', pixels: 12, serialNumer: '123'));

    myPhone.call();
    print('');
    blackPhone.videoCall();
    
}