cask "castor" do
  arch arm: "arm64", intel: "amd64"

  version "v1.7.0"
  sha256 arm:   "8a37999bdae78f9d707e0e8291d81e38a885a8840a2c0bc852f626778b823a03",
         intel: "51f476e1dba48dbe3ca4e188cb8cd5c5aa6621ff3d7801617eb8f16a64bd13b4"

  url "https://github.com/stupside/castor/releases/download/#{version}/castor_#{version}_darwin_#{arch}.tar.gz"
  name "castor"
  desc "Cast video streams to networked devices"
  homepage "https://github.com/stupside/castor"

  binary "castor"

  # The binary is unsigned, so macOS Gatekeeper quarantines it on download and
  # refuses to run it. Strip the quarantine attribute so it works out of the box.
  postflight do
    system_command "/usr/bin/xattr", args: ["-cr", "#{staged_path}/castor"]
  end

  zap trash: "~/.castor/config.yml"
end
