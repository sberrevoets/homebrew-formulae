class Urlview < Formula
  desc "URL extractor/launcher"
  homepage "https://github.com/sigpipe/urlview"
  head "https://github.com/sberrevoets/urlview.git"

  def install
    inreplace "urlview.man", "/etc/urlview/url_handler.sh", "open"
    inreplace "urlview.c",
      '#define DEFAULT_COMMAND "/etc/urlview/url_handler.sh %s"',
      '#define DEFAULT_COMMAND "open %s"'

    man1.mkpath
    ENV.prepend "CFLAGS", "-I /usr/local/include"
    system "./configure", "--disable-dependency-tracking", "--prefix=#{prefix}"
    system "make", "install"
  end
end
