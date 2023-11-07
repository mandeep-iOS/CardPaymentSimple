import 'package:flutter/material.dart';
import 'package:paymenttest/export.dart';


class DialogServices {


  static Future<Object?> showEmptyModal(BuildContext context,
      {String? title,
      TextStyle? titleStyle,
      Widget? body,
      String? iconPath,
      bool showIcon = true,
      double screenFraction = 0.4}) {
    bool fromTop = true;
    return showGeneralDialog(
      barrierLabel: "Label",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 700),
      context: context,
      pageBuilder: (context, anim1, anim2) {
        return Align(
          alignment:
              fromTop == true ? Alignment.topCenter : Alignment.bottomCenter,
          child: Container(
            constraints: const BoxConstraints(maxHeight: 400),
            margin: EdgeInsets.only(
                top: context.heightPx * screenFraction,
                left: Insets.l,
                right: Insets.l,
                bottom: 50),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Material(
              color: Colors.transparent,
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: Insets.l, vertical: 15.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Align(
                      alignment: Alignment.centerRight,
                      child: SizedBox(
                        height: 20,
                        width: 40,
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Positioned(
                              top: -60.0,
                              right: -8,
                              child: CircleAvatar(
                                  radius: 15.0,
                                  backgroundColor: Colors.white,
                                  child: Padding(
                                    padding: EdgeInsets.all(3.0),
                                    child: Icon(
                                      Icons.close,
                                      color: Colors.black,
                                      size: 20,
                                    ),
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                        height: 20,
                        width: 40,
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Positioned(
                              top: -21.0,
                              child: showIcon
                                  ? CircleAvatar(
                                      radius: 20,
                                      backgroundColor: const Color(0xffD9D9D9)
                                          .withOpacity(0.4),
                                      child: iconPath == null
                                          ? const Padding(
                                              padding:
                                                  EdgeInsets.all(3.0),
                                              child: Icon(
                                                  Icons.question_mark_rounded),
                                            )
                                          : Image.asset(iconPath),
                                    )
                                  : const SizedBox.shrink(),
                            ),
                          ],
                        ),
                      ),
                    ),
                    title == null ? const SizedBox.shrink() : const VSpace(10),
                    title == null
                        ? const SizedBox.shrink()
                        : Text(
                            title,
                            textAlign: TextAlign.center,
                            style: titleStyle ??
                                TextStyles.h5.copyWith(
                                    fontWeight: FontWeight.w900,
                                    color: Theme.of(context).primaryColor),
                          ),
                    const VSpace(10),
                    body ?? const SizedBox.shrink()
                  ],
                ),
              ),
            ),
          ),
        );
      },
      transitionBuilder: (context, anim1, anim2, child) {
        return SlideTransition(
          position: Tween(
                  begin: Offset(0, fromTop == true ? -1 : 1),
                  end: const Offset(0, 0))
              .animate(anim1),
          child: child,
        );
      },
    );
  }


}
