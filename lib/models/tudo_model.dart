import 'package:freezed_annotation/freezed_annotation.dart';
 part 'tudo_model.freezed.dart';
part 'tudo_model.g.dart';
@freezed
class Todo with _$Todo {
  const factory Todo({
    required List<Item> items,
  }) = _Todo;

  factory Todo.fromJson(Map<String, dynamic> json) => _$TodoFromJson(json);
}

@freezed
class Item with _$Item {
  const factory Item({
    @JsonKey(name: "_id") String? id,
    required String? title,
    required String? description,
  }) = _Item;

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);
}