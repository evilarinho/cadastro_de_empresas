import 'package:cadastro_de_empresas/endereco.dart';
import 'package:cadastro_de_empresas/socio.dart';

class Empresa {
  String nomeEmpresa;
  String razaoSocial;
  String cnpj;
  String fone;
  Endereco endereco;
  Socio socio;
  DateTime horaRegistro;
  String uuid;
  Empresa({
    required this.nomeEmpresa,
    required this.razaoSocial,
    required this.cnpj,
    required this.fone,
    required this.endereco,
    required this.socio,
    required this.horaRegistro,
    required this.uuid,
  });

  String formatarCnpj() {
    if (cnpj.length == 14) {
      return ('${cnpj.substring(0, 2)}.${cnpj.substring(2, 5)}.${cnpj.substring(5, 8)}/${cnpj.substring(8, 12)}-${cnpj.substring(12, 14)}');
    } else {
      return "CNPJ com quantidade de digitos diferente de 14";
    }
  }
}



  








// ID, Razão Social, Nome Fantasia, CNPJ, Endereço (Logradouro, Número, Complemento, Bairro, Estado e CEP), Telefone, Horário do Cadastro e Sócio