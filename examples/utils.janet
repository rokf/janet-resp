(import ../src :prefix "resp/")

(defn request [query &opt host port]
  (default host "127.0.0.1")
  (default port "6379")
  (with [conn (net/connect host port :stream)]
    (:write conn (resp/encode query))
    (resp/decode (:read conn 1024))))
