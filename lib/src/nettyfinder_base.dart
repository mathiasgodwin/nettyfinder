/// This is a callable class that basically detect the network
/// type based on the provided (Phone number). Works with only [Nigerian]
/// numbers atleast for now.
class NetworkTypeDetect {
  String number;
  NetworkTypeDetect(this.number);

  String? call() {
    this.number = this.number.trim();
    this._validateNumber();
    var phone_primary_prefix = this._getPhonePrefix();
    var phone_secondary_prefix = this._getPhonePrefix(length: 5);
    var networks = this._getNetworks();

    //
    if (networks["mtn"]!.contains(phone_primary_prefix)) {
      return "MTN";
    }

    if (networks["glo"]!.contains(phone_primary_prefix)) {
      return "GLO";
    }

    if (networks["9mobile"]!.contains(phone_primary_prefix)) {
      return "9mobile";
    }

    if (networks["airtel"]!.contains(phone_primary_prefix)) {
      return "Airtel";
    }

    if (networks["glo"]!.contains(phone_secondary_prefix) ||
        networks["starcomms"]!.contains(phone_primary_prefix)) {
      return "Starcomms";
    }

    if (networks["visafone"]!.contains(phone_secondary_prefix) ||
        networks["visafone"]!.contains(phone_primary_prefix)) {
      return "Visafone";
    }

    if (networks["multilinks"]!.contains(phone_primary_prefix) ||
        networks["multilinks"]!.contains(phone_secondary_prefix)) {
      return "Multilinks";
    }

    if (networks['zoom']!.contains(phone_primary_prefix)) {
      return "Zoom";
    }

    if (networks['ntel']!.contains(phone_primary_prefix)) {
      return "Ntel";
    }

    if (networks['smile']!.contains(phone_primary_prefix)) {
      return "Smile";
    }

    // Return null if number is valid but not recognized
    // The developer is left with what to `output to the user`
    return null;
  }

  /// Return list of available networks.
  /// You can extend this if you want.
  Map<String, List<String>> _getNetworks() {
    return {
      "9mobile": ["0809", "0909", "0817", "0818", "0908"],
      "mtn": [
        "0806",
        "0803",
        "0816",
        "0813",
        "0810",
        "0814",
        "0903",
        "0906",
        "0703",
        "0706",
      ],
      "glo": ["0805", "0705", "0905", "0807", "0815", "0811", "0915"],
      "airtel": ["0802", "0902", "0701", "0808", "0708", "0812", "0907"],
      "starcomms": ["07028", "07029", "0819"],
      "visafone": ["07025", "07026", "0704"],
      "multilinks": ["07027", "0709"],
      "zoom": ["0707"],
      "ntel": ["0804"],
      "smile": ["0702"],
    };
  }

  /// Return Phone number prefix
  String _getPhonePrefix({int? length}) {
    // Use 4 as defualt length if not specified
    length = length ?? 4;
    return this.number.substring(0, length);
  }

  /// This method basic does all the validation neccessary on a phone number
  bool _validateNumber() {
    // Check if it's an empty value
    if (this.number.isEmpty) {
      throw Exception('Invalid entry, enter a telephone number');
    }

    // Check if number contains unwanted characters
    if (this.number.substring(0, 4) != '+234' &&
        this.number.contains(RegExp(r"/[^0-9]/"))) {
      throw Exception('Number contains unwanted characters');
    }

    // Check if number is lesser than 11
    if (this.number.length < 11) {
      throw Exception('Number must bot be less than 11 digits');
    }

    // Check if number without +234 is greater than 11
    if (this.number.length > 11 && this.number.substring(0, 4) != '+234') {
      throw Exception('Number without +234 must not be greater than 11');
    }

    // Check if +234 number is less than 14 characters
    if (this.number.length < 14 && this.number.substring(0, 4) == '+234') {
      throw Exception('Number with +234 must be 14 characters long');
    }

    // Check if number with +234 is greater than 14 characters
    if (this.number.length > 14 && this.number.substring(0, 4) == '+234') {
      throw Exception(
          'Number with +234 must not be greater than 14 characters');
    }

    // Reformat the number into 08012345678 (11 digits) standard
    if (this.number.substring(0, 4) == '+234') {
      this.number = '0${this.number.substring(4, this.number.length)}';
    }

    // finally return true if validation passed
    return true;
  }
}
