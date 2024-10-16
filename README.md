# janet-resp

janet-resp is a Janet module library for the Redis serialization protocol (RESP).

> [!IMPORTANT]
> The encoders and decoders still aren't fully implemented and things might
> change as I do more testing. Check the comments in the source files if
> you encounter unexpected behaviour.

## Installation

You can install it through `jpm` with `jpm install https://github.com/rokf/janet-resp`
or by adding the following to the dependency list in your `project.janet` file:

```janet
{ :url "https://github.com/rokf/janet-resp" :tag "main" }
```

## API

### `resp/encode`

Encode takes a Janet value, encodes it into a RESP string, and returns that
string. Example:

```janet
(resp/encode ["set" :color [255 100 50]])
```

### `resp/decode`

Decode takes a RESP encoded string, decodes it, and produces a Janet value as
a response. Example:

```janet
(resp/decode "*3\r\n$3\r\nset\r\n$5\r\ncolor\r\n*3\r\n:255\r\n:100\r\n:50\r\n")
```

## Examples

See the `examples` folder for various examples using this module. The folder
contains a `compose.yaml` file which can be used with Docker Compose to spin
up services that are required for the examples to run.

## License

MIT - details can be found in the `LICENSE` file at the root of the repository.
