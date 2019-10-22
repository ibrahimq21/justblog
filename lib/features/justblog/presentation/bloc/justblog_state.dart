import 'package:equatable/equatable.dart';
import 'package:justblog/features/justblog/domain/entities/justblog.dart';
import 'package:meta/meta.dart';

abstract class JustBlogState extends Equatable {
  final List prop;

  JustBlogState([this.prop = const <dynamic>[]]);

  @override
  List get props => [prop];
}

class Empty extends JustBlogState {}

class Loading extends JustBlogState {}

class Loaded extends JustBlogState {
  final JustBlog justblog;

  Loaded({@required this.justblog}) : super([justblog]);
}

class Error extends JustBlogState {
  final String message;

  Error({@required this.message}) : super([message]);
}
