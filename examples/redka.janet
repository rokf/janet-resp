(import ./utils)

(pp (utils/request ["ping"]))

(pp (utils/request ["set" "hello" "world"]))
(pp (utils/request ["get" "hello"]))

(pp (utils/request ["lpush" "list" "1"]))
(pp (utils/request ["lpush" "list" "2"]))
(pp (utils/request ["lindex" "list" "2"]))

(pp (utils/request (string/split " " "sadd my-set 1")))
(pp (utils/request (string/split " " "sadd my-set 2")))
(pp (utils/request (string/split " " "smembers my-set")))
