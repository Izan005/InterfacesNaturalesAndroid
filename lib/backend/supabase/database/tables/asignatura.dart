import '../database.dart';

class AsignaturaTable extends SupabaseTable<AsignaturaRow> {
  @override
  String get tableName => 'Asignatura';

  @override
  AsignaturaRow createRow(Map<String, dynamic> data) => AsignaturaRow(data);
}

class AsignaturaRow extends SupabaseDataRow {
  AsignaturaRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => AsignaturaTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get nombre => getField<String>('nombre');
  set nombre(String? value) => setField<String>('nombre', value);

  int? get anioCarrera => getField<int>('anio_carrera');
  set anioCarrera(int? value) => setField<int>('anio_carrera', value);

  int? get carreraId => getField<int>('carrera_id');
  set carreraId(int? value) => setField<int>('carrera_id', value);
}
