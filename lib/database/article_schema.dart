const tableArticle = "article";

const articleId = "id";
const articleAuthor = "author";
const articleDescription = "description";
const articleTitle = "title";
const articleUrl = "url";
const articleUrlToImage = "urlToImage";
const articlePublishedAt = "publishedAt";
const articleContent = "content";

const articleCreateTableSql = """
  CREATE TABLE $tableArticle (
    $articleId INTEGER PRIMARY KEY,
    $articleAuthor TEXT,
    $articleDescription TEXT,
    $articleTitle TEXT NOT NULL,
    $articleUrl TEXT NOT NULL UNIQUE,
    $articleUrlToImage TEXT,
    $articlePublishedAt TEXT NOT NULL,
    $articleContent TEXT
  )
""";