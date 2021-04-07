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
  Jekyll::Site.new(Jekyll.configuration({
    "source"      => ".",
    "destination" => "_site"
  })).process
end

task :publish => [:clean, :generate] do
  Dir.mktmpdir { |tmp|
    Dir.chdir(tmp) {
      system "git clone git@github.com:#{NAME}/#{REPO}.git"
    }
    system "find #{tmp}/#{REPO}/ -mindepth 1 -name .git -prune -o -exec rm -rf {} \;"
    system "cp -r _site/* #{tmp}/#{REPO}"
    Dir.chdir("#{tmp}/#{REPO}") {
      system "git add ."
      system "git commit -m 'Site updated'"
      system "git push"
    }
    system "git add ."
    system "git commit -m 'Site updated'"
    system "git push"
  }
end