require_relative 'spec_helper'

describe 'the initial draft page' do

  it 'has a navbar' do
    visit root_path

    expect(page).to have_selector('div.navbar')
  end

  it 'has a link to the homepage', js: true do
    visit root_path

    find('.navbar').click_link('Fantassist')

    expect(current_path).to eq(root_path)
  end

  it 'has a stats table with the correct table headers', js: true do
    visit root_path

    within(stats_table) do
      expect(find('thead')).to have_content("G R HR RBIs SB OBP")
    end
  end

  it 'has a stats table of undrafted players', js: true do
    expected_stats = create_list(:stat, 3, :hitter)

    visit root_path

    expect(all_stat_rows.count).to eq(3)
    all_stat_rows.each_with_index do |row, i|
      expect(row).to have_content(stat_content(expected_stats[i]))
    end
  end

  it 'has a table of drafted players', js: true do
    expected_draft_picks = create_list(:draft_pick, 2)

    visit root_path

    expect(all_draft_pick_rows.count).to eq(2)
    all_draft_pick_rows.each_with_index do |row, i|
      expect(row).to have_content(expected_draft_picks[i].player.full_name)
    end
  end

  it 'does not show drafted players in the main stats table', js: true do
    create_list(:stat, 2, :hitter)
    draft_pick = create(:draft_pick, :with_hitting_stat)
    not_expected_stat = draft_pick.player.stats.first

    visit root_path

    all_stat_rows.each do |row|
      expect(row).to have_no_content(stat_content(not_expected_stat))
    end
  end
end
