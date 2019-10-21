import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:justblog/core/error/failures.dart';
import 'package:justblog/core/usecases/usecase.dart';
import 'package:justblog/features/justblog/data/models/justblog_models.dart';
import 'package:justblog/features/justblog/domain/repositories/justblog_repository.dart';
import 'package:meta/meta.dart';

class GetConcreteJustBlogContent implements UseCase<JustBlogModel, Params>{


  final JustBlogRepository repo;

  GetConcreteJustBlogContent({@required this.repo});


  @override
  Future<Either<Failure, JustBlogModel>> call(Params params) async{
    // TODO: implement call
    return await repo.getConcretePages(params.search);
  }
}

class Params extends Equatable {
  final String search;

  Params({@required this.search}) : super([search]);
}