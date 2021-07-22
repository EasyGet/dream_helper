import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart' show Widget;


// PlaceholderWidgetBuilder placeholderWidgetBuilder() =>


Widget image(String url, {Map<String, String>? httpHeaders}) =>
  CachedNetworkImage(imageUrl: url, httpHeaders: httpHeaders,);
