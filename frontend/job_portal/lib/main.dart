import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:job_portal/core/usecases/usecase.dart';
import 'package:job_portal/features/affinidi-login/presentation/pages/auth_callback.page.dart';
import 'package:job_portal/features/common/pages/dashboard.page.dart';
import 'package:job_portal/features/inji_oid4vp/domain/providers/new_credentials.provider.dart';
import 'package:job_portal/features/inji_oid4vp/domain/repositories/oid4vp_websocket_repo.dart';
import 'package:job_portal/features/inji_oid4vp/domain/usecases/start_listening_to_websocket.dart';
import 'package:job_portal/features/jobs/presentation/pages/job-application.page.dart';
import 'package:job_portal/home.page.dart';
import 'package:job_portal/service_registry.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  ServiceRegistry.registerAll();
  usePathUrlStrategy();
  dotenv.load(fileName: ".env").then(
        (_) => runApp(
          ProviderScope(
            child: const MyApp(),
          ),
        ),
      );
}

final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const HomePage();
        // return const DashboardPage();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'callback',
          builder: (BuildContext context, GoRouterState state) {
            return const AuthCallbackPage();
          },
        ),
        GoRoute(
          path: 'jobapplication',
          builder: (BuildContext context, GoRouterState state) {
            return JobApplicationPage();
          },
        ),
        GoRoute(
          path: 'dashboard',
          builder: (BuildContext context, GoRouterState state) {
            // final String userEmail = state.uri.queryParameters["userEmail"]!;
            return const DashboardPage();
          },
        ),
        // GoRoute(
        //   path: 'applicationsuccess',
        //   builder: (BuildContext context, GoRouterState state) {
        //     return const ApplicationSuccessPage();
        //   },
        // ),
      ],
    ),
  ],
);

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {
    ServiceRegistry.get<Oid4vpWebsocketRepo>().startListening(
      newCredentials: ref.read(
        newCredentialsProvider.notifier,
      ),
    );

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'My Buddy',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.cyanAccent,
          brightness: Brightness.light,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            textStyle: const TextStyle(
              color: Color(0xFF020202),
              // fontWeight: FontWeight.bold,
              fontSize: 12,
              fontFamily: "DM Sans Bold",
            ),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            textStyle: const TextStyle(
              // fontWeight: FontWeight.bold,
              fontSize: 12,
              fontFamily: "DM Sans Bold",
            ),
            side: const BorderSide(
              color: Color(0xFF006A6B),
              width: 0.5,
            ),
          ),
        ),
        checkboxTheme: CheckboxThemeData(
          checkColor: MaterialStateProperty.all(
            const Color(0xFF041F1F), // on Secondary Container
          ),
          fillColor: MaterialStateProperty.resolveWith((states) {
            // If the button is pressed, return size 40, otherwise 20
            if (states.contains(MaterialState.selected)) {
              return const Color(0xFFCCE8E7); // Secondary Container
            }
            return null;
          }),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            textStyle: const TextStyle(
              // fontWeight: FontWeight.bold,
              fontSize: 12,
              fontFamily: "DM Sans Bold",
            ),
          ),
        ),
        chipTheme: const ChipThemeData(
          backgroundColor: Color(0xFF8FF3F2),
          selectedColor: Color(0xFF8FF3F2),
          labelStyle: TextStyle(
            color: Color(0xFF020202),
            // fontWeight: FontWeight.bold,
            fontSize: 12,
            fontFamily: 'DM Sans Bold',
          ),
        ),
        cardTheme: const CardTheme(
          color: Colors.white,
          surfaceTintColor: Colors.white,
        ),
        navigationBarTheme: NavigationBarThemeData(
          labelTextStyle: MaterialStateProperty.all(
            const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 10,
            ),
          ),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor:
              Color(0xffE9E9EC), //Affinidi Bg Color with 0.1 opacity

          titleTextStyle: TextStyle(
            fontSize: 16,
            fontFamily: 'DM Sans Bold',
            color: Colors.black87, // On Inverse Surface
          ),
          iconTheme: IconThemeData(
            color: Colors.black87,
            size: 24,
          ),
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Color(0xFFCCE8E7), // secondary container
          extendedTextStyle: TextStyle(
            color: Color(0xFF041F1F),
          ), // on secondary container
        ),
        tabBarTheme: const TabBarTheme(
          // indicator: BoxDecoration(
          //   color: Color(0xFF8FF3F2),
          // ),

          labelPadding: EdgeInsets.all(0),
          labelColor: Colors.black87,
          labelStyle: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.bold,
          ),
          unselectedLabelColor: Colors.black87,
          unselectedLabelStyle: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.bold,
          ),
        ),
        switchTheme: SwitchThemeData(
          trackColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.selected)) {
              return const Color(0xFFCCE8E7); // Secondary Container
            }
            return null;
          }),
          thumbColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.selected)) {
              return const Color(0xFF4A6363); // Secondary
            }
            return null;
          }),
        ),
        fontFamily: 'DM Sans Medium',
      ),
      // home: const HomePage(),
      // routes: {
      //   'callback': (context) {
      //     return const AuthCallbackPage();
      //   }
      // }
      routerConfig: _router,
    );
  }
}
