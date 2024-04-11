import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:uni_links/uni_links.dart';
import 'package:url_strategy/url_strategy.dart';

import 'auth/supabase_auth/supabase_user_provider.dart';
import 'auth/supabase_auth/auth_util.dart';
import 'backend/supabase/supabase.dart';
import 'backend/firebase/firebase_config.dart';
import 'flutter_flow/flutter_flow_theme.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'flutter_flow/internationalization.dart';
import 'index.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setPathUrlStrategy();
  await initFirebase();

  await SupaFlow.initialize();

  await FlutterFlowTheme.initialize();

  await FFLocalizations.initialize();

  final appState = FFAppState(); // Initialize FFAppState
  await appState.initializePersistedState();

  runApp(ChangeNotifierProvider(
    create: (context) => appState,
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();

  static _MyAppState of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>()!;
}

class _MyAppState extends State<MyApp> {
  Locale? _locale = FFLocalizations.getStoredLocale();
  ThemeMode _themeMode = FlutterFlowTheme.themeMode;

  late Stream<BaseAuthUser> userStream;

  late AppStateNotifier _appStateNotifier;
  late GoRouter _router;

  // Define _currentPage and _currentPageName
  Widget _currentPage = const HomePageWidget(); // Set default page
  String _currentPageName = 'HomePage'; // Set default page name

  @override
  void initState() {
    super.initState();

    _appStateNotifier = AppStateNotifier.instance;
    _router = createRouter(_appStateNotifier);
    userStream = bountyFeverSupabaseUserStream()
      ..listen((user) => _appStateNotifier.update(user));
    jwtTokenStream.listen((_) {});

    // Handle deep link
    handleDeepLink();
    Future.delayed(
      const Duration(milliseconds: 1000),
      () => _appStateNotifier.stopShowingSplashImage(),
    );
  }

  void handleDeepLink() async {
    // Get the initial URL when the app is launched
    Uri? initialUri = await getInitialUri();
    if (initialUri != null) {
      handleDeepLinkUrl(initialUri);
    }

    // Set up a listener for incoming URLs
    linkStream.listen(
        (Uri? uri) {
          if (uri != null) {
            handleDeepLinkUrl(uri);
          }
        } as void Function(String? event)?, onError: (err) {
      // Handle exception by warning the user their action did not succeed
    });
  }

  void handleDeepLinkUrl(Uri uri) {
    // Extract the route from the URL and navigate to the corresponding page
    String? path = uri.path;
    Map<String, String> parameters = uri.queryParameters;

    if (path == '/home') {
      setState(() {
        _currentPageName = 'HomePage';
      });
    } else if (path == '/competitions') {
      setState(() {
        _currentPageName = 'Competitions';
      });
    } else if (path == '/success') {
      String? sessionId = parameters['session_id'];
      if (sessionId != null) {
        setState(() {
          _currentPageName = 'Success';
        });
      }
    } else if (path == '/mytickets') {
      setState(() {
        _currentPageName = 'MyTickets';
      });
    } else if (path == '/myorders') {
      setState(() {
        _currentPageName = 'MyOrders';
      });
    } else if (path == '/myaccount') {
      setState(() {
        _currentPageName = 'MyAccount';
      });
    } else if (path == '/aboutus') {
      setState(() {
        _currentPageName = 'AboutUs';
      });
    } else if (path == '/contactus') {
      setState(() {
        _currentPageName = 'ContactUs';
      });
    } else if (path == '/feedback') {
      setState(() {
        _currentPageName = 'Feedback';
      });
    } else if (path == '/privacypolicy') {
      setState(() {
        _currentPageName = 'PrivacyPolicy';
      });
    } else if (path == '/termsandconditions') {
      setState(() {
        _currentPageName = 'TermsAndConditions';
      });
    } else if (path == '/cookiepolicy') {
      setState(() {
        _currentPageName = 'CookiePolicy';
      });
    } else if (path == '/acceptableusepolicy') {
      setState(() {
        _currentPageName = 'AcceptableUsePolicy';
      });
    } else if (path == '/refundpolicy') {
      setState(() {
        _currentPageName = 'RefundPolicy';
      });
    } else if (path == '/forgotpassword') {
      setState(() {
        _currentPageName = 'ForgotPassword';
      });
    } else if (path == '/updatepassword') {
      setState(() {
        _currentPageName = 'updatePassword';
      });
    } else if (path == '/ticketslistdetails') {
      setState(() {
        _currentPageName = 'TicketsListDetails';
      });
    } else if (path == '/myticketsdetails') {
      setState(() {
        _currentPageName = 'myticketsdetails';
      });
    } else if (path == '/login') {
      setState(() {
        _currentPageName = 'Login';
      });
    } else {
      // Handle unknown paths, you might want to navigate to a 'Not Found' page or show an error
    }
  }

  void cacheSharedLink(String link) {
    // Cache the shared link using SharedPreferences
    // Example:
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // prefs.setString('shared_link', link);
  }

  void setLocale(String language) {
    setState(() => _locale = createLocale(language));
    FFLocalizations.storeLocale(language);
  }

  void setThemeMode(ThemeMode mode) => setState(() {
        _themeMode = mode;
        FlutterFlowTheme.saveThemeMode(mode);
      });

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'BountyFever',
      localizationsDelegates: const [
        FFLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: _locale,
      supportedLocales: const [
        Locale('en'),
        Locale('ro'),
        Locale('de'),
        Locale('es'),
      ],
      theme: ThemeData(
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      themeMode: _themeMode,
      routerConfig: _router,
    );
  }
}

class NavBarPage extends StatefulWidget {
  const NavBarPage({super.key, this.initialPage, this.page});

  final String? initialPage;
  final Widget? page;

  @override
  _NavBarPageState createState() => _NavBarPageState();
}

class _NavBarPageState extends State<NavBarPage> {
  String _currentPageName = 'Competitions';
  late Widget? _currentPage;

  @override
  void initState() {
    super.initState();
    _currentPageName = widget.initialPage ?? _currentPageName;
    _currentPage = widget.page;
  }

  @override
  Widget build(BuildContext context) {
    final tabs = {
      'HomePage': const HomePageWidget(),
      'Competitions': const CompetitionsWidget(),
      'Winners': const WinnersWidget(),
      'TicketsList': const TicketsListWidget(),
    };
    final currentIndex = tabs.keys.toList().indexOf(_currentPageName);

    return Scaffold(
      body: _currentPage ?? tabs[_currentPageName],
      bottomNavigationBar: Visibility(
        visible: responsiveVisibility(
          context: context,
          tabletLandscape: false,
          desktop: false,
        ),
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (i) => setState(() {
            _currentPage = null;
            _currentPageName = tabs.keys.toList()[i];
          }),
          backgroundColor: FlutterFlowTheme.of(context).primaryText,
          selectedItemColor: FlutterFlowTheme.of(context).primary,
          unselectedItemColor: FlutterFlowTheme.of(context).primaryBackground,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: const Icon(
                Icons.home_outlined,
                size: 24.0,
              ),
              activeIcon: const Icon(
                Icons.home,
                size: 28.0,
              ),
              label: FFLocalizations.of(context).getText(
                '1viy95jo' /* Home */,
              ),
              tooltip: '',
            ),
            BottomNavigationBarItem(
              icon: const FaIcon(
                FontAwesomeIcons.gift,
                size: 24.0,
              ),
              activeIcon: const FaIcon(
                FontAwesomeIcons.gifts,
                size: 28.0,
              ),
              label: FFLocalizations.of(context).getText(
                'rd1ydmzh' /* Competitions */,
              ),
              tooltip: '',
            ),
            BottomNavigationBarItem(
              icon: const Icon(
                Icons.person_outline,
                size: 24.0,
              ),
              activeIcon: const Icon(
                Icons.person_rounded,
                size: 28.0,
              ),
              label: FFLocalizations.of(context).getText(
                'wa42169b' /* Winners */,
              ),
              tooltip: '',
            ),
            BottomNavigationBarItem(
              icon: const FaIcon(
                FontAwesomeIcons.ticketAlt,
                size: 24.0,
              ),
              activeIcon: const FaIcon(
                FontAwesomeIcons.ticketAlt,
                size: 28.0,
              ),
              label: FFLocalizations.of(context).getText(
                'zkummwj9' /* Tickets */,
              ),
              tooltip: '',
            )
          ],
        ),
      ),
    );
  }
}
