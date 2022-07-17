import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:poseidon/poseidon.dart';

import '../cubit/page/add_comment/add_comment_page_cubit.dart';
import '../ui/page/add_comment_page/add_comment_page.dart';

class AddCommentPageRoute extends PoseidonRoute {
  final int postId;

  final void Function()? onAdding;

  AddCommentPageRoute(this.postId, {this.onAdding});

  @override
  MaterialPageRoute route(BuildContext context) {
    return MaterialPageRoute(
        builder: (context) => BlocProvider<AddCommentPageCubit>(
            create: (context) =>
                AddCommentPageCubit(postId, onAdding: onAdding),
            child: const AddCommentPage()));
  }
}
