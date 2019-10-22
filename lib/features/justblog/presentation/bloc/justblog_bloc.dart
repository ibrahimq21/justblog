import 'package:dartz/dartz.dart';
import 'package:justblog/core/error/failures.dart';
import 'package:justblog/core/usecases/usecase.dart';
import 'package:justblog/core/util/search_input.dart';
import 'package:justblog/features/justblog/data/models/justblog_models.dart';
import 'package:justblog/features/justblog/domain/usecases/get_concrete_justblog_content.dart';
import 'package:justblog/features/justblog/domain/usecases/get_justblog_content_list.dart';
import 'package:bloc/bloc.dart';

import 'justblog_event.dart';
import 'justblog_state.dart';
import 'bloc.dart';
import 'package:meta/meta.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CACHE_FAILURE_MESSAGE = 'Cache Failure';
const String INVALID_INPUT_FAILURE_MESSAGE =
    'Invalid Input - The number must be a positive integer or zero.';



class JustBlogBloc extends Bloc<JustBlogEvent, JustBlogState>{


  final GetConcreteJustBlogContent getConcreteJustBlogContent;
  final GetJustBlogContentList getJustBlogContentList;
  final SearchInput searchInput;

  JustBlogBloc({
    @required GetConcreteJustBlogContent concrete,
    @required GetJustBlogContentList list,
    @required this.searchInput}): assert(concrete != null),
        assert(list != null),
        assert(searchInput != null),
        getConcreteJustBlogContent = concrete,
        getJustBlogContentList = list;


  @override
  // TODO: implement initialState
  JustBlogState get initialState => Empty();

  @override
  Stream<JustBlogState> mapEventToState(JustBlogEvent event)async* {
    // TODO: implement mapEventToState



    if(event is GetConcretePages){

      final inputEither = searchInput.stringSearch(event.search);

      yield* inputEither.fold((failure)async*{yield Error(message: INVALID_INPUT_FAILURE_MESSAGE);},

          (string) async*{


            yield Loading();
            final failureOrJustBlog = await getConcreteJustBlogContent(Params(search: string));
            yield* _eitherLoadedOrErrorState(failureOrJustBlog);

          },

      );


    }
    else
    if(event is GetAllPages){

      yield Loading();
      final failureOrJustBlog = await getJustBlogContentList(NoParams());
      yield* _eitherLoadedOrErrorState(failureOrJustBlog);


    }




  }

  Stream<JustBlogState> _eitherLoadedOrErrorState(
      Either<Failure, JustBlogModel> failureOrJustBlog
      )async*{

    yield failureOrJustBlog.fold((failure) => Error(message: _mapFailureToMessage(failure)),

        (justblog) => Loaded(justblog: justblog)

    );



  }


  String _mapFailureToMessage(Failure failure){
    switch(failure.runtimeType){
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;

      case CacheFailure:
        return CACHE_FAILURE_MESSAGE;

      default:
        return 'Unexpected error';


    }

  }


}