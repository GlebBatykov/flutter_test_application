import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubit/page/user/user_page_cubit.dart';
import 'user_page_albums.dart';
import 'companys/user_page_companys.dart';
import 'user_page_posts.dart';

class UserPage extends StatelessWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    const textStyle = TextStyle(fontSize: 16);

    return BlocBuilder<UserPageCubit, UserPageState>(builder: (context, state) {
      if (state is UserPageShow) {
        return Scaffold(
          appBar: AppBar(
            title: Text(state.username),
          ),
          body: SingleChildScrollView(
              child: Container(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Name: ${state.name}', style: textStyle),
                const SizedBox(height: 10),
                Text('Email: ${state.email}', style: textStyle),
                const SizedBox(height: 10),
                Text('Phone: ${state.phone}', style: textStyle),
                const SizedBox(height: 10),
                Text('Website: ${state.website}', style: textStyle),
                const SizedBox(height: 10),
                Text('Address: ${state.address}', style: textStyle),
                const SizedBox(height: 10),
                SizedBox(
                  height: 140,
                  width: size.width - 30,
                  child: UserPageCompanys(companys: state.companys),
                ),
                BlocProvider.value(
                    value: state.postsCubit, child: const UserPagePosts()),
                const SizedBox(height: 10),
                BlocProvider.value(
                    value: state.albumsCubit, child: const UserPageAlbums())
              ],
            ),
          )),
        );
      } else {
        return Container();
      }
    });
  }
}
