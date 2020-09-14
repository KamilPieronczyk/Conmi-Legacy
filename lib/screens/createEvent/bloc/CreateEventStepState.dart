import 'package:conmi/models/CreateEventData.dart';
import 'package:conmi/screens/createEvent/createEventStep1/CreateEventStep1.dart';
import 'package:conmi/screens/createEvent/createEventStep2/CreateEventStep2.dart';
import 'package:conmi/screens/createEvent/createEventStep3/CreateEventStep3.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class CreateEventStepState extends Equatable {
  Widget previousScreen;
  Widget nextScreen;
  CreateEventData createEventData;

  CreateEventStepState(this.createEventData);

  @override
  List<Object> get props => [];
}

class CreateEventStep1State extends CreateEventStepState {
  CreateEventStep1State(CreateEventData createEventData) : super(createEventData) {
    this.previousScreen = CreateEventStep1();
    this.nextScreen = CreateEventStep2();
  }

  @override
  List<Object> get props => [];
}

class CreateEventStep2State extends CreateEventStepState {
  CreateEventStep2State(CreateEventData createEventData) : super(createEventData) {
    this.previousScreen = CreateEventStep1();
    this.nextScreen = CreateEventStep3();
  }

  @override
  List<Object> get props => [];
}

class CreateEventStep3State extends CreateEventStepState {
  CreateEventStep3State(CreateEventData createEventData) : super(createEventData) {
    this.previousScreen = CreateEventStep2();
    this.nextScreen = CreateEventStep3();
  }

  @override
  List<Object> get props => [];
}
