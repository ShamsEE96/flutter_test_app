class RegularEx {
  RegExp _email = new RegExp(
      r"^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))$");

  RegExp get email => _email;
  RegExp _ipv4Maybe =
      new RegExp(r'^(\d?\d?\d)\.(\d?\d?\d)\.(\d?\d?\d)\.(\d?\d?\d)$');
  RegExp _ipv6 =
      new RegExp(r'^::|^::1|^([a-fA-F0-9]{1,4}::?){1,7}([a-fA-F0-9]{1,4})$');

  RegExp _surrogatePairsRegExp = new RegExp(r'[\uD800-\uDBFF][\uDC00-\uDFFF]');

  RegExp _alpha = new RegExp(r'^[a-zA-Z]+$');
  static RegExp _alphanumeric = new RegExp(r'^[a-zA-Z0-9]+$');
  RegExp _numeric = new RegExp(r'^-?[0-9]+$');
  RegExp _int = new RegExp(r'^(?:-?(?:0|[1-9][0-9]*))$');
  RegExp _float =
      new RegExp(r'^(?:-?(?:[0-9]+))?(?:\.[0-9]*)?(?:[eE][\+\-]?(?:[0-9]+))?$');
  RegExp _hexadecimal = new RegExp(r'^[0-9a-fA-F]+$');
  RegExp _hexcolor = new RegExp(r'^#?([0-9a-fA-F]{3}|[0-9a-fA-F]{6})$');

  RegExp _base64 = new RegExp(
      r'^(?:[A-Za-z0-9+\/]{4})*(?:[A-Za-z0-9+\/]{2}==|[A-Za-z0-9+\/]{3}=|[A-Za-z0-9+\/]{4})$');

  RegExp _creditCard = new RegExp(
      r'^(?:4[0-9]{12}(?:[0-9]{3})?|5[1-5][0-9]{14}|6(?:011|5[0-9][0-9])[0-9]{12}|3[47][0-9]{13}|3(?:0[0-5]|[68][0-9])[0-9]{11}|(?:2131|1800|35\d{3})\d{11})$');

  RegExp _isbn10Maybe = new RegExp(r'^(?:[0-9]{9}X|[0-9]{10})$');
  RegExp _isbn13Maybe = new RegExp(r'^(?:[0-9]{13})$');

  Map _uuid = {
    '3': new RegExp(
        r'^[0-9A-F]{8}-[0-9A-F]{4}-3[0-9A-F]{3}-[0-9A-F]{4}-[0-9A-F]{12}$'),
    '4': new RegExp(
        r'^[0-9A-F]{8}-[0-9A-F]{4}-4[0-9A-F]{3}-[89AB][0-9A-F]{3}-[0-9A-F]{12}$'),
    '5': new RegExp(
        r'^[0-9A-F]{8}-[0-9A-F]{4}-5[0-9A-F]{3}-[89AB][0-9A-F]{3}-[0-9A-F]{12}$'),
    'all': new RegExp(
        r'^[0-9A-F]{8}-[0-9A-F]{4}-[0-9A-F]{4}-[0-9A-F]{4}-[0-9A-F]{12}$')
  };

  RegExp _multibyte = new RegExp(r'[^\x00-\x7F]');
  RegExp _ascii = new RegExp(r'^[\x00-\x7F]+$');
  RegExp _fullWidth = new RegExp(
      r'[^\u0020-\u007E\uFF61-\uFF9F\uFFA0-\uFFDC\uFFE8-\uFFEE0-9a-zA-Z]');
  RegExp _halfWidth = new RegExp(
      r'[\u0020-\u007E\uFF61-\uFF9F\uFFA0-\uFFDC\uFFE8-\uFFEE0-9a-zA-Z]');

  static RegExp _textWithoutSpecialCharacter = new RegExp(
      '[a-zA-Z |0-9|\u0621-\u064A\u0660-\u0669|\dåäöÅÄÖ|\dğüşöçİĞÜŞÖÇ|\s ]');

  RegExp get ipv4Maybe => _ipv4Maybe;

  RegExp get halfWidth => _halfWidth;

  RegExp get fullWidth => _fullWidth;

  RegExp get ascii => _ascii;

  RegExp get multibyte => _multibyte;

  Map get uuid => _uuid;

  RegExp get isbn13Maybe => _isbn13Maybe;

  RegExp get isbn10Maybe => _isbn10Maybe;

  RegExp get creditCard => _creditCard;

  RegExp get base64 => _base64;

  RegExp get hexcolor => _hexcolor;

  RegExp get hexadecimal => _hexadecimal;

  RegExp get float => _float;

  RegExp get int => _int;

  RegExp get numeric => _numeric;

  static RegExp get alphanumeric => _alphanumeric;

  RegExp get alpha => _alpha;

  RegExp get surrogatePairsRegExp => _surrogatePairsRegExp;

  RegExp get ipv6 => _ipv6;

  static RegExp get textWithoutSpecialCharacter => _textWithoutSpecialCharacter;
}
