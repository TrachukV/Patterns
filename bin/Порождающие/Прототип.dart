void main(List<String> args) {
  AbstractPrototypeCola original = CocaColaOriginal('Черный');

  print('Кока Кола: ');
  print(original);

  AbstractPrototypeCola colaClone = original.clone();

  print('Клон Кока Кола: ');
  print(colaClone);

  AbstractPrototypeCola copyCola = ColaVlasnaMarka(5.0);

  print('Кола из АТБ ');
  print(copyCola);

  AbstractPrototypeCola copySugar = copyCola.clone();

  print('Клон Колы из АТБ: ');
  print(copySugar);
}

//Интерфейс клонирования
abstract class AbstractPrototypeCola {
  AbstractPrototypeCola clone();
}

//Конкретный клон Колы
class CocaColaOriginal implements AbstractPrototypeCola {
  String? colorOfWater;
  CocaColaOriginal(this.colorOfWater);

  CocaColaOriginal.clone(CocaColaOriginal prototype) {
    colorOfWater = prototype.colorOfWater;
  }

  @override
  AbstractPrototypeCola clone() {
    return CocaColaOriginal.clone(this);
  }

  @override
  String toString() {
    return "Цвет напитка: $colorOfWater";
  }
}

//Конкретный клон АТБ Колы
class ColaVlasnaMarka implements AbstractPrototypeCola {
  double? grSugar;
  ColaVlasnaMarka(this.grSugar);

  ColaVlasnaMarka.clone(ColaVlasnaMarka prototype) {
    grSugar = prototype.grSugar;
  }

  @override
  AbstractPrototypeCola clone() {
    return ColaVlasnaMarka.clone(this);
  }

  @override
  String toString() {
    return 'Грамм сахара: $grSugar';
  }
}
