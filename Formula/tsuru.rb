require 'formula'

class Tsuru < Formula
  url "https://s3.amazonaws.com/tsuru/dist-src/tsuru-0.18.1.tar.gz"
  homepage "https://tsuru.io"
  sha256 "ff3b62c5e5cfbd74d000e92f95f38f61b5cb1cba57ecbaa077e76e071de1dfdc"

  depends_on 'go'

  def install
    system "bash", "-c", "test -n \"$(go version | awk '{print \$3}' | perl -ne 'print if /go1\.[0-4](\.[0-9]+)?$/')\" && echo ERROR: tsuru requires Go 1.5 or later, your version is: $(go version) && exit 1 || echo proceeding ..."
    system "bash", "-c", "GOPATH=\"$PWD\" go build -o tsuru github.com/tsuru/tsuru-client/tsuru"
    ENV['TSURU_PATH'] = "./tsuru"
    system "python", "src/github.com/tsuru/tsuru-client/docs/source/exts/man_pages.py"
    bin.install "tsuru"
    man8.install "src/github.com/tsuru/tsuru-client/docs/source/exts/tsuru.8"
    bash_completion.install "src/github.com/tsuru/tsuru-client/misc/bash-completion" => "tsuru"
    zsh_completion.install "src/github.com/tsuru/tsuru-client/misc/zsh-completion" => "tsuru"
  end
end
