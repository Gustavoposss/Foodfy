import '../database.dart';

class PedidosTable extends SupabaseTable<PedidosRow> {
  @override
  String get tableName => 'pedidos';

  @override
  PedidosRow createRow(Map<String, dynamic> data) => PedidosRow(data);
}

class PedidosRow extends SupabaseDataRow {
  PedidosRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => PedidosTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  String? get enderecoEntrega => getField<String>('endereco_entrega');
  set enderecoEntrega(String? value) =>
      setField<String>('endereco_entrega', value);

  String get tipoEntrega => getField<String>('tipo_entrega')!;
  set tipoEntrega(String value) => setField<String>('tipo_entrega', value);

  String get status => getField<String>('status')!;
  set status(String value) => setField<String>('status', value);

  String get metodoPagamento => getField<String>('metodo_pagamento')!;
  set metodoPagamento(String value) =>
      setField<String>('metodo_pagamento', value);

  double get total => getField<double>('total')!;
  set total(double value) => setField<double>('total', value);

  DateTime? get criadoEm => getField<DateTime>('criado_em');
  set criadoEm(DateTime? value) => setField<DateTime>('criado_em', value);
}
