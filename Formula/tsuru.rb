require 'formula'

class Tsuru < Formula
  url "https://s3.amazonaws.com/tsuru/dist-src/tsuru-0.17.0.tar.gz"
  homepage "https://tsuru.io"
  sha256 "eb107cd99e4c9f38f73bb39cb670ff68d29de085e6d8fe98f54944ef1a17d8cd"

  depends_on 'go'

  def install
    system "bash", "-c", "test $( go version|awk '{print \$3}' | sed 's/^[^0-9]*\\([0-9]\\)[^0-9]*\\([0-9]\\).*/\\1\\2/') -lt 14 && echo ERROR: tsuru requires Go 1.4 or later, your version is: $(go version) && exit 1 || echo proceeding ..."
    system "bash", "-c", "GOPATH=\"$PWD\" go build -o tsuru github.com/tsuru/tsuru-client/tsuru"
    ENV['TSURU_PATH'] = "./tsuru"
    system "python", "src/github.com/tsuru/tsuru-client/docs/source/exts/man_pages.py"
    bin.install "tsuru"
    man8.install "src/github.com/tsuru/tsuru-client/docs/source/exts/tsuru.8"
    bash_completion.install "src/github.com/tsuru/tsuru-client/misc/bash-completion" => "tsuru"
    zsh_completion.install "src/github.com/tsuru/tsuru-client/misc/zsh-completion" => "tsuru"
  end
end
