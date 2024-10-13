# janet-resp

janet-resp is a Janet module library for the Redis serialization protocol (RESP).

## API

### `resp/encode`

Encode takes a Janet value, encodes it into a RESP string, and returns that
string.

### `resp/decode`

Decode takes a RESP encoded string, decodes it, and produces a Janet value as
a response.

## License

MIT - details can be found in the `LICENSE` file at the root of the repository.
