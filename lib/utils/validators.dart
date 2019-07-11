class Validators {
  get validateTagName => (String name) {
        if (name.isEmpty) {
          return 'Please enter tag category name';
        }
      };
}
