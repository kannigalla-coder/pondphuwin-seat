# ปักหมุดที่นั่ง — แก๊งค์อีสคาบิน

เว็บปักหมุดที่นั่งแบบแชร์ร่วมกัน เก็บข้อมูลบน **Supabase** และ deploy บน **Vercel**

## ขั้นตอนติดตั้ง

### 1) สร้างฐานข้อมูลบน Supabase
1. สมัคร/เข้า https://supabase.com → **New project** (ตั้งรหัสผ่าน database เก็บไว้)
2. รอโปรเจกต์สร้างเสร็จ (~2 นาที)
3. เมนูซ้าย → **SQL Editor** → **New query** → วางเนื้อหาไฟล์ [`supabase-setup.sql`](supabase-setup.sql) → กด **Run**
4. เมนูซ้าย → **Project Settings** → **API**
   - คัดลอก **Project URL** (เช่น `https://abcd.supabase.co`)
   - คัดลอก **anon public** key

### 2) ใส่คีย์ลงในโค้ด
เปิด [`index.html`](index.html) ค้นหาบรรทัด (อยู่ต้น `<script>`):
```js
const SUPABASE_URL = 'https://YOUR-PROJECT.supabase.co';
const SUPABASE_ANON_KEY = 'YOUR-ANON-PUBLIC-KEY';
```
แก้ 2 ค่านี้เป็นของโปรเจกต์คุณ แล้วบันทึก

> anon key เปิดเผยในหน้าเว็บได้ตามปกติ — ความปลอดภัยมาจาก Row Level Security (RLS) ที่ตั้งไว้ในไฟล์ SQL แล้ว

### 3) Deploy ขึ้น Vercel
**วิธีง่ายสุด (ผ่าน GitHub):**
1. push โฟลเดอร์นี้ขึ้น GitHub repo
2. เข้า https://vercel.com → **Add New → Project** → เลือก repo
3. Framework Preset เลือก **Other** (ไม่ต้องตั้ง build command) → **Deploy**
4. ได้ URL เช่น `https://your-app.vercel.app` ส่งให้เพื่อนใช้ได้เลย

**หรือใช้ Vercel CLI:**
```bash
npm i -g vercel
vercel        # ครั้งแรก
vercel --prod # ขึ้น production
```

## หมายเหตุ
- หน้าแรกคือ `index.html` (Vercel เสิร์ฟให้อัตโนมัติ)
- ใครก็ปัก/ลบหมุดได้ (เหมือนบอร์ดสาธารณะ) — ถ้าต้องการจำกัดสิทธิ์ให้แก้ policy ใน SQL หรือเพิ่มระบบล็อกอิน
- หน้าเว็บ refresh หมุดใหม่ทุก 8 วินาทีอยู่แล้ว
