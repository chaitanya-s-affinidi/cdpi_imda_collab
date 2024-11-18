// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verifiable_presentation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VerifiablePresentationImpl _$$VerifiablePresentationImplFromJson(
        Map<String, dynamic> json) =>
    _$VerifiablePresentationImpl(
      verifiableCredential: (json['verifiableCredential'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
    );

Map<String, dynamic> _$$VerifiablePresentationImplToJson(
        _$VerifiablePresentationImpl instance) =>
    <String, dynamic>{
      'verifiableCredential': instance.verifiableCredential,
    };
