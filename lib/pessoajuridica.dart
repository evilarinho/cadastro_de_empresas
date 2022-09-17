import 'package:cadastro_de_empresas/socio.dart';

class PessoaJuridica extends Socio {
  @override
  //{String razaoSocial};
  PessoaJuridica({
    required super.tipoSocio,
    required super.nome,
    required super.numeroRegistro,
    required super.endereco,
  });
}
