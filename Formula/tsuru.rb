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

  devel do
    url "https://github.com/tsuru/tsuru-client/releases/download/1.6.0-rc3/tsuru_1.6.0-rc3_macOS_amd64.tar.gz"
    version "1.6.0-rc3"
    sha256 "91b56b91afc243b7a51dc3c8ae820c38241205323d72597075a20baaade3659d"
    ENV['TSURU_DEVEL'] = "true"
  end

  test do
  end
end
