import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubit/page/add_comment/add_comment_page_cubit.dart';

class AddCommentPage extends StatelessWidget {
  const AddCommentPage({Key? key}) : super(key: key);

  String? _validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'The field should not be empty';
    }

    return null;
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'The field should not be empty';
    } else if (!EmailValidator.validate(value)) {
      return 'Incorrect email';
    }

    return null;
  }

  String? _validateText(String? value) {
    if (value == null || value.isEmpty) {
      return 'The field should not be empty';
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(fontSize: 16);

    return BlocBuilder<AddCommentPageCubit, AddCommentPageState>(
        builder: (context, state) {
      if (state is AddCommentPageShow) {
        return Scaffold(
          appBar: AppBar(title: const Text('Add comment')),
          body: SingleChildScrollView(
              child: Container(
            margin: const EdgeInsets.all(15),
            child: Column(
              children: [
                Form(
                    key: state.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Name:', style: textStyle),
                        TextFormField(
                          validator: _validateName,
                          controller: state.nameEditingController,
                        ),
                        const SizedBox(height: 20),
                        const Text('Email:', style: textStyle),
                        TextFormField(
                            validator: _validateEmail,
                            controller: state.emailEditingController),
                        const SizedBox(height: 20),
                        const Text('Text:', style: textStyle),
                        TextFormField(
                          validator: _validateText,
                          controller: state.textEditingController,
                          maxLength: null,
                          maxLines: null,
                          textInputAction: TextInputAction.done,
                        )
                      ],
                    )),
                const SizedBox(height: 25),
                ElevatedButton(
                    onPressed: state.onPressed, child: const Text('Submit'))
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
