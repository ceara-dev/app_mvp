enum MensagemTipo {
  SUCESSO,
  ERROR,
  INFORMACAO,
  ATENCAO,
}

extension MensagemTipoExtensao on MensagemTipo {
  String get descricao {
    switch (this) {
      case MensagemTipo.SUCESSO:
        return 'Sucesso';
      case MensagemTipo.ERROR:
        return 'Error';
      case MensagemTipo.INFORMACAO:
        return 'Informação';
      case MensagemTipo.ATENCAO:
        return 'Atenção';
    }
  }
}
