require "tmpdir"
require 'highline'

NAME = "rednaw"
REPO = "#{NAME}.github.io"

task :get_message do
  @message = HighLine.new().ask('Message:') if @message.nil?
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
    system "git -C #{tmp} clone git@github.com:#{NAME}/#{REPO}.git"
    system "rsync -a --delete --exclude=.git _site/ #{tmp}/#{REPO}"
    system "cp _includes/README.md #{tmp}/#{REPO}/"
    system "cp _includes/CNAME #{tmp}/#{REPO}/"
    system "git -C #{tmp}/#{REPO} add ."
    system "git -C #{tmp}/#{REPO} commit -m '#{@message}'"
    system "git -C #{tmp}/#{REPO} push"
  }
end