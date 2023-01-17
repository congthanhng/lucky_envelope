import 'package:bloc/bloc.dart';
import 'package:lucky_envolope/app/domain/models/history/history_model.dart';
import 'package:lucky_envolope/app/domain/usecases/history_usecase.dart';
import 'package:meta/meta.dart';

part 'draw_event.dart';

part 'draw_state.dart';

class DrawBloc extends Bloc<DrawEvent, DrawState> {
  DrawBloc() : super(DrawInitial()) {
    on<DrawFetched>(_onFetched);
    on<DrawSaved>(_onSaved);
    on<DrawDeleted>(_onDeleted);
  }

  final HistoryUseCase _useCase = HistoryUseCase();

  _onFetched(DrawFetched event, Emitter<DrawState> emit) async {
    await _useCase.getHistoryData().then(
      (value) {
        emit(DrawFetchSuccess(data: value ?? []));
      },
    );
  }

  _onSaved(DrawSaved event, Emitter<DrawState> emit) async {
    state.data.add(event.data);
    await _useCase.saveHistoryData(state.data).then(
      (value) {
        if (value) {
          add(DrawFetched());
        }
      },
    );
  }

  _onDeleted(DrawDeleted event, Emitter<DrawState> emit) async {
    await _useCase.saveHistoryData([]).then(
      (value) {
        if (value) {
          add(DrawFetched());
        }
      },
    );
  }
}
