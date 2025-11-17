import 'package:flutter/material.dart';
import 'package:throw_user/modules/home_module/widgets/home_page_bottom_navigation_bar.dart';
import 'package:throw_user/modules/home_module/widgets/home_tab_widget.dart';
import 'package:throw_user/modules/home_module/widgets/profile_widget.dart';
import 'package:throw_user/modules/home_module/widgets/recent_deliveries_widget.dart';
import 'package:throw_user/modules/home_module/widgets/wallet_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();

  static route() => MaterialPageRoute(builder: (context) => HomePage());
}

class _HomePageState extends State<HomePage> {
  final ValueNotifier<int> _currentIndex = ValueNotifier<int>(0);

  late final List<Widget> _tabs;

  @override
  void initState() {
    super.initState();

    _tabs = [
      HomeTabWidget(),
      RecentDeliveriesWidget(),
      WalletWidget(),
      ProfileWidget(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    // Color definitions
    final backgroundColor = isDark
        ? const Color(0xFF101a22)
        : const Color(0xFFf6f7f8);
    final cardColor = isDark ? const Color(0xFF182430) : Colors.white;
    final textPrimaryColor = isDark
        ? const Color(0xFFf6f7f8)
        : const Color(0xFF111518);

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text(
          'Throw',
          style: TextStyle(
            color: textPrimaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: cardColor,
        elevation: 2,
        shadowColor: Colors.black.withValues(alpha: 0.1),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_outlined, color: textPrimaryColor),
            onPressed: () {},
          ),
        ],
      ),
      body: ValueListenableBuilder(
        valueListenable: _currentIndex,
        builder: (context, currentIndex, child) {
          return _tabs[currentIndex];
        },
      ),
      bottomNavigationBar: ValueListenableBuilder(
        valueListenable: _currentIndex,
        builder: (context, currentIndex, child) {
          return HomePageBottomNavigationBar(
            currentIndex: currentIndex,
            onSelectingNavTab: (index) {
              _currentIndex.value = index;
            },
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _currentIndex.dispose();
    super.dispose();
  }
}
