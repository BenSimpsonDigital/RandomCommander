-- Random Commander Finder — Supabase setup
-- Run this once in your Supabase project: Dashboard → SQL Editor → New query → paste → Run.
--
-- It creates a per-user table for saved commanders and locks it down with Row Level
-- Security so each signed-in user can only ever see and modify their own rows. This is
-- what makes it safe to ship the public "anon" key in index.html.

create table if not exists public.saved_commanders (
  user_id    uuid        not null references auth.users (id) on delete cascade,
  card_id    text        not null,            -- Scryfall card id
  card       jsonb       not null,            -- full card object the UI renders from
  created_at timestamptz not null default now(),
  primary key (user_id, card_id)
);

alter table public.saved_commanders enable row level security;

-- One policy covering select/insert/update/delete: you may only touch your own rows.
drop policy if exists "own saved commanders" on public.saved_commanders;
create policy "own saved commanders"
  on public.saved_commanders
  for all
  to authenticated
  using (auth.uid() = user_id)
  with check (auth.uid() = user_id);

-- Handy index for the per-user fetch on sign-in.
create index if not exists saved_commanders_user_idx
  on public.saved_commanders (user_id);
