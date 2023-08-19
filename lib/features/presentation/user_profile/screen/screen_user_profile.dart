import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gtaf_assignment/features/presentation/user_profile/bloc/user_bloc.dart';
import 'package:gtaf_assignment/features/presentation/user_profile/bloc/user_state.dart';
import 'package:gtaf_assignment/res/app_context_extension.dart';

import '../../../../core/domain/extensions/callback_status.dart';
import '../../../../core/widgets/error_dialog.dart';

class ScreenUserProfile extends StatelessWidget {
  const ScreenUserProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {

        return true;
      },
      child: Scaffold(
        backgroundColor: context.resources.color.black_333333,
        body: SafeArea(
            child: BlocConsumer<UserBloc, UserState>(
              listener: (context, state) {
                if (state.status == CallbackStatus.success) {
                } else if (state.status == CallbackStatus.error) {
                  ErrorDialog.errorDialog(context, state.errorMessage?? "Error");
                }
              },
              builder: (context, state) {
                if(state.status == CallbackStatus.loading){
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return SingleChildScrollView(
                    child: Center(
                      child: Container(
                        margin: const EdgeInsets.only(left: 24,top: 74, right: 24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ClipOval(
                              child: SizedBox.fromSize(// Image radius
                                  child: Image.network(state.user!.avatar ?? "N/A", height: 168, width: 168,)
                              ),
                            ),
                            const SizedBox(height: 16,),
                            Text(
                              state.user!.name ?? "N/A",
                              style: const TextStyle(
                                fontSize: 24.0,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 4,),
                            Text(state.user!.twitterUsername!,
                              style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.w400,
                                color: context.resources.color.grey_C9C9C9,
                              ),
                            ),
                            const SizedBox(height: 16,),
                            Text(
                              "Bio: ${state.user!.bio}" ,
                              style: const TextStyle(
                                fontSize: 17.0,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 16,),
                            Text(
                              "Public Repos: ${state.user!.publicRepos}",
                              style: const TextStyle(
                                fontSize: 17.0,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 8,),
                            Text(
                              "Public Gists: ${state.user!.publicGists}",
                              style: const TextStyle(
                                fontSize: 17.0,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 8,),
                            Text(
                              "Private Repos: ${state.user!.publicGists}",
                              style: const TextStyle(
                                fontSize: 17.0,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }
              },
            )
        ),
      ),
    );
  }
}
