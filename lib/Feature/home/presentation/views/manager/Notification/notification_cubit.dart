import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shawativender/Feature/home/data/model/notification_model/notification_model.dart';
import 'package:shawativender/Feature/home/data/repo/home_repo.dart';

part 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit(this.repo) : super(NotificationInitial());

  final HomeRepo repo;
  NotificationModel model = NotificationModel();

  Future<void> getNotification() async {
    model.data = [];
    emit(NotificationLoading());
    final result = await repo.getNotifications();
    result.fold(
      (l) => emit(NotificationError(msg: l.msq.toString())),
      (r) {
        model = r;
        emit(NotificationSucc(model: r));
      },
    );
  }

  Future<void> getNotificationsCount() async {
    emit(GetNotificationCountLoading());
    final result = await repo.getNotificationsCount();
    result.fold(
      (l) => emit(GetNotificationCountError(msg: l.msq.toString())),
      (r) {
        emit(GetNotificationCountSucc(count: r));
      },
    );
  }
}
