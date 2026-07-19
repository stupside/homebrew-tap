cask "castor" do
  arch arm: "arm64", intel: "amd64"

  version "1.4.0"
  sha256 arm:   "1624a5e7c0834dcad669e831bc8949506bd6bb1ce8352bf2ee646810394686ae",
         intel: "6612371eb92859cd051465d16a32917ba6ffafbf7394f5730faa83eaea645de4"

  url "https://github.com/stupside/castor/releases/download/v#{version}/castor_#{version}_darwin_#{arch}.tar.gz"
  name "castor"
  desc "Cast video streams to networked devices"
  homepage "https://github.com/stupside/castor"

  binary "castor"

  zap trash: "~/.castor/config.yml"
end
