import "package:test/test.dart";

import "package:fast_immutable_collections_benchmarks/fast_immutable_collections_benchmarks.dart";

void main() {
  group("Table and Scores |", () {
    const Config config = Config(runs: 100, size: 100);

    final TableScoreEmitter tableScoreEmitter =
        TableScoreEmitter(prefixName: "report", config: config);

    tableScoreEmitter.emit("List (Mutable)", 10);
    tableScoreEmitter.emit("Collection1", 1);

    test("TableScoreEmitter.emit adds values to the TableScoreEmitter.table", () {
      expect(tableScoreEmitter.table.resultsColumn.records, [
        StopwatchRecord(collectionName: "List (Mutable)", record: 10),
        StopwatchRecord(collectionName: "Collection1", record: 1),
      ]);
    });
  });

  group("Other stuff |", () {
    final TableScoreEmitter tableScoreEmitter =
        TableScoreEmitter(prefixName: "report", config: Config(runs: 10, size: 10));

    tableScoreEmitter.emit("Test1", 5);

    test(
        "TableScoreEmitter.toString method",
        () => expect(tableScoreEmitter.toString(),
            "Table Score Emitter: RecordsColumn: [StopwatchRecord: (collectionName: Test1, record: 5.0)]"));
  });
}
