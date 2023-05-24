import 'package:flutter/material.dart';

class DataTableView extends StatefulWidget {
  const DataTableView({super.key});

  @override
  State<DataTableView> createState() => _DataTableViewState();
}

List<Student> lstStudent = [
  Student(fname: 'aarati', age: 30),
  Student(fname: 'karna', age: 55),
  Student(fname: 'janaki', age: 53),
  Student(fname: 'anil', age: 27),
  Student(fname: 'padam', age: 90),
];

class _DataTableViewState extends State<DataTableView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Table'),
        centerTitle: true,
        elevation: 0,
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: DataTable(
          headingRowColor: MaterialStateColor.resolveWith(
            (states) => Colors.amber,
          ),
          border: TableBorder.all(color: Colors.black),
          columns: const [
            DataColumn(
                label: Expanded(
                    child: Text(
              'Name',
              textAlign: TextAlign.center,
              // style: TextStyle(color: Colors.red),
            ))),
            DataColumn(
                label: Expanded(
                    child: Text(
              'Roll No',
              textAlign: TextAlign.center,
            ))),
            DataColumn(
              label: Expanded(
                child: Center(
                  child: Text(
                    'Action',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
          rows: [
            for (Student student in lstStudent) ...{
              DataRow(
                cells: [
                  DataCell(Center(child: Text(student.fname!))),
                  DataCell(Center(child: Text(student.age.toString()))),
                  DataCell(
                    Expanded(
                      child: Center(
                        child: Wrap(
                          children: [
                            IconButton(
                                onPressed: () {}, icon: const Icon(Icons.edit)),
                            IconButton(
                                onPressed: () {
                                  _showAlertDialog(context, student);
                                },
                                icon: const Icon(Icons.delete)),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            },
            // DataRow(
            //   cells: [
            //     const DataCell(Text('Marry')),
            //     const DataCell(Text('11')),
            //     DataCell(
            //       Expanded(
            //         child: Center(
            //           child: Wrap(
            //             children: [
            //               IconButton(
            //                   onPressed: () {}, icon: const Icon(Icons.edit)),
            //             ],
            //           ),
            //         ),
            //       ),
            //     )
            //   ],
            // ),
          ],
        ),
      ),
    );
  }

  _showAlertDialog(BuildContext context, Student student) {
    //set up the AlertDialog

    AlertDialog alert = AlertDialog(
      title: const Text("delet ?"),
      content: Text("Are you sure you want ot delete ${student.fname} ??"),
      actions: [
        TextButton(
          child: const Text("No"),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        TextButton(
          child: const Text("Yes"),
          onPressed: () {
            setState(() {
              lstStudent.remove(student);
            });
            Navigator.pop(context);
          },
        ),
      ],
    );

    //show the dialod

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        });
  }
}

class Student {
  String? fname;
  int? age;

  Student({this.fname, this.age});
}
