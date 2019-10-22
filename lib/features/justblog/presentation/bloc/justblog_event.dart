import 'package:equatable/equatable.dart';

abstract class JustBlogEvent extends Equatable {
  final List prop;

  JustBlogEvent([this.prop = const <dynamic>[]]);

  @override
  List<Object> get props => [prop];
}

class GetConcretePages extends JustBlogEvent {
  final String search;

  GetConcretePages(this.search);

  @override
  List<String> get props => [search];
}

class GetAllPages extends JustBlogEvent {}
