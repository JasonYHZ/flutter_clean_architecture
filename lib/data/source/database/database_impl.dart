import 'package:drift/drift.dart';

import 'connection/connection.dart' as impl;
import 'database.dart';

part 'database_impl.g.dart';

@DriftDatabase(include: {'sql/schema.drift'})
class DatabaseImpl extends _$DatabaseImpl implements Database {
  final String dbName;
  final bool inMemory;
  final bool logStatements;

  DatabaseImpl(
      {required this.dbName,
      required this.inMemory,
      required this.logStatements})
      : super(impl.connect(
          dbName,
          inMemory: inMemory,
          logStatements: logStatements,
        ));

  @override
  int get schemaVersion => 1;
}
