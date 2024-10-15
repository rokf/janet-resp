(use judge)

(import ../src :prefix "resp/")

(test (resp/encode {:hello "World!"}) "%1\r\n+hello\r\n$6\r\nWorld!\r\n")

(test (resp/decode "+hello\r\n") @["hello"])

(test (resp/decode "*2\r\n+hello\r\n+world\r\n") @["hello" "world"])

(test (resp/decode "$5\r\nhello\r\n") @["hello"])

(test (resp/decode "-ERR this is a generic error\r\n") @[[:err "ERR" "this is a generic error"]])

(test (resp/decode ":4567\r\n") @[4567])

(test (resp/decode "_\r\n") @[nil])

(test (resp/decode ",-30.49\r\n") @[-30.49])

(test (resp/decode "*2\r\n#t\r\n#f\r\n") @[true false])

(test (resp/decode "(812738712387123\r\n") @[812738712387123])

(test (resp/decode "*3\r\n$3\r\nSET\r\n+age\r\n:35\r\n") @["SET" "age" 35])

(test (resp/decode "!9\r\nERR error\r\n") @[[:berr "ERR" "error"]])

(test (resp/decode "=14\r\nmkd:**STRONG**\r\n") @[[:vstr "mkd" "**STRONG**"]])
