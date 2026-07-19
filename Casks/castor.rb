cask "castor" do
  arch arm: "arm64", intel: "amd64"

  version "1.4.2"
  sha256 arm:   "6fff0fafc4757a69dee474e72f6271fd6c96757ba02e3f13c7754be3352755de",
         intel: "532fced9654cbf8427d43937fa8a128dd5a53a1432cfe23f45e61d1ce648f942"

  url "https://github.com/stupside/castor/releases/download/v#{version}/castor_#{version}_darwin_#{arch}.tar.gz"
  name "castor"
  desc "Cast video streams to networked devices"
  homepage "https://github.com/stupside/castor"

  binary "castor"

  zap trash: "~/.castor/config.yml"
end
