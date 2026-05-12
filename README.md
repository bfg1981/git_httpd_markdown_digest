# git_httpd_markdown_digest

Digest-auth protected layer on top of `git_httpd_markdown`.

This image inherits the base `git_httpd` repository/webhook variables and the
`git_httpd_markdown` `STRAPDOWN_*` metadata defaults. It adds digest-auth setup
for the served site.

## Environment variables

Inherited from `git_httpd`:

| Variable | Purpose |
| --- | --- |
| `GIT_SOURCE` | Git URL to clone into `/var/www/localhost/htdocs`. |
| `FORCE_REINIT` | Set to a positive number to force a fresh clone of `GIT_SOURCE`. |
| `HOOKS` | Space-separated webhook endpoint names. Defaults to `postreceive`. |
| `SECRET` | Optional GitHub webhook secret. |

Inherited from `git_httpd_markdown`:

| Variable | Purpose |
| --- | --- |
| `STRAPDOWN_TITLE` | Default HTML title and fallback OpenGraph title. |
| `STRAPDOWN_DESCRIPTION` | Default regular meta description and fallback OpenGraph description. |
| `STRAPDOWN_OG_TITLE` | Default `og:title`. |
| `STRAPDOWN_OG_DESCRIPTION` | Default `og:description`. |
| `STRAPDOWN_OG_IMAGE` | Default `og:image` and `twitter:image`. Prefer an absolute PNG/JPG URL, ideally `1200x630`. |
| `STRAPDOWN_OG_SITE_NAME` | Default `og:site_name`. |
| `STRAPDOWN_OG_TYPE` | Default `og:type`; if unset, pages use `website`. |
| `STRAPDOWN_OG_URL` | Default `og:url`; if unset, the current request URL is used. |
| `STRAPDOWN_THEME` | Default Strapdown theme. |
| `STRAPDOWN_SHORTCUTICON` | Default favicon URL. |

Digest-auth specific:

| Variable | Purpose |
| --- | --- |
| `ACCESS` | Semicolon-separated digest credentials in `user:realm:password` form. |
| `DEFAULT_REALM` | Optional replacement for the default Apache digest realm `General`. |

Example:

```sh
ACCESS="alice:Private:secret;bob:Private:also-secret"
DEFAULT_REALM="Private"
STRAPDOWN_OG_SITE_NAME="Review site"
STRAPDOWN_OG_IMAGE="https://example.org/assets/opengraph.png"
```

If `/var/www/localhost/auth/digest_pw` already exists and is non-empty, startup
keeps it and does not rewrite credentials from `ACCESS`.
