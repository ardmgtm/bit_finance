import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction.freezed.dart';
part 'transaction.g.dart';

const String transactionTable = 'transaction';
const String columnId = 'id';
const String columnType = 'type';
const String columnNominal = 'nominal';
const String columnDateTime = 'datetime';
const String columnCategory = 'category';
const String columnDescription = 'description';

@freezed
class Transaction with _$Transaction {
  const factory Transaction({
    @JsonKey(defaultValue: 0, name: columnId) int? id,
    @JsonKey(name: columnType) required int type,
    @JsonKey(name: columnNominal) required double nominal,
    @JsonKey(name: columnDateTime) required DateTime dateTime,
    @JsonKey(name: columnCategory) required int category,
    @JsonKey(name: columnDescription) required String description,
  }) = _Transaction;

  factory Transaction.fromJson(Map<String, dynamic> json) =>
      _$TransactionFromJson(json);
}
