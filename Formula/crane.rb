require 'formula'

class Crane < Formula
  url 'https://s3.amazonaws.com/tsuru/dist-src/crane-0.4.7.tar.gz'
  homepage 'http://tsuru.io'
  sha256 '32e7f738f07248a3b497a68dfbc8f6ba618a0fdb77fbc12b7b9d24714dfa70c4'

  depends_on 'go'

  def install
    system "bash", "-c", "export GOVERSION=$(go version | cut -d' ' -f3) && [ \"x$GOVERSION\" = \"xdevel\" ] || [ \"x$GOVERSION\" = \"xgo1.1\" ] || (echo && echo \"ERROR: crane requires Go 1.1 or later, your version is $GOVERSION\" && exit 1)"
    system "bash", "-c", "GOPATH=\"$PWD\" go build -o crane github.com/globocom/tsuru/cmd/crane"
    bin.install "crane"
    bash_completion.install "src/github.com/globocom/tsuru/misc/bash-completion.d/crane"
  end
end
