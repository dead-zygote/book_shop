# coding: utf-8

if Region.count == 0
  ["Адыгея", "Алтай", "Башкортостан", "Бурятия", "Дагестан",
  "Ингушетия", "Кабардино-Балкарская респ.", "Калмыкия",
  "Карачаево-Черкесская респ.", "Карелия", "Коми", "Марий Эл",
  "Мордовия", "Якутия", "Северная Осетия", "Татарстан", "Тува",
  "Удмуртская респ.", "Хакасия", "Чеченская респ.",
  "Чувашская респ.", "Алтайский край", "Забайкальский край",
  "Камчатскай край", "Краснодарский край", "Красноярский край",
  "Пермский край", "Приморский край", "Ставропольский край",
  "Хабаровский край", "Амурская обл.", "Архангельская обл.",
  "Астраханская обл.", "Белгородская обл.", "Брянская обл.",
  "Владимирская обл.", "Волгоградская обл.", "Вологодская обл.",
  "Воронежская обл.", "Ивановская обл.", "Иркутская обл.",
  "Калининградская обл.", "Калужская обл.", "Кемеровская обл.",
  "Кировская обл.", "Костромская обл.", "Курганская обл.",
  "Курская обл.", "Ленинградская обл.", "Липецкая обл.",
  "Магаданская обл.", "Московская обл.", "Мурманская обл.",
  "Нижегородская обл.", "Новгородская обл.",
  "Новосибирская обл.", "Омская обл.", "Оренбургская обл.",
  "Орловская обл.", "Пензенская обл.", "Псковская обл.",
  "Ростовская обл.", "Рязанская обл.", "Самарская обл.",
  "Саратовская обл.", "Сахалинская обл.", "Смоленская обл.",
  "Тамбовская обл.", "Тверская обл.", "Томская обл.",
  "Тульская  обл.", "Тюменская обл.", "Ульяновская обл.",
  "Челябинская обл.", "Ярославская обл.", "Еврейская авт. обл.", "Ненецкий авт. окр.",
  "Ханты-Мансийский авт. окр.", "Чукотский авт. окр.",
  "Ямало-Ненецкий авт. окр."].each { |name|  Region.create!(:name => name) }
end
