import '../database.dart';

class UsuarioAsignaturaTable extends SupabaseTable<UsuarioAsignaturaRow> {
  @override
  String get tableName => 'UsuarioAsignatura';

  @override
  UsuarioAsignaturaRow createRow(Map<String, dynamic> data) =>
      UsuarioAsignaturaRow(data);
}

class UsuarioAsignaturaRow extends SupabaseDataRow {
  UsuarioAsignaturaRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UsuarioAsignaturaTable();

  int get usuarioId => getField<int>('usuario_id')!;
  set usuarioId(int value) => setField<int>('usuario_id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int get asignaturaId => getField<int>('asignatura_id')!;
  set asignaturaId(int value) => setField<int>('asignatura_id', value);

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);
}
