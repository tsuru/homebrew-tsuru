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
    url "https://github.com/tsuru/tsuru-client/releases/download/1.5.0-rc4/tsuru_1.5.0-rc4_macOS_amd64.tar.gz"
    version "1.5.0-rc4"
    sha256 "5143e98c7cd166f21dfa76fa82b45f77d4bea732c8c8667b1a10e856612f3f8f"
    ENV['TSURU_DEVEL'] = "true"
  end
end
