class Tsuru < Formula
  desc "tsuru-client is a tsuru command line tool for application developers."
  homepage "https://docs.tsuru.io/stable/"
  url "https://github.com/tsuru/tsuru-client/releases/download/1.5.0/tsuru_1.5.0_macOS_amd64.tar.gz"
  version "1.5.0"
  sha256 "d37380e1fdfae0bbc958bf0afcaea2bf5ec2d71f2b090125c4db050f0ff941dc"

  def install
    bin.install "tsuru"
    bash_completion.install "misc/bash-completion" => "tsuru"
    zsh_completion.install "misc/zsh-completion" => "tsuru"
  end

  test do
    
  end
end
