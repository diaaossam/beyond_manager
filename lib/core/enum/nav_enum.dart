import '../../../../gen/assets.gen.dart';
import '../../../../generated/l10n.dart';

enum UserNavItem {
  home,
  emergencySupport,
  insurancePolicies,
  profile;

  String get title => switch (this) {
    UserNavItem.home => S.current.home,
    UserNavItem.emergencySupport => S.current.emergency,
    UserNavItem.insurancePolicies => S.current.policies,
    UserNavItem.profile => S.current.profile,
  };

  String get icons => switch (this) {
    UserNavItem.home => Assets.icons.home,
    UserNavItem.emergencySupport => Assets.icons.emergencySupport,
    UserNavItem.insurancePolicies => Assets.icons.policies,
    UserNavItem.profile => Assets.icons.profile,
  };
}
