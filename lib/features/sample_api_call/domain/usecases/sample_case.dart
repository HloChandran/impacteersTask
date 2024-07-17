import 'package:dartz/dartz.dart';

import '../../../../failure.dart';
import '../entities/sample_list_entity.dart';
import '../repositories/sample_repository.dart';


class SampleCase{
  final SampleRepository sampleRepository;
  SampleCase(this.sampleRepository);
  Future<Either<Failure, SampleEntity>> getSampleDetails(dynamic jsonRequestBody){
    return sampleRepository.getSampleDetails(jsonRequestBody);
  }
}