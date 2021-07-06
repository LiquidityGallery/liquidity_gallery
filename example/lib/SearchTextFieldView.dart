// import 'package:flutter/material.dart';
// import 'package:flutter_typeahead/flutter_typeahead.dart';
// import 'package:liquidity_gallery/liquidity_gallery.dart';
// import 'package:search_choices/search_choices.dart';
// import 'package:searchfield/searchfield.dart';
//
// class SearchTextFieldView extends StatefulWidget {
//   const SearchTextFieldView({Key? key}) : super(key: key);
//
//   @override
//   _SearchTextFieldViewState createState() => _SearchTextFieldViewState();
// }
//
// class _SearchTextFieldViewState extends State<SearchTextFieldView> {
//   final List<int> _intList = [10, 11, 12, 13, 14, 15, 16, 23, 24, 25, 26, 27];
//
//   int? singleDialogValue;
//   int? smartSelectInt;
//
//   final _showSearchModalTextController = TextEditingController();
//   final _showSearchModalClassTextController = TextEditingController();
//   final _showOnlineSearchModalClassTextController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Search text field'),
//       ),
//       body: ListView(
//         padding: EdgeInsets.symmetric(horizontal: 20),
//         children: [
//           Text('Search Choice Single dialog'),
//           SearchChoices.single(
//             isExpanded: true,
//             menuBackgroundColor: Theme.of(context).scaffoldBackgroundColor,
//             onClear: () {
//               setState(() {
//                 singleDialogValue = null;
//               });
//             },
//             value: singleDialogValue,
//             items: _intList
//                 .map((e) =>
//                     DropdownMenuItem(value: e, child: Text(e.toString())))
//                 .toList(),
//             onChanged: (value) {
//               setState(() {
//                 singleDialogValue = value;
//               });
//             },
//           ),
//           Text('Dropdown search'),
//           SearchField(
//             suggestions: ['abc', 'cde', 'bdc'],
//           ),
//           Text('Typeahead'),
//           TypeAheadField<String>(
//               suggestionsCallback: (pattern) async {
//                 await Future.delayed(Duration(seconds: 5));
//                 return ['11', '22', '33', '44'];
//               },
//               itemBuilder: (context, suggestion) {
//                 return ListTile(
//                   title: Text(suggestion),
//                 );
//               },
//               onSuggestionSelected: (suggestion) => print(suggestion)),
//           ElevatedButton(
//               onPressed: () => showSearchModal<String>(context,
//                   items: ['abc', 'bcd', '222', '111'],
//                   filterFunction: (string, String filter) =>
//                       string.contains(filter),
//                   itemAsString: (string) => string),
//               child: Text('Show search modal')),
//           Text('showSearchModal normal use'),
//           TextField(
//             decoration: InputDecoration(hintText: 'Tap to showSearchModal'),
//             controller: _showSearchModalTextController,
//             onTap: () => showSearchModal<String>(context,
//                 items: ['abc', 'bcd', '222', '111'],
//                 filterFunction: (String string, String filter) =>
//                     string.contains(filter),
//                 itemAsString: (String string) => string).then((value) {
//               _showSearchModalTextController.text = value;
//             }),
//           ),
//           Text('showSearchModal class use'),
//           TextField(
//             decoration: InputDecoration(hintText: 'Tap to showSearchModal'),
//             controller: _showSearchModalClassTextController,
//             onTap: () => showSearchModal<ItemModel>(context,
//                 items: [
//                   ItemModel(id: '01', name: 'item01'),
//                   ItemModel(id: '02', name: 'Item02'),
//                   ItemModel(id: '03', name: 'Item 03')
//                 ],
//                 filterFunction: (ItemModel item, String filter) =>
//                     item.name.contains(filter) || item.id.contains(filter),
//                 itemAsString: (ItemModel item) => item.name).then((value) {
//               _showSearchModalClassTextController.text = value.name;
//             }),
//           ),
//           Text('ShowOnlineSearchModal class use'),
//           TextField(
//             decoration:
//                 InputDecoration(hintText: 'Tap to showOnlineSearchModal'),
//             controller: _showOnlineSearchModalClassTextController,
//             onTap: () => showOnlineSearchModal<ItemModel>(context,
//                 items: _futureItem(),
//                 itemAsString: (item) => item.name,
//                 filterFunction: (item, filter) => item.name.contains(filter)).then((value) => _showOnlineSearchModalClassTextController.text = value.name),
//           )
//         ],
//       ),
//     );
//   }
// }
//
// Future<List<ItemModel>> _futureItem() async {
//   await Future.delayed(Duration(seconds: 5));
//   return [
//     ItemModel(id: '01', name: 'item01'),
//     ItemModel(id: '02', name: 'Item02'),
//     ItemModel(id: '03', name: 'Item 03')
//   ];
// }
//
// class ItemModel {
//   String id;
//   String name;
//
//   ItemModel({required this.id, required this.name});
// }
