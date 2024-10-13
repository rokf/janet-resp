(def- CRLF "\r\n")

# This one probably doesn't make sense as such, the s part should be sent in
# chunks. Maybe accept an optional buffer / connection object of sorts so that
# the response can be streamed. The s paramter would then probably have to
# accept different types or not be a regular string at all. 
(defn- encode-blob-string [s]
  (string "$" (length s) CRLF s CRLF))

(defn- encode-simple-string [s]
  (string "+" s CRLF))

(defn- encode-simple-error [s]
  (string "-" s CRLF))

(defn- encode-number [n]
  (string ":" n CRLF))

(defn- encode-null []
  (string "_" CRLF))

# Might require some more work, handling some of the "special" characters.
# Check the RESP3 specification for details.
(defn- encode-double [d]
  (string "," d CRLF))

(defn- encode-boolean [b]
  (string "#" (if b "t" "f") CRLF))

(defn- encode-blob-error [e]
  (string "!" (length e) CRLF e CRLF))

# Might require more work.
(defn- verbatim-string [s]
  (string "=" (length s) CRLF s CRLF))

# Will probably have to depend on an external
# library for big number support, which will
# require some kind of string conversion.
(defn- encode-big-number [n]
  (string "(" n CRLF))

(varfn encode [input])

(defn- encode-array [a]
  (string "*" (length a) CRLF ;(map encode a)))

(defn- encode-map [s]
  (string "%" (length s) CRLF ;(map encode (kvs s))))

# Janet doesn't have this built-in but ianthehenry has
# a library for it AFAIK.
(defn- encode-set [s]
  (string "~" (length s) CRLF ;(map encode s)))

# This one will require more work.
(defn- encode-attribute [a]
  (string "|" (length a) CRLF ;(map encode (kvs a))))

(defn- encode-push [a]
  (string ">" (length a) CRLF ;(map encode a)))

# @TODO watch out for streamed strings

# @TODO add streamed aggregate data type support, especially the decoding part

(varfn encode [input]
  ((case (type input)
     :nil encode-null
     :boolean encode-boolean
     :number (fn [i]
               # This will need some more work.
               (encode-double i))
     :array encode-array
     :tuple encode-array
     :table encode-map
     :struct encode-map
     :string encode-simple-string
     :buffer (fn [i]
               (encode-blob-string (string i)))
     :symbol encode-simple-string
     :keyword encode-simple-string
     (fn [i]
       (error (string "don't know how to encode element of type" (type i))))) input))

(defn decode [input]
  {})
