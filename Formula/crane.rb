require 'formula'

class Crane < Formula
  url 'https://s3.amazonaws.com/tsuru/dist-src/crane-0.5.3.tar.gz'
  homepage 'http://tsuru.io'
  sha256 '0e23d1b0cbbd2c279a785c86f06455fe818813c5cc3947825698550db8b3bc56'

  depends_on 'go'

  def install
    system "bash", "-c", "test $( go version|awk '{print \$3}' | sed 's/^[^0-9]*\\([0-9]\\)[^0-9]*\\([0-9]\\).*/\\1\\2/') -lt 11 && echo ERROR: crane requires Go 1.1 or later, your version is: $(go version) && exit 1 || echo proceeding ..."
    system "bash", "-c", "GOPATH=\"$PWD\" go build -o crane github.com/tsuru/crane"
    bin.install "crane"
    bash_completion.install "src/github.com/tsuru/crane/misc/bash-completion" => "crane"
  end
end
