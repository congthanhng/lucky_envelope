part of 'draw_bloc.dart';

@immutable
abstract class DrawState {
  final List<HistoryModel> data;

  const DrawState({required this.data});
}

class DrawInitial extends DrawState {
  DrawInitial() : super(data: []);
}

class DrawFetchSuccess extends DrawState {
  const DrawFetchSuccess({required super.data});
}
