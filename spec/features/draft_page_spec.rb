require 'spec_helper'

describe 'the initial draft page' do

  it 'has a navbar' do
    visit root_path

    expect(page).to have_selector('div.navbar')
  end

  it 'has a link to the homepage', js: true do
    visit root_path

    find('.navbar').click_link('Fantassist2')

    expect(page).to have_selector('table.stats-table')
  end

  it 'has a table of undrafted players', js: true do
    create_list(:stat, 3, :hitter)

    visit root_path

    expect(page).to have_selector('table.stats-table tr.stat', count: 3)
  end

  #TODO: make this pass
  it 'does not show drafted players in the main stats table', js: true do
    create_list(:stat, 2, :hitter)
    create(:draft_pick, :with_stat)

    visit root_path

    expect(page).to have_selector('table.stats-table tr.stat', count: 2)
  end
end
