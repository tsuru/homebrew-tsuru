require 'formula'

class TsuruAdmin < Formula
  url 'https://s3.amazonaws.com/tsuru/dist-src/tsuru-admin-0.9.0.tar.gz'
  homepage 'http://tsuru.io'
  sha256 'e8c38aaca5681cbe305bfdf5ef06c027e817bfd5382d098f4d78b65f93228d7b'

  depends_on 'go'

  def install
    system "bash", "-c", "test $( go version|awk '{print \$3}' | sed 's/^[^0-9]*\\([0-9]\\)[^0-9]*\\([0-9]\\).*/\\1\\2/') -lt 11 && echo ERROR: tsuru-admin requires Go 1.1 or later, your version is: $(go version) && exit 1 || echo proceeding ..."
    system "bash", "-c", "GOPATH=\"$PWD\" go build -o tsuru-admin github.com/tsuru/tsuru-admin"
    bin.install "tsuru-admin"
    bash_completion.install "src/github.com/tsuru/tsuru-admin/misc/bash-completion" => "tsuru-admin"
  end
end
