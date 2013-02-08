require 'formula'

# Documentation: https://github.com/mxcl/homebrew/wiki/Formula-Cookbook
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class MoodleMdk < Formula
  homepage 'https://github.com/FMCorz/mdk/'
  url 'https://github.com/FMCorz/mdk/archive/master.zip'
  sha1 '84166bbe2c12bbea6481451cdc96850a8169b08d'
  version '0.1'

  def install
      libexec.install 'moodle'
      libexec.install Dir['moodle-*.py']
      libexec.install Dir['lib']
      bin.install_symlink libexec+'moodle' => 'mdk'
      bash_completion.install  'extra/bash_completion'
  end
end
