import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:logistech/core/const/app_consts.dart';
import 'package:logistech/core/data/data_state.dart';
import 'package:logistech/fetures/notification/data/model/nontification_model.dart';
import 'package:logistech/fetures/notification/data/repo/noti_repo.dart';

part 'notification_event.dart';
part 'notification_state.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  final NotiRepo notiRepo;
  NotificationBloc(this.notiRepo) : super(NotificationInitial()) {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      add(const NotificationReceivedEvent(hasRecieved: true));
    });
    on<NotificationReceivedEvent>((event, emit) {
      emit(GetNotificationState(hasNewNotification: event.hasRecieved));
    });
    on<NotificationClearedEvent>((event, emit) {
      emit(const GetNotificationState(hasNewNotification: false));
    });
    on<GetNotiEvent>(
      (event, emit) async {
        emit(GetNotiLoadingState());
        final result = await notiRepo.getNoti(getNotiModel: GetNotiModel());
        if (result is DataSuccess<GetNotiModel>) {
          final notifications = result.data!.data!;

          for (GetNotiModelData notification in notifications) {
            box.write('noti_title', notification.title);
          }

          emit(GetNotiLoadedState(allNoti: notifications));
        } else if (result is DataFailed) {
          emit(GetNotiErrorState());
        }
      },
    );
  }
}
