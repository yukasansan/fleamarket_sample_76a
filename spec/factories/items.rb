FactoryBot.define do
  factory :item do
    name             {"water"}
    condition        {"hoge"}
    shipping_method  {"hoge"}
    shipping_days    {"hoge"}
    prefecture_id    {"1"}
    shipping_price   {"hoge"}
    price            {"100"}
    text             {"hoge"}
    seller_id        {"1"}
    sale_status      {"0"}
  end
end
