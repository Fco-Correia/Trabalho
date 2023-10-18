class Genotype {
  final String genotype;

  Genotype(this.genotype) {
    final List<String> genotypes = ["AA", "Ai", "BB", "Bi", "AB", "ii"];
    if (!genotypes.contains(genotype)) {
      throw Exception();
    }
  }

  @override
  String toString() {
    return genotype;
  }

  String get bloodType {
    final Map<String, String> myMap = {
      "AA": "A",
      "Ai": "A",
      "BB": "B",
      "Bi": "B",
      "AB": "AB",
      "ii": "O",
    };
    return myMap[genotype]!;
  }

  List<String> get alleles {
    final List<String> alleleList = [];

    for (int i = 0; i < genotype.length; i++) {
      var allele = genotype[i];
      if (!alleleList.contains(allele)) {
        alleleList.add(allele);
      }
    }
    return alleleList;
  }

  List<String> get agglutinogens {
    final List<String> agglutinogensList = [];

    for (int i = 0; i < genotype.length; i++) {
      var agglutinogen = genotype[i];
      if (agglutinogen == 'A' || agglutinogen == 'B') {
        if (!agglutinogensList.contains(agglutinogen)) {
          agglutinogensList.add(agglutinogen);
        }
      }
    }
    return agglutinogensList;
  }

  List<String> get agglutinins {
    final List<String> agglutininsList = [];
    final List<String> options = ["A", "B"];
    if (genotype == "ii") {
      agglutininsList.addAll(options);
    } else if (genotype[0] == "A" && genotype[1] != "B") {
      agglutininsList.add(options[1]);
    } else if (genotype[0] == "B") {
      agglutininsList.add(options[0]);
    }
    return agglutininsList;
  }

  List<String> offsprings(Genotype otherGenotype) {
    List<String> offspringGenotypes = [];
    dynamic union;
    for (int i = 0; i < genotype.length; i++) {
      for (int j = 0; j < otherGenotype.genotype.length; j++) {
        union = genotype[i] + otherGenotype.genotype[j];
        if (union[0] == "i" && (union[1] == "A" || union[1] == "B")) {
          union = otherGenotype.genotype[j] + genotype[i];
        }
        if (union[0] == "B" && union[1] == "A") {
          union = otherGenotype.genotype[j] + genotype[i];
        }
        if (!offspringGenotypes.contains(union)) {
          offspringGenotypes.add(union);
        }
      }
    }

    return offspringGenotypes;
  }

  bool compatible(Genotype otherGenotype) {
    List<String> compatilbeA = ["A", "AB"];
    List<String> compatilbeB = ["B", "AB"];
    List<String> compatilbeAB = ["AB"];
    List<String> compatilbeO = ["A", "AB", "B", "O"];
    if (bloodType == "A") {
      if (compatilbeA.contains(otherGenotype.bloodType)) {
        return true;
      }
    } else if (bloodType == "B") {
      if (compatilbeB.contains(otherGenotype.bloodType)) {
        return true;
      }
    } else if (bloodType == "AB") {
      if (compatilbeAB.contains(otherGenotype.bloodType)) {
        return true;
      }
    } else if (bloodType == "O") {
      if (compatilbeO.contains(otherGenotype.bloodType)) {
        return true;
      }
    }
    return false;
  }
}
