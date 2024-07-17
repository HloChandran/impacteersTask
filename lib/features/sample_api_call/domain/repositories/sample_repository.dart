import 'package:dartz/dartz.dart';

import '../../../../failure.dart';
import '../entities/sample_list_entity.dart';


abstract class SampleRepository{
  Future<Either<Failure, SampleEntity>> getSampleDetails(dynamic jsonRequestBody);
}