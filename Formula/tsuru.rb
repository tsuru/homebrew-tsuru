require 'formula'

class Tsuru < Formula
  url 'https://s3.amazonaws.com/tsuru/dist-src/tsuru-0.7.17.tar.gz'
  homepage 'http://tsuru.io'
  sha256 '0a3eeafb68db5e681d9b3a9944b2cb1578ffa064862235c1a8212632dbfa990e'

  depends_on 'go'

  def install
    system "bash", "-c", "export GOVERSION=$(go version | cut -d' ' -f3) && [ \"x$GOVERSION\" = \"xdevel\" ] || [ \"x$GOVERSION\" = \"xgo1.1\" ] || (echo && echo \"ERROR: tsuru requires Go 1.1 or later, your version is $GOVERSION\" && exit 1)"
    system "bash", "-c", "GOPATH=\"$PWD\" go build -o tsuru github.com/globocom/tsuru/cmd/tsuru"
    bin.install "tsuru"
    bash_completion.install "src/github.com/globocom/tsuru/misc/bash-completion.d/tsuru"
  end
end
