// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'application/controller/add_transaction_controller.dart' as _i8;
import 'application/controller/get_transaction_controller.dart' as _i9;
import 'application/controller/main_page_controller.dart' as _i3;
import 'application/controller/transaction_screen_controller.dart' as _i7;
import 'domain/repository/transaction_repository.dart' as _i5;
import 'infrastructure/local_data_source/transaction/transaction_local_data_source.dart'
    as _i4;
import 'infrastructure/repository/transaction_repository_impl.dart'
    as _i6; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.MainPageController>(() => _i3.MainPageController());
  gh.lazySingleton<_i4.TransactionLocalDataSource>(
      () => _i4.TransactionLocalDataSource());
  gh.lazySingleton<_i5.TransactionRepository>(() =>
      _i6.TransactionRepositoryImpl(get<_i4.TransactionLocalDataSource>()));
  gh.factory<_i7.TransactionViewController>(
      () => _i7.TransactionViewController());
  gh.factory<_i8.AddTransactionController>(
      () => _i8.AddTransactionController(get<_i5.TransactionRepository>()));
  gh.factory<_i9.GetTransactionController>(
      () => _i9.GetTransactionController(get<_i5.TransactionRepository>()));
  return get;
}
