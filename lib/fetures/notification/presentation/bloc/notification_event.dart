part of 'notification_bloc.dart';

sealed class NotificationEvent extends Equatable {
  const NotificationEvent();

  @override
  List<Object> get props => [];
}

class NotificationReceivedEvent extends NotificationEvent {
  final bool hasRecieved;

  const NotificationReceivedEvent({required this.hasRecieved});
}

class NotificationClearedEvent extends NotificationEvent {}

class GetNotiEvent extends NotificationEvent{}