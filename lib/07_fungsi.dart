void main() {
  var list = ["IRVAN", "DANI", "WAHYU", "RAMADHAN"];
  // Cetak element list
  list.forEach((item) {
    print("${list.indexOf(item) + 1}. $item");
  });
}
