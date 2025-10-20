# odusg

### Our definitly unique social game (ODUSG)
- lokaler Mehrspieler (Later maybe also online mode)
- Angelehnt an Spiele wie: Mafia / Werwolf, Secret Hitler, Triple Agent etc.
- GGf unterschiedliche Schauplätze (Finde den Mörder, Wer ist der Doppelagent, Hexer / Magier wer ist besessen, etc. pp.)
  - Bietet möglichkeiten für gänzlich unteschiedliche Events
- Communtity Driven / Crowdsourced
  - Neue Schauplätze
  - Neue Events
  - Grafiken?
  - Translations
- Engine: 
  - Godot
  - Flutter (Flame?) ✔

#### Brainstorming
1. Timer ✔
   1. Wie wollen wir das handhaben? Konfigurierbarer Intervall oder sowas? ✔
   2. Irgendwie ins Spiel integrieren: Manueller Trigger ✔
   3. Am Anfang bei Rollenvergabe Unique Codeword geben  ✔
      1. Bspw. 5 Wörter anzeigen, nur eins davon ist korrekt zum Progress. Das Unique Codeword von jedem darf nur 1x angezeigt werden
      2. Jede 30 Sekunden die Wortkombinationen durchcyclen, sodass jeder die Chance hat das Spiel zu progressen
2. Events
   1. Templates, damit es in der App nachgepflegt werden kann? ✔
   2. 3 Unterschiedliche Typen
      1. Information (Rein lesend) ✔
      2. Interaktiv mit anderen Spieler(n) ✔
      3. Entscheidung / Aktion ✔
3. Einstellung
   1. Anzahl an Runden
   2. Anzahl an "Teams"
4. Gewinnbedingungen

## Demo Szenarien (Die wir unbedingt als Showcase haben wollen)
* Werwölfe ✔
* Blood on the Clocktower (vielleicht, aber garantiert nicht jetzt)
* Secert Agent

## Editor für eigene Szenarien
* Texte Anpassen (Theming)
* Logik anpassen (Anfangs erstmal Auswahl an existierenden Scenarien mit Custom Texten)
* Szenarien Teilen

## Werwolf mit App

-1. Spielernamen serialisieren, macht Testing einfacher ✔
0. Ggf. zusätzliche Mini Rollen (https://drive.google.com/file/d/1qoNljuvSPt95M19LR2KgeqkkqeeWCCKv/view ähnlich wie solche Karten mit einzelaktionen)
1. Start: Alle Spieler tragen nacheinander ihre Namen ein (Im Kreis Herum?) (Triaged as maybe future, but not now)
   1. Spieler wählen nur Namen aus und bekommen im Anschluss die Rolle gesagt
   2. Namen können nur 1x gewählt werden, danach ausgrauen und nach unten verschieben (Verhinder missbrauch)
2. Alle Spieler bekommen nacheinander ihre Identität Geheim ✔
   1. Werwölfe sehen in der Liste die anderen Werwölfe (Triages, sehen es in der ersten nacht)
3. Spiel Startet ✔
4. Nacht Beginnt ✔
   1. Werwölfe werden aufgerufen (TTS? (Not now), Text bevor die nicht Werwölfe Augen schließen sollen ✔)
   2. Werwölfe Voten (Finger, Handy reium oder so) ✔ (Liegt in der Mitte, einer Tippt halt)
   3. Sonderrollen werden aufgerufen (Erklärung wird auf Bildchirm angezeigt) ✔ (Erklärung nicht gut, aber Text ist modifizierbar)
   4. Sonderrolle macht ihr Ding (Seherin sieht, Hexe hext, Heilierin heilt, Jäger jagd...) ✔ (Haben halt nur Sehering und Heilering)
5. Resultat von Nacht wird angezeigt (Wer Tot oder wer nicht tot, das ist hier die Frage) ✔
6. Diskussionsrunde geht los, außer Werwölfe = Dorfbewohner, dann Ende ✔ (Der Flow wird von den Spielern gemacht, das Handy wartet nur auf Input)
   1. Anklage
   2. Verteidigung
   3. Voting
      1. Mehrheit tot
      2. Minderheit lebt
   4. Keine Mehrheit, Spring zu 6.1.
7. Nacht beginnt, wenn jemand tot (Rolle anzeigen, Ja / Nein Option) ✔ (Rolle wird akut nicht angezeigt, wäre aber via Template machbar)
8. Springe zu 4. ✔


## Next Todos:
- Im & Export von Scenarien ✔
  - Persist Scenarios ✔
- Grafischen Editor, theoretisch Werewolf nachbauen
- Secret Agent versuchen umzusetzen
- UI aufbessern 

## Editor Todos:
1. Delete from Roles ✔
2. Save scenario ✔
3. Per Tag Text Widget inside Blocks / Steps ✔
4. Tags Selection / Addition for ChangeTagBlock ✔
~~5. Somehow Add EventInfos into Editor (X)~~
   ~~1. Add an event info block, where "Random" and "InOrder" can be selected~~
   ~~2. Event Info Block Contains multiple EventInfos ✔~~
   ~~3. Edit event infos inside the EventInfo Block~~
   ~~4. Has to support "Per Player"~~
   ~~5. Maybe add "Randomize Per Player", so that the order is not known beforhand to the players / Make Per Player always randomize~~
5. Add Group Block, which can have multiple child blocks and executes them in order ✔
6. Add SingleChildExecutor Block, which executes a single child from it's children, either in order or random, but only single child per revolution ✔
7. Make Tag Filter ✔
8. (Maybe) add simple templates, especially for old "EventInfo" logic, so that the user has it easier to do this
9. Copy Paste of Steps ✔


For Next Stream:
- Finish implement of SingleExecuteBlockLogic ✔
- Copy the UI for GroupBlock to SingleExecute Block ✔
- Somehow try to remove unnecessary options for group and single execute block, which are on the default block ✔


## Future:
- Add support for Images / Gifs (Url? Maybe not, because they can get taken offline, somaybe b64)
  - Add support for different outcomes (Maybe via Groups?)
    - Seer sees Villager / Werewolf
    - Game Win / Loose Screen
    - Unalive / No ones Dead etc.