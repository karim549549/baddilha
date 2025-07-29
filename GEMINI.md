# Project Context: `baddliha`

This project is structured as a monorepo, containing the following sub-projects:

## 1. `api` (Backend)

*   **Framework:** NestJS (Node.js framework for building scalable server-side applications).
*   **Language:** TypeScript.
*   **ORM:** Prisma, configured for PostgreSQL.
*   **Database Schema (`prisma/schema.prisma`):** Defines models for `User`, `Item`, `Like`, `Match`, `Message`, and `UserPreferences`. It also includes enums for `ItemCondition`, `ItemCategory`, `MatchStatus`, `GamingInterest`, and `GamingPlatform`.
    *   **Key Models:**
        *   `User`: Stores user profiles, including `latitude`, `longitude`, `gamingInterests`, `preferredPlatforms`, and a one-to-many relationship with `Account` for multi-provider authentication. Passwords are NOT stored directly.
        *   `Account`: Manages external authentication providers (e.g., Google, Facebook) linked to a `User`.
        *   `UserPreferences`: Stores granular user preferences for matching algorithms (e.g., `maxSwapDistanceKm`, `preferredItemCategories`, `preferredConditions`, `preferredGameTitles`).
        *   `Item`: Represents gaming items for swap, including `likesCount` for performance optimization.
        *   `Like`: Records a user's interest in a specific `Item`.
        *   `Match`: Represents a mutual, item-for-item interest between two users, enabling chat.
        *   `Message`: Stores chat messages within a `Match`.
*   **Key Dependencies:** `@nestjs/common`, `@nestjs/core`, `@nestjs/platform-express`, `@prisma/client`, `reflect-metadata`, `rxjs`.
*   **Development Tools:** Jest (for testing), ESLint (for linting), Prettier (for code formatting), TypeScript.
*   **Available Scripts:** `build`, `format`, `start`, `start:dev`, `start:debug`, `start:prod`, `lint`, `test`, `test:watch`, `test:cov`, `test:debug`, `test:e2e`.
*   **Entry Point:** `src/main.ts`.

### API Documentation (Swagger)

*   **Integration:** Swagger (OpenAPI) is integrated for API documentation and interactive testing.
*   **Access:** Available at `/api` endpoint when the server is running (e.g., `http://localhost:3000/api`).
*   **Dependencies:** `@nestjs/swagger`, `swagger-ui-express`.

### Global Error Handling

*   **Implementation:** A global `AllExceptionsFilter` is implemented to catch all unhandled exceptions.
*   **Purpose:** Provides consistent error responses across the API, improving robustness and developer experience by centralizing error handling logic.
*   **Location:** `src/common/filters/all-exceptions.filter.ts`.
*   **Integration:** Applied globally in `src/main.ts` using `app.useGlobalFilters()`.

### Blob Storage Design (Supabase Storage)

For optimal performance, security, and manageability, we will use a **single Supabase Storage bucket** with a well-defined prefix (folder) structure. Direct public access to files will be disabled; instead, **signed URLs** will be used for temporary, secure access.

**Bucket Strategy:**

*   **Single Bucket:** `baddliha-assets` (or similar, created manually via Supabase GUI).
    *   **Reasoning:** More performant and easier to manage than multiple buckets. Cloud storage systems are optimized for parallel operations across different key prefixes within a single bucket.

**Folder Structure (Prefixes) within the Bucket:**

1.  **`profile-pictures/{userId}/{filename}`**
    *   **Purpose:** Stores user avatar images.
    *   **Example Path:** `profile-pictures/a1b2c3d4-e5f6-7890-1234-567890abcdef/avatar.jpg`
    *   **Benefits:** Unique paths per user, scalability, easy access control, and simplified deletion upon user removal.

2.  **`item-photos/{itemId}/{filename}`**
    *   **Purpose:** Stores multiple photos for each gaming item.
    *   **Example Path:** `item-photos/x9y8z7w6-v5u4-3210-fedc-ba9876543210/game-console-front.png`
    *   **Benefits:** Unique paths per item, scalability, organized grouping of item photos, and simplified deletion upon item removal.

3.  **(Optional) `chat-media/{matchId}/{messageId}/{filename}`**
    *   **Purpose:** For future support of media within chat messages.

**Access Control and Security:**

*   **Private Buckets:** All buckets will be private. Direct public access is strictly forbidden to prevent security risks, unauthorized access, hotlinking, and content scraping.
*   **Signed URLs (Pre-signed URLs):** The primary mechanism for accessing private objects.
    *   Your NestJS backend will generate temporary, time-limited signed URLs for specific objects.
    *   These URLs are sent to the frontend, allowing direct, secure access to the private object from Supabase Storage.
    *   The URLs expire after a set duration, ensuring temporary access.
    *   This method ensures no long-lived credentials are exposed to the client and offloads authentication to Supabase.

**Supabase Storage Integration (API Side):**

*   **Installation:** `npm install @supabase/supabase-js`
*   **Keys (Environment Variables - ONLY on server-side):**
    *   `SUPABASE_URL`: Your Supabase project URL.
    *   `SUPABASE_SERVICE_ROLE_KEY`: Your Supabase secret key with full privileges. Used by the NestJS API for server-side operations (e.g., uploading, deleting, generating signed URLs) that bypass Row Level Security.

## 2. `web` (Frontend)

*   **Framework:** Next.js (React framework for building full-stack web applications).
*   **Language:** TypeScript.
*   **Styling:** Tailwind CSS.
*   **Key Dependencies:** `next`, `react`, `react-dom`.
*   **Development Tools:** ESLint, Prettier, TypeScript.
*   **Available Scripts:** `dev`, `build`, `start`, `lint`.
*   **Entry Points:** `src/app/page.tsx` and `src/app/layout.tsx`.
*   **Fonts:** Utilizes `geist/font/sans` and `geist/font/mono`.

## 3. `mobile`

*   This directory is present in the project structure but currently appears to be empty or uninitialized, suggesting it might be reserved for a future mobile application.

---

**Overall Project Goal:**

The `baddliha` project is a comprehensive application designed for item swapping, with a robust NestJS backend handling data and logic, and a modern Next.js frontend providing the user interface.
