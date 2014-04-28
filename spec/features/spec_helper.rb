require 'spec_helper'

def all_stat_rows
  all('table.stats-table tr.stat')
end

def stat_content(stat)
  "#{stat.player.first_name} #{stat.player.last_name} (#{stat.player.position}) #{stat.games_played} #{stat.runs} #{stat.home_runs} #{stat.rbis} #{stat.stolen_bases} #{stat.on_base_percentage.round(3)}"
end

def stats_table
  find('table.stats-table')
end

def draft_picks_table
  find('table.draft-picks-table')
end

def all_draft_pick_rows
  all('table.draft-picks-table tr.draft-pick')
end

RSpec.configure do |config|
  config.before(:each) do
    attrs = {email: 'sterling.archer@example.com', first_name: 'Sterling', last_name: 'Archer'}
    OmniAuth.config.test_mode = true
    oauth_hash = {
      provider: 'google_oauth2',
      uid: '12345',
      info: attrs
    }
    OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new(oauth_hash)
  end
end
