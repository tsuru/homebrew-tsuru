require 'formula'

class Tsuru < Formula
  url 'https://s3.amazonaws.com/tsuru/dist-src/tsuru-0.15.1.tar.gz'
  homepage 'http://tsuru.io'
  sha256 'ef91c54706f5d23c8fc086a87dccc19c04555ddf11b1a189970870c2d5bdd7dd'

  depends_on 'go'

  def install
    system "bash", "-c", "test $( go version|awk '{print \$3}' | sed 's/^[^0-9]*\\([0-9]\\)[^0-9]*\\([0-9]\\).*/\\1\\2/') -lt 14 && echo ERROR: tsuru requires Go 1.4 or later, your version is: $(go version) && exit 1 || echo proceeding ..."
    system "bash", "-c", "GOPATH=\"$PWD\" go build -o tsuru github.com/tsuru/tsuru-client/tsuru"
    bin.install "tsuru"
    bash_completion.install "src/github.com/tsuru/tsuru-client/misc/bash-completion" => "tsuru"
  end
end
