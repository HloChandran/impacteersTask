



import '../../domain/entities/sample_list_entity.dart';

class SampleModel extends SampleEntity {
  SampleModel({
    required page,
    required perPage,
    required total,
    required totalPages,
    required data,
    required support,
  }) : super(page:page, perPage: perPage, total: total, data: data, support: support, totalPages: totalPages);


  factory SampleModel.fromJson(Map<String, dynamic> json) => SampleModel(
        page: json["page"],
        perPage: json["per_page"],
        total: json["total"],
        totalPages: json["total_pages"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        support: Support.fromJson(json["support"]),
      );


}

class Datum  extends DatumEntity {
  Datum({
    required id,
    required email,
    required firstName,
    required lastName,
    required avatar,
  }) : super(id: id, email: email, firstName: firstName, lastName: lastName, avatar: avatar);



  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        email: json["email"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        avatar: json["avatar"],
      );

}

class Support extends SupportEntity {
  Support({
    required url,
    required text,
  }) : super(url: url, text: text);

  late String url;
  late String text;

  factory Support.fromJson(Map<String, dynamic> json) => Support(
        url: json["url"],
        text: json["text"],
      );


}
