import '../database.dart';

class NotaTable extends SupabaseTable<NotaRow> {
  @override
  String get tableName => 'Nota';

  @override
  NotaRow createRow(Map<String, dynamic> data) => NotaRow(data);
}

class NotaRow extends SupabaseDataRow {
  NotaRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => NotaTable();

  int get matriculaId => getField<int>('matricula_id')!;
  set matriculaId(int value) => setField<int>('matricula_id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get nota => getField<int>('nota');
  set nota(int? value) => setField<int>('nota', value);
}
