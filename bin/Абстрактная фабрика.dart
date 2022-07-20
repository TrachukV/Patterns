//Список идентификаторов продукции

enum TypeSuitWear { sportSuit, officeSuit }

// Интерфейс продукта
abstract class Lightweight {
  final String wear;

  Lightweight(this.wear);

  void make();
}

// Интерфейс продукта
abstract class Textile {
  final String wear;

  Textile(this.wear);

  void make();
}

// Интерфейс продукта
abstract class Season {
  final String wear;

  Season(this.wear);

  void make();
}

// Конкретный продукт
class SportWearWeight extends Lightweight {
  SportWearWeight() : super('Спортивний костюм');
  @override
  void make() {
    print('Виготовляємо 🪡 $wear по методиці Adidas Zero Sport Weight 🥷 ');
  }
}

// Конкретный продукт
class SportWearTextile extends Textile {
  SportWearTextile() : super('Спортивный костюм');
  @override
  void make() {
    print('Виготовляємо 🪡 $wear з української 🇺🇦 бавовни 😉');
  }
}

// Конкретный продукт
class SportWearSeason extends Season {
  SportWearSeason() : super('Спортивний костюм');
  @override
  void make() {
    print('Виготовляємо 🪡 $wear для холодих температур на вулиці 🥶');
  }
}

// Конкретный продукт
class OfficeWearWeight extends Lightweight {
  OfficeWearWeight() : super('Діловий костюм');
  @override
  void make() {
    print(
        'Виготовляємо 🪡 $wear по методиці Armani Casual Office Super Mega Fashion from AliExpress 👔');
  }
}

// Конкретный продукт
class OfficeWearTextile extends Textile {
  OfficeWearTextile() : super('Діловий костюм');
  @override
  void make() {
    print('Виготовляємо 🪡 $wear з української 🇺🇦 бавовни 😉');
  }
}

// Конкретный продукт
class OfficeWearSeason extends Season {
  OfficeWearSeason() : super('Діловий костюм');
  @override
  void make() {
    print('Виготовляємо 🪡$wear для холодих температур на вулиці 🥶');
  }
}

// Абстрактный конструктор Фабрика (Интерфейс базового класса)
abstract class TypeWearAbstractFactory {
  factory TypeWearAbstractFactory(TypeSuitWear typeSuitWear) {
    switch (typeSuitWear) {
      case TypeSuitWear.sportSuit:
        return SportWearType();
      case TypeSuitWear.officeSuit:
        return OfficeWearType();
      default:
        throw ArgumentError();
    }
  }
  Lightweight getLightweight();
  Textile getTextile();
  Season getSeason();
}

// Конкретный конструктор (Реализация абстрактного конструктора)
class SportWearType implements TypeWearAbstractFactory {
  @override
  Lightweight getLightweight() {
    return SportWearWeight();
  }

  @override
  Textile getTextile() {
    return SportWearTextile();
  }

  @override
  Season getSeason() {
    return SportWearSeason();
  }
}

// Конкретный конструктор (Реализация абстрактного конструктора)
class OfficeWearType implements TypeWearAbstractFactory {
  @override
  Lightweight getLightweight() {
    return OfficeWearWeight();
  }

  @override
  Textile getTextile() {
    return OfficeWearTextile();
  }

  @override
  Season getSeason() {
    return OfficeWearSeason();
  }
}

//Клиентский класс для создания одежды
class Manufacture {
  final TypeWearAbstractFactory typeWear;
  Manufacture(this.typeWear);
  void makeSuit() {
    typeWear.getLightweight().make();
    typeWear.getTextile().make();
    typeWear.getSeason().make();
  }
}

void main() {
  final typeSuitWear = TypeSuitWear.officeSuit;
  final manufacture = Manufacture(TypeWearAbstractFactory(typeSuitWear));
  manufacture.makeSuit();
}
