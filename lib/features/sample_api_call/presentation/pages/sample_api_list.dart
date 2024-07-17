import 'package:chandranflutter/config/appTextStyle.dart';
import 'package:chandranflutter/widgets/customText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../../../../config/appColorConfig.dart';
import '../../../../widgets/circleText.dart';
import '../cubit/sample_api_call_cubit.dart';
import '../cubit/sample_api_call_state.dart';

class SampleList extends StatefulWidget {
  const SampleList({Key? key}) : super(key: key);

  @override
  State<SampleList> createState() => _SampleListState();
}

class _SampleListState extends State<SampleList> {
  @override
  void initState() {
    var jsonRequestBody = {};
    BlocProvider.of<SampleApiCallCubit>(context)
        .getSampleDetail(jsonRequestBody);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.appBar,
          title: CustomText(
            text: 'List users',
            textStyle: AppTextStyle.heding1
                .copyWith(color: AppColor.white, fontSize: 18),
          ),
        ),
        body: BlocBuilder<SampleApiCallCubit, SampleApiCallState>(
            builder: (context, state) {
          if (state is LoadingState) {
            return const Center(
              child: CircularProgressIndicator(
                color: AppColor.buttonColor,
              ),
            );
          } else if (state is LoadedState) {
            return AnimationLimiter(
              child: ListView.builder(
                padding: EdgeInsets.all(w / 30),
                physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                itemCount: state.sampleEntity.data.length,
                itemBuilder: (BuildContext c, int i) {
                  return AnimationConfiguration.staggeredList(
                    position: i,
                    delay: const Duration(milliseconds: 100),
                    child: SlideAnimation(
                      duration: const Duration(milliseconds: 2500),
                      curve: Curves.fastLinearToSlowEaseIn,
                      horizontalOffset: 30,
                      verticalOffset: 300.0,
                      child: FlipAnimation(
                        duration: const Duration(milliseconds: 3000),
                        curve: Curves.fastLinearToSlowEaseIn,
                        flipAxis: FlipAxis.y,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 5, bottom: 5, left: 16, right: 16),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                color: Colors.white,
                                boxShadow: const [
                                  BoxShadow(
                                      spreadRadius: 0,
                                      blurRadius: 0.5,
                                      offset: Offset(0, 1),
                                      color: AppColor.textskyBlue)
                                ]),
                            child: Wrap(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Flexible(
                                        flex: 1,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              CircleText(
                                                text: state.sampleEntity.data[i]
                                                    .firstName
                                                    .toString()
                                                    .substring(0, 1)
                                                    .toUpperCase(),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Flexible(
                                          child: Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              CustomText(
                                                text: state
                                                    .sampleEntity.data[i].firstName,
                                                textStyle: AppTextStyle.heding1,
                                              ),
                                              CustomText(
                                                text:
                                                state.sampleEntity.data[i].email,
                                                textStyle: AppTextStyle.heding1,
                                              ),
                                            ],
                                          ))
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )





                      ),
                    ),
                  );
                },
              ),
            );
          } else if (state is ErrorState) {
            return const Center(
              child: Icon(Icons.error),
            );
          } else {
            return Container(
              width: double.infinity,
              color: Colors.amber,
            );
          }
        }));
  }
}
