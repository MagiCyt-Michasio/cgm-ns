# CGM NS — wersja rozwojowa

Nowa, niezależna wersja monitora CGM oparta na działającym projekcie xDrip Monitor NS.

## Status
- Wersja rozwojowa: pierwszy etap — odświeżenie interfejsu w stylistyce inspirowanej iOS.
- Backend Express i odczyt z MongoDB Nightscout zachowane z projektu bazowego.
- Baza Nightscout pozostaje źródłem danych; projekt nie wykonuje migracji.
- Repozytorium źródłowe `xdrip-monitor-ns` pozostaje nietknięte.

## Uruchomienie
```bash
npm install
cp .env.example .env
# Ustaw MONGODB_URI, MONGODB_DB i PORT
npm start
```

Panel: `http://127.0.0.1:3058/dane` (przykładowy port).

## Uwaga
To wersja rozwojowa. Przed użyciem należy skonfigurować własne połączenie do MongoDB Nightscout. Nie należy wystawiać jej publicznie bez odpowiedniego uwierzytelnienia i zabezpieczenia.
