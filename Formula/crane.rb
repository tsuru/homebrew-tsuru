require 'formula'

class Crane < Formula
  url 'https://s3.amazonaws.com/tsuru/crane-1.0.0.tar.gz'
  homepage 'https://tsuru.io'
  sha256 '730e3a1d98b9e3e176c62ab67cf8eebb3e295027eeffa6032b59f6bd3fbc4e4d'

  depends_on 'go'

  def install
    system "bash", "-c", "test -n \"$(go version | awk '{print \$3}' | perl -ne 'print if /go1\.[0-4](\.[0-9]+)?$/')\" && echo ERROR: crane requires Go 1.5 or later, your version is: $(go version) && exit 1 || echo proceeding ..."
    system "bash", "-c", "GOPATH=\"$PWD\" go build -o crane github.com/tsuru/crane"
    bin.install "crane"
    bash_completion.install "src/github.com/tsuru/crane/misc/bash-completion" => "crane"
  end
end
