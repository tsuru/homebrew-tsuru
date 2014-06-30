require 'formula'

class Tsuru < Formula
  url 'https://s3.amazonaws.com/tsuru/dist-src/tsuru-0.10.0.tar.gz'
  homepage 'http://tsuru.io'
  sha256 '09890a0e0b97a6e7d912b1c3454064d05fef599e5da20248dc674956eecf61b5'

  depends_on 'go'

  def install
    system "bash", "-c", "test $( go version|awk '{print \$3}' | sed 's/^[^0-9]*\\([0-9]\\)[^0-9]*\\([0-9]\\).*/\\1\\2/') -lt 11 && echo ERROR: tsuru requires Go 1.1 or later, your version is: $(go version) && exit 1 || echo proceeding ..."
    system "bash", "-c", "GOPATH=\"$PWD\" go build -o tsuru github.com/tsuru/tsuru/cmd/tsuru"
    bin.install "tsuru"
    bash_completion.install "src/github.com/tsuru/tsuru/misc/bash-completion.d/tsuru"
  end
end
