class Tsuru < Formula
  desc "tsuru-client is a tsuru command line tool for application developers."
  homepage "https://docs.tsuru.io/stable/"
  url "https://github.com/tsuru/tsuru-client/releases/download/1.4.0/tsuru_1.4.0_macOS_amd64.tar.gz"
  version "1.4.0"
  sha256 "5f09c97f63da301d814efab58131723216ae81642b176a78b1acc8925f6ea2e7"

  def install
    bin.install "tsuru"
    bash_completion.install "misc/bash-completion" => "tsuru"
    zsh_completion.install "misc/zsh-completion" => "tsuru"
  end
  devel do
    url "https://github.com/tsuru/tsuru-client/releases/download/1.5.0-rc1/tsuru_1.5.0-rc1_macOS_amd64.tar.gz"
    version "1.5.0-rc1"
    sha256 "e28760a45a911cd9aca1f1b01967bc5c6824e6b0e4cfc9f9f342e6c162348ac4"
    ENV['TSURU_DEVEL'] = "true"
  end
end
