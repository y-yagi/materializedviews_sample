# ## Schema Information
#
# Table name: `book_sale_summaries`
#
# ### Columns
#
# Name               | Type               | Attributes
# ------------------ | ------------------ | ---------------------------
# **`name`**         | `string`           |
# **`id`**           | `integer`          | `primary key`
# **`author_id`**    | `integer`          |
# **`total_sales`**  | `integer`          |
#

class BookSaleSummary < ActiveRecord::Base
  belongs_to :author

  self.primary_key = :id

  def self.repopulate
    connection.execute("REFRESH MATERIALIZED VIEW CONCURRENTLY #{table_name}")
  end

  def readonly?
    true
  end
end
