class AtendimentoItem {
  String? STATUS;
  String? MENSAGEM;

  AtendimentoItem({
    this.STATUS,
    this.MENSAGEM,
  });

  AtendimentoItem.fromJson(Map<String, dynamic> json) {
    STATUS = json['STATUS'];
    MENSAGEM = json['MENSAGEM'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> AtendimentoItem = <String, dynamic>{};
    AtendimentoItem['STATUS'] = STATUS;
    AtendimentoItem['MENSAGEM'] = MENSAGEM;
    return AtendimentoItem;
  }
}
