# Nix Flake Template for development
Starting point template for creating a new flake for development

To use the default template run:

```nix
nix flake init --template github:vieolo/dev-flake-template --refresh
```

To use the domain specific template, add a `#` followed by the template name. e.g.

```nix
nix flake init --template github:vieolo/dev-flake-template#frontend --refresh
```

The domain specific templates are:
- frontend