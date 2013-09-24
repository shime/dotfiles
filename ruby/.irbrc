require 'irb/ext/save-history'
IRB.conf[:SAVE_HISTORY] = 500
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.dotfiles_other/.irb-history"

begin
  require 'rubygems'
  require 'interactive_editor'
rescue LoadError
end
