FactoryBot.define do
  factory :frame_spread, class: Frame do
    roll_1 {8}
    roll_2 {2}
  end

  factory :frame_strike, class: Frame do
    roll_1 {10}
  end

end