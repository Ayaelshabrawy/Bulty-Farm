class GraphQlBaseModel<T> {
  final T? data;
  final List<GraphQlError>? errors;

  GraphQlBaseModel({this.data, this.errors});

  factory GraphQlBaseModel.fromJson(Map<String, dynamic> json, T Function(dynamic) fromJsonT) {
    return GraphQlBaseModel(
      data: json['data'] != null ? fromJsonT(json['data']) : null,
      errors: json['errors'] != null
          ? (json['errors'] as List<dynamic>)
          .map((errorJson) => GraphQlError.fromJson(errorJson))
          .toList()
          : null,
    );
  }
}

class GraphQlError {
  final String? message;

  GraphQlError({this.message});

  factory GraphQlError.fromJson(Map<String, dynamic> json) {
    return GraphQlError(
      message: json['message'],
    );
  }
}
