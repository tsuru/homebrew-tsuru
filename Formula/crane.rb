require 'formula'

class Crane < Formula
  url 'https://s3.amazonaws.com/tsuru/dist-src/crane-0.8.0.tar.gz'
  homepage 'https://tsuru.io'
  sha256 'a3924bfad0668bd2f64c0a7ecbf2fb2e8824ebde0814ae5f7ecbb72b7132f775'

  depends_on 'go'

  def install
    system "bash", "-c", "test -n \"$(go version | awk '{print \$3}' | perl -ne 'print if /go1\.[0-4](\.[0-9]+)?$/')\" && echo ERROR: crane requires Go 1.5 or later, your version is: $(go version) && exit 1 || echo proceeding ..."
    system "bash", "-c", "GOPATH=\"$PWD\" go build -o crane github.com/tsuru/crane"
    bin.install "crane"
    bash_completion.install "src/github.com/tsuru/crane/misc/bash-completion" => "crane"
  end
end
