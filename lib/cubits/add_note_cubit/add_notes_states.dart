abstract class AddNoteState {}

class AddNoteInitial extends AddNoteState {}

class AddNotesLoading extends AddNoteState {}

class AddNotesSuccess extends AddNoteState {}

class AddNotesFailure extends AddNoteState {
  final String errMessage;

  AddNotesFailure(this.errMessage);
}
