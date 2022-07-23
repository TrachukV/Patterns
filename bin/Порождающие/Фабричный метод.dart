//Список идентификаторов напитков
enum SugarDrink {
  cocaCola,
  fanta,
  sprite,
}

//Интерфейс продукта
abstract class CarbonatedDrinks {
  final int size;
  final String name;
  CarbonatedDrinks(this.name, this.size);

  double procentOFSugar();

  @override
  String toString() {
    return 'Water is $name, $size ml, ';
  }
}

//Конкретный продукт
class CocaCola extends CarbonatedDrinks {
  final double sugar;
  CocaCola(String name, int size, this.sugar) : super(name, size);
  @override
  double procentOFSugar() {
    return size * sugar;
  }
}

class FantaZero extends CarbonatedDrinks {
  int juice = 25;
  FantaZero(
    String name,
    int size,
    this.juice,
  ) : super(name, size);

  @override
  double procentOFSugar() {
    return (size * 0 + juice).toDouble();
  }
}

class Sprite extends CarbonatedDrinks {
  final double colorant;
  final double sugar;
  Sprite(String name, int size, this.colorant, this.sugar) : super(name, size);
  @override
  double procentOFSugar() {
    return size * sugar + colorant;
  }
}

//Фабрика
class FactoryCarbonatedDrinks {
  static CarbonatedDrinks factory(SugarDrink sugarDrink) {
    switch (sugarDrink) {
      case SugarDrink.cocaCola:
        return CocaCola('Coca Cola Original', 500, 2.5);

      case SugarDrink.fanta:
        return FantaZero('Fanta Orange Zero', 500, 25);

      case SugarDrink.sprite:
        return Sprite('Sprite limited edition', 500, 25, 2.5);
      default:
        throw ArgumentError();
    }
  }
}

void main(List<String> arguments) {
  for (final value in SugarDrink.values) {
    final drink = FactoryCarbonatedDrinks.factory(value);
    print('$drink calories ${drink.procentOFSugar()}');
  }
}
