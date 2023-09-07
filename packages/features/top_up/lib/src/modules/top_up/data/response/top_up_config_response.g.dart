// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'top_up_config_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TopUpConfigResponse _$TopUpConfigResponseFromJson(Map<String, dynamic> json) =>
    TopUpConfigResponse(
      topUpSuggestions: (json['topupSuggestions'] as List<dynamic>)
          .map((e) =>
              TopUpAmountSuggestionResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      minTopUpAmount: (json['minTopupAmount'] as num).toDouble(),
      maxTopUpAmount: (json['maxTopupAmount'] as num).toDouble(),
    );
