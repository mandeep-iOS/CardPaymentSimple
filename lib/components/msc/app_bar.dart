import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:paymenttest/export.dart';

import '../icon_button.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    this.title,
    this.leading = true,
    this.trailing,
    this.leadingIcon,
    this.leadingIconColor,
    this.leadingWidth = 55.0,
    this.elevation,
    this.onTapLeadingIcon,
    this.backgroundColor,
    this.titleWidget,
    this.titleColor,
    this.titleSpacing = 2,
    Key? key,
  }) : super(key: key);
  final String? title;
  final Widget? titleWidget;
  final List<Widget>? trailing;
  final bool leading;
  final Widget? leadingIcon;
  final double appBarSize = 65.0;
  final double? leadingWidth;
  final double titleSpacing;
  final double? elevation;
  final Color? leadingIconColor, titleColor, backgroundColor;
  final VoidCallback? onTapLeadingIcon;
  @override
  Widget build(BuildContext context) {
    AppTheme theme = context.watch();

    return AppBar(
      foregroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      leading: leading
          ? InkWell(
              highlightColor: Colors.blueGrey.shade200,
              borderRadius: BorderRadius.circular(Corners.s8),
              onTap: onTapLeadingIcon ?? () => Navigator.pop(context),
              child: leadingIcon ??
                  IcButton(
                    SvgIcon(
                      R.png.arrowLeftIcon.svg,
                      color: theme.black,
                      size: 20,
                    ),
                    onPressed: onTapLeadingIcon ?? () => Navigator.pop(context),
                    radius: Corners.s0,
                  ),
            )
          : const SizedBox.shrink(), //
      title: titleWidget ??
          (StringHelper.isEmpty(title)
              ? null
              : Text(title ?? '',
                      style: TextStyles.body1.semiBold.copyWith(
                          color: titleColor ?? theme.txt,
                          fontWeight: FontWeight.w700))
                  .center()),
      actions: trailing ?? [],
      backgroundColor: backgroundColor ?? theme.surface,
      elevation: elevation ?? 0,
      leadingWidth: leadingWidth,
      scrolledUnderElevation: 0,
      titleSpacing: titleSpacing,
      shadowColor: theme.black.withOpacity(0.5),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: theme.surface,
        statusBarIconBrightness: Brightness.dark,
        systemStatusBarContrastEnforced: true,
        statusBarBrightness: Brightness.dark,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBarSize);
}
