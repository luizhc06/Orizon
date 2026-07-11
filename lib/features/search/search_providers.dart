import 'package:flutter_riverpod/legacy.dart';

/// Tags ativas da sessão de busca atual. Compartilhado entre a tela de
/// busca e o viewer, para que uma tag tocada no viewer possa abrir uma
/// nova sessão ou entrar na sessão já em andamento sem duplicar estado.
final activeSearchTagsProvider = StateProvider<List<String>>((ref) => []);
