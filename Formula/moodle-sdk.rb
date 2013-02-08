require 'formula'

# Documentation: https://github.com/mxcl/homebrew/wiki/Formula-Cookbook
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class MoodleSdk < Formula
  homepage 'https://github.com/FMCorz/mdk/'
  url 'https://github.com/FMCorz/mdk/archive/master.zip'
  sha1 '399c603370817d15042f9e4f8f278d25e4dbc6fc'
  version '0.1'

  def install
      dir = (libexec+'moodle-sdk')
      dir.mkpath
      dir.install 'moodle'
      dir.install 'config-dist.json'
      dir.install Dir['moodle-*.py']
      dir.install Dir['lib']
      bin.install_symlink dir+'moodle' => 'mdk'
      bash_completion.install  'extra/bash_completion'
  end
end
