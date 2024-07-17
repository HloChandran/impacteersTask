
import 'package:flutter_bloc/flutter_bloc.dart';

// import 'package:equatable/equatable.dart';

import '../../domain/usecases/sample_case.dart';
import 'sample_api_call_state.dart';

class SampleApiCallCubit extends Cubit<SampleApiCallState> {
  final SampleCase getSampleDetails;

  SampleApiCallCubit(this.getSampleDetails) : super(EmptyState());
  void getSampleDetail(dynamic jsonRequestBody) async {
    try {
      emit(LoadingState());
      final result = await getSampleDetails.getSampleDetails(jsonRequestBody);
      result.fold((failure) => emit(ErrorState(result.toString())),
          (data) => emit(LoadedState(data)));
    } catch (e) {
      ErrorState(e.toString());
    }
  }
}
