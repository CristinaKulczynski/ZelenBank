import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:zelenbank/core/http_client/http_client.dart';
import 'package:mocktail/mocktail.dart';
import 'package:zelenbank/core/utils/constants/api_endpoints_constants.dart';
import 'package:zelenbank/layers/data/datasources/remote/get_transaction_list_remote_datasource_impl.dart';

import '../../../../fixtures/fixture_reader.dart';

class MockHttpClient extends Mock implements http.Client {}

void main() {
  late MockHttpClient mockHttpClient;
  late HttpClient httpClientModel;
  late GetTransactionListRemoteDatasourceImpl
      getTransactionListRemoteDatasourceImpl;

  setUp(() {
    mockHttpClient = MockHttpClient();
    httpClientModel = HttpClient(mockHttpClient);
    getTransactionListRemoteDatasourceImpl =
        GetTransactionListRemoteDatasourceImpl(httpClientModel);
  });

  const int tPageNumber = 0;

  group('get_transaction_list_remote_datasource', () {
    test('Should return a TransactionEntity List if the response is 200',
        () async {
      // arrange
      when(
        () => mockHttpClient.get(
            Uri.parse('$kApiUrl/$kMyStatement/$kRequestNumber/$tPageNumber'),
            headers: {'Token': kApiToken}),
      ).thenAnswer(
          (_) async => http.Response(fixture('transaction_list.json'), 200));

      // act
      final result = await getTransactionListRemoteDatasourceImpl(tPageNumber);

      // assert
      expect(result, isA<Right>());
    });

    test('Should return a Failure if the response is different than 200',
        () async {
      // arrange
      when(
        () => mockHttpClient.get(
            Uri.parse('$kApiUrl/$kMyStatement/$kRequestNumber/$tPageNumber'),
            headers: {'Token': kApiToken}),
      ).thenAnswer(
          (_) async => http.Response(fixture('transaction_list.json'), 404));

      // act
      final result = await getTransactionListRemoteDatasourceImpl(tPageNumber);

      // assert
      expect(result, isA<Left>());
    });

    test('Should return a Failure if an Exception is thrown', () async {
      // arrange
      when(
        () => mockHttpClient.get(
            Uri.parse('$kApiUrl/$kMyStatement/$kRequestNumber/$tPageNumber'),
            headers: {'Token': kApiToken}),
      ).thenThrow(Exception());

      // act
      final result = await getTransactionListRemoteDatasourceImpl(tPageNumber);

      // assert
      expect(result, isA<Left>());
    });
  });
}
