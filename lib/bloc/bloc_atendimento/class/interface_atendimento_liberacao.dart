class InterfaceAtendimentoLiberacao {
  String? STATUS;
  String? MENSAGEM;

  InterfaceAtendimentoLiberacao({this.STATUS, this.MENSAGEM});

  InterfaceAtendimentoLiberacao.fromJson(Map<String, dynamic> json) {
    STATUS = json['STATUS'];
    MENSAGEM = json['MENSAGEM'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['STATUS'] = STATUS;
    data['MENSAGEM'] = MENSAGEM;
    return data;
  }
}
