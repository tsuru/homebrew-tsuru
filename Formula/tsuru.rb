class Tsuru < Formula
  desc "tsuru-client is a tsuru command line tool for application developers."
  homepage "https://docs.tsuru.io/stable/"
  url "https://github.com/tsuru/tsuru-client/releases/download/1.7.0/tsuru_1.7.0_macOS_amd64.tar.gz"
  version "1.7.0"
  sha256 "e6032cdcc3c29c05c62f0b9dc8d7b38cfba9e9383f1f8850c930a4fd9ec1e081"

  def install
    bin.install "tsuru"
    bash_completion.install "misc/bash-completion" => "tsuru"
    zsh_completion.install "misc/zsh-completion" => "tsuru"
  end

  test do
    
  end
end
