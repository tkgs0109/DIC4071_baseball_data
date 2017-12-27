require 'rails_helper'

RSpec.describe Pitcher, type: :model do
  it "most_winnersメソッド使用時、最多勝投手が一人の場合" do
    Pitcher.create(player_id: 'Taro', year_id:2000, wins:8)
    Pitcher.create(player_id: 'Jiro', year_id:2000, wins:9)
    Pitcher.create(player_id: 'Saburo', year_id:2000, wins:10)
    Pitcher.create(player_id: 'Shiro', year_id:2001, wins:10)
    expect(Pitcher.most_winners(2000)).to eq ["Saburo"]
  end
  it "most_winnersメソッド使用時、最多勝投手が複数人の場合" do
    Pitcher.create(player_id: 'Taro', year_id:2000, wins:8)
    Pitcher.create(player_id: 'Jiro', year_id:2000, wins:10)
    Pitcher.create(player_id: 'Saburo', year_id:2000, wins:10)
    Pitcher.create(player_id: 'Shiro', year_id:2001, wins:10)
    expect(Pitcher.most_winners(2000)).to eq ["Jiro", "Saburo"]
  end
  it "most_winnersメソッド使用時、指定した年のデータが存在しない場合" do
    Pitcher.create(player_id: 'Shiro', year_id:2001, wins:10)
    expect(Pitcher.most_winners(2000)).to eq []
  end
  
  it "top_tenメソッド使用時、上から10番目の投手と同じ勝利数の投手がいない場合" do
    Pitcher.create(player_id: 'Taro', year_id: 2000, wins: 15)
    Pitcher.create(player_id: 'Jiro', year_id: 2000, wins: 14)
    Pitcher.create(player_id: 'Saburo', year_id: 2000, wins: 13)
    Pitcher.create(player_id: 'Shiro', year_id: 2000, wins: 12)
    Pitcher.create(player_id: 'Goro', year_id: 2000, wins: 11)
    Pitcher.create(player_id: 'Rokuro', year_id: 2000, wins: 20)
    Pitcher.create(player_id: 'Shichiro', year_id: 2000, wins: 19)
    Pitcher.create(player_id: 'Hachiro', year_id: 2000, wins: 18)
    Pitcher.create(player_id: 'Kuro', year_id: 2000, wins: 17)
    Pitcher.create(player_id: 'Juro', year_id: 2000, wins: 16)
    Pitcher.create(player_id: 'Juichiro', year_id: 2000, wins: 10)
    Pitcher.create(player_id: 'Jujiro', year_id: 2001, wins: 18)
    expect(Pitcher.top_ten(2000)).to eq ["Rokuro","Shichiro","Hachiro","Kuro","Juro","Taro","Jiro","Saburo","Shiro","Goro"]
  end
  it "top_tenメソッド使用時、上から10番目の投手と同じ勝利数の投手がいる場合" do
    Pitcher.create(player_id: 'Taro', year_id: 2000, wins: 15)
    Pitcher.create(player_id: 'Jiro', year_id: 2000, wins: 14)
    Pitcher.create(player_id: 'Saburo', year_id: 2000, wins: 13)
    Pitcher.create(player_id: 'Shiro', year_id: 2000, wins: 12)
    Pitcher.create(player_id: 'Goro', year_id: 2000, wins: 11)
    Pitcher.create(player_id: 'Rokuro', year_id: 2000, wins: 20)
    Pitcher.create(player_id: 'Shichiro', year_id: 2000, wins: 19)
    Pitcher.create(player_id: 'Hachiro', year_id: 2000, wins: 18)
    Pitcher.create(player_id: 'Kuro', year_id: 2000, wins: 17)
    Pitcher.create(player_id: 'Juro', year_id: 2000, wins: 17)
    Pitcher.create(player_id: 'Juichiro', year_id: 2000, wins: 11)
    Pitcher.create(player_id: 'Jujiro', year_id: 2000, wins: 10)
    Pitcher.create(player_id: 'Jujiro', year_id: 2001, wins: 18)
    expect(Pitcher.top_ten(2000)).to eq ["Rokuro","Shichiro","Hachiro","Juro","Kuro","Taro","Jiro","Saburo","Shiro","Goro","Juichiro"]
  end
  it "top_tenメソッド使用時、指定した年のデータが10件に満たない場合" do
    Pitcher.create(player_id: 'Taro', year_id: 2000, wins: 15)
    Pitcher.create(player_id: 'Jiro', year_id: 2000, wins: 14)
    Pitcher.create(player_id: 'Hachiro', year_id: 2000, wins: 18)
    Pitcher.create(player_id: 'Kuro', year_id: 2000, wins: 17)
    Pitcher.create(player_id: 'Juro', year_id: 2000, wins: 17)
    Pitcher.create(player_id: 'Juichiro', year_id: 2000, wins: 11)
    Pitcher.create(player_id: 'Jujiro', year_id: 2000, wins: 10)
    Pitcher.create(player_id: 'Jusaburo', year_id: 2001, wins: 18)
    expect(Pitcher.top_ten(2000)).to eq ["Hachiro","Kuro","Juro","Taro","Jiro","Juichiro","Jujiro"]
  end
  it "top_tenメソッド使用時、指定した年のデータが存在しない場合" do
    Pitcher.create(player_id: 'Jusaburo', year_id: 2001, wins: 18)
    expect(Pitcher.top_ten(2000)).to eq []
  end

  it "most_winners_in_teamメソッド使用時、最多勝投手が一人の場合" do
    Pitcher.create(player_id: 'Taro', year_id: 2000, team_id: "A", wins: 18)
    Pitcher.create(player_id: 'Jiro', year_id: 2000, team_id: "A", wins: 17)
    Pitcher.create(player_id: 'Sabuo', year_id: 2000, team_id: "A", wins: 16)
    Pitcher.create(player_id: 'Shiro', year_id: 2000, team_id: "B", wins: 18)
    Pitcher.create(player_id: 'Goro', year_id: 2000, team_id: "B", wins: 17)
    Pitcher.create(player_id: 'Rokuro', year_id: 2001, team_id: "A", wins: 18)
    expect(Pitcher.most_winners_in_team(2000, "A")).to eq ["Taro"]
  end
  it "most_winners_in_teamメソッド使用時、最多勝投手が複数人の場合" do
    Pitcher.create(player_id: 'Taro', year_id: 2000, team_id: "A", wins: 18)
    Pitcher.create(player_id: 'Jiro', year_id: 2000, team_id: "A", wins: 18)
    Pitcher.create(player_id: 'Sabuo', year_id: 2000, team_id: "A", wins: 16)
    Pitcher.create(player_id: 'Shiro', year_id: 2000, team_id: "B", wins: 18)
    Pitcher.create(player_id: 'Goro', year_id: 2000, team_id: "B", wins: 17)
    Pitcher.create(player_id: 'Rokuro', year_id: 2001, team_id: "A", wins: 18)
    expect(Pitcher.most_winners_in_team(2000, "A")).to eq ["Taro","Jiro"]
  end
  it "most_winners_in_teamメソッド使用時、指定した年、チームのデータが存在しない場合" do
    Pitcher.create(player_id: 'Rokuro', year_id: 2001, team_id: "B", wins: 18)
    expect(Pitcher.most_winners_in_team(2000, "A")).to eq []
  end
  
  it "most_winners_in_termメソッド使用時、最多勝投手が一人の場合" do
    Pitcher.create(player_id: 'Taro', year_id: 1999, wins: 21)
    Pitcher.create(player_id: 'Jiro', year_id: 2000, wins: 18)
    Pitcher.create(player_id: 'Saburo', year_id: 2001, wins: 19)
    Pitcher.create(player_id: 'Shiro', year_id: 2001, wins: 20)
    Pitcher.create(player_id: 'Goro', year_id: 2002, wins: 19)
    Pitcher.create(player_id: 'Rokuro', year_id: 2003, wins: 21)
    expect(Pitcher.most_winners_in_term(2000, 2002)).to eq ["Shiro"]
  end
  it "most_winners_in_termメソッド使用時、最多勝投手が複数人の場合" do
    Pitcher.create(player_id: 'Taro', year_id: 1999, wins: 21)
    Pitcher.create(player_id: 'Jiro', year_id: 2000, wins: 18)
    Pitcher.create(player_id: 'Saburo', year_id: 2001, wins: 19)
    Pitcher.create(player_id: 'Shiro', year_id: 2001, wins: 20)
    Pitcher.create(player_id: 'Goro', year_id: 2002, wins: 20)
    Pitcher.create(player_id: 'Rokuro', year_id: 2003, wins: 21)
    expect(Pitcher.most_winners_in_term(2000, 2002)).to eq ["Shiro","Goro"]
  end
  it "most_winners_in_termメソッド使用時、指定した期間のデータが存在しない場合" do
    Pitcher.create(player_id: 'Taro', year_id: 1999, wins: 21)
    Pitcher.create(player_id: 'Rokuro', year_id: 2003, wins: 21)
    expect(Pitcher.most_winners_in_term(2000, 2002)).to eq []
  end
  
  it "best_dealメソッド使用時、最も費用対効果が高かった投手が一人の場合" do
    Pitcher.create(player_id: 'taro', year_id: 2000, wins: 20)
    Pitcher.create(player_id: 'jiro', year_id: 2000, wins: 15)
    Pitcher.create(player_id: 'saburo', year_id: 2000, wins: 10)
    Pitcher.create(player_id: 'taro', year_id: 2001, wins: 10)
    Pitcher.create(player_id: 'jiro', year_id: 2001, wins: 15)
    Pitcher.create(player_id: 'saburo', year_id: 2001, wins: 20)
    Salary.create(player_id: 'taro', year_id: 2000, salary: 200000)
    Salary.create(player_id: 'jiro', year_id: 2000, salary: 250000)
    Salary.create(player_id: 'saburo', year_id: 2000, salary: 300000)
    Salary.create(player_id: 'taro', year_id: 2001, salary: 300000)
    Salary.create(player_id: 'jiro', year_id: 2001, salary: 250000)
    Salary.create(player_id: 'saburo', year_id: 2001, salary: 200000)
    expect(Pitcher.best_deal(2000)).to eq ["taro"]
  end
  it "best_dealメソッド使用時、最も費用対効果が高かった投手が複数人の場合" do
    Pitcher.create(player_id: 'taro', year_id: 2000, wins: 20)
    Pitcher.create(player_id: 'jiro', year_id: 2000, wins: 15)
    Pitcher.create(player_id: 'saburo', year_id: 2000, wins: 10)
    Pitcher.create(player_id: 'taro', year_id: 2001, wins: 10)
    Pitcher.create(player_id: 'jiro', year_id: 2001, wins: 15)
    Pitcher.create(player_id: 'saburo', year_id: 2001, wins: 20)
    Salary.create(player_id: 'taro', year_id: 2000, salary: 200000)
    Salary.create(player_id: 'jiro', year_id: 2000, salary: 150000)
    Salary.create(player_id: 'saburo', year_id: 2000, salary: 300000)
    Salary.create(player_id: 'taro', year_id: 2001, salary: 300000)
    Salary.create(player_id: 'jiro', year_id: 2001, salary: 250000)
    Salary.create(player_id: 'saburo', year_id: 2001, salary: 200000)
    expect(Pitcher.best_deal(2000)).to eq ["taro","jiro"]
  end
  it "best_dealメソッド使用時、指定した年のある投手の給与データが存在しない場合" do
    Pitcher.create(player_id: 'taro', year_id: 2000, wins: 20)
    Pitcher.create(player_id: 'jiro', year_id: 2000, wins: 15)
    Pitcher.create(player_id: 'saburo', year_id: 2000, wins: 10)
    Pitcher.create(player_id: 'taro', year_id: 2001, wins: 10)
    Pitcher.create(player_id: 'jiro', year_id: 2001, wins: 15)
    Pitcher.create(player_id: 'saburo', year_id: 2001, wins: 20)
    Salary.create(player_id: 'jiro', year_id: 2000, salary: 250000)
    Salary.create(player_id: 'saburo', year_id: 2000, salary: 300000)
    Salary.create(player_id: 'taro', year_id: 2001, salary: 300000)
    Salary.create(player_id: 'jiro', year_id: 2001, salary: 250000)
    Salary.create(player_id: 'saburo', year_id: 2001, salary: 200000)
    expect(Pitcher.best_deal(2000)).to eq ["jiro"]
  end
  it "best_dealメソッド使用時、指定した年のデータが存在しない場合" do
    Pitcher.create(player_id: 'taro', year_id: 2001, wins: 10)
    Pitcher.create(player_id: 'jiro', year_id: 2001, wins: 15)
    Pitcher.create(player_id: 'saburo', year_id: 2001, wins: 20)
    Salary.create(player_id: 'taro', year_id: 2001, salary: 300000)
    Salary.create(player_id: 'jiro', year_id: 2001, salary: 250000)
    Salary.create(player_id: 'saburo', year_id: 2001, salary: 200000)
    expect(Pitcher.best_deal(2000)).to eq []
  end
end