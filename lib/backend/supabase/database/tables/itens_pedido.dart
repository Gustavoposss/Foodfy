import '../database.dart';

class ItensPedidoTable extends SupabaseTable<ItensPedidoRow> {
  @override
  String get tableName => 'itens_pedido';

  @override
  ItensPedidoRow createRow(Map<String, dynamic> data) => ItensPedidoRow(data);
}

class ItensPedidoRow extends SupabaseDataRow {
  ItensPedidoRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ItensPedidoTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String? get pedidoId => getField<String>('pedido_id');
  set pedidoId(String? value) => setField<String>('pedido_id', value);

  String? get produtoId => getField<String>('produto_id');
  set produtoId(String? value) => setField<String>('produto_id', value);

  int get quantidade => getField<int>('quantidade')!;
  set quantidade(int value) => setField<int>('quantidade', value);

  String? get observacao => getField<String>('observacao');
  set observacao(String? value) => setField<String>('observacao', value);

  double get subtotal => getField<double>('subtotal')!;
  set subtotal(double value) => setField<double>('subtotal', value);
}
