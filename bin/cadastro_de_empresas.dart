import 'dart:io';
import 'package:cadastro_de_empresas/cadastro.dart';

void main(List<String> arguments) {
  Cadastro cad = Cadastro();
  while (true) {
    print('1 - Incluir uma empresa');
    print('2 - Pesquisar uma empresa pelo CNPJ');
    print('3 - Pesquisar uma empresa pelo CPF do sócio');
    print('4 - Listar empresas em ordem alfabética da Razão Social');
    print('5 - Excluir uma empresa (por CNPJ)');
    print('0 - Sair.');

    int op = int.parse(stdin.readLineSync()!);
    if (op == 0) {
      print('Obrigado por utilizar nosso sistema de cadastro de empresas.');
      break;
    }
    switch (op) {
      case 1:
        cad.incluirEmpresa();
        break;
      case 2:
        cad.pesquisarEmpresaPorCnpj();
        break;
      case 3:
        cad.pesquisarEmpresaPorNumeroRegistroSocio();
        break;
      case 4:
        cad.imprimirEmpresasPorRazaoSocial();
        break;
      case 5:
        cad.excluirEmpresaPorCnpj();
        break;
      default:
        print('Opção inválida. Informe um número de 0 a 5.');
    }
  }
}
