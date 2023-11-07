import 'package:flutter/material.dart';
import 'package:paymenttest/export.dart';

import '../../utils/styles/app_style.dart';

class LoaderStateItem extends StatefulWidget {
  const LoaderStateItem(
      {Key? key,
      required this.isLoading,
      required this.item,
      required this.widgetOnLoadSuccess})
      : super(key: key);
  final bool isLoading;
  final List<dynamic> item;
  final Widget widgetOnLoadSuccess;

  @override
  State<LoaderStateItem> createState() => _LoaderStateItemState();
}

class _LoaderStateItemState extends State<LoaderStateItem> {
  @override
  Widget build(BuildContext context) {
    if (widget.isLoading == true) {
      return UnconstrainedBox(
        child: Center(
          child: CircularProgressIndicator(
            strokeWidth: 1.5,
            color: Theme.of(context).primaryColor.withOpacity(0.4),
          ),
        ),
      );
    } else if (widget.isLoading == false && widget.item.isEmpty) {
      return Center(
        child: Text(
          'No records to display',
          style: TextStyles.body1.semiBold,
        ),
      );
    } else if (widget.isLoading == false && widget.item.isNotEmpty) {
      return widget.widgetOnLoadSuccess;
    } else {
      return Center(
        child: Text(
          'Error occurred',
          style: TextStyles.body1.semiBold,
        ),
      );
    }
  }
}
