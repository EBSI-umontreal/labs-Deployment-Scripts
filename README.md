# labs-Deployment-Scripts
Scripts de déploiement des postes des laboratoires informatiques de l'EBSI.


# Présentation
Ce dépôt contient une collection de scripts d'installation utilisés pour déployer les principaux outils ou logiciels sur les postes de travail des [laboratoires informatiques de l'EBSI](https://ebsi.umontreal.ca/ressources-services/laboratoires-informatique-documentaire/) via SCCM (System Center Configuration Manager).<br>
Ces scripts ont été conçus pour automatiser et standardiser le processus d'installation des logiciels, garantissant ainsi une configuration cohérente et personnalisée selon les besoins des enseignant-e-s.


# Organisation du dépôt
- Certains logiciels sont déployés en mode *application* et d’autres en mode *package*.<br>
  Habituellement, les *applications* disposent d'un script d'installation et d'un script de désinstallation pour permettre l’utilisation du *supersedence*.<br>
  Les *packages* sont généralement utilisés pour les scripts de configuration ou certains éléments plus stables, ou pour lesquels les mécanismes SCCM de validation d'installation ne sont pas pertinents ou applicables.
- Bien que nous conservions sur notre serveur SCCM plusieurs versions de chaque *application* ou *package*, ce dépôt ne conserve que les dernières versions utilisées dans la séquence de déploiement, sauf en de rares exceptions. Vous devrez donc naviguer dans les comits précédents pour retrouver d’anciennes versions.


# Contexte et notes d’utilisation
- Les fichiers d’installation des logiciels ne sont pas inclus. Ce dépôt ne contient que les scripts ou autres fichiers de configuration qui peuvent être diffusés de façon non préjudiciable (par exemple, les numéros de série et clés ne sont pas inclus).<br>
- Les postes des laboratoires de l’EBSI sont redéployés au début de chaque session académique. Certains choix peuvent donc découler de ce mode de fonctionnement.
- Les profils utilisateurs des laboratoires de l’EBSI ne sont pas itinérants. Nous n’utilisons pas non plus le `CopyProfile` lors du déploiement des postes : tous les paramètres de configuration sont donc généralement poussés dans le dossier ou le registre du profil par défaut (`%SystemDrive%\Users\Default`).
- Certains paramètres des postes sont réalisés par GPO domaine, qui ne sont pas forcément décrits dans ce dépôt.
- Sauf pour des raisons de sécurité, dans la majorité des cas, les versions des logiciels ne changent pas durant la session académique, pour assurer la stabilité et le bon déroulement des activités pédagogiques. De ce fait, la mise à jour automatique des logiciels est généralement désactivée.<br>
Cas particuliers : les navigateurs web sont configurés pour se mettre à jour de façon automatique.


# Notes de conception
- La perfection n’est pas recherchée; notre pratique peut avoir évolué, mais sans que nous fassions forcément un traitement rétroactif des scripts.<br>
Par exemple, certains *packages* ont été développés pour des versions plus anciennes de Windows, mais s’ils sont encore fonctionnels, ce sont ces versions qui sont encore utilisées.
- Le langage principalement utilisé est le Batch (`.bat`), par commodité. Certaines opérations peuvent être réalisées en VBScript ou Powershell, par commodité également.
- Les scripts sont basés sur le même modèle, qui est présenté dans le répertoire `template`.<br>
  Le répertoire `template` regroupe également certains scripts VBScript ou Powershell qui ont été volontairement retirés de certains répertoires où ils sont parfois requis.
  <br>
  Il y a volontairement une symétrie au niveau des lignes des scripts d’installation et de désinstallation, pour en faciliter la relecture.
- Il est recommandé de conserver le codage des scripts en ANSI (UTF-8 avec BOM cause parfois des problèmes). L'édition avec Notepad++ est recommandée.
- Certains scripts utilisent 7-ZIP. Placez une copie des fichiers `7z.exe` et `7z.dll` dans le même répertoire (ou adaptez les scripts pour utiliser une version préalablement installée).
- Certains logiciels peuvent nécessiter des opérations lors des principaux événements système (démarrage, arrêt, ouverture de session, fermeture de session).
Pour ce faire, des scripts sont exécutés par GPO domaine à l’aide des packages `LocalGPO-Framework` et  `LocalGPO-Scripts`.<br>
Ainsi, lorsque c’est requis, les applications ou packages ajoutent des scripts dans le dossier `%WINDIR%\System32\GroupPolicy`.


# Avertissements
- Le contenu de ce dépôt est fourni "tel quel", à des fins strictement éducatives.
- Certains contenus de ce dépôt peuvent avoir été inspirés ou recopiés d'autres sites, tels que [Stack Overflow](https://stackoverflow.com/).<br> Bien que nous nous efforcions généralement d'inclure des commentaires indiquant les sources, il peut y avoir involontairement des omissions. Nous remercions tous les contributeurs originaux pour leur travail.