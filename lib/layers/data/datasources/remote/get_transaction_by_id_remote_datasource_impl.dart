import 'dart:convert';
import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:zelenbank/core/errors/failures/generic_failure.dart';
import 'package:zelenbank/layers/data/datasources/get_transaction_by_id_datasource.dart';
import 'package:zelenbank/layers/domain/entities/transaction_entity.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/http_client/http_client_interface.dart';
import '../../../../core/utils/constants/api_endpoints_constants.dart';
import '../dtos/transaction_dto.dart';

class GetTransactionByIdRemoteDatasourceImpl
    implements GetTransactionByIdDatasource {
  final IHttpClient _httpClient;
  GetTransactionByIdRemoteDatasourceImpl(this._httpClient);

  @override
  Future<Either<Failure, TransactionEntity>> call(String id) async {
    try {
      final response = await _httpClient.get(
        url: '$kApiUrl/$kMyDtStatement/$id',
        header: {'Token': kApiToken},
      );

      if (response.statusCode == HttpStatus.ok) {
        final json = jsonDecode(response.body);

        final transaction = TransactionDto.fromMap(json);

        return Right(transaction);
      }

      return Left(GeneralFailure('Error'));
    } on Exception {
      return Left(GeneralFailure('Error'));
    }
  }
}
