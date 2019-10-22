import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'core/network/network_info.dart';
import 'core/util/search_input.dart';
import 'features/justblog/data/datasources/justblog_local_data_source.dart';
import 'features/justblog/data/datasources/justblog_remote_data_source.dart';
import 'features/justblog/data/repositories/justblog_repository_impl.dart';
import 'features/justblog/domain/repositories/justblog_repository.dart';
import 'features/justblog/domain/usecases/get_concrete_justblog_content.dart';
import 'features/justblog/domain/usecases/get_justblog_content_list.dart';
import 'features/justblog/presentation/bloc/justblog_bloc.dart';

final sl = GetIt.instance;


    Future<void> init()async{

  //!Features

      sl.registerFactory(
          () => JustBlogBloc(
            list: sl(),
            concrete: sl(),
            searchInput: sl(),

          )
      );


      //Use cases
      sl.registerLazySingleton(()=> GetJustBlogContentList(sl()));
      sl.registerLazySingleton(() => GetConcreteJustBlogContent(sl()));



      //Repository

      sl.registerLazySingleton<JustBlogRepository>(()=> JustBlogRepositoryImpl(

        localDataSource: sl(),
        networkInfo: sl(),
        remoteDataSource: sl(),

      ));



      //Data source
      sl.registerLazySingleton<JustBlogRemoteDataSource>(
              ()=> JustBlogRemoteDataSourceImpl(client: sl())
      );

      //local
      sl.registerLazySingleton<JustBlogLocalDataSource>(
          ()=> JustBlogLocalDataSourceImpl(sharedPreferences: sl()),
      );



  //! Core
      sl.registerLazySingleton(()=> SearchInput());
      sl.registerLazySingleton<NetworkInfo>(
          ()=> NetworkInfoImpl(sl()),
      );

      //! External
      final sharedPreferences = await SharedPreferences.getInstance();
      sl.registerLazySingleton(() => sharedPreferences);
      sl.registerLazySingleton(() => http.Client());
      sl.registerLazySingleton(() => DataConnectionChecker());



    }