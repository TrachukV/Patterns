import 'dart:math';

void main() async {
  Uah moneyRate = RateCashAdapter();
  print(moneyRate.rateUah(0));
}

//Старый класс доллара
class Dollar {
  double convert(double rate) {
    return rate;
  }
}

//Класс с совместимым интерфейсом
abstract class Uah {
  rateUah(int checkRate);
}

//Адаптация класса доллар
class RateCashAdapter extends Dollar implements Uah {
  @override
  rateUah(int randomDollarRate) {
    var randomDollarRate = Random().nextInt(10) + 5;
    final double uahRate = 36.60;
    convert(randomDollarRate.toDouble());
    return 'Запускаем конвертацию валют по курсу НБУ $randomDollarRateти USD \n'
        'Согласно курсу 24.07.2021 года: $randomDollarRate долларов равно ${randomDollarRate * uahRate} гривен';
  }
}
