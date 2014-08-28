require 'formula'

class Gandalf < Formula
  url "https://s3.amazonaws.com/tsuru/dist-src/gandalf-0.4.1.tar.gz"
  homepage 'https://github.com/tsuru/gandalf'
  sha256 '95bcd9dd4565074cb0a18b114def2e7cc9d0f58f4be187b4f2170463e05974ec'

  depends_on 'go'

  def install
    system "bash", "-c", "test $( go version|awk '{print \$3}' | sed 's/^[^0-9]*\\([0-9]\\)[^0-9]*\\([0-9]\\).*/\\1\\2/') -lt 11 && echo ERROR: tsuru requires Go 1.1 or later, your version is: $(go version) && exit 1 || echo proceeding ..."

    if build.head?
        env = "PATH=$PATH:#{ buildpath }/bin GOPATH=\"#{ buildpath }\""
        system "bash", "-c", "#{ env } go get github.com/tools/godep"
        system "bash", "-c", "#{ env } godep restore"
        system "bash", "-c", "#{ env } mkdir -p src/github.com/tsuru/ && cd src/github.com/tsuru && wget https://github.com/tsuru/gandalf/archive/master.zip && unzip master.zip && mv gandalf-master gandalf"
    end

    system "bash", "-c", "GOPATH=\"#{ buildpath }\" go build -o gandalf-server github.com/tsuru/gandalf/webserver"
    system "bash", "-c", "GOPATH=\"#{ buildpath }\" go build -o gandalf-wrapper github.com/tsuru/gandalf/bin"

    bin.install "gandalf-server"
    bin.install "gandalf-wrapper"
  end

  head do
    url "https://github.com/tsuru/gandalf.git"

    depends_on 'mercurial'
    depends_on 'bazaar'
    depends_on 'git'
    depends_on 'wget'
  end
end
