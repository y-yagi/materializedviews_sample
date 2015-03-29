unless Author.exists?
  (1..20).each do |i|
    Author.create!(name: "author_#{i}")
  end
end

unless Book.exists?
  (1..100).each do |i|
    Book.create!(name: "book_#{i}", price: rand(100) * 100, author: Author.find((1..20).to_a.sample))
  end
end

unless Sale.exists?
  (1..1000).each do |_|
    Sale.create!(
      number: rand(2) + 1, date: (1..7).to_a.sample.days.ago,
      book: Book.find((1..100).to_a.sample)
    )
  end
end
