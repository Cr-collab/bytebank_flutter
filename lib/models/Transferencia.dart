class Transferencia {
  final double value;
  final int accountNumber;

  Transferencia(this.value, this.accountNumber);

  @override
  String toString() {
    // TODO: implement toString
    return 'Transferencia { valor : $value , accountNumber : $accountNumber }';
  }
}
