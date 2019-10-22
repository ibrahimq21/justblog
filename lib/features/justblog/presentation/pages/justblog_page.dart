import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:justblog/features/justblog/presentation/bloc/justblog_bloc.dart';

import '../../../../injection_container.dart';
class JustBlogPage extends StatelessWidget{



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(

      body: buildBody(context),
    );
  }

  BlocProvider<JustBlogBloc> buildBody(BuildContext context) {



    return BlocProvider(

      builder: (_)=> sl<JustBlogBloc>(),



    );
  }



}