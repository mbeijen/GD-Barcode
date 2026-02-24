# Developer Guide

## Code Formatting

This project uses automated code formatting to maintain consistency:

- **Perl code**: Formatted with [perltidy](https://perltidy.sourceforge.net/)
  using the configuration in `.perltidyrc`
- **Markdown**: Formatted with [mdformat](https://mdformat.readthedocs.io/)
  (optional, wraps at 80 characters)

### Git Hooks

A pre-commit hook automatically formats code before each commit. To enable it:

```bash
./scripts/install-git-hooks.sh
```

This configures git to use the hooks in `.githooks/`, which will:

- Format all Perl files with perltidy
- Format Markdown files with mdformat (if installed)
- Stage the formatted files automatically

### Manual Formatting

To format code manually:

```bash
# Format all Perl files
git ls-files '*.pm' '*.pl' '*.t' 'Makefile.PL' | xargs perltidy -b

# Format all Markdown files (if mdformat is installed)
git ls-files '*.md' | xargs mdformat --wrap 80
```

### Bypassing Hooks

If needed, you can bypass the pre-commit hook with:

```bash
git commit --no-verify
```

## Testing

Run the test suite with:

```bash
prove -l
```

Author tests (for distribution maintainers):

```bash
prove -l xt/
```
