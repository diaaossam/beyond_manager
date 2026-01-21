enum MemberStatus {
  added("added"),
  deleted("deleted"),
  underAddition("under_addition"),
  underDeletion("under_deletion");

  final String name;

  const MemberStatus(this.name);
}

String? handleMemberStatsToString({String? value}) {
  if (value == "added") {
    return "Added";
  }
  if (value == "deleted") {
    return "Deleted";
  }
  if (value == "under_addition") {
    return "Under Addition";
  }
  if (value == "under_deletion") {
    return "Under Deletion";
  } else {
    return null;
  }
}
