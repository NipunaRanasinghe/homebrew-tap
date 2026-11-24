class Homecider < Formula
  desc "Turn any Mac into a private home server"
  homepage "https://github.com/NipunaRanasinghe/homecider"
  url "https://github.com/NipunaRanasinghe/homecider/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "f974b5ce4eb9ffb96cfec7b22ba9e8df8ce3faeaae135d8454bbd2f4c371d23d"
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
