
// // import 'package:app_links/app_links.dart';

// // AppLinks.

// StreamSubscription<String> _subUniLinks;

// @override
// initState() {
//     super.initState();
//     // universal link setup
//     initUniLinks();
// }

// Future<void> initUniLinks() async {
//     try {
//         final String initialLink = await getInitialLink();
//         await processLink(initialLink);
//     } on PlatformException {
//     }
//     _subUniLinks = linkStream.listen(processLink, onError: (err) {});
// }

// processLink(String link) async {
//     // parse link and decide what to do:
//     // - use setState
//     // - or use Navigator.pushReplacement
//     // - or whatever mechanism if you have in your app for routing to a page
// }

// @override
// dispose() {
//     if (_subUniLinks != null) _subUniLinks.cancel();
//     super.dispose();
// }