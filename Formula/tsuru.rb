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

  test do
    
  end
end
