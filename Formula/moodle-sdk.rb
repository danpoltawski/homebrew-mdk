require 'formula'

# Documentation: https://github.com/mxcl/homebrew/wiki/Formula-Cookbook
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class MoodleSdk < Formula
  homepage 'https://github.com/FMCorz/mdk/'
  url 'https://github.com/FMCorz/mdk/archive/v1.5.1.zip'
  sha1 '259cc901890c6cebdfed02e89fc92d73e6937d18'
  version '1.5.1'

  def install
      dir = (libexec+'moodle-sdk')
      dir.mkpath
      dir.install 'requirements.txt'
      dir.install 'mdk.py'
      dir.install Dir['mdk']
      bin.install_symlink dir+'mdk.py' => 'mdk'
      bash_completion.install  'extra/bash_completion'
  end

  def caveats; <<-EOS.undent
    You will need to install the some pip depdencies for example, keyring. To do this run:
      $ sudo pip install -r /usr/local/opt/moodle-sdk/libexec/moodle-sdk/requirements.txt

    Check for missing depencies by running:
      $ mdk doctor --dependencies

    EOS
  end
end
