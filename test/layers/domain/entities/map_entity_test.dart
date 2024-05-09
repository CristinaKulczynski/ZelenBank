import 'package:flutter_test/flutter_test.dart';
import 'package:zelenbank/layers/domain/entities/map_entity.dart';

void main() {
  final MapEntity tMapEntity = MapEntity(
    name: 'name',
    address: 'address',
    picture: 'picture',
    latitude: 1.0,
    longitude: 1.0,
  );

  test(
      'Should be a map entity and field data types should be string and doubles',
      () {
    expect(tMapEntity, isA<MapEntity>());
    expect(tMapEntity.name, isA<String>());
    expect(tMapEntity.latitude, isA<double>());
  });
}
