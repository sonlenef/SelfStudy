enum FormType {
  vocabulary('Vocabulary'),
  test('Quiz test');

  const FormType(this.label);
  final String label;
}