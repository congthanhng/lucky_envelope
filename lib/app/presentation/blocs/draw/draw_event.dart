part of 'draw_bloc.dart';

@immutable
abstract class DrawEvent {}

class DrawFetched extends DrawEvent{}

class DrawSaved extends DrawEvent{
  final HistoryModel data;

  DrawSaved(this.data);
}

class DrawDeleted extends DrawEvent{
}