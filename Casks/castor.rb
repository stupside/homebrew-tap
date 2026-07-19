cask "castor" do
  arch arm: "arm64", intel: "amd64"

  version "1.4.1"
  sha256 arm:   "0654e7574f6eb8c9deaf459e4a0d277af6c66f11f6370dacca279fdf83572cec",
         intel: "d3cca086a105e566a6291386c1a2d205f7e7819869342141907cb6c07530ea89"

  url "https://github.com/stupside/castor/releases/download/v#{version}/castor_#{version}_darwin_#{arch}.tar.gz"
  name "castor"
  desc "Cast video streams to networked devices"
  homepage "https://github.com/stupside/castor"

  binary "castor"

  zap trash: "~/.castor/config.yml"
end
