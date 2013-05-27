require 'formula'

class TsuruAdmin < Formula
  url 'https://s3.amazonaws.com/tsuru/dist-src/tsuru-admin-0.1.9.tar.gz'
  homepage 'http://tsuru.io'
  sha256 'e32e5855787675c67b0f9f96a5038c1df9c3ae307a328b124d94ff82633205a1'

  depends_on 'go'

  def install
    system "bash", "-c", "export GOVERSION=$(go version | cut -d' ' -f3) && [ \"x$GOVERSION\" = \"xdevel\" ] || [ \"x$GOVERSION\" = \"xgo1.1\" ] || (echo && echo \"ERROR: tsuru-admin requires Go 1.1 or later, your version is $GOVERSION\" && exit 1)"
    system "bash", "-c", "GOPATH=\"$PWD\" go build -o tsuru-admin github.com/globocom/tsuru/cmd/tsuru-admin"
    bin.install "tsuru-admin"
  end
end
