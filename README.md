# hoigresOpenNetty
Implementazione opennetty per il sistema domotico bTicino SCS di casa hoigres

Basato su [kevinchalet/opennetty-core@myhomeserver1_f523](https://github.com/kevinchalet/opennetty-core/tree/myhomeserver1_f523), che aggiunge il supporto al gateway BTicino MyHOMEServer1 e agli attuatori F523 ([opennetty/opennetty-core#157](https://github.com/opennetty/opennetty-core/pull/157)).

## Struttura

- `test/` — build di prova del daemon (`opennetty-daemon` + `appsettings.json`), usata così com'è invece di compilare il progetto dai sorgenti.
- `configuration/configuration.xml` — configurazione OpenNetty (gateway MQTT, gateway MyHOMEServer1 e endpoint) generata a partire da [impianto_scs.json](../bTicino/myHOMEServer1/scripts/impianto_scs.json).
- `Dockerfile` / `docker-compose.yml` — immagine che esegue il daemon di prova, con `configuration.xml` montato in sola lettura.

## Note sulla configurazione

- Gli endpoint F523 usano l'**unit 2** invece dell'unit 1, perché l'unit 1 gestisce il controllo del carico energetico e non è ancora supportato da OpenNetty.
- Termostati (F430/4) e contatori di energia (F521/F520) presenti in `impianto_scs.json` non sono ancora supportati da OpenNetty e non sono stati inclusi in `configuration.xml`.
- Prima di avviare il container, aggiorna in `configuration.xml` la password del gateway MyHOMEServer1 e le credenziali MQTT (valori segnaposto presi da `impianto_scs.json`).

## Avvio

```sh
docker compose up --build -d
docker compose logs -f
```
