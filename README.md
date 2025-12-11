# Maven Template Project

A minimal, opinionated Maven + Kotlin project that comes pre‑configured with:

- **Spotless** – code formatting
- **Detekt** – static code analysis
- **JaCoCo** – test coverage
- **OWASP Dependency‑Check** – vulnerability scanning
- **Git hooks** – enforce commit‑message format and run checks on push
- **Justfile** – convenient CLI commands (`just test`, `just verify`, `just fix`, etc.)

## Quick start

```bash
# Install git hooks
just setup-hooks

# Run formatting and linting
just lint

# Run unit tests
just test

# Run unit tests
just test

# Run full verification (tests + coverage + security checks)
just verify

# Run the application
just run          # uses default profile
just run prod     # uses prod profile
```
## Just commands

- `just fix` – formatting and static analysis (Spotless + Detekt)
- `just lint` – check formatting and static analysis without tests
- `just build` – build the project without tests
- `just test` – run unit‑tests
- `just verify` – run all tests, coverage and security checks
- `just run [profile]` – run the application, default profile `local`
- `just m +args` – run Maven with arbitrary arguments
- `just nuke` – clean everything and force update dependencies
- `just deps` – display dependency tree
- `just check-updates` – check for dependency updates
- `just format` – apply formatting (Spotless)
- `just setup-hooks` – install git hooks