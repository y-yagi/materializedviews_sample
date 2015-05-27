unless Author.exists?
  200.times.each do |i|
    Author.create!(name: "author_#{i}")
  end
end

unless Book.exists?
  author_ids = Author.pluck(:id)
  10000.times.each do |i|
    Book.create!(name: "book_#{i}", price: rand(100) * 100,
      author: Author.find(author_ids.sample)
    )
  end
end

unless Sale.exists?
  book_ids = Book.pluck(:id)
  100000.times.each do |_|
    Sale.create!(
      number: rand(2) + 1, date: (1..30).to_a.sample.days.ago,
      book: Book.find(book_ids.sample)
    )
  end
end
