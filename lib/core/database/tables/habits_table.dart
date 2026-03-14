const String habistTableName = "habits";
const String habistTableId = "id";
const String habistTableTitle = "title";
const String habistTableCreatedAt = "created_at";

const String createHabitsTable = '''
      CREATE TABLE habits(dbid TEXT PRIMARY KEY,
      title TEXT NOT NULL,
      created_at TEXT NOT NULL
      )
    ''';
