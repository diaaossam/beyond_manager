class DoctorsResult {
  DoctorsResult({
    this.bloqueReservationTel,
    this.branche,
    this.code,
    this.codeCabinet,
    this.dateAction,
    this.dateCreate,
    this.dateModification,
    this.designationAr,
    this.designationJour,
    this.designationSpecialite,
    this.designationSpecialiteAr,
    this.designationbranche,
    this.designationbrancheAr,
    this.heureDebut,
    this.heureDebutLocalDateTime,
    this.heureFin,
    this.heureFinLocalDateTime,
    this.idBranch,
    this.infirmier,
    this.isDental,
    this.jour,
    this.jourLocalDateTime,
    this.medecin,
    this.medecinAbsent,
    this.nbPlace,
    this.nbPlaceTel,
    this.nomInterv,
    this.nomIntervAr,
    this.numSeq,
    this.numberOfReservation,
    this.numberOfReservationAttached,
    this.partOfDay,
    this.custom_start_date_time,
    this.custom_end_date_time,
  });

  DoctorsResult.fromJson(dynamic json) {
    bloqueReservationTel = json['bloqueReservationTel'];
    branche = json['branche'] != null
        ? Branche.fromJson(json['branche'])
        : null;
    code = json['code'];
    codeCabinet = json['codeCabinet'];
    dateAction = json['dateAction'];
    dateCreate = json['dateCreate'];
    dateModification = json['dateModification'];
    designationAr = json['designationAr'];
    designationJour = json['designationJour'];
    designationSpecialite = json['designationSpecialite'];
    designationSpecialiteAr = json['designationSpecialiteAr'];
    designationbranche = json['designationbranche'];
    designationbrancheAr = json['designationbrancheAr'];
    heureDebut = json['heureDebut'];
    heureDebutLocalDateTime = json['heureDebutLocalDateTime'];
    heureFin = json['heureFin'];
    heureFinLocalDateTime = json['heureFinLocalDateTime'];
    idBranch = json['idBranch'];
    infirmier = json['infirmier'] != null
        ? Infirmier.fromJson(json['infirmier'])
        : null;
    isDental = json['isDental'];
    jour = json['jour'];
    jourLocalDateTime = json['jourLocalDateTime'];
    medecin = json['medecin'] != null
        ? Medecin.fromJson(json['medecin'])
        : null;
    medecinAbsent = json['medecinAbsent'];
    nbPlace = json['nbPlace'];
    nbPlaceTel = json['nbPlaceTel'];
    nomInterv = json['nomInterv'];
    nomIntervAr = json['nomIntervAr'];
    numSeq = json['numSeq'];
    numberOfReservation = json['numberOfReservation'];
    numberOfReservationAttached = json['numberOfReservationAttached'];
    partOfDay = json['partOfDay'];
    custom_start_date_time = json['custom_start_date_time'];
    custom_end_date_time = json['custom_end_date_time'];
  }

  static List<DoctorsResult> fromJsonList(dynamic json) {
    return json
        .map<DoctorsResult>((item) => DoctorsResult.fromJson(item))
        .toList();
  }

  bool? bloqueReservationTel;
  Branche? branche;
  num? code;
  num? codeCabinet;
  num? dateAction;
  num? dateCreate;
  num? dateModification;
  String? designationAr;
  String? designationJour;
  String? designationSpecialite;
  String? designationSpecialiteAr;
  String? designationbranche;
  String? designationbrancheAr;
  num? heureDebut;
  String? heureDebutLocalDateTime;
  num? heureFin;
  String? heureFinLocalDateTime;
  num? idBranch;
  Infirmier? infirmier;
  bool? isDental;
  num? jour;
  String? jourLocalDateTime;
  Medecin? medecin;
  bool? medecinAbsent;
  num? nbPlace;
  num? nbPlaceTel;
  String? nomInterv;
  String? nomIntervAr;
  num? numSeq;
  num? numberOfReservation;
  num? numberOfReservationAttached;
  String? partOfDay;
  String? custom_start_date_time;
  String? custom_end_date_time;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['bloqueReservationTel'] = bloqueReservationTel;
    if (branche != null) {
      map['branche'] = branche?.toJson();
    }
    map['code'] = code;
    map['codeCabinet'] = codeCabinet;
    map['dateAction'] = dateAction;
    map['dateCreate'] = dateCreate;
    map['dateModification'] = dateModification;
    map['designationAr'] = designationAr;
    map['designationJour'] = designationJour;
    map['designationSpecialite'] = designationSpecialite;
    map['designationSpecialiteAr'] = designationSpecialiteAr;
    map['designationbranche'] = designationbranche;
    map['designationbrancheAr'] = designationbrancheAr;
    map['heureDebut'] = heureDebut;
    map['heureDebutLocalDateTime'] = heureDebutLocalDateTime;
    map['heureFin'] = heureFin;
    map['heureFinLocalDateTime'] = heureFinLocalDateTime;
    map['idBranch'] = idBranch;
    if (infirmier != null) {
      map['infirmier'] = infirmier?.toJson();
    }
    map['isDental'] = isDental;
    map['jour'] = jour;
    map['jourLocalDateTime'] = jourLocalDateTime;
    if (medecin != null) {
      map['medecin'] = medecin?.toJson();
    }
    map['medecinAbsent'] = medecinAbsent;
    map['nbPlace'] = nbPlace;
    map['nbPlaceTel'] = nbPlaceTel;
    map['nomInterv'] = nomInterv;
    map['nomIntervAr'] = nomIntervAr;
    map['numSeq'] = numSeq;
    map['numberOfReservation'] = numberOfReservation;
    map['numberOfReservationAttached'] = numberOfReservationAttached;
    map['partOfDay'] = partOfDay;
    map['custom_start_date_time'] = custom_start_date_time;
    map['custom_end_date_time'] = custom_end_date_time;
    return map;
  }
}

class Medecin {
  Medecin({
    this.actif,
    this.alias,
    this.aliasSec,
    this.code,
    this.codeDegre,
    this.codeSaisie,
    this.codeSpecialite,
    this.codesSpecialSkills,
    this.delaisControle,
    this.dureeConsultation,
    this.genre,
    this.nomInterv,
    this.nomIntervAr,
    this.opd,
    this.scientificDegree,
    this.scientificDegreeSec,
    this.specialSkillDTOs,
    this.visible,
  });

  Medecin.fromJson(dynamic json) {
    actif = json['actif'];
    alias = json['alias'];
    aliasSec = json['aliasSec'];
    code = json['code'];
    codeDegre = json['codeDegre'] != null
        ? CodeDegre.fromJson(json['codeDegre'])
        : null;
    codeSaisie = json['codeSaisie'];
    codeSpecialite = json['codeSpecialite'] != null
        ? CodeSpecialite.fromJson(json['codeSpecialite'])
        : null;
    codesSpecialSkills = json['codesSpecialSkills'] != null
        ? json['codesSpecialSkills'].cast<num>()
        : [];
    delaisControle = json['delaisControle'];
    dureeConsultation = json['dureeConsultation'];
    genre = json['genre'];
    nomInterv = json['nomInterv'];
    nomIntervAr = json['nomIntervAr'];
    opd = json['opd'];
    scientificDegree = json['scientificDegree'];
    scientificDegreeSec = json['scientificDegreeSec'];
    if (json['specialSkillDTOs'] != null) {
      specialSkillDTOs = [];
      json['specialSkillDTOs'].forEach((v) {
        specialSkillDTOs?.add(SpecialSkillDtOs.fromJson(v));
      });
    }
    visible = json['visible'];
  }

  bool? actif;
  String? alias;
  String? aliasSec;
  num? code;
  CodeDegre? codeDegre;
  String? codeSaisie;
  CodeSpecialite? codeSpecialite;
  List<num>? codesSpecialSkills;
  num? delaisControle;
  num? dureeConsultation;
  String? genre;
  String? nomInterv;
  String? nomIntervAr;
  bool? opd;
  String? scientificDegree;
  String? scientificDegreeSec;
  List<SpecialSkillDtOs>? specialSkillDTOs;
  bool? visible;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['actif'] = actif;
    map['alias'] = alias;
    map['aliasSec'] = aliasSec;
    map['code'] = code;
    if (codeDegre != null) {
      map['codeDegre'] = codeDegre?.toJson();
    }
    map['codeSaisie'] = codeSaisie;
    if (codeSpecialite != null) {
      map['codeSpecialite'] = codeSpecialite?.toJson();
    }
    map['codesSpecialSkills'] = codesSpecialSkills;
    map['delaisControle'] = delaisControle;
    map['dureeConsultation'] = dureeConsultation;
    map['genre'] = genre;
    map['nomInterv'] = nomInterv;
    map['nomIntervAr'] = nomIntervAr;
    map['opd'] = opd;
    map['scientificDegree'] = scientificDegree;
    map['scientificDegreeSec'] = scientificDegreeSec;
    if (specialSkillDTOs != null) {
      map['specialSkillDTOs'] = specialSkillDTOs
          ?.map((v) => v.toJson())
          .toList();
    }
    map['visible'] = visible;
    return map;
  }
}

class SpecialSkillDtOs {
  SpecialSkillDtOs({
    this.actif,
    this.code,
    this.codeSpecialite,
    this.dateCreate,
    this.designation,
    this.designationAr,
  });

  SpecialSkillDtOs.fromJson(dynamic json) {
    actif = json['actif'];
    code = json['code'];
    codeSpecialite = json['codeSpecialite'];
    dateCreate = json['dateCreate'];
    designation = json['designation'];
    designationAr = json['designationAr'];
  }

  bool? actif;
  num? code;
  num? codeSpecialite;
  num? dateCreate;
  String? designation;
  String? designationAr;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['actif'] = actif;
    map['code'] = code;
    map['codeSpecialite'] = codeSpecialite;
    map['dateCreate'] = dateCreate;
    map['designation'] = designation;
    map['designationAr'] = designationAr;
    return map;
  }
}

class CodeSpecialite {
  CodeSpecialite({
    this.code,
    this.codeCostCentre,
    this.codeSpecialSkills,
    this.designation,
    this.designationAr,
    this.familleSpecialite,
    this.prefixe,
    this.sites,
    this.suffixe,
  });

  CodeSpecialite.fromJson(dynamic json) {
    code = json['code'];
    codeCostCentre = json['codeCostCentre'];
    codeSpecialSkills = json['codeSpecialSkills'];
    designation = json['designation'];
    designationAr = json['designationAr'];
    familleSpecialite = json['familleSpecialite'] != null
        ? FamilleSpecialite.fromJson(json['familleSpecialite'])
        : null;
    prefixe = json['prefixe'];
    sites = json['sites'];
    suffixe = json['suffixe'];
  }

  num? code;
  dynamic codeCostCentre;
  dynamic codeSpecialSkills;
  String? designation;
  String? designationAr;
  FamilleSpecialite? familleSpecialite;
  String? prefixe;
  dynamic sites;
  String? suffixe;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = code;
    map['codeCostCentre'] = codeCostCentre;
    map['codeSpecialSkills'] = codeSpecialSkills;
    map['designation'] = designation;
    map['designationAr'] = designationAr;
    if (familleSpecialite != null) {
      map['familleSpecialite'] = familleSpecialite?.toJson();
    }
    map['prefixe'] = prefixe;
    map['sites'] = sites;
    map['suffixe'] = suffixe;
    return map;
  }
}

class FamilleSpecialite {
  FamilleSpecialite({
    this.actif,
    this.code,
    this.designation,
    this.designationAr,
  });

  FamilleSpecialite.fromJson(dynamic json) {
    actif = json['actif'];
    code = json['code'];
    designation = json['designation'];
    designationAr = json['designationAr'];
  }

  bool? actif;
  num? code;
  String? designation;
  String? designationAr;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['actif'] = actif;
    map['code'] = code;
    map['designation'] = designation;
    map['designationAr'] = designationAr;
    return map;
  }
}

class CodeDegre {
  CodeDegre({
    this.code,
    this.designation,
    this.designationAr,
    this.designationEn,
  });

  CodeDegre.fromJson(dynamic json) {
    code = json['code'];
    designation = json['designation'];
    designationAr = json['designationAr'];
    designationEn = json['designationEn'];
  }

  num? code;
  String? designation;
  String? designationAr;
  String? designationEn;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = code;
    map['designation'] = designation;
    map['designationAr'] = designationAr;
    map['designationEn'] = designationEn;
    return map;
  }
}

class Infirmier {
  Infirmier({this.code});

  Infirmier.fromJson(dynamic json) {
    code = json['code'];
  }

  num? code;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = code;
    return map;
  }
}

class Branche {
  Branche({
    this.actif,
    this.code,
    this.dateCreate,
    this.designation,
    this.designationAr,
    this.ipAdress,
    this.logo,
  });

  Branche.fromJson(dynamic json) {
    actif = json['actif'];
    code = json['code'];
    dateCreate = json['dateCreate'];
    designation = json['designation'];
    designationAr = json['designationAr'];
    ipAdress = json['ipAdress'];
    logo = json['logo'];
  }

  bool? actif;
  num? code;
  num? dateCreate;
  String? designation;
  String? designationAr;
  String? ipAdress;
  dynamic logo;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['actif'] = actif;
    map['code'] = code;
    map['dateCreate'] = dateCreate;
    map['designation'] = designation;
    map['designationAr'] = designationAr;
    map['ipAdress'] = ipAdress;
    map['logo'] = logo;
    return map;
  }
}
