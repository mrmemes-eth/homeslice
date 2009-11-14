require 'rbosa'
require 'fileutils'

process do |files|
  safari = OSA.app 'Safari'

  files.each do |input_file|
    if input_file =~ /(.+).md$/
      FileUtils.mkdir_p(output_dir  = File.expand_path('./_out'))
      output_file = File.join(output_dir,"#{$1}.html")
      execute("maruku #{input_file} -o #{output_file}")
      if safari && safari.documents.any?
        if tab = safari.windows.first.tabs.detect{|t| t.url =~ %r|#{output_file}| }
          safari.do_javascript "window.location.reload();", tab
        end
      else
        safari.activate
        safari.open File.expand_path(output_file)
      end
      input_file
    end
  end
end

