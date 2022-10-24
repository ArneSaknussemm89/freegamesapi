part of layouts;

class TabletLayout extends StatelessWidget {
  const TabletLayout({
    required this.bodyBuilder,
    this.bottomNav,
    this.fab,
    this.appBar,
    this.backgroundColor,
    this.bottomButtons = const [],
    this.showAppBar = true,
    this.showFab = true,
    Key? key,
  }) : super(key: key);

  final WidgetBuilder bodyBuilder;

  final Widget? bottomNav;
  final Widget? fab;
  final PreferredSizeWidget? appBar;
  final Color? backgroundColor;
  final List<Widget> bottomButtons;
  final bool showAppBar;
  final bool showFab;

  Widget _buildLayout(BuildContext context, int sidebarWidth) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Scaffold(
            backgroundColor: backgroundColor,
            resizeToAvoidBottomInset: true,
            appBar: showAppBar ? defaultAppBar() : null,
            bottomNavigationBar: bottomNav,
            floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
            floatingActionButton: showFab ? fab : null,
            persistentFooterButtons:
                bottomButtons.isNotEmpty ? [...bottomButtons] : null,
            body: bodyBuilder(context),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    final width = (mq.size.width * 0.3).clamp(0, 300).toInt();
    return _buildLayout(context, width);
  }
}
