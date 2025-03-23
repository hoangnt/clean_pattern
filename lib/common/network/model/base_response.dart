class BaseResponse<T> {
  String? message;
  Paging? paging;
  T? data;
  late int statusCode;

  BaseResponse({
    this.message,
    this.paging,
    this.data,
    required this.statusCode,
  });

  BaseResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'];
    message = json['message'];
    statusCode = json['statusCode'];
    paging = json['paging'] != null ? Paging.fromJson(json['paging']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = <String, dynamic>{};
    map['message'] = message;
    map['data'] = data;
    map['statusCode'] = statusCode;
    map['paging'] = paging?.toJson();
    return map;
  }
}

class Paging {
  int? totalRecords;
  int? totalPages;

  Paging({this.totalRecords, this.totalPages});

  Paging.fromJson(Map<String, dynamic> json) {
    totalRecords = json['totalRecords'];
    totalPages = json['totalPages'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['totalRecords'] = this.totalRecords;
    data['totalPages'] = this.totalPages;
    return data;
  }
}
