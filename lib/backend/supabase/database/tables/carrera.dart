import '../database.dart';

class CarreraTable extends SupabaseTable<CarreraRow> {
  @override
  String get tableName => 'Carrera';

  @override
  CarreraRow createRow(Map<String, dynamic> data) => CarreraRow(data);
}

class CarreraRow extends SupabaseDataRow {
  CarreraRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => CarreraTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String get nombre => getField<String>('nombre')!;
  set nombre(String value) => setField<String>('nombre', value);
}
