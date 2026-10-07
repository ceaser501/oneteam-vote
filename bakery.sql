-- 베이킹 업체·클래스 투표(bakery/index.html)가 쓰는 표.
-- Supabase(oneteam-vote) SQL Editor에 통째로 붙여넣어 실행한다. 여러 번 실행해도 안전하다.
-- 날짜 투표 표(oneteam_votes)는 건드리지 않는다.
--
-- 한 사람당 한 줄. 다시 투표하면 덮어쓴다. 로그인 없이 쓰는 페이지라 anon이 읽고 쓴다.

create table if not exists public.oneteam_picks (
  name        text primary key check (name in (
                '최주열','금봉수','박선애','차슬기','김은화','전승훈',
                '김태수','김동훈','박순영','김인규','김수연','성우현','최재훈')),
  vendor      text not null check (vendor in ('bakemiyu','selgateau','yeonplace')),
  class       text not null check (char_length(class) <= 40),
  updated_at  timestamptz not null default now()
);

alter table public.oneteam_picks enable row level security;

drop policy if exists picks_read   on public.oneteam_picks;
drop policy if exists picks_insert on public.oneteam_picks;
drop policy if exists picks_update on public.oneteam_picks;
create policy picks_read   on public.oneteam_picks for select to anon, authenticated using (true);
create policy picks_insert on public.oneteam_picks for insert to anon, authenticated with check (true);
create policy picks_update on public.oneteam_picks for update to anon, authenticated using (true) with check (true);

grant select, insert, update on public.oneteam_picks to anon, authenticated;

do $$
begin
  alter publication supabase_realtime add table public.oneteam_picks;
exception when duplicate_object then null;
end $$;

-- 행사가 끝나면: drop table public.oneteam_picks;
