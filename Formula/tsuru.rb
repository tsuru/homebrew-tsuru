class Tsuru < Formula
  desc "tsuru-client is a tsuru command line tool for application developers."
  homepage "https://docs.tsuru.io/stable/"
  url "https://github.com/tsuru/tsuru-client/releases/download/1.2.0/tsuru_1.2.0_macOS_amd64.tar.gz"
  version "1.2.0"
  sha256 "da6a6b99aa25d14c8c9eb022c260f4085b230ea90144f9d8ba5f232fb959f404"

  def install
    bin.install "tsuru"
    bash_completion.install "misc/bash-completion" => "tsuru"
    zsh_completion.install "misc/zsh-completion" => "tsuru"

  end
  devel do
    url "https://github.com/tsuru/tsuru-client/releases/download/1.3.0-rc3/tsuru_1.3.0-rc3_macOS_amd64.tar.gz"
    version "1.3.0-rc3"
    sha256 "de18153ca10966c9249c274bfca983df1b2fe08520e4b9bd7f9f7e39b2c0068c"
    ENV['TSURU_DEVEL'] = "true"
  end
end
