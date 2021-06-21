# Lean 4 Script

A simple shell script for downloading and compiling Lean 4.

## How to Use

To download Lean 4 into `some/directory/`:

```
./LeanScript.sh "some/directory/"
```

If there's already a directory named `lean4` inside `some/directory/` and are okay with overwriting it:

```
./LeanScript.sh "some/directory/" --overwrite
```
