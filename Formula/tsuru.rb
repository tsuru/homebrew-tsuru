class Tsuru < Formula
  desc "tsuru-client is a tsuru command line tool for application developers."
  homepage "https://docs.tsuru.io/stable/"
  url "https://github.com/tsuru/tsuru-client/releases/download/1.6.0/tsuru_1.6.0_macOS_amd64.tar.gz"
  version "1.6.0"
  sha256 "7b5a46a51ba06913249be6c6ac5396ea6c4b8613ef441e3eea3d290f18da8057"

  def install
    bin.install "tsuru"
    bash_completion.install "misc/bash-completion" => "tsuru"
    zsh_completion.install "misc/zsh-completion" => "tsuru"
  end
  
  devel do
    url "https://github.com/tsuru/tsuru-client/releases/download/1.7.0-rc1/tsuru_1.7.0-rc1_macOS_amd64.tar.gz"
    version "1.7.0-rc1"
    sha256 "bd9a5e13e802caf8b43557df9d5ef19aae4a581547d28b2b1b2ce4deb362dfae"
    ENV['TSURU_DEVEL'] = "true"
  end

  test do
    
  end
end
