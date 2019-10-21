import 'package:dartz/dartz.dart';
import 'package:justblog/core/error/failures.dart';
import 'package:justblog/features/justblog/data/models/justblog_models.dart';

abstract class JustBlogRepository{

  Future<Either<Failure, JustBlogModel>> getConcretePages(String search);
  Future<Either<Failure, JustBlogModel>> getListOfPages();


}