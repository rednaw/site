require "bundler/setup"
require "jekyll"
require "rubygems"
require "tmpdir"
require "fileutils"

NAME = "rednaw"
REPO = "#{NAME}.github.io"

task :clean do
  system "jekyll clean"
end

task :build => :clean do
  system "jekyll build"
end

task :test => :build do
  system "jekyll doctor"
end

task :push => :test do
  system "git add ."
  system "git commit -m 'Site updated'"
  system "git push"
end

task :publish => :push do
  Dir.mktmpdir { |tmp|
    system "git -C #{tmp} clone git@github.com:#{NAME}/#{REPO}.git"
    system "rsync -a --delete --exclude=.git _site/ #{tmp}/#{REPO}"
    system "git -C #{tmp}/#{REPO} add ."
    system "git -C #{tmp}/#{REPO} commit -m 'Site updated'"
    system "git -C #{tmp}/#{REPO} push"
  }
end