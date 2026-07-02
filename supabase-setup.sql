-- ============================================================
--  ตาราง markers สำหรับเว็บ "ปักหมุดที่นั่ง"
--  วิธีใช้: Supabase Dashboard → SQL Editor → New query
--  วางทั้งไฟล์นี้ แล้วกด Run
-- ============================================================

create table if not exists public.markers (
  id       text primary key,
  name     text not null,
  photo    text,            -- รูปโปรไฟล์แบบ base64 (data URL)
  zone     text,
  x        double precision,
  y        double precision,
  date     text,
  twitter  text,
  link     text,
  ts       bigint           -- เวลาที่ปัก (Date.now())
);

-- เปิด Row Level Security
alter table public.markers enable row level security;

-- อนุญาตให้ทุกคน (anon) อ่าน / เพิ่ม / ลบ ได้
-- เพราะเป็นบอร์ดสาธารณะให้เพื่อน ๆ ปักหมุดร่วมกัน
-- (ลบ policy เดิมก่อน เพื่อให้รันซ้ำได้โดยไม่ error)
drop policy if exists "public read"   on public.markers;
drop policy if exists "public insert" on public.markers;
drop policy if exists "public delete" on public.markers;
create policy "public read"   on public.markers for select using (true);
create policy "public insert" on public.markers for insert with check (true);
create policy "public delete" on public.markers for delete using (true);
