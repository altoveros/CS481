// Citation: api.flutter.dev
//    Scrolling table- https://stackoverflow.com/questions/56942322/how-to-create-a-horizontally-scrolling-table-with-fixed-column-in-flutter
import 'package:flutter/material.dart';


class PurchaseHistory extends StatefulWidget {
  @override
  _PurchaseHistory createState() => _PurchaseHistory();
}

class _PurchaseHistory extends State<PurchaseHistory> {
  List<History>_historyDisplay = List<History>();
  bool sort = false;
  @override
  void initState(){
    setState(() {
       _historyDisplay = history;
    });
    super.initState();
  }
  Widget bodyData() => DataTable(
      columnSpacing: 80,
      dataRowHeight: 40,
      sortColumnIndex: 0,
      sortAscending: sort,
      columns: <DataColumn>[
        DataColumn(
          label: Text("Date"),
          numeric: false,
          onSort: (index,ascending){
            _historyDisplay.sort((a, b) => a.date.compareTo(b.date));
            _historyDisplay = ascending ? _historyDisplay : _historyDisplay.reversed.toList();
            setState(() {
              sort = ascending;
            });
          },
          tooltip: "Date item purchased.",
        ),
        DataColumn(
          label: Text("Item"),
          numeric: false,
          tooltip: "Item purchased.",
        ),
        DataColumn(
          label: Text("Price"),
          numeric: false,
          tooltip: "Price of item purchased.",
        ),
      ],
      rows: _historyDisplay.map((_historyDisplay) =>DataRow(
          cells: [
            DataCell(Text(_historyDisplay.date),
              showEditIcon: false,
              placeholder: false,
            ),
            DataCell(Text(_historyDisplay.item),
              showEditIcon: false,
              placeholder: false,
            ),
            DataCell(Text(_historyDisplay.price),
              showEditIcon: false,
              placeholder: false,
            )
          ]))
          .toList()
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Purchase History")
      ),
         body: Column(
          children:[
            Container(
              child: _searchBar(),
            ),
            Flexible(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Container(
                  child: bodyData(),
                ),
              ),
            ),
         ],
      ),
    );
  }

  _searchBar(){
    return Padding(
      padding: const EdgeInsets.all(7.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search'
        ),
        onChanged: (text){
          text = text.toLowerCase();
          setState(() {
            _historyDisplay = history.where((note){
              var history = note.item.toLowerCase();
              return history.contains(text);
            }).toList();
          });
        }
      ),
    );
  }

}


class History{
  String date;
  String item;
  String price;

  History({this.date, this.item, this.price});
}

var history = <History>[
  History(date: "2020/10/25", item: "AAA Batteries",price:"8.99"),
  History(date: "2020/09/27", item: "Chair",price:"40.55"),
  History(date: "2020/08/14", item: "Lamp",price:"35.99"),
  History(date: "2019/01/04", item: "Hat",price:"15.99"),
  History(date: "2018/07/12", item: "Cat Litter",price:"20.44"),
];


