// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'domain/repository/transaction_repository.dart' as _i4;
import 'infrastructure/local_data_source/transaction/transaction_local_data_source.dart'
    as _i3;
import 'infrastructure/repository/transaction_repository_impl.dart'
    as _i5; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.lazySingleton<_i3.TransactionLocalDataSource>(
      () => _i3.TransactionLocalDataSource());
  gh.lazySingleton<_i4.TransactionRepository>(() =>
      _i5.TransactionRepositoryImpl(get<_i3.TransactionLocalDataSource>()));
  return get;
}
