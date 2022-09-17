import 'dart:io';
import 'package:cadastro_de_empresas/endereco.dart';
import 'package:cadastro_de_empresas/empresa.dart';
import 'package:cadastro_de_empresas/pessoajuridica.dart';
import 'package:cadastro_de_empresas/pessoafisica.dart';
import 'package:cadastro_de_empresas/socio.dart';
import 'package:uuid/uuid.dart';

class Cadastro {
  List<Empresa> empresas = [];

  void incluirEmpresa() {
    final uuid = Uuid().v1();
    print('Digite o nome da empresa:');
    String nomeEmpresa = stdin.readLineSync()!;
    print('Digita a razão social da empresa:');
    String razaoSocial = stdin.readLineSync()!;
    print('Digite o CNPJ da empresa (somente números):');
    String cnpj = stdin.readLineSync()!;
    print('Digite o telefone da empresa (somente números):');
    String fone = stdin.readLineSync()!;
    print('Digite o nome da rua do endereço da empresa:');
    String rua = stdin.readLineSync()!;
    print('Digite o número da rua da empresa:');
    String numero = stdin.readLineSync()!;
    print('Digite o complemento do endereço da empresa:');
    String complemento = stdin.readLineSync()!;
    print('Digite o bairro do endereço da empresa:');
    String bairro = stdin.readLineSync()!;
    print('Digite o estado do endereço da empresa:');
    String estado = stdin.readLineSync()!;
    print('Digite o CEP do endereço da empresa (somente números):');
    String cep = stdin.readLineSync()!;

    Endereco empresaEndereco = Endereco(
        logradoro: rua,
        numero: numero,
        complemento: complemento,
        bairro: bairro,
        estado: estado,
        cep: cep);

    final horaRegistro = DateTime.now();

    //socio:
    Socio socio;
    String razaoSocialSocio = '';
    String tipoSocio;

    while (true) {
      print('Digite o tipo de sócio (1-Pessoa Física ou 2-Pessoa Jurídica):');
      String tipoSocioStr = stdin.readLineSync()!;
      if (tipoSocioStr == "1" || tipoSocioStr == "2") {
        tipoSocio = tipoSocioStr;
        break;
      }
      print("Favor informar apenas 1 ou 2 para o tipo de sócio(a)");
    }

    print('Digite o nome do sócio:');
    String socioNome = stdin.readLineSync()!;
    if (tipoSocio == '2') {
      print('Digite a razão social da empresa sócia:');
      razaoSocialSocio = stdin.readLineSync()!;
    }
    print('Digite o número do registro do sócio (somente números):');
    String numeroRegistroSocio = stdin.readLineSync()!;
    print('Digita a rua do endereço do sócio:');
    String ruaSocio = stdin.readLineSync()!;
    print('Digite o número da rua do endereço do sócio:');
    String numeroRuaSocio = stdin.readLineSync()!;
    print('Digite o complento do endereço do sócio:');
    String complementoEnderecoSocio = stdin.readLineSync()!;
    print('Digite o bairro do endereço do sócio:');
    String bairroSocio = stdin.readLineSync()!;
    print('Digite o estado do endereço do sócio:');
    String estadoEnderecoSocio = stdin.readLineSync()!;
    print('Digite o CEP do endereco do sócio (somente números):');
    String cepEnderecosocio = stdin.readLineSync()!;

    Endereco socioEndereco = Endereco(
        logradoro: ruaSocio,
        numero: numeroRuaSocio,
        complemento: complementoEnderecoSocio,
        bairro: bairroSocio,
        estado: estadoEnderecoSocio,
        cep: cepEnderecosocio);

    if (tipoSocio == "2") {
      socio = PessoaJuridica(
          tipoSocio: tipoSocio,
          nome: socioNome,
          numeroRegistro: numeroRegistroSocio,
          endereco: socioEndereco);
    } else {
      socio = PessoaFisica(
          tipoSocio: tipoSocio,
          nome: socioNome,
          numeroRegistro: numeroRegistroSocio,
          endereco: socioEndereco);
    }

    Empresa empresa = Empresa(
        nomeEmpresa: nomeEmpresa,
        razaoSocial: razaoSocial,
        cnpj: cnpj,
        fone: fone,
        endereco: empresaEndereco,
        socio: socio,
        horaRegistro: horaRegistro,
        uuid: uuid);

    empresas.add(empresa);
  }

//
  void pesquisarEmpresaPorCnpj() {
    print(
        'Digite o número do CNPJ para para pesquisar a empresa cadastrada (somente números):');
    String pesquisaCNPJ = stdin.readLineSync()!;
    final empresa =
        empresas.firstWhere((element) => element.cnpj == pesquisaCNPJ);
    print('''Empresa Cadastrada: \n
        ID: ${empresa.uuid} \n
        CNPJ: ${empresa.formatarCnpj()} \n
        Nome: ${empresa.nomeEmpresa} \n
        Razão Social: ${empresa.razaoSocial} \n
        Telefone: ${empresa.fone} \n
        Endereço da Empresa: ${empresa.endereco.logradoro}. ${empresa.endereco.numero},
        ${empresa.endereco.complemento}, ${empresa.endereco.bairro}, 
        ${empresa.endereco.estado}, ${empresa.endereco.formatarCep()} \n
        Data/Hora do registro: ${empresa.horaRegistro}
        ''');
  }

  void pesquisarEmpresaPorNumeroRegistroSocio() {
    print(
        'Digite o número de registro do sócio para pesquisar a empresa cadastrada (somente números):');
    String pesquisaNumeroRegistroSocio = stdin.readLineSync()!;

    final socio = empresas.firstWhere((element) =>
        element.socio.numeroRegistro == pesquisaNumeroRegistroSocio);
    print('''Empresa Cadastrada: \n
        ID: ${socio.uuid} \n
        CNPJ: ${socio.cnpj} \n
        Name: ${socio.nomeEmpresa} \n
        Razão Social: ${socio.razaoSocial}
        Telefone: ${socio.fone} \n
        Endereço da Empresa: ${socio.endereco.logradoro}. ${socio.endereco.numero}, ${socio.endereco.complemento}, ${socio.endereco.bairro}, 
        ${socio.endereco.estado}, ${socio.endereco.formatarCep()}, \n
        Sócio: \n Tipo de Sócio: ${socio.socio.tipoSocio}, \n
        CPF:  ${socio.socio.formatarNumeroRegistro()}, \n
        Nome: ${socio.socio.nome}, \n
        ${socio.socio.tipoSocio == '2' ? 'Razão Social: ${socio.socio.razaoSocial}' : ''}, \n
        Endereço do Sócio: ${socio.socio.endereco.logradoro}.
        ${socio.socio.endereco.numero}, ${socio.socio.endereco.complemento},
        ${socio.socio.endereco.bairro}, ${socio.socio.endereco.estado},
        ${socio.socio.endereco.formatarCep()}, \n
        Hora Registro: ${socio.horaRegistro}
     ''');
  }

  void imprimirEmpresasPorRazaoSocial() {
    for (var i = 0; i < empresas.length; i++) {
      empresas.sort((a, b) => a.nomeEmpresa.compareTo(b.nomeEmpresa));
      print('''Listagem das empresas por ordem alfabética da razão socioal: \n
          ID: ${empresas[i].uuid} \n
          Número do registro: ${empresas[i].formatarCnpj()} \n
          Nome: ${empresas[i].nomeEmpresa} \n
          Razão Social: ${empresas[i].razaoSocial} 
          Telefone: ${empresas[i].fone} \n
          Endereço da empresa: \n
          ${empresas[i].endereco.logradoro}.
          ${empresas[i].endereco.numero},
          ${empresas[i].endereco.complemento},
          ${empresas[i].endereco.bairro},
          ${empresas[i].endereco.estado},
          ${empresas[i].endereco.formatarCep()}
          Sócio: \n
          Número de Registro:  ${empresas[i].socio.formatarNumeroRegistro()} \n
          Nome: ${empresas[i].socio.nome} \n
          ${empresas[i].socio.tipoSocio == '2' ? 'Razão Social: ${empresas[i].socio.razaoSocial}' : ''} 
          Endereço do Sócio: ${empresas[i].endereco.logradoro}. ${empresas[i].endereco.numero}, ${empresas[i].endereco.complemento}, ${empresas[i].endereco.bairro}, ${empresas[i].endereco.estado}, ${empresas[i].endereco.formatarCep()} 
          Data/Hora do Registro: ${empresas[i].horaRegistro}
      ''');
    }
  }

  void excluirEmpresaPorCnpj() {
    print('Digite o CNPJ para exclusão da empresa (somente números):');
    String pesquisaCnpj = stdin.readLineSync()!;
    final empresa =
        empresas.firstWhere((element) => element.cnpj == pesquisaCnpj);
    print(' A empresa ${empresa.nomeEmpresa} foi excluída com sucesso.');
    empresas.remove(empresa);
  }
}
