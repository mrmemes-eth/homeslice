require 'irb/completion'
require 'irb/ext/save-history'
require 'rubygems'
require 'pp'

begin
  require 'wirble'
rescue LoadError
  raise 'Please install wirble'
end

begin
  require 'hirb'
rescue LoadError
  raise 'Please install hirb'
end

IRB.conf[:AUTO_INDENT]  = true
IRB.conf[:SAVE_HISTORY] = 1000
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb_history" 
IRB.conf[:PROMPT_MODE]  = :SIMPLE

Wirble.init
Wirble.colorize

Hirb.enable

if ENV['RAILS_ENV'] 
  load File.dirname(__FILE__) + '/.railsrc' 
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
