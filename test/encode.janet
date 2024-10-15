(use judge)

(import ../src :prefix "resp/")

(test (resp/encode {:hello "World!"}) "%1\r\n+hello\r\n$6\r\nWorld!\r\n")

(test (resp/decode "+hello\r\n") @["hello"])

(test (resp/decode "*2\r\n+hello\r\n+world\r\n") @["hello" "world"])
