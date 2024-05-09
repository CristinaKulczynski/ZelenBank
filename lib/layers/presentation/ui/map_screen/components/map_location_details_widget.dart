import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zelenbank/layers/domain/entities/map_entity.dart';

class MapLocationDetailsWidget extends StatelessWidget {
  MapEntity map;
  MapLocationDetailsWidget({Key? key, required this.map}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Wrap(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          child: Image.network(
            map.picture,
            height: 250,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Padding(
                padding: const EdgeInsets.fromLTRB(6, 6, 6, 0),
                child: SvgPicture.asset(
                  'assets/map_img_placeholder.svg',
                  width: size.width,
                  fit: BoxFit.fitWidth,
                ),
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 24, left: 24),
          child: Text(
            map.name,
            style: const TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 60, left: 24),
          child: Text(
            map.address,
          ),
        ),
      ],
    );
  }
}
