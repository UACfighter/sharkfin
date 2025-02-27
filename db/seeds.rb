Comment.destroy_all
Post.destroy_all
Profile.destroy_all
User.destroy_all
Tag.destroy_all
Category.destroy_all
Status.destroy_all
Country.destroy_all
Role.destroy_all

roles = Role.create!([
  { name: 'Админ' },
  { name: 'Модератор' },
  { name: 'Редактор' },
  { name: 'Автор' },
  { name: 'Читатель' },
  { name: 'Гость' }
])

countries = Country.create!([
  { name: 'Россия' },
  { name: 'США' },
  { name: 'Канада' },
  { name: 'Великобритания' },
  { name: 'Австралия' },
  { name: 'Германия' },
  { name: 'Франция' }
])

statuses = Status.create!([
  { name: 'Черновик' },
  { name: 'Опубликовано' },
  { name: 'Архивировано' },
  { name: 'На проверке' },
  { name: 'Отклонено' }
])

categories = Category.create!([
  { name: 'Технологии', description: 'Новости и обзоры о современных технологиях.' },
  { name: 'Здоровье', description: 'Советы и исследования о здоровье и благополучии.' },
  { name: 'Путешествия', description: 'Рекомендации и истории из разных уголков мира.' },
  { name: 'Кулинария', description: 'Рецепты, обзоры и секреты вкусной еды.' },
  { name: 'Образование', description: 'Методы обучения и образовательные ресурсы.' },
  { name: 'Стиль жизни', description: 'Обсуждение моды, досуга и повседневных историй.' },
  { name: 'Финансы', description: 'Советы по управлению бюджетом и инвестициям.' },
  { name: 'Кино', description: 'Рецензии и обсуждения новинок кино.' },
  { name: 'Спорт', description: 'Новости и обсуждения спортивных событий.' },
  { name: 'Литература', description: 'Обсуждения книг и творческих идей.' }
])

tags = Tag.create!([
  { name: 'Ruby' },
  { name: 'Rails' },
  { name: 'Программирование' },
  { name: 'Веб-разработка' },
  { name: 'Гайды' },
  { name: 'Советы' },
  { name: 'БазаДанных' },
  { name: 'Обучение' },
  { name: 'Путешествия' },
  { name: 'Рецепты' },
  { name: 'Технологии' },
  { name: 'Здоровье' },
  { name: 'Кино' },
  { name: 'Музыка' },
  { name: 'Финансы' }
])

users = []
user_data = [
  { name: 'vanGuru', email: 'ivan@guru.com' },
  { name: 'petya_c0de', email: 'petya@coder.com' },
  { name: 'serega_xpert', email: 'serega@expert.com' },
  { name: 'KatyaVibes', email: 'katya@vibes.com' },
  { name: 'alexrand', email: 'alex@random.com' }
]
user_data.each do |ud|
  user = User.create!(
    name: ud[:name],
    email: ud[:email],
    role: roles.sample
  )
  Profile.create!(
    user: user,
    country: countries.sample,
    biography: "Привет, я #{ud[:name]}. Люблю общаться на форуме и делиться мнениями."
  )
  users << user
end

posts = []
post_data = [
  {
    user: users[0],
    title: "Неожиданный прорыв в технологиях или взлом в Москве?",
    content: "Сегодня утром в центре Москвы произошёл странный инцидент — системы города словно заблудились. Кто-то попытался проникнуть в городские серверы, и теперь вопросы множатся, как снежинки. Что думаете?",
    category: categories.find { |c| c.name == 'Технологии' },
    status: statuses.find { |s| s.name == 'Опубликовано' },
    tag_names: ['Технологии', 'Ruby', 'Rails']
  },
  {
    user: users[1],
    title: "Путешествие в сердце Москвы",
    content: "Прогулка по старинным улочкам столицы подарила мне море впечатлений. Архитектура и неожиданные детали заставляют задуматься: не скрывается ли за этим тайна, связанная с сегодняшними новостями?",
    category: categories.find { |c| c.name == 'Путешествия' },
    status: statuses.find { |s| s.name == 'Опубликовано' },
    tag_names: ['Путешествия', 'Гайды', 'Советы']
  },
  {
    user: users[2],
    title: "Стресс и здоровье: последствия загадочного вмешательства",
    content: "После слухов о взломе московских систем мои нервы на пределе. Чувствую, как давление растёт, и хочется узнать: как справиться с этим эмоциональным шоком?",
    category: categories.find { |c| c.name == 'Здоровье' },
    status: statuses.find { |s| s.name == 'Опубликовано' },
    tag_names: ['Здоровье', 'Советы', 'Обучение']
  },
  {
    user: users[3],
    title: "Финансовый шторм в преддверии неопределенности",
    content: "Новости о загадочном инциденте в Москве уже повлияли на биржевой климат. Акции колеблются, и многие инвесторы теряются в догадках. Какие стратегии спасения можно предложить в такой ситуации?",
    category: categories.find { |c| c.name == 'Финансы' },
    status: statuses.find { |s| s.name == 'Опубликовано' },
    tag_names: ['Финансы', 'Советы', 'Гайды']
  },
  {
    user: users[4],
    title: "Литературный взгляд на современные реалии",
    content: "Вдохновлённый недавними событиями, я начал писать рассказ о городе, где грань между фантазией и реальностью стерта. Возможно, это отражение нашей души или просто игра воображения?",
    category: categories.find { |c| c.name == 'Литература' },
    status: statuses.find { |s| s.name == 'Опубликовано' },
    tag_names: ['Обучение', 'Гайды', 'Советы']
  },
  {
    user: users[0],
    title: "Кино и реальность: новый взгляд на произошедшее",
    content: "Смотрел недавно фильм, сюжет которого странно перекликался с тем, что творится в нашей столице. Может, режиссёр подсмотрел новости? Иногда реальность оказывается ярче любого кино.",
    category: categories.find { |c| c.name == 'Кино' },
    status: statuses.find { |s| s.name == 'Опубликовано' },
    tag_names: ['Кино', 'Музыка', 'Советы']
  },
  {
    user: users[1],
    title: "Образовательный эксперимент: анализ причин и следствий",
    content: "Задумался, как один инцидент способен повлиять на столь разные сферы жизни. Приглашаю к обсуждению: чему нас может научить эта загадочная история и какие уроки извлечь из хаоса?",
    category: categories.find { |c| c.name == 'Образование' },
    status: statuses.find { |s| s.name == 'Опубликовано' },
    tag_names: ['Обучение', 'Гайды', 'Советы']
  }
]
post_data.each do |pd|
  post = Post.create!(
    user: pd[:user],
    title: pd[:title],
    content: pd[:content],
    category: pd[:category],
    status: pd[:status]
  )
  pd[:tag_names].each do |tname|
    tag = tags.find { |tg| tg.name == tname }
    post.tags << tag if tag
  end
  posts << post
end

comments_data = [
  { post: posts[0], user: users[1], content: "Вау, реально ли это или очередной слух, как в старых легендах?" },
  { post: posts[0], user: users[2], content: "Кажется, системы решили пошутить. Но точно не баг — а мистификация!" },
  { post: posts[1], user: users[0], content: "Москва всегда удивляет. Может, за этим скрывается глубокая тайна?" },
  { post: posts[2], user: users[3], content: "Стресс — дело серьезное, но иногда смех помогает пережить даже хаос." },
  { post: posts[3], user: users[4], content: "Инвестиции сейчас напоминают игру в рулетку: риск, адреналин и щепотка удачи!" },
  { post: posts[4], user: users[1], content: "Рассказ получился живым и немного сюрреалистичным. Жду продолжения этой истории!" },
  { post: posts[5], user: users[2], content: "Фильм, о котором говоришь, должен стать культовым. Реальность иногда забавнее киношных вымыслов." },
  { post: posts[6], user: users[0], content: "Образование — ключ к пониманию даже самых запутанных событий. Интересно, какой урок преподнесёт судьба." },
  { post: posts[1], user: users[3], content: "Эта прогулка по Москве как путешествие в параллельную вселенную — магия в каждом шаге!" },
  { post: posts[3], user: users[4], content: "Финансовый шторм — отличный повод для шуток. Кто бы мог подумать, что экономика может быть такой веселой?" }
]
comments_data.each do |cd|
  Comment.create!(
    post: cd[:post],
    user: cd[:user],
    content: cd[:content]
  )
end

puts "Заполнение базы данных завершено!"