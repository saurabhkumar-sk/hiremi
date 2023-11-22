import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_layout/models/collage_model.dart';
import 'package:flutter_layout/provider/collage_list.dart';
import 'package:provider/provider.dart';

class CollageListScreen extends StatefulWidget {
  final void Function(String collageName) onCollageSelected;
  const CollageListScreen({Key? key, required this.onCollageSelected})
      : super(key: key);

  @override
  State<CollageListScreen> createState() => _CollageListScreenState();
}

class _CollageListScreenState extends State<CollageListScreen> {
  final collageController = TextEditingController();

  List<College> _colleges = [];
  List<College> _filteredColleges = [];

  // fetch content from the JSON file
  Future<void> readJson() async {
    final response = await rootBundle.loadString('assets/collageList.json');
    final data = jsonDecode(response)["collages"];

    List<College> colleges = [];
    for (var collegeData in data) {
      colleges.add(
        College(
          collegeData["S. No."],
          collegeData["College Name"],
        ),
      );
    }

    setState(() {
      _colleges = colleges;
      _filteredColleges = colleges;
    });
  }

  void filterColleges(String query) {
    setState(() {
      _filteredColleges = _colleges
          .where((college) =>
              college.collegeName.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  void initState() {
    super.initState();
    readJson();
  }

  @override
  Widget build(BuildContext context) {
    var collageProvider = Provider.of<CollageListProvider>(context);
    String collageName = collageProvider.collageName;

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: TextFormField(
                controller: collageController,
                onChanged: (query) {
                  filterColleges(query);
                },
                decoration: const InputDecoration(
                    hintText: "search", border: OutlineInputBorder()),
              ),
            ),
            _filteredColleges.isEmpty
                ? Center(
                    child: TextButton(
                        onPressed: () {
                          collageName = collageController.text.toString();
                          widget.onCollageSelected(collageName);
                          Navigator.pop(context);
                          //  print(collageName);
                        },
                        child: Text('Submit')),
                  )
                : Expanded(
                    child: ListView.builder(
                      itemCount: _filteredColleges.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title:
                              Text('${_filteredColleges[index].collegeName}'),
                          onTap: () {
                            collageName =
                                '${_filteredColleges[index].collegeName}'
                                    .toString();
                            widget.onCollageSelected(collageName);
                            //   print(collageName);
                            Navigator.pop(context);
                          },
                        );
                      },
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
