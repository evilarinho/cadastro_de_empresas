import 'package:cadastro_de_empresas/endereco.dart';

abstract class Socio {
  //Attributes:
  String tipoSocio;
  String nome;
  String numeroRegistro;
  Endereco endereco;
  Socio({
    required this.tipoSocio,
    required this.nome,
    required this.numeroRegistro,
    required this.endereco,
  });

  Object? get razaoSocial => null;

  String formatarNumeroRegistro() {
    if (numeroRegistro.length == 14) {
      return ('${numeroRegistro.substring(0, 2)}.${numeroRegistro.substring(2, 5)}.${numeroRegistro.substring(5, 8)}/${numeroRegistro.substring(8, 12)}-${numeroRegistro.substring(12, 14)}');
    } else if (numeroRegistro.length == 11) {
      return ('${numeroRegistro.substring(0, 3)}.${numeroRegistro.substring(3, 6)}.${numeroRegistro.substring(6, 9)}-$numeroRegistro.substring(9, 11)}');
    } else {
      return "Quantidade de digitos do CNPJ diferente de 14 ou quantidade de digitos do CPF diferente de 11";
    }
  }
}
