import 'package:equatable/equatable.dart';

import '../../domain/entities/sample_list_entity.dart';


abstract class SampleApiCallState extends Equatable {
  const SampleApiCallState();

  @override
  List<Object> get props => [];
}

class InitialState extends SampleApiCallState {
  @override
  List<Object> get props => [];
}
class LoadingState extends SampleApiCallState{
  @override
  List<Object> get props => [];
}
class ErrorState extends SampleApiCallState{
  String msg;
  ErrorState(this.msg);
  @override
  List<Object> get props => [msg];
}
class EmptyState extends SampleApiCallState{
  @override 
  List<Object> get props => [];
}
class LoadedState extends SampleApiCallState{
  SampleEntity sampleEntity;
  LoadedState(this.sampleEntity);

  @override
  List<Object> get props => [sampleEntity];
}