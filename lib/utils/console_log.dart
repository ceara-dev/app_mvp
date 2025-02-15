import '../enum/mensagem_tipo_enum.dart';

class ConsoleLog {
  static void mensagem({
    required String titulo,
    required String mensagem,
    required MensagemTipo tipo,
  }) {
    String colorCode;
    String resetColor = '\x1B[0m';

    switch (tipo) {
      case MensagemTipo.SUCESSO:
        colorCode = '\x1B[32m';
        break;
      case MensagemTipo.ERROR:
        colorCode = '\x1B[31m';
        throw Exception('Error: $mensagem');
      case MensagemTipo.INFORMACAO:
        colorCode = '\x1B[34m';
        break;
      case MensagemTipo.ATENCAO:
        colorCode = '\x1B[33m';
        break;
    }

    print('$colorCode$titulo: $mensagem (${tipo.descricao})$resetColor');
  }
}
