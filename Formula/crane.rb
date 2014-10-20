require 'formula'

class Crane < Formula
  url 'https://s3.amazonaws.com/tsuru/dist-src/crane-0.6.0.tar.gz'
  homepage 'http://tsuru.io'
  sha256 '1278976f24e2aec6784b96b19165caf92d2b2181978ea147ee4c8298dfbd6514'

  depends_on 'go'

  def install
    system "bash", "-c", "test $( go version|awk '{print \$3}' | sed 's/^[^0-9]*\\([0-9]\\)[^0-9]*\\([0-9]\\).*/\\1\\2/') -lt 11 && echo ERROR: crane requires Go 1.1 or later, your version is: $(go version) && exit 1 || echo proceeding ..."
    system "bash", "-c", "GOPATH=\"$PWD\" go build -o crane github.com/tsuru/crane"
    bin.install "crane"
    bash_completion.install "src/github.com/tsuru/crane/misc/bash-completion" => "crane"
  end
end
