schtasks /Create /TN "displayDuplicate_%USERNAME%" /XML "C:\Program files (x86)\EBSI\displayDuplicate\displayDuplicate.xml"
::Comme les scripts ONCE sont ex�cut�s apr�s les scripts r�currents, ex�cuter apr�s la cr�ation de la t�che
schtasks /Run /TN "displayDuplicate_%USERNAME%"
