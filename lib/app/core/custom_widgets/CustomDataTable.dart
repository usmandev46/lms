import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'my_text.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';


class CustomDataTable extends StatelessWidget {
  final List<String> columns;
  final List<List<String>> rows;

  const CustomDataTable({
    super.key,
    required this.columns,
    required this.rows,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(1.5.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SingleChildScrollView(
          child: DataTable(
            dataRowMinHeight: 45,
            dataRowMaxHeight: 45,
            headingRowHeight: 40,
            columnSpacing: 30,
            horizontalMargin: 5.w,
            border: TableBorder.all(
              width: 1,
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(10),
            ),

            headingRowColor: WidgetStateProperty.all(
              Theme.of(context).primaryColor.withValues(alpha: 0.15),
            ),

            columns: [
              DataColumn(
                label: MyText(
                  "#",
                  fontWeight: FontWeight.bold,
                  fontSize: 14.sp,
                ),
              ),

              ...columns.map(
                    (title) => DataColumn(
                  label: MyText(
                    title,
                    fontWeight: FontWeight.bold,
                    fontSize: 14.sp,
                  ),
                ),
              ),
            ],

            rows: List.generate(
              rows.length,
                  (index) {
                final rowData = rows[index];

                return DataRow(
                  cells: [
                    DataCell(
                      MyText(
                        (index + 1).toString(),
                        fontWeight: FontWeight.w600,
                        fontSize: 14.sp,
                      ),
                    ),

                    ...rowData.map(
                          (cell) => DataCell(
                        MyText(
                          cell,
                          fontSize: 14.sp,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}


typedef JsonMapper<T> = Map<String, dynamic> Function(T item);

class CustomTableDataSource<T> extends DataGridSource {
  CustomTableDataSource({
    required List<String> columns,
    required this.jsonMapper,
  }) {
    _columns = columns;
  }

  late final List<String> _columns;
  final JsonMapper<T> jsonMapper;

  List<DataGridRow> _rows = [];

  void clearRows() {
    _rows = [];
    notifyListeners();
  }

  @override
  List<DataGridRow> get rows => _rows;

  void setPageItems({
    required List<T> items,
    required Map<String, String> columnKeyMap,
    required int currentPage,
    required int pageSize,
  }) {
    _rows.clear();

    int index = ((currentPage - 1) * pageSize) + 1;

    for (final item in items) {
      final json = jsonMapper(item);

      _rows.add(
        DataGridRow(
          cells: [
            DataGridCell<String>(
              columnName: '#',
              value: index.toString(),
            ),
            ..._columns.map(
                  (col) => DataGridCell<String>(
                columnName: col,
                value: json[columnKeyMap[col]]?.toString() ?? '',
              ),
            ),
          ],
        ),
      );

      index++;
    }

    notifyListeners();
  }

  void clear() {
    _rows.clear();
    notifyListeners();
  }

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
      cells: row.getCells().map((cell) {
        return Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            cell.value.toString(),
            overflow: TextOverflow.ellipsis,
          ),
        );
      }).toList(),
    );
  }
}

class CustomDataTableAdvance extends StatelessWidget {
  final List<String> columns;
  final CustomTableDataSource dataSource;
  final BuildContext context;

  const CustomDataTableAdvance({
    super.key,
    required this.columns,
    required this.dataSource,
    required this.context
  });

  @override
  Widget build(BuildContext context) {
    return SfDataGrid(
      // allowSorting: true,
      source: dataSource,
      columnWidthMode: ColumnWidthMode.auto,
      gridLinesVisibility: GridLinesVisibility.both,
      headerGridLinesVisibility: GridLinesVisibility.both,
      rowHeight: 40,
      headerRowHeight: 42,
      columns: [
        GridColumn(
          columnName: '#',
          label: _headerCell('#'),
        ),
        ...columns.map(
              (title) => GridColumn(
            columnName: title,
            label: _headerCell(title),
          ),
        ),
      ],
    );
  }

  Widget _headerCell(String title) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.2),
      child: MyText(
        title,
        fontWeight: FontWeight.bold,
        fontSize: 14.sp,
      ),
    );
  }
}





