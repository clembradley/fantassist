require_relative 'spec_helper'

feature 'Drafting players' do

  background do
    create(:drafter)
  end

  scenario 'When I click a player\'s name, a DraftPick record gets created for that player', js: true do
    stat = create(:stat, :hitter)

    visit root_path
    click_on stat.player.full_name

    expect { DraftPick.find_by(player_id: stat.player.id).present? }.to become_true
  end

  scenario 'When I click a player\'s name, his stat row is removed from the table', js: true do
    stat = create(:stat, :hitter)

    visit root_path
    click_on stat.player.full_name

    all_stat_rows.each do |row|
      expect(row).to have_no_content(stat_content(stat))
    end
  end

  scenario 'When I click a player\'s name, the new draft pick is added to the draft picks table', js: true do
    stat = create(:stat, :hitter)

    visit root_path
    click_on stat.player.full_name

    expect(draft_picks_table).to have_content("#{stat.player.full_name} (#{stat.player.position})")
  end
end