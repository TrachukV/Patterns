void main() {
  LoadingCar volvoBigTruck = SideLoadBig('Верхняя');
  LoadingCar gazel = SideLoadLow(5);

  TypeCar volvo = BigTruck(volvoBigTruck);
  TypeCar gazelka = SmallTruck(gazel);

  volvo.loading();

  gazelka.loading();
}

abstract class TypeCar {
  LoadingCar load;

  TypeCar(this.load);

  void loading();
}

class BigTruck extends TypeCar {
  BigTruck(super.load);

  @override
  void loading() {
    print('Большой грузовик стоит и ${load.load()}');
  }
}

class SmallTruck extends TypeCar {
  SmallTruck(super.load);

  @override
  void loading() {
    print('Маленький грузовик стоит и ${load.load()}тонн');
  }
}

//Абстрактный мост (Birdge)
abstract class LoadingCar {
  String load();
}

//Реализация
class SideLoadBig implements LoadingCar {
  String side;

  SideLoadBig(this.side);

  @override
  String load() {
    if (side == 'Верхняя') {
      return 'идет верхняя загрузка';
    } else if (side == 'Задняя') {
      return 'идет задняя загрузка';
    } else {
      return 'Идет обычная задняя загрузка';
    }
  }
}

//Реализация
class SideLoadLow implements LoadingCar {
  int maxWeight;

  SideLoadLow(this.maxWeight);

  @override
  String load() {
    return 'идет задняя загрузка $maxWeight ';
  }

  int maxWeightStop() {
    return maxWeight;
  }
}
