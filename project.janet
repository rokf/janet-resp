(declare-project
  :name "janet-resp"
  :author "Rok Fajfar <hi@rokf.dev>"
  :description "A Janet library for working with RESP(2/3)"
  :license "MIT"
  :version "0.0.1"
  :url "https://github.com/rokf/janet-resp"
  :repo "git+https://github.com/rokf/janet-resp"
  :dependencies ["spork"])

(declare-source
  :prefix "resp"
  :source ["src/init.janet"])
