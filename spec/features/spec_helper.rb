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
