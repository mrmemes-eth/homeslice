require 'irb/completion'
require 'irb/ext/save-history'
require 'rubygems'
require 'pp'

begin
  require 'wirble'
  Wirble.init
  Wirble.colorize
rescue LoadError
  # Wirble is not installed. Do nothing.
end

IRB.conf[:AUTO_INDENT]  = true
IRB.conf[:SAVE_HISTORY] = 1000
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb_history" 
IRB.conf[:PROMPT_MODE]  = :SIMPLE

if ENV['RAILS_ENV'] 
  load File.dirname(__FILE__) + '/.railsrc' 
end

def pb(string)
  `echo #{string}|pbcopy`
end

def update_vimbundles
  Dir.glob("#{ENV['HOME']}/.vimbundles/*").each do |d| 
    next unless File.directory?(d)
    puts "updating #{d}"
    `cd #{d}; git pull --rebase; cd -`
  end 
end

class Object
  def native_methods
    methods - Object.new.methods
  end
  def self.native_methods
    methods - Object.methods
  end
end
