void main() {
  WatchManufacture watchManufacture = WatchManufacture();
  watchManufacture.infoForWatch();
  AbstractBuilderManufacture watchBuilder2021 = WatchSeries2021Builder();
  AbstractBuilderManufacture watchBuilder2022 = WatchSeries2022Builder();
  Director director2021 = Director(watchBuilder2021);
  Director director2022 = Director(watchBuilder2022);
  director2021.work();
  director2022.work();

  print(watchBuilder2021.getResultat().lineup2021);
  print(watchBuilder2022.getResultat().lineup2022);
}

//продукт
class WatchManufacture {
  void infoForWatch() {
    print('Презентуємо Вам нашу нову коллекцію годинників');
  }

  List<String> lineup2021 = [];
  void addSeries1(String a) {
    lineup2021.add(a);
  }

  List<String> lineup2022 = [];
  void addSeries2(String a) {
    lineup2022.add(a);
  }
}

//Логика выполнения задачи (Директор)
class Director {
  AbstractBuilderManufacture watchBuilder;
  Director(this.watchBuilder);

  void work() {
    watchBuilder.sportWatch();
    watchBuilder.classicWatch();
    watchBuilder.armyWatch();
  }
}

//Задаем интерфейс строителя
abstract class AbstractBuilderManufacture {
  void sportWatch();
  void classicWatch();
  void armyWatch();
  WatchManufacture getResultat();
}

//Все конкретные строители реализуют общий интерфейс по-своему
class WatchSeries2021Builder extends AbstractBuilderManufacture {
  WatchManufacture manufacture2021 = WatchManufacture();
  @override
  void sportWatch() {
    manufacture2021.addSeries1('Спортивний годинник Model Fitness 2021   ||||');
  }

  @override
  void classicWatch() {
    manufacture2021.addSeries1('Класичний годинник Model Fashion 2021   ||||');
  }

  @override
  void armyWatch() {
    manufacture2021.addSeries1('Військовий годинник Model Strong 2021 ');
  }

  @override
  WatchManufacture getResultat() {
    return manufacture2021;
  }
}

class WatchSeries2022Builder extends AbstractBuilderManufacture {
  WatchManufacture manufacture2022 = WatchManufacture();
  @override
  void sportWatch() {
    manufacture2022.addSeries2('Спортивний годинник Model Fitness 2022   ||||');
  }

  @override
  void classicWatch() {
    manufacture2022.addSeries2('Класичний годинник Model Fashion 2022   ||||');
  }

  @override
  void armyWatch() {
    manufacture2022.addSeries2('Військовий годинник Model Strong 2022 ');
  }

  @override
  WatchManufacture getResultat() {
    return manufacture2022;
  }
}
