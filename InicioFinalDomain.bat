@echo off

net use * /del /yes

If %username%==ARPESTEFANIA Goto RESCONTABILIDAD
If %username%==VIGQUERALT Goto CONTABILIDAD
If %username%==AYFJOAN Goto CONTABILIDAD
If %username%==BATJOAN Goto CONTABILIDAD
If %username%==BASMARC Goto CONTABILIDAD
If %username%==ANVJOSEP Goto CONTABILIDAD
If %username%==PAAESTHER Goto CONTABILIDAD
If %username%==VAGLAURA Goto CONTABILIDAD
If %username%==RAGRAQUEL Goto CONTABILIDAD
If %username%==ANCJOAN Goto CONTABILIDAD
If %username%==BACMARIA ISABEL Goto CONTABILIDAD
If %username%==BECADRIA Goto CONTABILIDAD
If %username%==LODGERARD Goto RESLOGISTICA
If %username%==ARMELIOT Goto LOGISTICA
If %username%==RAGJORDI Goto LOGISTICA
If %username%==ZAFLLUIS Goto LOGISTICA
If %username%==BICLAURA Goto LOGISTICA
If %username%==BIFJORDI Goto LOGISTICA
If %username%==ZAFDOUNYA Goto LOGISTICA
If %username%==ALIJULIO Goto LOGISTICA
If %username%==BATANDREU Goto LOGISTICA
If %username%==MOGRAMON Goto LOGISTICA
If %username%==BLFDAVID-JESE Goto LOGISTICA
If %username%==ALFARAN Goto LOGISTICA
If %username%==GAAGEMMA Goto LOGISTICA
If %username%==LIFIVAN Goto LOGISTICA
If %username%==BIPDAVID Goto LOGISTICA
If %username%==BEJXAVIER Goto RESPERSONAL
If %username%==PAFMARIO Goto PERSONAL
If %username%==AYTJESUS Goto PERSONAL
If %username%==LIFGEMMA Goto PERSONAL
If %username%==RAGSILVIA Goto PERSONAL
If %username%==ARPALBERT Goto PERSONAL
If %username%==MOGMARIA Goto PERSONAL
If %username%==GAGBERTA Goto PERSONAL
If %username%==LOGBERTA Goto PERSONAL
If %username%==SAGMIREIA Goto PERSONAL
If %username%==ALSUGEMMA Goto PERSONAL
If %username%==ALBMARIA ISABEL Goto PERSONAL
If %username%==MAFTONI Goto PERSONAL
If %username%==ALCALEJANDRO Goto PERSONAL
If %username%==ASVJOAN MARTI Goto PERSONAL
If %username%==BIPINGRID Goto DIRECTOR
If %username%==ALCOLIVER Goto JEFEPROYECTO-1
If %username%==ALASANDRA Goto JEFEPROYECTO-2
If %username%==BESJORDI Goto JEFEPROYECTO-3
If %username%==BAGMARC Goto JEFEPROYECTO-4
If %username%==AGRJORDINA Goto PROYECTO-1
If %username%==BASMARIA JOSE Goto PROYECTO-1
If %username%==AVMRAQUEL Goto PROYECTO-1
If %username%==PAFENRIC Goto PROYECTO-1
If %username%==AGRMARTA Goto PROYECTO-1
If %username%==AYACARLA Goto PROYECTO-1
If %username%==ALTMARIA NOELIA Goto PROYECTO-1
If %username%==ALGCRISTINA Goto PROYECTO-1
If %username%==ACTCARLOS Goto PROYECTO-1
If %username%==ALTDAVID Goto PROYECTO-1
If %username%==BACCRISTIAN Goto PROYECTO-1
If %username%==BEFJULIO ALBERTO Goto PROYECTO-1
If %username%==TOGSERGI Goto PROYECTO-1
If %username%==ALRALEIX Goto PROYECTO-1
If %username%==ARPVERONICA Goto PROYECTO-1
If %username%==ALRMARIONA Goto PROYECTO-1
If %username%==BARMARC Goto PROYECTO-1
If %username%==POGGEMMA Goto PROYECTO-2
If %username%==AGBRICARD Goto PROYECTO-2
If %username%==ROGJUAN Goto PROYECTO-2
If %username%==AGSMARTA Goto PROYECTO-2
If %username%==BATNATALIA Goto PROYECTO-2
If %username%==BALMARTA Goto PROYECTO-2
If %username%==AGTLAURA Goto PROYECTO-2
If %username%==ALPJOAN Goto PROYECTO-2
If %username%==VAGALEXIA Goto PROYECTO-2
If %username%==MOGFERRAN Goto PROYECTO-2
If %username%==ARHCRISTINA Goto PROYECTO-2
If %username%==BAPJOSE ANTONIO Goto PROYECTO-2
If %username%==SUGJORDI Goto PROYECTO-2
If %username%==ARMBEGONYA Goto PROYECTO-2
If %username%==ALFINGRID Goto PROYECTO-2
If %username%==LUGMIQUEL Goto PROYECTO-2
If %username%==RIGAGUSTI Goto PROYECTO-2
If %username%==SAFANTONI Goto PROYECTO-3
If %username%==HEGJOAN Goto PROYECTO-3
If %username%==ARMMONICA Goto PROYECTO-3
If %username%==AGMGERARD Goto PROYECTO-3
If %username%==ALSGEMMA Goto PROYECTO-3
If %username%==TOGMARIA Goto PROYECTO-3
If %username%==ARPORIOL Goto PROYECTO-3
If %username%==ALAVIRGINIA Goto PROYECTO-3
If %username%==BATDAMIA Goto PROYECTO-3
If %username%==GAGVALENTI Goto PROYECTO-3
If %username%==ARGAINA Goto PROYECTO-3
If %username%==ALRDAVID Goto PROYECTO-3
If %username%==CAGGERARD Goto PROYECTO-3
If %username%==ALMMARTA Goto PROYECTO-3
If %username%==AGPMIREIA Goto PROYECTO-3
If %username%==ALIELOI Goto PROYECTO-3
If %username%==RIFANNA Goto PROYECTO-3
If %username%==AVMALBA Goto PROYECTO-4
If %username%==GRASANDRA Goto PROYECTO-4
If %username%==FEGERIC Goto PROYECTO-4
If %username%==AMMLLUIS Goto PROYECTO-4
If %username%==ABTCRISTIAN Goto PROYECTO-4
If %username%==CAGGUILLEM Goto PROYECTO-4
If %username%==HIADIMAS Goto PROYECTO-4
If %username%==BAFANA INES Goto PROYECTO-4
If %username%==ABMIVET Goto PROYECTO-4
If %username%==ARSJULIA Goto PROYECTO-4
If %username%==ALMDANIEL Goto PROYECTO-4
If %username%==GAGABEL Goto PROYECTO-4
If %username%==ALPIRENE Goto PROYECTO-4
If %username%==CAAADRIA Goto PROYECTO-4
If %username%==MOGJAIRO Goto PROYECTO-4
If %username%==BAMCRISTINA Goto PROYECTO-4
If %username%==ARGDAVID Goto SUBDIRECCION
If %username%==RUAADRIA Goto DIRECCION
If %username%==ALDLUCIA Goto RESCALIDAD
If %username%==BOGCARLA Goto CALIDAD
If %username%==BAMADRIA Goto CALIDAD
If %username%==AGMMARTA Goto CALIDAD
If %username%==BAHMARC Goto CALIDAD
If %username%==BAHALEX Goto SISTEMAS


:SISTEMAS
net use m: \\PAURAMOS\FinalDomain
exit
:CONTABILIDAD
net use z: \\Pauramos\contabilidad
net use y: \\PAURAMOS\Publica
net use x: \\PAURAMOS\Carpeta_%username%
exit
:RESCONTABILIDAD
net use z: \\Pauramos\contabilidad
net use y: \\PAURAMOS\Publica
net use x: \\PAURAMOS\Carpeta_%username%
net use l: \\PAURAMOS\Responsables
exit
:LOGISTICA
net use w: \\Pauramos\logistica
net use y: \\PAURAMOS\Publica
net use x: \\PAURAMOS\Carpeta_%username%
exit
:RESLOGISTICA
net use w: \\Pauramos\logistica
net use y: \\PAURAMOS\Publica
net use x: \\PAURAMOS\Carpeta_%username%
net use l: \\PAURAMOS\Responsables
exit
:PERSONAL
net use v: \\Pauramos\personal
net use x: \\PAURAMOS\Publica
net use w: \\PAURAMOS\Carpeta_%username%
exit
:RESPERSONAL
net use v: \\Pauramos\personal
net use x: \\PAURAMOS\Publica
net use w: \\PAURAMOS\Carpeta_%username%
net use l: \\PAURAMOS\Responsables
exit
:DIRECCION
net use u: \\Pauramos\direccion
net use x: \\PAURAMOS\Publica
net use w: \\PAURAMOS\Carpeta_%username%
net use l: \\PAURAMOS\Responsables
exit
:SUBDIRECCION
net use t: \\Pauramos\subdireccion
net use x: \\PAURAMOS\Publica
net use w: \\PAURAMOS\Carpeta_%username%
net use l: \\PAURAMOS\Responsables
exit
:DIRECTOR
net use s: \\Pauramos\director
net use x: \\PAURAMOS\Publica
net use w: \\PAURAMOS\Carpeta_%username%
exit
:PROYECTO-1
net use r: \\Pauramos\proyecto-1
net use x: \\PAURAMOS\Publica
net use w: \\PAURAMOS\Carpeta_%username%
exit
:JEFEPROYECTO-1
net use r: \\Pauramos\proyecto-1
net use x: \\PAURAMOS\Publica
net use w: \\PAURAMOS\Carpeta_%username%
net use l: \\PAURAMOS\Responsables
exit
:PROYECTO-2
net use q: \\Pauramos\proyecto-2
net use x: \\PAURAMOS\Publica
net use w: \\PAURAMOS\Carpeta_%username%
exit
:JEFEPROYECTO-2
net use r: \\Pauramos\proyecto-2
net use x: \\PAURAMOS\Publica
net use w: \\PAURAMOS\Carpeta_%username%
net use l: \\PAURAMOS\Responsables
exit
:PROYECTO-3
net use p: \\Pauramos\proyecto-3
net use x: \\PAURAMOS\Publica
net use w: \\PAURAMOS\Carpeta_%username%
exit
:JEFEPROYECTO-3
net use r: \\Pauramos\proyecto-3
net use x: \\PAURAMOS\Publica
net use w: \\PAURAMOS\Carpeta_%username%
net use l: \\PAURAMOS\Responsables
exit
:PROYECTO-4
net use o: \\Pauramos\proyecto-4
net use x: \\PAURAMOS\Publica
net use w: \\PAURAMOS\Carpeta_%username%
exit
:JEFEPROYECTO-4
net use r: \\Pauramos\proyecto-4
net use x: \\PAURAMOS\Publica
net use w: \\PAURAMOS\Carpeta_%username%
net use l: \\PAURAMOS\Responsables
exit
:CALIDAD
net use n: \\Pauramos\calidad
net use x: \\PAURAMOS\Publica
net use w: \\PAURAMOS\Carpeta_%username%
exit
:RESCALIDAD
net use n: \\Pauramos\calidad
net use x: \\PAURAMOS\Publica
net use w: \\PAURAMOS\Carpeta_%username%
net use l: \\PAURAMOS\Responsables
exit