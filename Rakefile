require "bundler/setup"
require "jekyll"
require "rubygems"
require "tmpdir"
require "fileutils"

NAME = "rednaw"
REPO = "#{NAME}.github.io"

task :clean do
  system "rm -r _site"
  system "rm -r .jekyll-cache"
end

task :generate do
  system "jekyll build"
end

task :push do
  system "git add ."
  system "git commit -m 'Site updated'"
  system "git push"
end

task :test do
end

task :publish => [:clean, :generate, :test, :push] do
  Dir.mktmpdir { |tmp|
    system "git -C #{tmp} clone git@github.com:#{NAME}/#{REPO}.git"
    system "rsync -a --delete --exclude=.git _site/ #{tmp}/#{REPO}"
    system "git -C #{tmp}/#{REPO} add ."
    system "git -C #{tmp}/#{REPO} commit -m 'Site updated'"
    system "git -C #{tmp}/#{REPO} push"
  }
end