class SingletonDataBase {
  static SingletonDataBase? _httpRequest;

  String _postRequest = 'Отправляем запрос:\n';

  SingletonDataBase._init() {
    _httpRequest = this;
  }

  factory SingletonDataBase() {
    return _httpRequest ??= SingletonDataBase._init();
  }

  void addName(String n) {
    _postRequest = _postRequest + '$n\n';
  }

  void show() {
    print(_postRequest);
  }
}

void main(List<String> args) {
  SingletonDataBase firstRequest = SingletonDataBase();
  firstRequest.addName('https://cataas.com/cat');
  firstRequest.show();
  print('_' * 65);

  SingletonDataBase secondRequest = SingletonDataBase();

  secondRequest.addName(
      'https://api.privatbank.ua/p24api/pubinfo?json&exchange&coursid=5');
  secondRequest.show();

  print('_' * 65);

  print('Проверяем действительно ли это один экземпляр:');
  identical(firstRequest, secondRequest);
  if (identical(firstRequest, secondRequest)) {
    print(
        'Да, все верно, это один экземпляр - "${identical(firstRequest, secondRequest)}"');
  } else {
    print('что-то не то');
  }
}
