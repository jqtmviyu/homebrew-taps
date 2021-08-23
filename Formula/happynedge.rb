# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Happynedge < Formula
  desc "happyn client for macos "
  homepage "https://happyn.cc"
  url "https://github.com/happynclient/happynmacos/releases/download/2.9.0-rc1/happynmacos-darwin-amd64-2.9.0-rc1.tar.gz"
  sha256 "a898c8b858a7191aaeb41c17885e1bd7d858c09d83da79f6727b4b7b7b594eaf"
  license "GPL-3.0"

  def install
    # tar zxvf happnmacOS.tar.gz
    puts "prefix = #{prefix}"
    bin.install 'bin/edge'
    etc.install "conf/edge.conf" => "edge.conf"
    puts "Completed install happynedge"
  end

  def plist
    <<~EOS
      <?xml version="1.0" encoding="UTF-8"?>
      <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
      <plist version="1.0">
        <dict>
          <key>KeepAlive</key>
          <true/>
          <key>RunAtLoad</key>
          <true/>
          <key>Label</key>
          <string>#{plist_name}</string>
          <key>StandardErrorPath</key>
          <string>/usr/local/var/log/#{plist_name}.log</string>
          <key>StandardOutPath</key>
          <string>/usr/local/var/log/#{plist_name}.log</string>
          <key>ProgramArguments</key>
          <array>
            <string>#{opt_bin}/edge</string>
            <string>#{etc}/edge.conf</string>
            <string>-f</string>
          </array>
        </dict>
      </plist>
    EOS
  end
end
