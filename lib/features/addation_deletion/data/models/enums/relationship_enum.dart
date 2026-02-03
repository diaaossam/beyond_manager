import '../../../../../generated/l10n.dart';

enum RelationshipEnum {
  principal("principal"),
  spouse("spouse"),
  child('child');

  final String name;

  const RelationshipEnum(this.name);

  @override
  String toString() {
    switch (this) {
      case RelationshipEnum.spouse:
        return S.current.spouse;
      case RelationshipEnum.child:
        return S.current.child;
      case RelationshipEnum.principal:
        return S.current.principal;
    }
  }
}
