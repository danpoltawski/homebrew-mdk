require 'formula'

# Documentation: https://github.com/mxcl/homebrew/wiki/Formula-Cookbook
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class MoodleSdk < Formula
  homepage 'https://github.com/FMCorz/mdk/'
  url 'https://github.com/FMCorz/mdk/archive/v0.3.zip'
  sha1 '26240391b0b5558dcec2158fdc52e096c8c9c796'
  version '0.3'

  def install
      dir = (libexec+'moodle-sdk')
      dir.mkpath
      dir.install 'moodle'
      dir.install 'config-dist.json'
      dir.install Dir['moodle-*.py']
      dir.install Dir['lib']
      dir.install Dir['scripts']
      bin.install_symlink dir+'moodle' => 'mdk'
      bash_completion.install  'extra/bash_completion'
  end

  def caveats; <<-EOS.undent
    You should install the keyring package, to do this run:
      $ sudo pip install keyring

    EOS
  end
end
