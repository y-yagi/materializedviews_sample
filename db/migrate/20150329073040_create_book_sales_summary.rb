class CreateBookSalesSummary < ActiveRecord::Migration
  def up
    connection.execute <<-SQL
      CREATE MATERIALIZED VIEW book_sales_summary AS
              SELECT  books.name as name,
                      books.author_id as author_id,
                      sum((sales.number * books.price)) as total_sales
              FROM sales
              LEFT JOIN books ON sales.book_id = books.id
              GROUP BY sales.book_id, books.name, books.author_id;
      CREATE INDEX ON book_sales_summary (author_id);
    SQL
  end

  def down
    connection.execute 'DROP MATERIALIZED VIEW IF EXISTS book_sales_summary'
  end
end
