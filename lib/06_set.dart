void main() {
  // Deklarasi dan inisialisasi set
  var set1 = {"BAGUS", "IRVAN", "DANI", "MUHAMMAD"};
  print("Set 1: $set1");
  var set2 = {"IRVAN", "WAHYU", "RAMADHAN", "DIKKY"};
  print("Set 2: $set2");
  // Gabungkan set1 dan set2
  var set3 = set1.union(set2);
  print("Set 3: $set3");
  // Irisan set1 dan set2
  var set4 = set1.intersection(set2);
  print("Set 4: $set4");
  // Selisih set1 dan set2
  var set5 = set1.difference(set2);
  print("Set 5: $set5");
}
