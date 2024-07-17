import 'package:dartz/dartz.dart';


import '../../../../failure.dart';
import '../../domain/entities/sample_list_entity.dart';
import '../../domain/repositories/sample_repository.dart';
import '../datasources/sample_data_source.dart';

class SampleRepositoryImplements implements SampleRepository {
  final SampleDataSource dataSource;
  SampleRepositoryImplements({required this.dataSource});
  @override
  Future<Either<Failure, SampleEntity>> getSampleDetails(
      jsonRequestBody) async {
    try {
      dynamic result = await dataSource.getSampleDetails(jsonRequestBody);


if(result is SampleEntity){
  return Right(result);
}else{
  return Left(DataFailure(result.toString()));
}

      
    } catch (e) {
      return Left(UnknownFailure(e.toString()));
    }
  }
}
