class LocalDeDoacao {
  final String nome;
  final String logradouro;
  final String bairro;
  final String cidade;
  final String uf;
  final String telefone;
  final double latitude;
  final double longitude;

  LocalDeDoacao(
      this.nome, this.logradouro, this.bairro, this.cidade, this.uf, this.telefone, this.latitude, this.longitude);

  String telefoneSemSimbolos() => telefone.replaceAll("(", "").replaceAll(")", "").replaceAll("-", "");

  String shareText() => "**$nome**\n\nEndereço:$logradouro. $bairro. $cidade - $uf\nTelefone: $telefone";
}

final locaisDeDoacao = [
  LocalDeDoacao("Hemocentro da Paraíba", "Av. Dom Pedro II, 1119", "Torre", "João Pessoa", "PB", "(83) 3218-7600",
      -7.127263, -34.870618),
  LocalDeDoacao("Hemocentro de Campina Grande", "Rua Eutécio Vital de Ribeiro, S/N", "Catolé", "Campina Grande", "PB",
      "(83) 3310-7130", -7.239702, -35.872651),
  LocalDeDoacao("Hemonúcleo de Piancó", "Rua Luiz R. Ferreira, S/N", "Ouro Branco", "Piancó", "PB", "(83) 3452-2733",
      -7.197863, -37.923190),
  LocalDeDoacao("Hemonúcleo de Monteiro", "Rua Epaminondas Azevedo, S/N", "Centro", "Monteiro", "PB", "(83) 3351-2201",
      -7.893140, -37.120520),
  LocalDeDoacao("Hemonúcleo de Picuí", "Rua Lázaro J. Estrela, S/N", "Monte Santo", "Picuí", "PB", "(83) 3371-2554",
      -6.510439, -36.352257),
  LocalDeDoacao("Hemonúcleo de Patos", "Rua Juvenal Ledo, S/N", "Belo Horizonte", "Patos", "PB", "(83) 3421-4918",
      -7.016787, -37.281805),
  LocalDeDoacao("Hemonúcleo de Itaporanga", "Rua Oswaldo Cruz, S/N", "Centro", "Itaporanga", "PB", "(83) 3451-3819",
      -7.306844, -38.153648),
  LocalDeDoacao("Hemonúcleo de Cajazeiras", "Rua José de Alencar, S/N", "Centro", "Cajazeiras", "PB", "(83) 3531-5862",
      -6.884353, -38.554848),
  LocalDeDoacao("Hemonúcleo de Guarabira", "Av. Prefeito João P. Filho, 447", "Centro", "Guarabira", "PB", "(83) 3271-3610",
      -6.848927, -35.488844),
  LocalDeDoacao("Hemonúcleo de Catolé do Rocha", "Av. Castelo Branco, 309", "Batalhão", "Catolé do Rocha", "PB",
      "(83) 3441-2281", -6.351816, -37.749504),
  LocalDeDoacao("Hemonúcleo de Princesa Isabel", "Rua Alameda das Acácias, S/N", "A. Cascavel", "Princesa Isabel", "PB",
      "(83) 3457-2826", -7.736098, -37.978635),
  LocalDeDoacao("Hemonúcleo de Sousa", "Rua José Facundo de Lima, S/N", "Bancários", "Sousa", "PB", "(83) 3522-2774",
      -6.764459, -38.220350),
];
