schtasks /Create /TN "displayDuplicate_%USERNAME%" /XML "C:\Program files (x86)\EBSI\displayDuplicate\displayDuplicate.xml"
::Comme les scripts ONCE sont exécutés après les scripts récurrents, exécuter après la création de la tâche
schtasks /Run /TN "displayDuplicate_%USERNAME%"
