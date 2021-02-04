import 'package:flutter/foundation.dart';
import '../models/models.dart';

class Arguments {
  final String heroTag;
  final MovieItem movieItem;

  Arguments({
    @required this.heroTag,
    @required this.movieItem,
  });
}
