# InfiniteEVSE website

This repository contains the static site for InfiniteEVSE.

## Tests

Run `bash tests/check_meta.sh` to verify that all HTML files contain a
`<meta property="og:url">` tag starting with `https://infiniteevse.com`.
The script exits non-zero if any file violates this rule.

