require 'formula'

class Gandalf < Formula
  url "https://s3.amazonaws.com/tsuru/dist-src/gandalf-0.5.1.tar.gz"
  homepage 'https://github.com/tsuru/gandalf'
  sha256 '166c0d9da1c583c0c691ccd69e0084a3b20cf19fd326266e737f0bef67049cfd'

  depends_on 'go'

  def install
    system "bash", "-c", "test -n \"$(go version | awk '{print \$3}' | perl -ne 'print if /go1\.[0-4](\.[0-9]+)?$/')\" && echo ERROR: gandalf requires Go 1.5 or later, your version is: $(go version) && exit 1 || echo proceeding ..."

    if build.head?
        env = "PATH=$PATH:#{ buildpath }/bin GOPATH=\"#{ buildpath }\""
        system "bash", "-c", "#{env} go get github.com/tools/godep"
        system "bash", "-c", "#{env} godep restore"
        system "bash", "-c", "#{env} mkdir -p src/github.com/tsuru/ && cd src/github.com/tsuru && curl -LO https://github.com/tsuru/gandalf/archive/master.zip && unzip master.zip && mv gandalf-master gandalf"
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
