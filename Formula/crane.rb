require 'formula'

class Crane < Formula
  url 'https://s3.amazonaws.com/tsuru/dist-src/crane-0.5.1.tar.gz'
  homepage 'http://tsuru.io'
  sha256 '7eedbaaa3c45186b52a4d06acefa089e29bc0939e728d5cd7a87728ec1ef49d4'

  depends_on 'go'

  def install
    system "bash", "-c", "export GOVERSION=$(go version | cut -d' ' -f3) && [ \"x$GOVERSION\" = \"xdevel\" ] || [ \"x$GOVERSION\" = \"xgo1.1\" ] || [ \"x$GOVERSION\" = \"xgo1.2\" ] || [ \"x$GOVERSION\" = \"xgo1.1.1\" ] || [ \"x$GOVERSION\" = \"xgo1.1.2\" ] || (echo && echo \"ERROR: crane requires Go 1.1 or later, your version is $GOVERSION\" && exit 1)"
    system "bash", "-c", "GOPATH=\"$PWD\" go build -o crane github.com/globocom/tsuru/cmd/crane"
    bin.install "crane"
    bash_completion.install "src/github.com/globocom/tsuru/misc/bash-completion.d/crane"
  end
end
