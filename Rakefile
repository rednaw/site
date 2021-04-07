require "bundler/setup"
require "jekyll"
require "rubygems"
require "tmpdir"
require "fileutils"

GITHUB_REPONAME = "rednaw/rednaw.github.io"

task :generate do
  Jekyll::Site.new(Jekyll.configuration({
    "source"      => ".",
    "destination" => "_site"
  })).process
end

task :publish => [:generate] do
  Dir.mktmpdir { |tmp|
    Dir.chdir(tmp) {
      system "git clone git@github.com:rednaw/rednaw.github.io.git"
      system "find #{tmp}/rednaw.github.io/ -not -name '.git' -delete"
    }
    system "cp -r _site/* #{tmp}/rednaw.github.io"
    Dir.chdir("#{tmp}/rednaw.github.io") {
      system "git add ."
      system "git commit -m 'Site updated'"
      system "git push"
    }
    system "git add ."
    system "git commit -m 'Site updated'"
    system "git push"
  }
end