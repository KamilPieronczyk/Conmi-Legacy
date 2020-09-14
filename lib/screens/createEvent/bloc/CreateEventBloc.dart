import 'package:conmi/models/CreateEventData.dart';
import 'package:conmi/screens/createEvent/bloc/CreateEventStepState.dart';
import 'package:bloc/bloc.dart';

enum CreateEventEvents { go_to_step1, go_to_step2, go_to_step3 }

class CreateEventBloc extends Bloc<CreateEventEvents, CreateEventStepState> {
  CreateEventBloc() : super(CreateEventStep1State(new CreateEventData()));

  @override
  Stream<CreateEventStepState> mapEventToState(CreateEventEvents event) async* {
    switch (event) {
      case CreateEventEvents.go_to_step1:
        yield CreateEventStep1State(state.createEventData);
        break;
      case CreateEventEvents.go_to_step2:
        yield CreateEventStep2State(state.createEventData);
        break;
      case CreateEventEvents.go_to_step3:
        yield CreateEventStep3State(state.createEventData);
        break;
      default:
        yield CreateEventStep1State(state.createEventData);
        break;
    }
  }
}
