require 'formula'

class TsuruAdmin < Formula
  url 'https://s3.amazonaws.com/tsuru/dist-src/tsuru-admin-0.2.1.tar.gz'
  homepage 'http://tsuru.io'
  sha256 '15dfe07068697d2c421d44dea076026954be11cfe7c0c4d74642a2ecc892f15e'

  depends_on 'go'

  def install
    system "bash", "-c", "export GOVERSION=$(go version | cut -d' ' -f3) && [ \"x$GOVERSION\" = \"xdevel\" ] || [ \"x$GOVERSION\" = \"xgo1.1\" ] || [ \"x$GOVERSION\" = \"xgo1.2\" ] || [ \"x$GOVERSION\" = \"xgo1.1.1\" ] || [ \"x$GOVERSION\" = \"xgo1.1.2\" ] || (echo && echo \"ERROR: tsuru-admin requires Go 1.1 or later, your version is $GOVERSION\" && exit 1)"
    system "bash", "-c", "GOPATH=\"$PWD\" go build -o tsuru-admin github.com/globocom/tsuru/cmd/tsuru-admin"
    bin.install "tsuru-admin"
  end
end
