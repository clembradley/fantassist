require_relative 'spec_helper'

feature 'Drafting players' do

  background do
    # sign_in user
    visit user_omniauth_authorize_path(:google_oauth2)
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

  scenario 'When I click the reset button, the draft picks table is cleared', js: true do
    stats = create_list(:stat, 2, :hitter)

    visit root_path

    # draft two players
    click_on stats.first.player.full_name
    click_on stats.last.player.full_name

    click_on 'reset'

    expect(draft_picks_table).to have_no_css('.draft-pick')
  end

  scenario 'When I click the reset button, all draft picks are destroyed', js: true do
    stats = create_list(:stat, 2, :hitter)

    visit root_path

    # draft two players
    click_on stats.first.player.full_name
    click_on stats.last.player.full_name

    click_on 'reset'

    expect { DraftPick.all.blank? }.to become_true
  end
end
