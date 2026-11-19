# syntax=docker/dockerfile:1

# Node 26 (LTS), image Debian "slim" : bcrypt y trouve ses binaires précompilés.
ARG NODE_IMAGE=node:26-slim

# ---------- 1. Dépendances ----------
FROM ${NODE_IMAGE} AS deps
WORKDIR /app
COPY package.json package-lock.json ./
COPY prisma ./prisma
COPY prisma.config.ts ./
RUN npm ci

# ---------- 2. Build ----------
FROM ${NODE_IMAGE} AS builder
WORKDIR /app
ENV NEXT_TELEMETRY_DISABLED=1
COPY --from=deps /app/node_modules ./node_modules
COPY . .
# prisma.config.ts exige DATABASE_URL, mais `prisma generate` ne se connecte pas
# à la base : une URL factice suffit. La vraie URL est fournie au lancement.
RUN DATABASE_URL="postgresql://build:build@localhost:5432/build" npx prisma generate \
 && npm run build

# ---------- 3. Migrations (cible à part) ----------
# docker build --target migrate -t cinefile-migrate .
# docker run --rm -e DATABASE_URL=... cinefile-migrate
FROM ${NODE_IMAGE} AS migrate
WORKDIR /app
COPY --from=deps /app/node_modules ./node_modules
COPY package.json prisma.config.ts ./
COPY prisma ./prisma
CMD ["npx", "prisma", "migrate", "deploy"]

# ---------- 4. Image de production ----------
FROM ${NODE_IMAGE} AS runner
WORKDIR /app
ENV NODE_ENV=production \
    NEXT_TELEMETRY_DISABLED=1 \
    PORT=3000 \
    HOSTNAME=0.0.0.0

# Le serveur standalone ne contient ni public/ ni .next/static : on les copie.
COPY --from=builder --chown=node:node /app/public ./public
COPY --from=builder --chown=node:node /app/.next/standalone ./
COPY --from=builder --chown=node:node /app/.next/static ./.next/static

# L'utilisateur "node" existe déjà dans l'image officielle : on ne tourne pas en root.
USER node
EXPOSE 3000
CMD ["node", "server.js"]
