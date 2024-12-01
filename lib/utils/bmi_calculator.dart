double calculateBMI(double weight, double heightCm) {
  double heightM = heightCm / 100;
  return weight / (heightM * heightM);
}
