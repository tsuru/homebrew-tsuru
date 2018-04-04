class Tsuru < Formula
  desc "tsuru-client is a tsuru command line tool for application developers."
  homepage "https://docs.tsuru.io/stable/"
  url "https://github.com/tsuru/tsuru-client/releases/download/1.5.1/tsuru_1.5.1_macOS_amd64.tar.gz"
  version "1.5.1"
  sha256 "e6c7284e0cdebdb07ecb6ffed9cdcfc3ef7d5b91343ab5180bb700e2c18e0b34"

  def install
    bin.install "tsuru"
    bash_completion.install "misc/bash-completion" => "tsuru"
    zsh_completion.install "misc/zsh-completion" => "tsuru"
  end

  test do
    
  end
end
