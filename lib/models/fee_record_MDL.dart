
class Fee_Record_MDL {
  String? fRID;
  String? fTMONTH;
  String? fTMONTH2;
  String? fEEMONTH;
  String? dUEDATE;
  String? eXPDATE;
  String? hFEE1;
  String? hFEE2;
  String? hFEE3;
  String? hFEE4;
  String? hFEE5;
  String? tMFEE;
  String? vFEE1;
  String? vFEE2;
  String? vFEE3;
  String? vFEE4;
  String? vFEE5;
  String? aRREARS;
  String? oLDFINE;
  String? cRFINE;
  String? tOTALFEE;
  String? dISCOUNT;
  String? rECEIVABLE;
  String? aDVANCEAMNT;
  String? aMOUNTDUE;
  String? rECEIVED;
  String? bALANCE;
  String? fRACTIVE;
  String? cID;
  String? cLSID;
  String? cLNO;
  String? sID;
  String? aID;
  String? cLID;

  // Newly added fields
  String? kINGNO;
  String? kINGS;
  String? sUID;
  String? rOLLNO;
  String? rVAL_PAYID;
  String? rVAL_ORDER_LINK;
  String? rVAL_INV_LINK;
  String? rVAL_TRANS_STATUS;
  String? rVAL_AMOUNT_PAID;
  String? pROCESS_FLG;

  Fee_Record_MDL({
    this.fRID,
    this.fTMONTH,
    this.fTMONTH2,
    this.fEEMONTH,
    this.dUEDATE,
    this.eXPDATE,
    this.hFEE1,
    this.hFEE2,
    this.hFEE3,
    this.hFEE4,
    this.hFEE5,
    this.tMFEE,
    this.vFEE1,
    this.vFEE2,
    this.vFEE3,
    this.vFEE4,
    this.vFEE5,
    this.aRREARS,
    this.oLDFINE,
    this.cRFINE,
    this.tOTALFEE,
    this.dISCOUNT,
    this.rECEIVABLE,
    this.aDVANCEAMNT,
    this.aMOUNTDUE,
    this.rECEIVED,
    this.bALANCE,
    this.fRACTIVE,
    this.cID,
    this.cLSID,
    this.cLNO,
    this.sID,
    this.aID,
    this.cLID,
    this.kINGNO,
    this.kINGS,
    this.sUID,
    this.rOLLNO,
    this.rVAL_PAYID,
    this.rVAL_ORDER_LINK,
    this.rVAL_INV_LINK,
    this.rVAL_TRANS_STATUS,
    this.rVAL_AMOUNT_PAID,
    this.pROCESS_FLG,
  });

  Fee_Record_MDL.fromJson(Map<String, dynamic> json) {
    fRID = json['FRID'];
    fTMONTH = json['FTMONTH'];
    fTMONTH2 = json['FTMONTH2'];
    fEEMONTH = json['FEEMONTH'];
    dUEDATE = json['DUEDATE'];
    eXPDATE = json['EXPDATE'];
    hFEE1 = json['HFEE1'];
    hFEE2 = json['HFEE2'];
    hFEE3 = json['HFEE3'];
    hFEE4 = json['HFEE4'];
    hFEE5 = json['HFEE5'];
    tMFEE = json['TMFEE'];
    vFEE1 = json['VFEE1'];
    vFEE2 = json['VFEE2'];
    vFEE3 = json['VFEE3'];
    vFEE4 = json['VFEE4'];
    vFEE5 = json['VFEE5'];
    aRREARS = json['ARREARS'];
    oLDFINE = json['OLDFINE'];
    cRFINE = json['CRFINE'];
    tOTALFEE = json['TOTALFEE'];
    dISCOUNT = json['DISCOUNT'];
    rECEIVABLE = json['RECEIVABLE'];
    aDVANCEAMNT = json['ADVANCEAMNT'];
    aMOUNTDUE = json['AMOUNTDUE'];
    rECEIVED = json['RECEIVED'];
    bALANCE = json['BALANCE'];
    fRACTIVE = json['FRACTIVE'];
    cID = json['CID'];
    cLSID = json['CLSID'];
    cLNO = json['CLNO'];
    sID = json['SID'];
    aID = json['AID'];
    cLID = json['CLID'];
    kINGNO = json['KINGNO'];
    kINGS = json['KINGS'];
    sUID = json['SUID'];
    rOLLNO = json['ROLLNO'];
    rVAL_PAYID = json['RVAL_PAYID'];
    rVAL_ORDER_LINK = json['RVAL_ORDER_LINK'];
    rVAL_INV_LINK = json['RVAL_INV_LINK'];
    rVAL_TRANS_STATUS = json['RVAL_TRANS_STATUS'];
    rVAL_AMOUNT_PAID = json['RVAL_AMOUNT_PAID'];
    pROCESS_FLG = json['PROCESS_FLG'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['FRID'] = fRID;
    data['FTMONTH'] = fTMONTH;
    data['FTMONTH2'] = fTMONTH2;
    data['FEEMONTH'] = fEEMONTH;
    data['DUEDATE'] = dUEDATE;
    data['EXPDATE'] = eXPDATE;
    data['HFEE1'] = hFEE1;
    data['HFEE2'] = hFEE2;
    data['HFEE3'] = hFEE3;
    data['HFEE4'] = hFEE4;
    data['HFEE5'] = hFEE5;
    data['TMFEE'] = tMFEE;
    data['VFEE1'] = vFEE1;
    data['VFEE2'] = vFEE2;
    data['VFEE3'] = vFEE3;
    data['VFEE4'] = vFEE4;
    data['VFEE5'] = vFEE5;
    data['ARREARS'] = aRREARS;
    data['OLDFINE'] = oLDFINE;
    data['CRFINE'] = cRFINE;
    data['TOTALFEE'] = tOTALFEE;
    data['DISCOUNT'] = dISCOUNT;
    data['RECEIVABLE'] = rECEIVABLE;
    data['ADVANCEAMNT'] = aDVANCEAMNT;
    data['AMOUNTDUE'] = aMOUNTDUE;
    data['RECEIVED'] = rECEIVED;
    data['BALANCE'] = bALANCE;
    data['FRACTIVE'] = fRACTIVE;
    data['CID'] = cID;
    data['CLSID'] = cLSID;
    data['CLNO'] = cLNO;
    data['SID'] = sID;
    data['AID'] = aID;
    data['CLID'] = cLID;
    data['KINGNO'] = kINGNO;
    data['KINGS'] = kINGS;
    data['SUID'] = sUID;
    data['ROLLNO'] = rOLLNO;
    data['RVAL_PAYID'] = rVAL_PAYID;
    data['RVAL_ORDER_LINK'] = rVAL_ORDER_LINK;
    data['RVAL_INV_LINK'] = rVAL_INV_LINK;
    data['RVAL_TRANS_STATUS'] = rVAL_TRANS_STATUS;
    data['RVAL_AMOUNT_PAID'] = rVAL_AMOUNT_PAID;
    data['PROCESS_FLG'] = pROCESS_FLG;
    return data;
  }
}
