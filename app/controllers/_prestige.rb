def compute_lvl(user)
  user_exp = user.exp
  const = 10
  Math.sqrt(user_exp / const)
end

def exp_lvl(level)
  percentage = level - level.floor
  (percentage * 100).round(2)
end

def prestige(user)
  user_lvl = compute_lvl(user).floor
  prestige_floor = 8
  prestige_lvl = user_lvl / prestige_floor
  final_lvl = user_lvl % prestige_floor
  if user_lvl <= 8
    "Prestige 0 #{user_lvl}"

  else
    "Prestige #{prestige_lvl} - Level #{final_lvl.floor}"
  end
end
