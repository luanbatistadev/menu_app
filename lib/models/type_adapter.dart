import 'package:hive/hive.dart';
import 'package:menu_app/models/cart.dart';
import 'package:menu_app/models/foods.dart';

class FoodAdapter extends TypeAdapter<Food> {
  @override
  final typeId = 0;

  @override
  Food read(BinaryReader reader) {
    return Food(
      id: reader.readInt(),
      name: reader.readString(),
      price: reader.readDouble(),
      description: reader.readString(),
      path: reader.readString(),
    );
  }

  @override
  void write(BinaryWriter writer, Food obj) {
    writer
      ..writeInt(obj.id)
      ..writeString(obj.name)
      ..writeDouble(obj.price)
      ..writeString(obj.description)
      ..writeString(obj.path);
  }
}

class ShoppingCartAdapter extends TypeAdapter<ShoppingCart> {
  @override
  final typeId = 1;

  @override
  ShoppingCart read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ShoppingCart(
      userCart: (fields[0] as Map).cast<Food, int>(),
    );
  }

  @override
  void write(BinaryWriter writer, ShoppingCart obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.userCart);
  }
}

