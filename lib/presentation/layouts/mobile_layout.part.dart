part of layouts;

class MobileLayout extends StatelessWidget {
  const MobileLayout({
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      resizeToAvoidBottomInset: true,
      appBar: showAppBar ? defaultAppBar() : null,
      drawer: const AppDrawer(),
      bottomNavigationBar: bottomNav,
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: showFab ? fab : null,
      persistentFooterButtons: bottomButtons.isNotEmpty
          ? [
              ...bottomButtons,
            ]
          : null,
      body: bodyBuilder(context),
    );
  }
}
