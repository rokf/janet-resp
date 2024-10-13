(use judge)

(import ../src :prefix "resp/")

(test (resp/encode {:hello "World!"}))
