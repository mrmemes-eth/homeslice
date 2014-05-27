require 'irb/completion'
require 'irb/ext/save-history'
require 'rubygems'
require 'pp'

IRB.conf[:AUTO_INDENT]  = true
IRB.conf[:SAVE_HISTORY] = 1000
IRB.conf[:HISTORY_FILE] = File.join(ENV['HOME'],'.irb_history')
IRB.conf[:PROMPT_MODE]  = :SIMPLE

if defined?(Rails)
  railsrc = File.join(File.dirname(__FILE__), '.railsrc')
  load railsrc if File.exist?(railsrc)
end

def pb(string)
  `echo #{string}|pbcopy`
end

class Object
  def native_methods
    methods - Object.new.methods
  end
  def self.native_methods
    methods - Object.methods
  end
end
