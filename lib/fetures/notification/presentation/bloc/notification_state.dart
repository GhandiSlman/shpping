part of 'notification_bloc.dart';

sealed class NotificationState extends Equatable {
  const NotificationState();

  @override
  List<Object> get props => [];
}

final class NotificationInitial extends NotificationState {}

class GetNotificationState extends NotificationState {
  final bool hasNewNotification;

  const GetNotificationState({required this.hasNewNotification});

  @override
  List<Object> get props => [hasNewNotification];
}

//get all noti
class GetNotiLoadingState extends NotificationState {}

class GetNotiLoadedState extends NotificationState {
  final List<GetNotiModelData> allNoti;

  const GetNotiLoadedState({required this.allNoti});

  @override
  List<Object> get props => [allNoti];
}

class GetNotiErrorState extends NotificationState {}
