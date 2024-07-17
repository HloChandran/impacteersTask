
import 'package:equatable/equatable.dart';

class SampleEntity extends Equatable{
    SampleEntity({
      required  this.page,
       required this.perPage,
      required  this.total,
      required  this.totalPages,
      required  this.data,
      required  this.support,
    });

    int page;
    int perPage;
    int total;
    int totalPages;
    List<DatumEntity> data;
    SupportEntity support;

  @override
  List<Object?> get props => [
    page, perPage, total, totalPages, data, support
  ];


}

class DatumEntity  extends Equatable{
    DatumEntity({
      required  this.id,
      required  this.email,
      required  this.firstName,
       required this.lastName,
       required this.avatar,
    });

    int id;
    String email;
    String firstName;
    String lastName;
    String avatar;

  @override
  List<Object?> get props => [
    id, email, firstName, lastName, avatar
  ];

}

class SupportEntity extends Equatable {
    SupportEntity({
      required  this.url,
      required  this.text,
    });

    String url;
    String text;


  @override
  List<Object?> get props => [ url, text];
}
