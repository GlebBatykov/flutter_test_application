import 'package:flutter/material.dart';

import '../../../../../domain/model/company.dart';
import '../preview_card.dart';

class UserPageCompanyPreview extends StatelessWidget {
  final Company company;

  final EdgeInsets margin;

  const UserPageCompanyPreview(
      {Key? key, required this.company, required this.margin})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: PreviewCard(
        margin: margin,
        boxShadow: [
          BoxShadow(
              offset: const Offset(0, 2),
              color: Colors.black.withOpacity(0.5),
              blurRadius: 6)
        ],
        children: [
          Text(company.name),
          const SizedBox(height: 3),
          Text(company.address),
          const SizedBox(height: 3),
          Flexible(
              child: Text(
            company.catchPhrase,
            style: const TextStyle(overflow: TextOverflow.ellipsis),
          ))
        ],
      ),
    );
  }
}
