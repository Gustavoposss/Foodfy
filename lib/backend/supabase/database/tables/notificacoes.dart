import '../database.dart';

class NotificacoesTable extends SupabaseTable<NotificacoesRow> {
  @override
  String get tableName => 'notificacoes';

  @override
  NotificacoesRow createRow(Map<String, dynamic> data) => NotificacoesRow(data);
}

class NotificacoesRow extends SupabaseDataRow {
  NotificacoesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => NotificacoesTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  bool? get receberPush => getField<bool>('receber_push');
  set receberPush(bool? value) => setField<bool>('receber_push', value);
}
