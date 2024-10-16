(import ./utils)

(pp (utils/request ["ping"]))

(pp (utils/request ["set" "hello" "world"]))
(pp (utils/request ["get" "hello"]))
