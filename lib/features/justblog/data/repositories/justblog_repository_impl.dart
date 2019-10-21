import 'package:dartz/dartz.dart';
import 'package:justblog/core/error/failures.dart';
import 'package:justblog/core/network/network_info.dart';
import 'package:justblog/features/justblog/data/datasources/justblog_local_data_source.dart';
import 'package:justblog/features/justblog/data/datasources/justblog_remote_data_source.dart';
import 'package:justblog/features/justblog/data/models/justblog_models.dart';
import 'package:justblog/features/justblog/domain/repositories/justblog_repository.dart';
import 'package:meta/meta.dart';
import '../../../../core/error/exceptions.dart';

typedef Future<JustBlogModel> _ConcreteOrListChooser();

class JustBlogRepositoryImpl implements JustBlogRepository {
  final JustBlogRemoteDataSource remoteDataSource;
  final JustBlogLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  JustBlogRepositoryImpl(
      {@required this.remoteDataSource,
      @required this.localDataSource,
      @required this.networkInfo});

  @override
  Future<Either<Failure, JustBlogModel>> getConcretePages(String search) async{
    // TODO: implement getConcretePages
    return await _getBlog((){
        return remoteDataSource.getConcretePages(search);
    });
  }

  @override
  Future<Either<Failure, JustBlogModel>> getListOfPages() async{
    // TODO: implement getListOfPages
    return await _getBlog((){
      return remoteDataSource.getListOfPages();
    });
  }

  Future<Either<Failure, JustBlogModel>> _getBlog(
    _ConcreteOrListChooser getConcreteOrList,
  ) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteBlog = await getConcreteOrList();
        localDataSource.cacheJustBlog(remoteBlog);
        return Right(remoteBlog);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localBlog = await localDataSource.getLastConcretePage();

        return Right(localBlog);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
