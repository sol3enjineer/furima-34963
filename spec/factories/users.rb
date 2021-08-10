FactoryBot.define do
  factory :user do
    nickname {'あああ'}
    email {Faker::Internet.free_email}
    password {'a1' + Faker::Internet.password(min_length: 6)}
    firstname {'田中'}
    lastname {'太郎'}
    firstname_kana {'タナカ'}
    lastname_kana {'タロウ'}
    birthday {'2020-01-01'}
  end
end
