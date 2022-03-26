import '../../../domain/entity/transaction/transaction.dart';

const transactoinTableQuery = '''
create table if not exists $transactionTable ( 
  $columnId integer primary key autoincrement, 
  $columnType text not null,
  $columnNominal real not null,
  $columnDateTime text not null,
  $columnCategory integer not null
  $columnDescription text not null,
)
''';
