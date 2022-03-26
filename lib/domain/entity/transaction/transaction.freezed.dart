// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'transaction.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Transaction _$TransactionFromJson(Map<String, dynamic> json) {
  return _Transaction.fromJson(json);
}

/// @nodoc
class _$TransactionTearOff {
  const _$TransactionTearOff();

  _Transaction call(
      {@JsonKey(defaultValue: 0, name: columnId) int? id,
      @JsonKey(name: columnType) required int type,
      @JsonKey(name: columnNominal) required double nominal,
      @JsonKey(name: columnDateTime) required DateTime dateTime,
      @JsonKey(name: columnCategory) required int category,
      @JsonKey(name: columnDescription) required String description}) {
    return _Transaction(
      id: id,
      type: type,
      nominal: nominal,
      dateTime: dateTime,
      category: category,
      description: description,
    );
  }

  Transaction fromJson(Map<String, Object?> json) {
    return Transaction.fromJson(json);
  }
}

/// @nodoc
const $Transaction = _$TransactionTearOff();

/// @nodoc
mixin _$Transaction {
  @JsonKey(defaultValue: 0, name: columnId)
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: columnType)
  int get type => throw _privateConstructorUsedError;
  @JsonKey(name: columnNominal)
  double get nominal => throw _privateConstructorUsedError;
  @JsonKey(name: columnDateTime)
  DateTime get dateTime => throw _privateConstructorUsedError;
  @JsonKey(name: columnCategory)
  int get category => throw _privateConstructorUsedError;
  @JsonKey(name: columnDescription)
  String get description => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TransactionCopyWith<Transaction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionCopyWith<$Res> {
  factory $TransactionCopyWith(
          Transaction value, $Res Function(Transaction) then) =
      _$TransactionCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(defaultValue: 0, name: columnId) int? id,
      @JsonKey(name: columnType) int type,
      @JsonKey(name: columnNominal) double nominal,
      @JsonKey(name: columnDateTime) DateTime dateTime,
      @JsonKey(name: columnCategory) int category,
      @JsonKey(name: columnDescription) String description});
}

/// @nodoc
class _$TransactionCopyWithImpl<$Res> implements $TransactionCopyWith<$Res> {
  _$TransactionCopyWithImpl(this._value, this._then);

  final Transaction _value;
  // ignore: unused_field
  final $Res Function(Transaction) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? type = freezed,
    Object? nominal = freezed,
    Object? dateTime = freezed,
    Object? category = freezed,
    Object? description = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as int,
      nominal: nominal == freezed
          ? _value.nominal
          : nominal // ignore: cast_nullable_to_non_nullable
              as double,
      dateTime: dateTime == freezed
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as int,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$TransactionCopyWith<$Res>
    implements $TransactionCopyWith<$Res> {
  factory _$TransactionCopyWith(
          _Transaction value, $Res Function(_Transaction) then) =
      __$TransactionCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(defaultValue: 0, name: columnId) int? id,
      @JsonKey(name: columnType) int type,
      @JsonKey(name: columnNominal) double nominal,
      @JsonKey(name: columnDateTime) DateTime dateTime,
      @JsonKey(name: columnCategory) int category,
      @JsonKey(name: columnDescription) String description});
}

/// @nodoc
class __$TransactionCopyWithImpl<$Res> extends _$TransactionCopyWithImpl<$Res>
    implements _$TransactionCopyWith<$Res> {
  __$TransactionCopyWithImpl(
      _Transaction _value, $Res Function(_Transaction) _then)
      : super(_value, (v) => _then(v as _Transaction));

  @override
  _Transaction get _value => super._value as _Transaction;

  @override
  $Res call({
    Object? id = freezed,
    Object? type = freezed,
    Object? nominal = freezed,
    Object? dateTime = freezed,
    Object? category = freezed,
    Object? description = freezed,
  }) {
    return _then(_Transaction(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as int,
      nominal: nominal == freezed
          ? _value.nominal
          : nominal // ignore: cast_nullable_to_non_nullable
              as double,
      dateTime: dateTime == freezed
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as int,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Transaction implements _Transaction {
  const _$_Transaction(
      {@JsonKey(defaultValue: 0, name: columnId) this.id,
      @JsonKey(name: columnType) required this.type,
      @JsonKey(name: columnNominal) required this.nominal,
      @JsonKey(name: columnDateTime) required this.dateTime,
      @JsonKey(name: columnCategory) required this.category,
      @JsonKey(name: columnDescription) required this.description});

  factory _$_Transaction.fromJson(Map<String, dynamic> json) =>
      _$$_TransactionFromJson(json);

  @override
  @JsonKey(defaultValue: 0, name: columnId)
  final int? id;
  @override
  @JsonKey(name: columnType)
  final int type;
  @override
  @JsonKey(name: columnNominal)
  final double nominal;
  @override
  @JsonKey(name: columnDateTime)
  final DateTime dateTime;
  @override
  @JsonKey(name: columnCategory)
  final int category;
  @override
  @JsonKey(name: columnDescription)
  final String description;

  @override
  String toString() {
    return 'Transaction(id: $id, type: $type, nominal: $nominal, dateTime: $dateTime, category: $category, description: $description)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Transaction &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.type, type) &&
            const DeepCollectionEquality().equals(other.nominal, nominal) &&
            const DeepCollectionEquality().equals(other.dateTime, dateTime) &&
            const DeepCollectionEquality().equals(other.category, category) &&
            const DeepCollectionEquality()
                .equals(other.description, description));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(type),
      const DeepCollectionEquality().hash(nominal),
      const DeepCollectionEquality().hash(dateTime),
      const DeepCollectionEquality().hash(category),
      const DeepCollectionEquality().hash(description));

  @JsonKey(ignore: true)
  @override
  _$TransactionCopyWith<_Transaction> get copyWith =>
      __$TransactionCopyWithImpl<_Transaction>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TransactionToJson(this);
  }
}

abstract class _Transaction implements Transaction {
  const factory _Transaction(
          {@JsonKey(defaultValue: 0, name: columnId) int? id,
          @JsonKey(name: columnType) required int type,
          @JsonKey(name: columnNominal) required double nominal,
          @JsonKey(name: columnDateTime) required DateTime dateTime,
          @JsonKey(name: columnCategory) required int category,
          @JsonKey(name: columnDescription) required String description}) =
      _$_Transaction;

  factory _Transaction.fromJson(Map<String, dynamic> json) =
      _$_Transaction.fromJson;

  @override
  @JsonKey(defaultValue: 0, name: columnId)
  int? get id;
  @override
  @JsonKey(name: columnType)
  int get type;
  @override
  @JsonKey(name: columnNominal)
  double get nominal;
  @override
  @JsonKey(name: columnDateTime)
  DateTime get dateTime;
  @override
  @JsonKey(name: columnCategory)
  int get category;
  @override
  @JsonKey(name: columnDescription)
  String get description;
  @override
  @JsonKey(ignore: true)
  _$TransactionCopyWith<_Transaction> get copyWith =>
      throw _privateConstructorUsedError;
}
