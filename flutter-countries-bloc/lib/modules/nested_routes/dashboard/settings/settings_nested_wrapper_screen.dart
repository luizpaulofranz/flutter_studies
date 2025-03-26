import 'package:auto_route/auto_route.dart';

// The nested routes requires a few particularities in order to work
// this page is responsible to render all the nested routes, but this isn't a real screen
// it's AutoRoutes who make the trick, we can use it as a widget inside a page to make
// the nested routes render inside the same screen
// BUT with this approach here we render each nested route as an individual screen, this is just a wrappper
// look the configuration on routes.dart
@RoutePage()
class SettingsNestedWrapperScreen extends AutoRouter {
  const SettingsNestedWrapperScreen({super.key});
}

// @RoutePage()
// class ShellForNestedScreen extends StatelessWidget {
//   const ShellForNestedScreen({super.key});
//   @override
//   Widget build(BuildContext context) {
//     /// you can wrap the AutoRouter with any widget you want
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Nested Routes'),
//       ),
//       body: AutoRouter(),
//     );
//   }
// }
