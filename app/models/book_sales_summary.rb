class BookSalesSummary < ActiveRecord::Base
  belongs_to :author

  self.table_name = 'book_sales_summary'
  self.primary_key = :id

  def self.repopulate
    connection.execute("REFRESH MATERIALIZED VIEW #{table_name}")
  end

  def readonly
    true
  end
end
