# This file was generated by GoReleaser. DO NOT EDIT.
class Tsuru < Formula
  desc "tsuru-client is a tsuru command line tool for application developers."
  homepage "https://docs.tsuru.io/stable/"
  version "1.9.1"
  bottle :unneeded

  if OS.mac?
    url "https://github.com/tsuru/tsuru-client/releases/download/1.9.1/tsuru_1.9.1_macOS_amd64.tar.gz"
    sha256 "1da82b3c61ee62b5f454a8f2260dd785dd2582ab9ca67fbd1b5b3ddafd3d0959"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/tsuru/tsuru-client/releases/download/1.9.1/tsuru_1.9.1_linux_amd64.tar.gz"
    sha256 "de51de68ab8a826767c5a6e8f3e5ff03b2ad32e65b25a4145b0464b087f919a9"
  end

  def install
    bin.install "tsuru"
    bash_completion.install "misc/bash-completion" => "tsuru"
    zsh_completion.install "misc/zsh-completion" => "tsuru"
  end
end
