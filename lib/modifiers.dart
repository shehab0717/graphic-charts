import 'dart:ui';

import 'package:graphic/graphic.dart';

/// The specification of a dodge modifier.
///
/// The dodge method moves objects around locally so they do not collide.
class GroupModifier extends Modifier {
  /// Creates a dodge modifier.
  GroupModifier({
    this.ratio,
    this.symmetric,
  });

  /// The dodge ratio to the discrete band for each group.
  ///
  /// If null, a default reciprocal of group counts is set.
  double? ratio;

  /// Whether the dodge will go both side around the original x or only positive
  /// side.
  ///
  /// If null, a default true is set.
  bool? symmetric;

  @override
  bool equalTo(Object other) =>
      other is DodgeModifier &&
      ratio == other.ratio &&
      symmetric == other.symmetric;

  @override
  AttributesGroups modify(
      AttributesGroups groups,
      Map<String, ScaleConv<dynamic, num>> scales,
      AlgForm form,
      CoordConv coord,
      Offset origin) {
    final xField = form.first[0];
    final band = (scales[xField] as DiscreteScaleConv).band;

    final ratio = this.ratio ?? 1 / (groups.length);
    final symmetric = this.symmetric ?? true;

    final bias = ratio * band;
    // If symmetric, negtively shifts half of the total bias.
    var accumulated = symmetric ? -bias * (groups.length - 1) / 2 : 0.0;

    final AttributesGroups rst = [];
    for (var group in groups) {
      final groupRst = <Attributes>[];
      for (var attributes in group) {
        final oldPosition = attributes.position;
        groupRst.add(attributes.withPosition(oldPosition
            .map(
              (point) => Offset(point.dx + accumulated, point.dy),
            )
            .toList()));
      }
      rst.add(groupRst);
      // accumulated += bias;
    }

    return rst;
  }
}
