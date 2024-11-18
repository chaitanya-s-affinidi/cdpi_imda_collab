import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:job_portal/core/custom_hooks/af_value_notifier.dart';
import 'package:job_portal/features/affinidi-login/domain/repositories/affinidi_auth_repo.dart';
import 'package:job_portal/features/jobs/domain/entities/user_profile.dart';
import 'package:job_portal/features/jobs/domain/repositories/user_profile.provider.dart';
import 'package:job_portal/service_registry.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AuthCallbackPage extends HookConsumerWidget {
  const AuthCallbackPage({super.key});

  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {
    final ValueNotifier<String?> errNotifier = useAfValueNotifier(null);
    final ValueNotifier<bool> loadingInProgressFlagNotifier =
        useAfValueNotifier(false);
    useMemoized(() async {
      print("useCallback called");
      try {
        loadingInProgressFlagNotifier.value = true;
        final Map<String, dynamic> user =
            await ServiceRegistry.get<AffinidiAuthRepo>()
                .handleOAuthRedirectWeb(GoRouterState.of(context).uri);

        print("finished handleRedirect");
        // final List<Map<String, dynamic>> customAttrMapList =
        //     user["custom"].cast<Map<String, dynamic>>();
        String? givenName;
        String? familyName;
        String? email;
        // String? did;
        // for (Map<String, dynamic> customAttrMap in customAttrMapList) {
        // if (customAttrMap["givenName"] != null) {
        //   givenName = customAttrMap["givenName"];
        // }
        // if (customAttrMap["familyName"] != null) {
        //   familyName = customAttrMap["familyName"];
        // }
        // if (customAttrMap["email"] != null) {
        //   email = customAttrMap["email"];
        // }
        //   if (customAttrMap["did"] != null) {
        //     did = customAttrMap["did"];
        //   }
        // }
        givenName = user["given_name"];
        familyName = user["family_name"];
        email = user["email"];
        // did = (user["custom"] as Map<String, dynamic>)["did"];
        final UserProfile userProfile = UserProfile(
          givenName: givenName,
          familyName: familyName,
          email: email,
          // did: did,
          profilepic: user["picture"],
        );

        ref.read(userModelProvider.notifier).setUserProfile(
              profile: userProfile,
            );
        print("set userprofile");
        Future.delayed(const Duration(milliseconds: 300)).then((_) {
          loadingInProgressFlagNotifier.value = false;
          if (context.mounted) {
            print("routing to dashboard");
            context.go('/dashboard'); 
          }
        });
      } on Exception catch (err) {
        errNotifier.value = err.toString();
        loadingInProgressFlagNotifier.value = false;
      }
    }, []);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Auth Callback"),
      ),
      body: ValueListenableBuilder(
        valueListenable: loadingInProgressFlagNotifier,
        builder: (context, loadingInProgressFlag, _) {
          return loadingInProgressFlag
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const CircularProgressIndicator(),
                  ],
                )
              : ValueListenableBuilder(
                  valueListenable: errNotifier,
                  builder: (context, errString, _) {
                    return (errString != null) ? Text(errString) : Container();
                  },
                );
        },
      ),
    );
  }
}
