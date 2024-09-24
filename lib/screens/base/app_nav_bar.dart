import 'package:eye_muslim/screens/base/widgets/nav_bar_item.dart';
import 'package:eye_muslim/screens/biography/biography_screen.dart';
import 'package:eye_muslim/screens/home/home_screen.dart';
import 'package:eye_muslim/screens/mosques/mosques_screen.dart';
import 'package:eye_muslim/screens/quran/quran_screen.dart';
import 'package:eye_muslim/screens/times/times_screen.dart';
import 'package:eye_muslim/utils/base_extensions.dart';
import 'package:eye_muslim/utils/my_images.dart';
import 'package:eye_muslim/utils/my_theme.dart';
import 'package:flutter/material.dart';

class AppNavBar extends StatefulWidget {
  const AppNavBar({
    super.key,
  });

  @override
  State<AppNavBar> createState() => _AppNavBarState();
}

class _AppNavBarState extends State<AppNavBar> {
  int _currentIndex = 0;
  late PageController _pageController;
  //final cloudMessagingService = CloudMessagingService();
  //late AuthProvider authProvider;

  final items = [
    MyImages.home,
    MyImages.quran,
    MyImages.times,
    MyImages.hadith,
    MyImages.mosques,
  ];

  List<String> _getTitle(BuildContext context) {
    return [
      context.appLocalization.home,
      context.appLocalization.quran,
      context.appLocalization.times,
      context.appLocalization.biography,
      context.appLocalization.mosques,
    ];
  }

  final screens = [
    const HomeScreen(),
    const QuranScreen(),
    const TimesScreen(),
    const BiographyScreen(),
    const MosquesScreen(),
  ];

  void _onSelect(int index) {
    setState(() {
      _currentIndex = index;
    });
    _pageController.jumpToPage(_currentIndex);
  }

  @override
  void initState() {
    super.initState();
    //authProvider = context.authProvider;
    _pageController = PageController();
     //authProvider.updateDeviceToken(context);
     //if(authProvider.isAuthenticated) {
      //  authProvider.tokenCheck(context);
     //}
    //cloudMessagingService.requestPermission();
    //cloudMessagingService.init(context);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool withNotch = MediaQuery.of(context).viewPadding.bottom > 0.0;
    final Locale myLocale = Localizations.localeOf(context);
    final StringcountryCode = myLocale.countryCode;
    print("StringcountryCode:: $StringcountryCode");
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.transparent,
      bottomNavigationBar: Container(
        height: withNotch ? 95 : 85,
        width: context.mediaQuery.width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(MyTheme.radiusSecondary),
            topRight: Radius.circular(MyTheme.radiusSecondary),
          ),
          boxShadow: [
            BoxShadow(
              color: context.colorPalette.grey81,
              offset: const Offset(0.0, 1.0),
              blurRadius: 3.0,
            ),
          ],
        ),
        child: Row(
          children: screens.map((element) {
            final index = screens.indexOf(element);
            return NavBarItem(
              onTap: () {
               _onSelect(index);
             },
              isSelected: _currentIndex == index,
              icon: items[index],
              title: _getTitle(context)[index],
            );
          }).toList(),
        ),
      ),
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: screens,
      ),
    );
  }
}
