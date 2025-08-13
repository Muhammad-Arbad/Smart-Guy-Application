class Pagination_MDL {
  int? currentpage;
  int? totalpages;
  int? limit;
  int? totalrows;
  int? datarows;

  Pagination_MDL(
      {this.currentpage,
        this.totalpages,
        this.limit,
        this.totalrows,
        this.datarows});

  Pagination_MDL.fromJson(Map<String, dynamic> json) {
    currentpage = json['currentpage'];
    totalpages = json['totalpages'];
    limit = json['limit'];
    totalrows = json['totalrows'];
    datarows = json['datarows'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['currentpage'] = currentpage;
    data['totalpages'] = totalpages;
    data['limit'] = limit;
    data['totalrows'] = totalrows;
    data['datarows'] = datarows;
    return data;
  }
}
