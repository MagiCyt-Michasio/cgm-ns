# CGM Local Monitor
Niezależny monitor CGM dla Androida w Debian PROOT. Node.js/Express komunikuje się wyłącznie z lokalnym MongoDB. Nightscout nie jest używany ani wymagany.

## Wymagania
Debian PROOT ARM64, Node.js/npm oraz lokalny MongoDB dostępny pod 127.0.0.1:27017.

## Instalacja i start
```bash
npm install
cp .env.example .env
npm run check
./start-mongodb.sh
./start-cgm.sh
```
Podgląd: http://127.0.0.1:3058/dane
Zatrzymanie: ./stop-cgm.sh oraz ./stop-mongodb.sh

## API
- GET /health
- GET /dane/api/data?hours=72
- POST /dane/api/entries — {sgv,timestamp,direction,device,source}
- POST /dane/api/treatments — {insulin,carbs,timestamp,eventType,notes}
- DELETE /dane/api/treatments/:id — tylko wpisy ręczne

## Dane
Wykresy, TIR, histogram, statystyki i profil 3D są liczone z pomiarów zapisanych w kolekcji entries. Aplikacja nie generuje fikcyjnych pomiarów. Predykcja jest jedynie orientacyjną ekstrapolacją trendu i pojawia się dopiero po uzyskaniu świeżych odczytów.

## Uwaga
To nowa baza aplikacji. Adapter źródła danych (np. sensor lub import pliku LibreView) musi zapisywać odczyty przez lokalne API. Nie wpisuj danych Nightscout do konfiguracji.
