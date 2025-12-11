# Justfile

# ==========================================
# Configuration
# ==========================================
set shell := ["bash", "-c"]

# Auto-detect Maven Wrapper.
# If ./mvnw exists, use it (ensures team uses same Maven version).
# Otherwise fall back to system 'mvn'.
mvn := `test -f mvnw && echo "./mvnw" || echo mvn`

# Default target
default:
    @just --list

# ==========================================
# Developer Workflow
# ==========================================

# Formats code (Spotless) and then runs static analysis (Detekt)
# Usage: just fix
fix: format lint

# Checks code quality (Spotless Check + Detekt) without running full tests
# Usage: just lint
lint:
    {{mvn}} validate

# Builds the project (skips tests for speed)
# Usage: just build
build:
    {{mvn}} clean package -DskipTests

# Run Unit Tests only (Fast)
# Usage: just test
test:
    {{mvn}} test

# Run ALL tests (Unit + Integration) and Quality Gates (JaCoCo, OWASP)
# Usage: just verify
verify:
    {{mvn}} verify

# Run the application
# Usage: just run (defaults to local) | just run prod
run profile='local':
    {{mvn}} exec:java -Dapp.profile={{profile}}

# ==========================================
# Advanced / Ad-Hoc
# ==========================================

# Run Maven with arbitrary arguments (Pass-through)
# Usage: just m -X clean install
m +args:
    {{mvn}} {{args}}

# Nuke everything (clean + force update dependencies)
nuke:
    {{mvn}} clean -U

# ==========================================
# Maintenance
# ==========================================

# Show dependency tree
deps:
    {{mvn}} dependency:tree

# Check for library updates
check-updates:
    {{mvn}} versions:display-dependency-updates

# Apply formatting (Spotless)
format:
    {{mvn}} spotless:apply

# Install git pre-commit hooks (Optional, if you use a script)
setup-hooks:
    git config core.hooksPath .githooks