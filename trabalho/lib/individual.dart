import './genotype.dart';

class Individual {
  final Genotype genotype;
  final String name;
  static int N = 1;

  Individual(String genotype, [String? name])
      : genotype = Genotype(genotype),
        name = name ?? "Indiv${N++}";

  @override
  String toString() {
    return "$name(${genotype.bloodType})";
  }
}
