import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gtaf_assignment/features/domain/entity/commit_list_entity.dart';
import 'package:gtaf_assignment/features/presentation/commit_list/bloc/commit_bloc.dart';
import 'package:gtaf_assignment/features/presentation/commit_list/bloc/commit_state.dart';
import 'package:gtaf_assignment/res/app_context_extension.dart';

import '../../../../core/domain/extensions/callback_status.dart';
import '../../../../core/domain/extensions/date_time_util.dart';
import '../../../../core/widgets/error_dialog.dart';

class ScreenCommitList extends StatelessWidget {
  const ScreenCommitList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {

        return true;
      },
      child: Scaffold(
        backgroundColor: context.resources.color.black_333333,
        body: SafeArea(
            child: BlocConsumer<CommitBloc, CommitState>(
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
                    child: Column(
                      children: [
                        const Header(),
                        ListWidget(state: state)
                      ],
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


class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 13, top: 11),
      child: Row(
        children: [
          const Text(
            "Flutter Commit List",
            style: TextStyle(
              fontSize: 17.0,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 16,),
          Container(
            padding: const EdgeInsets.only(left: 8, bottom: 1, top: 1, right: 8),
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(26)),
                color: context.resources.color.grey_515050),
            child: const Text(
              "master",
              style: TextStyle(
                fontSize: 17.0,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}


class ListWidget extends StatelessWidget {
  const ListWidget({Key? key, required this.state}) : super(key: key);
  final CommitState state;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: state.list?.length,
      itemBuilder: (context, index) => CommitListItem(item: state.list![index]),
    );
  }
}


class CommitListItem extends StatelessWidget {
  const CommitListItem({Key? key, required this.item}) : super(key: key);
  final CommitListEntity item;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {

      },
      child: Container(
        padding: EdgeInsets.only(top: 12.0, bottom: 12.0, left: 16.0, right: 17.0),
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(width: 1, color: context.resources.color.grey_404040))
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  flex: 5,
                  child: Text(
                    item.commitMessage ?? "",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 17.0,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    DateTimeUtils().formatDateWithTimeUTC(item.date ?? ""),
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.w400,
                      color: context.resources.color.grey_B8B8B8,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 8),
            Row(
              children: [
                ClipOval(
                  child: SizedBox.fromSize(// Image radius
                      child: Image.network(item.avatar ?? "", height: 20, width: 20,)
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  item.name ?? "",
                  style: TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.w400,
                    color: context.resources.color.grey_9B9B9B,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

