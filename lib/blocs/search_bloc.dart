import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/user.dart';

abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchSuccess extends SearchState {
  final List<User> users;

  SearchSuccess(this.users);
}

class SearchNoData extends SearchState {}

abstract class SearchEvent {}

class SearchUsers extends SearchEvent {
  final String query;

  SearchUsers(this.query);
}

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final FirebaseFirestore firestore;

  SearchBloc(this.firestore) : super(SearchInitial()) {
    on<SearchUsers>((event, emit) async {
      emit(SearchLoading());
      List<User> users = [];

      try {
        final querySnapshot = await firestore.collection('users').get();
        users =
            querySnapshot.docs.map((doc) => User.fromDocument(doc)).toList();

        if (event.query.isNotEmpty) {
          users = users
              .where((user) =>
                  user.firstName
                      .toLowerCase()
                      .contains(event.query.toLowerCase()) ||
                  user.lastName
                      .toLowerCase()
                      .contains(event.query.toLowerCase()))
              .toList();
        }

        if (users.isNotEmpty) {
          emit(SearchSuccess(users));
        } else {
          emit(SearchNoData());
        }
      } catch (e) {
        emit(SearchNoData());
      }
    });
  }
}
