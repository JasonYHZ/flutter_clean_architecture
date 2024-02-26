// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database_impl.dart';

// ignore_for_file: type=lint
abstract class _$DatabaseImpl extends GeneratedDatabase {
  _$DatabaseImpl(QueryExecutor e) : super(e);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [];
}
