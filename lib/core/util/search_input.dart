import 'package:dartz/dartz.dart';
import 'package:justblog/core/error/failures.dart';

class SearchInput{

    Either<Failure, String> stringSearch(String search){
      try{

        return Right(search);


      }on FormatException{

        return Left(InvalidInputFailure());

      }
    }

}


class InvalidInputFailure extends Failure {}