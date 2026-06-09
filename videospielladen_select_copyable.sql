--Tabellenübergreifend    
    --Produkte, die aktuell auf Lager sind
    SELECT p.produktname, i.bestand  FROM produkt p JOIN inventar i ON p.produkt_id = i.produkt_id WHERE i.bestand > 0;
    
    --Beliebteste Produkte (nachverkaufsmenge)
    SELECT p.produktname, SUM(ka.produktanzahl) AS verkauft FROM produkt p JOIN kauft ka ON p.produkt_id = ka.produkt_id GROUP BY p.produkt_id ORDER BY verkauft DESC;
 
    --Lagerwert pro Produkt
    SELECT p.produktname, i.bestand, p.einkaufspreis, (i.bestand * p.einkaufspreis) AS lagerwert FROM produkt p JOIN inventar i ON p.produkt_id = i.produkt_id;

    --Alle gekauften Produkte mit Kundennamenf
    SELECT k.vorname, k.nachname, p.produktname, ka.produktanzahl FROM kunde k JOIN kauft ka ON k.kunde_id = ka.kunde_id JOIN produkt p ON ka.produkt_id = p.produkt_id;

    --Die Produkte, wo der Bestand zwischen 10 und 18 liegt
    SELECT p.produktname, i.bestand FROM inventar i JOIN produkt p ON i.produkt_id = p.produkt_id WHERE i.bestand BETWEEN 10 AND 18;

    --Einkaufswert pro Produkt
    SELECT k.vorname, k.nachname, ka.produktanzahl*p.verkaufspreis AS einkaufswert/produkt FROM kauft ka JOIN kunde k ON k.kunde_id = ka.kunde_id JOIN produkt p ON p.produkt_id = ka.produkt_id;

    --Alle Produkte und deren Lagerorte, die weder in den Kartons noch im Hinterlager gelagert werden
    SELECT p.produktname, i.lagerort FROM produkt p JOIN inventar i ON i.produkt_id = p.produkt_id WHERE NOT lagerort = 'kartons' AND NOT lagerort = 'hinterlager';
    
    --Liste aller Kunden die entweder 'Monster Hunter Dos' oder 'The Binding of Isaac: Repentance' kauften
    SELECT k.vorname, k.nachname, p.produktname, ka.produktanzahl FROM kunde k JOIN produkt p ON p.produkt_id =  ka.produkt_id JOIN kauft ka ON k.kunde_id = ka.kunde_id WHERE p.produkt_id = 1 OR p.produkt_id = 2;

--Weitere
    --Alle Produkte mit einem Verkaufspreis von über 15€, die beginnen mit dem Buchstaben "M" und als drittes den Buchstaben "n" beinhalten
    SELECT produktname, verkaufspreis FROM produkt WHERE produktname Like 'M_n%' AND verkaufspreis>15.00;
    
    --Die Differenzen aller Produkte aus Verkaufs- und Einkaufspreis in absteigender Reihehnfolge
    SELECT produktname, verkaufspreis, einkaufspreis, verkaufspreis-einkaufspreis AS differenz FROM produkt ORDER By verkaufspreis-einkaufspreis ASC;

    --Durchschnittlicher Einkaufs- und Verkaufspreis der Produkte
    SELECT AVG(einkaufspreis) AS einkaufspreis_durchschnitt, AVG (verkaufspreis) AS verkaufspreis_durchschnitt, produktname FROM produkt;

    
    
   