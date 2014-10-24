require 'formula'

class Tsuru < Formula
  url 'https://s3.amazonaws.com/tsuru/dist-src/tsuru-0.13.2.tar.gz'
  homepage 'http://tsuru.io'
  sha256 'fdfb1fbc36461a10eeff56b7d7ca7d22982e25f0060558dc43a6de04bdf98892'

  depends_on 'go'

  def install
    system "bash", "-c", "test $( go version|awk '{print \$3}' | sed 's/^[^0-9]*\\([0-9]\\)[^0-9]*\\([0-9]\\).*/\\1\\2/') -lt 11 && echo ERROR: tsuru requires Go 1.1 or later, your version is: $(go version) && exit 1 || echo proceeding ..."
    system "bash", "-c", "GOPATH=\"$PWD\" go build -o tsuru github.com/tsuru/tsuru-client/tsuru"
    bin.install "tsuru"
    bash_completion.install "src/github.com/tsuru/tsuru-client/misc/bash-completion" => "tsuru"
  end
end
