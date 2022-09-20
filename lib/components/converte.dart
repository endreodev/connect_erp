class Convert {
  Convert();

  convertNumber(String string) {
    String monta1 = '';
    String monta2 = '';
    String cString = '';

    string = string.replaceAll(',', '.');

    if (string.isNotEmpty) {
      double novoValor = double.parse(string.toString());

      cString = novoValor.toStringAsFixed(2).toString();

      cString = cString.replaceAll('.', ',');

      if (cString.length == 7) {
        monta1 = cString;
        monta2 = cString;

        cString = monta1.substring(0, 1) + '.' + monta2.substring(1);
      } else if (cString.length == 8) {
        monta1 = cString;
        monta2 = cString;

        cString = monta1.substring(0, 2) + '.' + monta2.substring(2);
      } else if (cString.length == 9) {
        monta1 = cString;
        monta2 = cString;

        cString = monta1.substring(0, 3) + '.' + monta2.substring(3);
      }

      return cString.toString();
    } else {
      return string;
    }
  }
}
