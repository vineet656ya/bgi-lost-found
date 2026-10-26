# BGI Lost & Found

Campus lost-and-found platform for BGI Bhopal, created by [Vineet Yadav](https://vineet-yadav-orange.vercel.app/).

## Features

- Public lost/found listings, filters and recovery history.
- Guest reporting with moderation and private recovery access.
- Student and faculty registration with private ID evidence and admin approval.
- Ownership claims and item-specific messaging.
- Admin and super admin workspaces, authenticator verification and audit records.
- Graduation-based student account cleanup; faculty accounts are excluded.
- Installable web app and Android Trusted Web Activity project.

## Stack

React, TypeScript and Vinext; Cloudflare Workers, D1 and private R2 storage. Hosting is currently managed through ChatGPT Sites. GitHub stores the source; GitHub Pages cannot run this backend.

## Run locally

Use Node.js 22.13+ and pnpm (see `package.json` for the pinned version):

```sh
pnpm install --frozen-lockfile
pnpm dev
```

Database migrations live in `drizzle/`. Configure local D1/R2 bindings and runtime secrets before testing account features. Never use production credentials for local testing.

```sh
node tests/workflows.mjs
node tests/manual-accounts.mjs
```

## Runtime configuration

The Worker expects D1 binding `DB` and R2 binding `BUCKET`. Account security uses `PASSWORD_PEPPER` and `ADMIN_ENCRYPTION_KEY`; initial owner setup uses `ADMIN_SETUP_HASH` and `ADMIN_SETUP_EXPIRES`. Supply these through the hosting secret configuration, never commit their values. Keep existing production secrets unchanged during migration. Review the API code before configuring account cleanup.

`.openai/hosting.json` references the existing Sites project. Independent hosting requires provisioning your own database, bucket and secrets and adapting the deployment configuration. Cloning the repository does not grant access to production data.

## Android

See [mobile/android/README.md](mobile/android/README.md). Signing keys, signing passwords, APK binaries, databases and private user uploads are excluded from this export. APK downloads remain on the live website. Android signing certificates in Digital Asset Links are public verification fingerprints, not private keys.

## Verification limits

The source includes backend workflow tests. Real-device testing and the previously reported Safari service-worker issue still need verification. This export does not claim to fix that issue.

