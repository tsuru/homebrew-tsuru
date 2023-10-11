# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Tsuru < Formula
  desc "tsuru-client is a tsuru command line tool for application developers."
  homepage "https://docs.tsuru.io/stable/"
  version "1.17.4"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/tsuru/tsuru-client/releases/download/1.17.4/tsuru_1.17.4_macOS_amd64.tar.gz"
      sha256 "f1595605ef5eb9ba3309190d22b7e0d5d1864d521545ab1db9ea61114619b4dc"

      def install
        bin.install "tsuru"
        bash_completion.install "misc/bash-completion" => "tsuru"
        zsh_completion.install "misc/zsh-completion" => "tsuru"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/tsuru/tsuru-client/releases/download/1.17.4/tsuru_1.17.4_macOS_arm64.tar.gz"
      sha256 "1604c01f1bbea0e92d68b9622c49717e773aea66321a119b68db72629a191f12"

      def install
        bin.install "tsuru"
        bash_completion.install "misc/bash-completion" => "tsuru"
        zsh_completion.install "misc/zsh-completion" => "tsuru"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/tsuru/tsuru-client/releases/download/1.17.4/tsuru_1.17.4_linux_amd64.tar.gz"
      sha256 "b058ba62d30a5164242a98d68ed551d359c79c0f42ec271e05e3d598ad12faa8"

      def install
        bin.install "tsuru"
        bash_completion.install "misc/bash-completion" => "tsuru"
        zsh_completion.install "misc/zsh-completion" => "tsuru"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/tsuru/tsuru-client/releases/download/1.17.4/tsuru_1.17.4_linux_arm64.tar.gz"
      sha256 "1a2ef25fc66fb4ea27d7167f7009a56f489c4e5558864dbb33c2b1a09b4c48e8"

      def install
        bin.install "tsuru"
        bash_completion.install "misc/bash-completion" => "tsuru"
        zsh_completion.install "misc/zsh-completion" => "tsuru"
      end
    end
  end
end
