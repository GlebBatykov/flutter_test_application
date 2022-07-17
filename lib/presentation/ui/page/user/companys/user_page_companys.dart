import 'package:flutter/material.dart';

import '../../../../../domain/model/company.dart';
import 'user_page_company_preview.dart';

class UserPageCompanys extends StatelessWidget {
  final List<Company> companys;

  EdgeInsets _getMargin(int index, int length) {
    return index == 0
        ? const EdgeInsets.only(left: 10, top: 10, bottom: 10, right: 5)
        : index < length - 1
            ? const EdgeInsets.only(left: 5, right: 5, top: 10, bottom: 10)
            : const EdgeInsets.only(right: 10, left: 5, bottom: 10, top: 10);
  }

  const UserPageCompanys({Key? key, required this.companys}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var length = companys.length;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Working:', style: TextStyle(fontSize: 16)),
        Expanded(
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: length,
                itemBuilder: (context, index) {
                  var maring = _getMargin(index, length);

                  return UserPageCompanyPreview(
                      company: companys[index], margin: maring);
                }))
      ],
    );
  }
}
