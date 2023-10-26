import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      title: 'Inventory Management App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const RequisitionFormScreen(),
    ));

class RequisitionFormScreen extends StatefulWidget {
  const RequisitionFormScreen({super.key});

  @override
  _RequisitionFormScreenState createState() => _RequisitionFormScreenState();
}

class _RequisitionFormScreenState extends State<RequisitionFormScreen> {
  int _currentIndex = 1;
  DateTime _selectedDate = DateTime.now();
  final List<DataRow> _dataRows = [];

  Future<void> _selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  void _addRow() {
    setState(() {
      _dataRows.add(DataRow(
        cells: [
          DataCell(Text('${_dataRows.length + 1}')),
          const DataCell(TextField(
            decoration: InputDecoration(border: InputBorder.none),
          )),
          const DataCell(TextField(
            decoration: InputDecoration(border: InputBorder.none),
          )),
          const DataCell(TextField(
            decoration: InputDecoration(border: InputBorder.none),
          )),
        ],
        // Delete row on long press
        onLongPress: () {
          _showDeleteConfirmationDialog(context, _dataRows.length - 1);
        },
      ));
    });
  }

  Future<void> _showDeleteConfirmationDialog(
      BuildContext context, int rowIndex) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete Row'),
          content: const Text('Are you sure you want to delete this row?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Delete'),
              onPressed: () {
                setState(() {
                  _dataRows.removeAt(rowIndex);
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                'College Of Science And Technology',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              const Text(
                'Rinchending, Phuentsholing: Bhutan',
                style: TextStyle(fontSize: 14),
              ),
              const SizedBox(height: 20),
              Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Si.No',
                        style: TextStyle(fontSize: 12),
                      ),
                      const SizedBox(width: 20),
                      const Text(
                        'Requisition Form',
                        style: TextStyle(fontSize: 12),
                      ),
                      const SizedBox(width: 20),
                      GestureDetector(
                        onTap: () => _selectDate(context),
                        child: const Icon(Icons.calendar_today, size: 24),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Date: ${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}',
                        style: const TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                  const SizedBox(width: 20),
                  const Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'To',
                            style: TextStyle(fontSize: 12),
                          ),
                          Text(
                            'The President,',
                            style: TextStyle(fontSize: 12),
                          ),
                          Text(
                            'College of Science And Technology,',
                            style: TextStyle(fontSize: 12),
                          ),
                          Text(
                            'Rinchending, Phuentsholing: Bhutan',
                            style: TextStyle(fontSize: 12),
                          ),
                          SizedBox(height: 14),
                          Text(
                            'Sir,',
                            style: TextStyle(fontSize: 12),
                          ),
                          Text(
                            "kindly supply the following items:",
                            style: TextStyle(fontSize: 12),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 12),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  dividerThickness: 1,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                  ),
                  columnSpacing: 20,
                  columns: const <DataColumn>[
                    DataColumn(
                      label: Text(
                        'Item.No',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 12),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Description',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 12),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Quantity',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 12),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Remarks',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 12),
                      ),
                    ),
                  ],
                  rows: _dataRows,
                ),
              ),
              const SizedBox(height: 10),
              Center(
                child: ElevatedButton(
                  onPressed: _addRow,
                  child: const Text('Add Row'),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Recommendation from the immediate supervisor:',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                'Remarks from procurement Officer:',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                'Remarks from Account Section:',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              const Text(
                'Signature of Indenter: ______________________________________',
                style: TextStyle(fontSize: 12),
              ),
              const SizedBox(height: 8),
              const Text(
                'Name & Designation: ______________________________________',
                style: TextStyle(fontSize: 12),
              ),
              const SizedBox(height: 8),
              const Text(
                'Approved by: ______________________________________',
                style: TextStyle(fontSize: 12),
              ),
              const SizedBox(height: 8),
              const Text(
                'Signature/Seal of Approving Authority: ______________________________________',
                style: TextStyle(fontSize: 12),
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Handle form submission logic here
                    // This function will be called when the user presses the submit button
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Form Submitted!'),
                      ),
                    );
                  },
                  child: const Text('Submit'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
