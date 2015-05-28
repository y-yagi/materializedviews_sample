class CreateBookSaleSummaries < ActiveRecord::Migration
  def up
    connection.execute <<-SQL
      CREATE MATERIALIZED VIEW book_sale_summaries AS
              SELECT  books.name as name,
                      books.id as id,
                      books.author_id as author_id,
                      sum((sales.number * books.price)) as total_sales
              FROM sales
              LEFT JOIN books ON sales.book_id = books.id
              GROUP BY sales.book_id, books.name, books.author_id, books.id;
      CREATE UNIQUE INDEX ON book_sale_summaries (id);
    SQL
  end

  def down
    connection.execute 'DROP MATERIALIZED VIEW IF EXISTS book_sale_summaries'
  end
end
