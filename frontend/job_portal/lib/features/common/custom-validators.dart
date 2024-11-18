class RegexPatterns {
  String? name;
  String? reference;
  String? phone;
  String? number;
  String? text;
  String? licenseplate;
  String? website;

  RegexPatterns({
    this.name,
    this.reference,
    this.phone,
    this.number,
    this.text,
    this.licenseplate,
    this.website,
  });
}

class TextLengthPattern {
  int? minLength;
  int? maxLength;
  TextLengthPattern({
    this.minLength,
    this.maxLength,
  });
}

class TextLengthPatterns {
  TextLengthPattern? name;
  TextLengthPattern? reference;
  TextLengthPattern? licenseplate;
  TextLengthPattern? phone;
  TextLengthPattern? password;
  TextLengthPattern? description;
  TextLengthPattern? comments;
  TextLengthPattern? terms;
  TextLengthPattern? website;

  TextLengthPatterns({
    this.name,
    this.reference,
    this.licenseplate,
    this.phone,
    this.password,
    this.description,
    this.comments,
    this.terms,
    this.website,
  });
}

class CustomValidators {
  static final CustomValidators _customValidators =
      CustomValidators._internal();
  factory CustomValidators() {
    return _customValidators;
  }

  CustomValidators._internal() {}

  final RegexPatterns _patterns = RegexPatterns(
      // name: "^[a-zA-Z ]+$",
      // phone: "^[0-9]+$",
      // number: "^[+]?[0-9]+(\.[0-9]+)?$",
      // text: "^[a-zA-Z0-9 \(\)\.,&\'-\/\n]+$"
      name: "^[a-zA-Z ]+\$",
      reference: "^[a-zA-Z0-9\-\_]+\$",
      licenseplate: "^[a-zA-Z0-9 ]+\$",
      phone: "^[0-9]+\$",
      number: "^[0-9]*(\.\[0-9]+)?\$",
      website: "^[0-9]*(\.\[0-9]+)?\$",
      text: "^[a-zA-Z0-9 \(\)\.,&\'-\/\n]+\$");
  RegexPatterns get patterns => _patterns;
  final TextLengthPatterns _textlengths = TextLengthPatterns(
    name: TextLengthPattern(maxLength: 30),
    licenseplate: TextLengthPattern(maxLength: 11),
    phone: TextLengthPattern(
      maxLength: 14,
      minLength: 9,
    ),
    reference: TextLengthPattern(maxLength: 20, minLength: 4),
    password: TextLengthPattern(
      maxLength: 20,
      minLength: 6,
    ),
    website: TextLengthPattern(
      maxLength: 30,
      minLength: 5,
    ),
    description: TextLengthPattern(
      maxLength: 350,
    ),
    comments: TextLengthPattern(
      maxLength: 500,
    ),
    terms: TextLengthPattern(
      maxLength: 5000,
    ),
  );
  TextLengthPatterns get textlengths => _textlengths;
}
