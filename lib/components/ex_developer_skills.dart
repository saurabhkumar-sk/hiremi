// import 'package:flutter/material.dart';
// import 'package:flutter_layout/components/database.dart';
// import 'package:flutter_layout/utils/my_colors.dart';

// class DropdownMenuExample extends StatefulWidget {
//   const DropdownMenuExample({super.key});

//   @override
//   State<DropdownMenuExample> createState() => _DropdownMenuExampleState();
// }

// class _DropdownMenuExampleState extends State<DropdownMenuExample> {
//   String dropdownValue = exDeveloperlist.first;

//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       keyboardType: TextInputType.emailAddress,
//       decoration: InputDecoration(
//         enabledBorder: const UnderlineInputBorder(
//           borderSide: BorderSide(
//             color: MyColor.borderColor,
//           ),
//         ),
//         focusedBorder: const UnderlineInputBorder(
//           borderSide: BorderSide(
//             color: MyColor.borderColor,
//           ),
//         ),
//         hintText: 'Ex-Developer',
//         hintStyle: const TextStyle(
//           color: MyColor.grey,
//           fontSize: 14,
//           fontWeight: FontWeight.w500,
//         ),
//         suffixIcon: DropdownMenu<String>(
//           width: 342,
//           initialSelection: exDeveloperlist.first,
//           onSelected: (String? value) {
//             // This is called when the user selects an item.
//             setState(() {
//               dropdownValue = value!;
//             });
//           },
//           dropdownMenuEntries:
//               exDeveloperlist.map<DropdownMenuEntry<String>>((String value) {
//             return DropdownMenuEntry<String>(value: value, label: value);
//           }).toList(),
//         ),
//       ),

//       //   IconButton(
//       //     onPressed: () {
//       //       // displayExDeveloperSkills = !displayExDeveloperSkills;
//       //     },
//       //     icon: const Icon(Icons.arrow_drop_down),
//       //   ),
//       // ),

//       // DropdownMenu<String>(
//       //   initialSelection: exDeveloperlist.first,
//       //   onSelected: (String? value) {
//       //     // This is called when the user selects an item.
//       //     setState(() {
//       //       dropdownValue = value!;
//       //     });
//       //   },
//       //   dropdownMenuEntries: exDeveloperlist.map<DropdownMenuEntry<String>>((String value) {
//       //     return DropdownMenuEntry<String>(value: value, label: value);
//       //   }).toList(),
//       // ),
//     );
//   }
// }
