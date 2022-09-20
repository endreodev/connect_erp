class IterfaceAtendimento {
  String? NUMATEND;
  String? CLIENTE;
  String? FILIALATENDIMENTO;
  String? DTFINALRESERVA;
  String? NOME;
  String? NUMERODOCHASSI;
  String? FILIAL;
  String? CODUSUARIO;
  String? COTACAO;
  String? LOJA;
  String? NOVALOJA;
  String? STATUS;
  String? TIPOSOLICIT;
  String? CHASSIINTERNO;
  String? NOMEUSR;
  String? OBS;
  String? NOVOCLIENTE;
  String? DTINCLUSAO;
  int? RECNO;
  String? MENSAGEM;

  IterfaceAtendimento(
      {this.NUMATEND,
      this.CLIENTE,
      this.FILIALATENDIMENTO,
      this.DTFINALRESERVA,
      this.NOME,
      this.NUMERODOCHASSI,
      this.FILIAL,
      this.CODUSUARIO,
      this.COTACAO,
      this.LOJA,
      this.NOVALOJA,
      this.STATUS,
      this.TIPOSOLICIT,
      this.CHASSIINTERNO,
      this.NOMEUSR,
      this.OBS,
      this.NOVOCLIENTE,
      this.DTINCLUSAO,
      this.RECNO});

  IterfaceAtendimento.fromJson(Map<String, dynamic> json) {
    NUMATEND = json['NUM_ATEND'];
    CLIENTE = json['CLIENTE'];
    FILIALATENDIMENTO = json['FILIAL_ATENDIMENTO'];
    DTFINALRESERVA = json['DT_FINAL_RESERVA'];
    NOME = json['NOME'];
    NUMERODOCHASSI = json['NUMERO_DO_CHASSI'];
    FILIAL = json['FILIAL'];
    CODUSUARIO = json['COD_USUARIO'];
    COTACAO = json['COTACAO'];
    LOJA = json['LOJA'];
    NOVALOJA = json['NOVA_LOJA'];
    STATUS = json['STATUS'];
    TIPOSOLICIT = json['TIPO_SOLICIT'];
    CHASSIINTERNO = json['CHASSI_INTERNO'];
    NOMEUSR = json['NOME_USR'];
    OBS = json['OBS'];
    NOVOCLIENTE = json['NOVO_CLIENTE'];
    DTINCLUSAO = json['DT_INCLUSAO'];
    RECNO = json['RECNO'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> iterfaceAtendimento = <String, dynamic>{};
    iterfaceAtendimento['NUM_ATEND'] = NUMATEND;
    iterfaceAtendimento['CLIENTE'] = CLIENTE;
    iterfaceAtendimento['FILIAL_ATENDIMENTO'] = FILIALATENDIMENTO;
    iterfaceAtendimento['DT_FINAL_RESERVA'] = DTFINALRESERVA;
    iterfaceAtendimento['NOME'] = NOME;
    iterfaceAtendimento['NUMERO_DO_CHASSI'] = NUMERODOCHASSI;
    iterfaceAtendimento['FILIAL'] = FILIAL;
    iterfaceAtendimento['COD_USUARIO'] = CODUSUARIO;
    iterfaceAtendimento['COTACAO'] = COTACAO;
    iterfaceAtendimento['LOJA'] = LOJA;
    iterfaceAtendimento['NOVA_LOJA'] = NOVALOJA;
    iterfaceAtendimento['STATUS'] = STATUS;
    iterfaceAtendimento['TIPO_SOLICIT'] = TIPOSOLICIT;
    iterfaceAtendimento['CHASSI_INTERNO'] = CHASSIINTERNO;
    iterfaceAtendimento['NOME_USR'] = NOMEUSR;
    iterfaceAtendimento['OBS'] = OBS;
    iterfaceAtendimento['NOVO_CLIENTE'] = NOVOCLIENTE;
    iterfaceAtendimento['DT_INCLUSAO'] = DTINCLUSAO;
    iterfaceAtendimento['RECNO'] = RECNO;
    return iterfaceAtendimento;
  }
}
