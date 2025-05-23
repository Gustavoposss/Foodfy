import '../database.dart';

class ProdutosTable extends SupabaseTable<ProdutosRow> {
  @override
  String get tableName => 'produtos';

  @override
  ProdutosRow createRow(Map<String, dynamic> data) => ProdutosRow(data);
}

class ProdutosRow extends SupabaseDataRow {
  ProdutosRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ProdutosTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String get nome => getField<String>('nome')!;
  set nome(String value) => setField<String>('nome', value);

  String? get descricao => getField<String>('descricao');
  set descricao(String? value) => setField<String>('descricao', value);

  double get preco => getField<double>('preco')!;
  set preco(double value) => setField<double>('preco', value);

  String? get imagemUrl => getField<String>('imagem_url');
  set imagemUrl(String? value) => setField<String>('imagem_url', value);

  String? get categoria => getField<String>('categoria');
  set categoria(String? value) => setField<String>('categoria', value);

  bool? get disponivel => getField<bool>('disponivel');
  set disponivel(bool? value) => setField<bool>('disponivel', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);
}
