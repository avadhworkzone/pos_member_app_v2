class ModelAddress {
  final String sTitle;
  final AddressDetails mAddressDetails;

  ModelAddress(this.sTitle, this.mAddressDetails);
}

class AddressDetails {
  String? sRecipientName;
  String? sPhoneNumber;
  String? sAddress;
  String? sPostcode;
  String? sState;

  AddressDetails({
    this.sRecipientName,
    this.sPhoneNumber,
    this.sAddress,
    this.sPostcode,
    this.sState,
  });
}
