import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/supabase/supabase.dart';
import '/auth/supabase_auth/auth_util.dart';

List<dynamic> removerDoCarrinho(
  List<dynamic> carrinho,
  String id,
) {
  return carrinho.where((item) => item['id'] != id).toList();
}

List<dynamic> alterarQuantidadeCarrinho(
  List<dynamic> carrinho,
  String id,
  String acao,
) {
  return carrinho.map((item) {
    if (item['id'] == id) {
      int novaQtd = item['quantidade'] ?? 1;
      if (acao == 'aumentar') {
        novaQtd++;
      } else if (acao == 'diminuir' && novaQtd > 1) {
        novaQtd--;
      }
      return {
        ...item,
        'quantidade': novaQtd,
      };
    }
    return item;
  }).toList();
}

double calcularSubtotal(
  double preco,
  int quantidade,
) {
  return preco * quantidade;
}
