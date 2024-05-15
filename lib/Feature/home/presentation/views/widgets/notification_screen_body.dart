import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shawativender/Core/widgets/empty_wid.dart';
import 'package:shawativender/Feature/home/data/repo/home_repo_imp.dart';
import 'package:shawativender/Feature/home/presentation/views/manager/Notification/notification_cubit.dart';
import 'package:shawativender/Feature/home/presentation/views/widgets/notification_item.dart';
import 'package:shawativender/Feature/home/presentation/views/widgets/notification_title.dart';

class NotificationScreenBody extends StatelessWidget {
  const NotificationScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: BlocProvider(
        create: (context) =>
            NotificationCubit(HomeRepoImpl())..getNotification(),
        child: BlocConsumer<NotificationCubit, NotificationState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const NotificationTitle(),
                const SizedBox(
                  height: 15,
                ),
                // Text(
                //   "Dec, 2023 19",
                //   style: StylesData.font12,
                // ),
                // SizedBox(
                //   height: 15,
                // ),

                Expanded(
                  child: Builder(builder: (context) {
                    if (state is NotificationSucc) {
                      if (state.model.data?.notifications?.isEmpty ?? true) {
                        return const Center(
                          child: EmptyWidget(),
                        );
                      }
                      return ListView.separated(
                        itemBuilder: (BuildContext context, int index) {
                          return const NotificationItem();
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(
                            height: 15,
                          );
                        },
                        itemCount: state.model.data?.notifications?.length ?? 0,
                      );
                    } else if (state is NotificationError) {
                      return Center(
                          child: Text(
                        state.msg,
                      ));
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  }),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
