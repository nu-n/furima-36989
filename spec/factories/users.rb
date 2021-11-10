FactoryBot.define do
  factory :user do
    nickname              {"yasu"}
    email                 {"test@example"}
    password              {"ya0127yu"}
    password_confirmation {password}
    last_name             {"林"}
    first_name            {"保徳"}
    last_name_kana        {"ハヤシ"}
    first_name_kana       {"ヤスノリ"}
    birth_day             {"1975-01-27"}
  end
end
