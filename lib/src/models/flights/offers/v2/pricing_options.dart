class PricingOptions {
  /// Types of fare of the flight-offer
  final List<PricingOptionsFareType?>? fareType;

  /// If true, returns the flight-offers with included checked bags only
  final bool? includedCheckedBagsOnly;

  /// If true, returns the flight-offers with refundable fares only
  final bool? refundableFare;

  /// If true, returns the flight-offers with no restriction fares only
  final bool? noRestrictionFare;

  /// If true, returns the flight-offers with no penalty fares only
  final bool? noPenaltyFare;

  PricingOptions(
      {this.fareType,
      this.includedCheckedBagsOnly,
      this.refundableFare,
      this.noRestrictionFare,
      this.noPenaltyFare});

  PricingOptions.fromJson(Map<String, dynamic> json)
      : fareType = json['fareType'] == null
            ? null
            : (json['fareType'] as List)
                .map((e) => _getPricingOptionsFareType(e))
                .toList(),
        includedCheckedBagsOnly = json['includedCheckedBagsOnly'],
        refundableFare = json['refundableFare'],
        noRestrictionFare = json['noRestrictionFare'],
        noPenaltyFare = json['noPenaltyFare'];

  static PricingOptionsFareType? _getPricingOptionsFareType(String type) {
    for (PricingOptionsFareType fareType in PricingOptionsFareType.values) {
      if (fareType.toString().endsWith(type)) {
        return fareType;
      }
    }
    return null;
  }
}

enum PricingOptionsFareType { PUBLISHED, NEGOTIATED, CORPORATE }
