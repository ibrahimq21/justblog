import 'package:dartz/dartz.dart';
import 'package:justblog/core/error/failures.dart';
import 'package:justblog/core/usecases/usecase.dart';
import 'package:justblog/features/justblog/data/models/justblog_models.dart';
import 'package:justblog/features/justblog/domain/repositories/justblog_repository.dart';
import 'package:meta/meta.dart';

class GetJustBlogContentList implements UseCase<JustBlogModel, NoParams>{

  final JustBlogRepository repo;

  GetJustBlogContentList({@required this.repo});

  @override
  Future<Either<Failure, JustBlogModel>> call(NoParams noParams) async{
    // TODO: implement call
    return await repo.getListOfPages();
  }


}


