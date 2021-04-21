require "tmpdir"
require 'highline'

NAME = "rednaw"
REPO = "#{NAME}.github.io"

task :get_message do
  if @message.nil?
    @message = HighLine.new().ask("\n\nPlease provide a short commit message:") { |q| 
      q.validate = /.+/
    }
  end
end

task :clean do
  system "jekyll clean"
end

task :build => :clean do
  system "jekyll build"
end

task :test => :build do
  system "jekyll doctor"
end

task :preview => :test do
  system "jekyll serve"
end

task :push => [:get_message, :test] do
  system "git add ."
  system "git commit -m '#{@message}'"
  system "git push"
end

task :publish => [:push] do
  Dir.mktmpdir { |tmp|
    clone_dir = "#{tmp}/#{REPO}"
    system "git -C #{tmp} clone git@github.com:#{NAME}/#{REPO}.git"
    system "rsync -a --delete --exclude=.git _site/ #{clone_dir}"
    system "cp _includes/README.md #{clone_dir}/"
    system "cp _includes/CNAME #{clone_dir}/"
    system "git -C #{clone_dir} add ."
    system "git -C #{clone_dir} commit -m '#{@message}'"
    system "git -C #{clone_dir} push"
  }
end