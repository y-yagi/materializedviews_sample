# ## Schema Information
#
# Table name: `sales`
#
# ### Columns
#
# Name              | Type               | Attributes
# ----------------- | ------------------ | ---------------------------
# **`id`**          | `integer`          | `not null, primary key`
# **`number`**      | `integer`          |
# **`date`**        | `date`             |
# **`book_id`**     | `integer`          |
# **`created_at`**  | `datetime`         | `not null`
# **`updated_at`**  | `datetime`         | `not null`
#

class Sale < ActiveRecord::Base
  belongs_to :book
end
