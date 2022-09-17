class Endereco {
  String logradoro;
  String numero;
  String complemento;
  String bairro;
  String estado;
  String cep;
  Endereco({
    required this.logradoro,
    required this.numero,
    required this.complemento,
    required this.bairro,
    required this.estado,
    required this.cep,
  });

  String formatarCep() {
    if (cep.length == 8) {
      return ('${cep.substring(0, 5)}-${cep.substring(5, 8)}');
    }
    return "CEP com quantidade de dígitos diferente de 8";
  }
}





//Logradouro, Número, Complemento, Bairro, Estado e CEP