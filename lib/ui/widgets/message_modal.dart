// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:store_management/helpers/localization_helper.dart';
// import 'package:store_management/ui/provider/message_provider.dart';
// import 'package:store_management/ui/theme/theme.dart';
// import 'package:store_management/ui/theme/theme_util.dart';
// import 'package:store_management/ui/widgets/space.dart';

// class MessageModal extends ConsumerWidget {
//   const MessageModal({super.key, required this.message, this.code});
//   static const String route = '/error';
//   final String message;
//   final int? code;
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final controller = ref.read(messageProvider.notifier);

//     return AlertDialog.adaptive(
//       actionsPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
//       buttonPadding: const EdgeInsets.symmetric(horizontal: 50).copyWith(bottom: 10),
//       shape: RoundedRectangleBorder(borderRadius: SystemTheme.borderRadius),
//       backgroundColor: Theme.of(context).colorScheme.surface,
//       title: Column(
//         children: [
//           Text(
//             LocalizationHelper.getLocalizedString(context, 'atentionError'),
//             style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.onSurface),
//           ),
//           Space(
//             vertical: 16,
//             child: Image.asset(
//               'assets/pharaoh_error.png',
//               height: ThemeUtil.deviceSize == DeviceSize.small ? 50 : 80,
//               bundle: rootBundle,
//             ),
//           ),
//         ],
//       ),
//       content: Text(
//         message.contains('XMLHttpRequest error') ? 'Error de conexión, vuelva a intentar mas tarde.' : message,
//         style: Theme.of(context).textTheme.bodySmall!.copyWith(
//               color: Theme.of(context).colorScheme.onSurface,
//             ),
//       ),
//       actions: [
//         TextButton(
//             style: ButtonStyle(shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: SystemTheme.borderRadius))),
//             onPressed: () {
//               controller.clear(context, logout: code == 401);

//               Navigator.of(context).pop();
//             },
//             child: Text('Aceptar',
//                 style: Theme.of(context).textTheme.bodySmall!.copyWith(
//                       color: Theme.of(context).colorScheme.onSurface,
//                     )))
//       ],
//     );
//   }
// }
