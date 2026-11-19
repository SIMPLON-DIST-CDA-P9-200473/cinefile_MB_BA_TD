import { NextResponse } from "next/server";
import type { NextRequest } from "next/server";

// S'exécute avant le rendu des routes (anciennement middleware.ts).
// La logique d'authentification / protection de /admin viendra ici.
export function proxy(request: NextRequest) {
  return NextResponse.next();
}

export const config = {
  // Exclut les fichiers statiques, les images optimisées et le favicon.
  matcher: ["/((?!_next/static|_next/image|favicon.ico).*)"],
};
