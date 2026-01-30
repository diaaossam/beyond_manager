class DocumentType {
  final String id;
  final String name;
  final String nameAr;
  final bool isSelected;

  DocumentType({
    required this.id,
    required this.name,
    required this.nameAr,
    this.isSelected = false,
  });

  DocumentType copyWith({
    String? id,
    String? name,
    String? nameAr,
    bool? isSelected,
  }) {
    return DocumentType(
      id: id ?? this.id,
      name: name ?? this.name,
      nameAr: nameAr ?? this.nameAr,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}
