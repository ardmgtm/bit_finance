import '../../../domain/entity/transaction/transaction.dart';

const transactionTableQuery = '''
create table if not exists '$transactionTable' ( 
  $columnId integer primary key autoincrement, 
  $columnType integer not null,
  $columnNominal real not null,
  $columnDateTime text not null,
  $columnCategory integer not null,
  $columnDescription text not null
)
''';
