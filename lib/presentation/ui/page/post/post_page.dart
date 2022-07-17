import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../cubit/page/post/post_page_cubit.dart';
import 'comments/post_page_comments.dart';

class PostPage extends StatelessWidget {
  const PostPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(fontSize: 16);

    return BlocBuilder<PostPageCubit, PostPageState>(builder: (context, state) {
      if (state is PostPageShow) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Post'),
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.green,
            onPressed: state.onPressed,
            child: const Icon(Icons.add),
          ),
          body: SingleChildScrollView(
              child: Container(
            padding: const EdgeInsets.all(15),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('Title: ${state.title}', style: textStyle),
              const SizedBox(height: 10),
              Text('Body: ${state.body}', style: textStyle),
              const SizedBox(height: 10),
              BlocProvider.value(
                  value: state.commentsCubit, child: const PostPageComments()),
            ]),
          )),
        );
      } else {
        return Container();
      }
    });
  }
}
