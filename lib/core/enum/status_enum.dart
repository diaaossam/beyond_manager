enum StatusEnum {
  done("Done"),
  notApproved("Not Approved"),
  pending("Pending"),
  processing("Processing");

  final String name;

  const StatusEnum(this.name);
}

StatusEnum handleStringToStatusEnum({required String status}) {
  if (status == "done") {
    return StatusEnum.done;
  }
  if (status == "not_approved") {
    return StatusEnum.notApproved;
  } else if (status == "processing") {
    return StatusEnum.processing;
  } else {
    return StatusEnum.pending;
  }
}
