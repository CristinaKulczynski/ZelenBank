import 'dart:convert';
import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:zelenbank/core/errors/failures/generic_failure.dart';
import 'package:zelenbank/core/http_client/http_client_interface.dart';
import 'package:zelenbank/core/utils/constants/api_endpoints_constants.dart';
import 'package:zelenbank/layers/data/datasources/get_current_balance_datasource.dart';

import '../../../../core/errors/failure.dart';

class GetCurrentBalanceRemoteDatasourceImpl
    implements GetCurrentBalanceDatasource {
  final IHttpClient _httpClient;
  GetCurrentBalanceRemoteDatasourceImpl(this._httpClient);

  @override
  Future<Either<Failure, double>> call() async {
    try {
      final response = await _httpClient.get(
        url: '$kApiUrl/$kMyBalance',
        header: {'Token': kApiToken},
      );

      if (response.statusCode == HttpStatus.ok) {
        final json = jsonDecode(response.body);

        final currentBalance = json['amount'].toDouble();

        return Right(currentBalance);
      }
      return Left(GeneralFailure('Error'));
    } on Exception {
      return Left(GeneralFailure('Error'));
    }
  }
}
