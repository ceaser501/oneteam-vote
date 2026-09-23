# 원팀 행사 투표

6조 원데이 클래스(베이킹·쿠킹·공예) 선호도 조사. 폰으로 QR 찍고 들어와 투표하고, 결과는 실시간으로 본다.

- 주소: https://ceaser501.github.io/oneteam-vote/
- 페이지: `index.html` (빌드 없는 파일 하나)
- 저장: Supabase 프로젝트 `oneteam-vote`, 표는 `schema.sql`

## 고칠 곳
- 후보 날짜·공휴일: `index.html`의 `START`, `END`, `HOLIDAYS`
- 지역 선택지: `REGIONS`
- 명단: `MEMBERS` (바꾸면 `schema.sql`의 check 목록도 같이)

## 끝나면
Supabase SQL Editor에서 `drop table public.oneteam_votes;`
