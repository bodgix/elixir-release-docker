# elixir-release-docker

A helper to cross-build Elixir projects for Linux as a target system.

## Synopsis

```
cp -r bin Makefile Dockerfile /path/to/your/elixir/project
make
```

## Requirements

### Docker

The machine on which you're building needs to have docker installed
and accessible for the current user.

### .tool-versions

The project which you are building needs to have a .tool-versions file.
When the docker image for the build environment is first built, the version of
Erlang and Elixir specified in .tool-versions will be installed into the container.
This is done using [asdf-elixir](https://github.com/asdf-vm/asdf-elixir)

### Distillery

The Elixir project which is being built, needs to specify distillery as one of its
dependencies in *mix.exs*

```
defp deps do
  [
    {:distillery, "~> 2.0"},
  ]
end
```
