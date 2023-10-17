import './genotype.dart';

class Individual {
  final Genotype genotype;
  final String nome;
  static int N = 1;

  Individual(String genotype, [String? nome])
      : genotype = Genotype(genotype),
        nome = nome ?? "Indiv${N++}";

  @override
  String toString() {
    return "$nome(${genotype.bloodType})";
  }
}
