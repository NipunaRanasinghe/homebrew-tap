class Homecider < Formula
  desc "Turn any Mac into a private home server"
  homepage "https://github.com/NipunaRanasinghe/homecider"
  # At launch: set sha256 to the checksum of the v0.1.0 tag tarball (shasum -a 256).
  url "https://github.com/NipunaRanasinghe/homecider/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "0000000000000000000000000000000000000000000000000000000000000000"
  license "MIT"
  head "https://github.com/NipunaRanasinghe/homecider.git", branch: "main"

  depends_on arch: :arm64
  depends_on :macos

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/homecider"
  end

  def caveats
    <<~EOS
      Set up:   homecider init && homecider doctor && homecider apply
      Upgrade:  brew upgrade homecider && homecider apply
                (the weekly update job does not upgrade HomeCider itself)
      Remove:   run `homecider uninstall` before `brew uninstall homecider`:
                launchd jobs run scripts from the installed code.
    EOS
  end

  test do
    assert_match "homecider", shell_output("#{bin}/homecider version")
  end
end
