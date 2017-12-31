3.times do |topic|
  Topic.create!(
    title: "Topic #{topic}"

  )
end

puts "3개의 topic이 생성되었습니다"

10.times do |blog|
  Blog.create!(
    title: "My Blog Post #{blog}",
    body: "rails is very nice framework",
    topic_id: Topic.last.id
  )
end

puts "10개의 blog가 생성되었습니다"

5.times do |skill|
  Skill.create!(
    title: "Rails #{skill}",
    percent_utilized: 15
  )
end

puts "5개의 skill이 생성되었습니다"

8.times do |portfolio_item|
  Portfolio.create!(
    title: "Portfolio_title:
    #{portfolio_item}",
    subtitle: "Ruby on Rails",
    body: "show me the money, show me the money, show me the money, show me the money, show me the money",
    main_image: "http://via.placeholder.com/600x400",
    thumb_image: "http://via.placeholder.com/350x200"
  )
end

1.times do |portfolio_item|
  Portfolio.create!(
    title: "Portfolio_title:
    #{portfolio_item}",
    subtitle: "Angular",
    body: "show me the money, show me the money, show me the money, show me the money, show me the money",
    main_image: "http://via.placeholder.com/600x400",
    thumb_image: "http://via.placeholder.com/350x200"
  )
end
puts "9개의 portfolio가 생성되었습니다"

3.times do |technology|
  Portfolio.last.technologies.create!(
    name: "Technology #{technology}"
  )
end

puts "3개의 technology가 생성되었습니다"
