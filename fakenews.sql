-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2024. Nov 29. 23:43
-- Kiszolgáló verziója: 10.4.32-MariaDB
-- PHP verzió: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `fakenews`
--
CREATE DATABASE IF NOT EXISTS `fakenews` DEFAULT CHARACTER SET utf16 COLLATE utf16_bin;
USE `fakenews`;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `comment`
--

CREATE TABLE `comment` (
  `id` bigint(20) NOT NULL,
  `release_date` datetime DEFAULT NULL,
  `text` text DEFAULT NULL,
  `news_id` bigint(20) DEFAULT NULL,
  `writer_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_bin;

--
-- A tábla adatainak kiíratása `comment`
--

INSERT INTO `comment` (`id`, `release_date`, `text`, `news_id`, `writer_id`) VALUES
(4, '2024-11-29 17:48:18', 'Nagyon hasznos cikk', 3, 1);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `hibernate_sequence`
--

CREATE TABLE `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_bin;

--
-- A tábla adatainak kiíratása `hibernate_sequence`
--

INSERT INTO `hibernate_sequence` (`next_val`) VALUES
(37);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `news`
--

CREATE TABLE `news` (
  `id` bigint(20) NOT NULL,
  `img_path` text DEFAULT NULL,
  `priority` bit(1) DEFAULT NULL,
  `releasedate` datetime DEFAULT NULL,
  `subtitle` varchar(255) DEFAULT NULL,
  `text` text DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `users_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_bin;

--
-- A tábla adatainak kiíratása `news`
--

INSERT INTO `news` (`id`, `img_path`, `priority`, `releasedate`, `subtitle`, `text`, `title`, `users_id`) VALUES
(3, 'https://assets.4cdn.hu/kraken/87r3wmDQkizf1Ieqvs-md.jpeg', b'0', '2024-11-29 17:47:49', 'Alekszej Navalnij, Putyin legismertebb politikai ellenfele mindent', 'A zavarba ejtően ismerősen hangzó bejegyzést 2021. januárjában írta le börtönnaplójában Alekszej Navalnij. A hazájában és nemzetközileg is legismertebb orosz ellenzéki politikus nem sokkal korábban került börtönbe, miután az ellene elkövetett, mérgezéses merényletkísérlet utáni lábadozást követően úgy döntött, visszatér Oroszországba.\n\nNavalnij három évvel később, idén februárban halt meg egy szibériai büntetőtelepen, a hivatalos magyarázat szerint rosszullét következtében, de ezt sem családja, sem munkatársa, sőt, úgy általában senki nem hitte el. Az elmúlt évtizedben messze ő tett a legtöbbet azért, hogy megmutassa, Vlagyimir Putyin és a Kreml-közeli hatalmi elit hogyan halmozott fel döbbenetes, ép ésszel felfoghatatlan mennyiségű vagyont, miközben a Navalnij által vezetett politikai mozgalom egy rakás kellemetlenséget is tudott okozni a hivatalos orosz ellenzéket már rég elfoglaló rezsim számára.', 'Nem bírta tétlenül nézni, ahogy ellopják a hazája jövőjét, végül az életével fizetett érte', 1),
(5, 'https://s.24.hu/app/uploads/2024/11/central-0596336930-e1732878433316-1140x641.jpg', b'0', '2024-11-29 17:55:12', 'A Nemzeti Választási Bizottság korábban már hitelesítette a Kereskedelmi Alkalmazottak ', 'A Nemzeti Választási Bizottság korábban már hitelesítette a Kereskedelmi Alkalmazottak Szakszervezetének népszavazási kezdeményezését, miszerint december 24-e legyen munkaszüneti nap. Egy magánszemély viszont az utolsó pillanatban megfellebbezte az NVB döntését – írják a Jobbik Magyarországért Mozgalom Facebook oldalán. A párt szerint ez „a Fidesz-KDNP kormány kommunikációjából következtetve várható volt, hogy a kezdeményezést meg fogják támadni a törvényes határidőn belül a Kúrián”.\n\nGulyás Gergely a kormányinfón arról beszélt, hogy meglepődött a december 24-i munkaszüneti napról szóló népszavazási kérdés hitelesítéséről. A miniszterelnök hozzátette: természetesen nem arról van szó, hogy a kormány ne örülne a több munkaszüneti napnak. Ennek jegyében bővítették is a munkaszüneti napok számát a Fidesz-kormány alatt, bevezetve a halottak napját és a nagypénteket is. Ugyanakkor fontos látni, hogy minden munkaszüneti nap csökkenti a gazdasági teljesítményt. Ha már a versenyképességről beszélünk: Európa valóban el van maradva az Egyesült Államoktól és Ázsiától a munkaórák számát tekintve – magyarázta.\n\nA Jobbik országgyűlési képviselőjének, Balassa Péternek a javaslatát a jövő héten tárgyalja a Vállalkozásfejlesztési Bizottság, azaz lehetőség lenne arra, hogy népszavazás nélkül törvénybe iktassák, hogy szentestén ne kelljen dolgozni.\n\n', 'Megtámadták a Kúrián a december 24-i munkaszüneti napról szóló népszavazást', 1),
(6, 'https://s.24.hu/app/uploads/2024/11/gettyimages-142741736-e1731939743123-1140x640.jpg', b'0', '2024-11-29 18:03:46', 'Nagy Márton nemzetgazdasági miniszter korábban rendeletben pontosította, hogy mikor lesznek hosszú hétvégék jövőre, illetve az ünnepnapokat mikor kell szombaton ledolgozni.', 'Hosszú hétvégék 2025-ben\n\n2025-ben 5 hosszú hétvégére készülhetünk, 2024-gyel ellentétben jövőre nem lesz hatnapos hosszú hétvége.\n\nNégynapos hosszú hétvége 2025-ben eggyel több lesz, mint 2024-ben; háromnapos hosszú hétvége 2025-ben viszont hárommal is kevesebb lesz, mint 2024-ben volt – olvasható a portál összeállításában.\n\n2024-ben 4 háromnapos hosszú hétvége, illetve 2 négynapos hosszú hétvége volt, 2025-ben egy 3 napos hosszú hétvége lesz, három 4 napos hosszú hétvége mellett. Különbséget jelent még, hogy karácsonykor a 2024-es 6 napos hosszú hétvége után 2025-ben egy 5 napos hosszú hétvége jön.\n\nHáromnapos hosszú hétvégék 2025-ben\n\n2025. június 7-8-9. – szombat, vasárnap, hétfő\nNégynapos hosszú hétvégék 2025-ben\n\n2025. április 18-19-20-21. – péntek, szombat, vasárnap, hétfő\n2025. május 1-2-3-4. – csütörtök, péntek, szombat, vasárnap\n2025. október 23-24-25-26. – csütörtök, péntek, szombat, vasárnap\nÖtnapos hosszú hétvége 2025-ben\n\n2025. december 24-25-26-27-28. – szerda, csütörtök, péntek, szombat, vasárnap\nNemzeti ünnepek 2025-ben\n\nA kifejezetten magyar ünnepek közül 2025-ben március 15-e szombatra, október 23-a pedig csütörtökre esik, 2025-ben az államalapítás ünnepe, tehát augusztus 20. szerdára esik.\n\nHúsvét 2025-ben\n\nNagypéntek 2025-ben április 18-ra esik, így április 18-29-20-21. napjai alkotják majd a húsvéti, négynapos hosszú hétvégét.\n\n2025 pünkösd hétvége\n\nPünkösd hétvége 2025-ben június elejére, pünkösdhétfő június 9-re esik, így június 7-8-9. napjai alkotják majd a háromnapos hosszú hétvégét.\n\nMindenszentek 2025-ben\n\n2025-ben november 1-je szombatra esik, így akkor nem lesz háromnapos hosszú hétvége.\n\nKarácsony 2025-ben\n\n2025 karácsonya kettő munkanapra eső munkaszüneti napot jelent majd, mivel december 24. szerdára, december 25. csütörtökre esik. Ez azt jelenti, hogy december 24-25-26-27-28. alkotja majd a maratoni, ötnapos hosszú hétvégét.', 'Öt hosszú hétvége jön, íme a 2025-ös munkaszüneti és ünnepnapok listája', 2),
(7, 'https://s.24.hu/app/uploads/2024/11/dvast20241119001-1-e1732884328818-1140x641.jpg', b'1', '2024-11-29 19:33:07', 'Fülöp Attila a Belügyminisztérium gondoskodáspolitikáért felelős államtitkárának ', 'Fülöp Attila a Belügyminisztérium gondoskodáspolitikáért felelős államtitkárának „volt szerencséje egy kicsit beletekinteni” Magyar Péter bicskei látogatásába. Fülöp Attila szerint „megengedhetetlen ez a fajta politikai show-műsor, amihez napok óta díszletnek használja a gyermekvédelmet és a benne dolgozókat az ellenzéki politikus”.\n\nHa bármelyik közszereplőnek információra van szüksége, azt meg fogják adni, szóban és írásban is megtették eddig is – mondta, hozzátéve: azt nem hagyhatják, hogy a gyermekvédelmet díszletként használja valaki saját politikai céljára.\n\nEz példa nélküli a magyar gyermekvédelem történetében\n\n– jelentette ki Fülöp Attila, aki szerint ennek révén megszaporodnak a gyermekvédelemben dolgozókat érintő vádaskodások, alaptalan hozzászólások.\n\n„Ebben a környezetben az a fontos, hogy béke legyen, a fejlődésnek mindig van helye. Szeretnének a továbbiakban még több erőforrást biztosítani a gyermekvédelem részére” – közölte.\n\nMagyar Péter szerdán látogatott el a bicskei gyermekotthonba, de az épületbe már nem jutott be. Magyart a kapunál Csizi Péter szociális ügyekért felelős helyettes államtitkár és Cséplőné Gönczi Veronika, a Szociális és Gyermekvédelmi Főigazgatóság vezetője fogadta.', '„Ez példa nélküli a magyar gyermekvédelem történetében” – kiakadt a gondoskodáspolitikáért felelős államtitkár Magyar bicskei látogatásán', 2),
(9, 'https://s.24.hu/app/uploads/2024/11/central-0917609088-e1732870326246-1140x643.jpg', b'1', '2024-11-29 19:47:34', 'Magyar Péter pénteken elment a bicskei gyermekotthonba,', 'Magyar Péter pénteken elment a bicskei gyermekotthonba, de a kapunál nem jutott tovább. A helyszínen a Tisza Párt elnökét Csizi Péter szociális ügyekért felelős helyettes államtitkár, volt fideszes képviselő és Cséplőné Gönczi Veronika, a Szociális és Gyermekvédelmi Főigazgatóság vezetője fogadta.  Magyar élőben közvetítette az eseményt, amiből leginkább annyi volt követhető, hogy Magyar és Csizi egyszerre beszél és vitatkozik. Magyar a gyermekvédelemmel kapcsolatos adatokat szeretett volna kihúzni az államtitkárból, miközben Csizi politikai show-t emlegetett, Magyart arrogánsnak nevezte, és arra kérte, hogy írásban kérje ki az adatokat.  Nincs eltussolás a gyermekvédelmi rendszerben  – jelentette ki Csizi. Magyarnak annyit sikerült kicsikarnia az államtitkárból, hogy a gyermekvédelemben az átlagbér 460 ezer forint.  Folyamatban van az átvilágítás a gyermekvédelemben, erről már Cséplőné Gönczi Veronika beszélt.  Magyar Péter elmondta, hogy 15 otthonból kaptak jelzéseket a többi között bántalmazásokról is, Csizi pedig azt ismételte el, hogy mindent kivizsgálnak, és nem tussolnak el semmit. Magyar Péter arról is érdeklődött, hogy van-e olyan otthon, ami szabályosan működik. Természetesen, nagyon sok otthon szabályosan működik – válaszolta erre Csizi.  Az államtitkár a sajtó kérdéseire nem volt hajlandó válaszolni, inkább bement a gyermekotthonba.  Magyar Péter korábban több másik gyermekotthonba is megpróbált bejutni. Miskolcon képeket közölt az otthon épületének állapotáról, Tiszadobon hasonlóan, Nyírszőlősön viszont már nem engedték be az otthonba.  Magyar politikai pályafutása tulajdonképpen a bicskei gyermekotthonból indult. Novák Katalin tavaly adott kegyelmet az otthon egyik volt vezetőjének, akit azért ítéltek el, mert segített a gyermekek zaklatását eltussolni a másik elítélt vezetőnek. Az ügy miatt a kegyelem ellenjegyzője, Magyar volt felesége, Varga Judit volt igazságügyi miniszter visszavonult a politikától.', 'Magyar Pétert nem engedték be a bicskei gyermekotthonba', 8),
(10, 'https://cdn.nemzetisport.hu/2024/11/XI_Li5xcHVxh41AV-PAdsrHPE37TfV2WP7Yt2YKNU5M/fill/1347/758/no/1/aHR0cHM6Ly9jbXNjZG4uYXBwLmNvbnRlbnQucHJpdmF0ZS9jb250ZW50LzAzZDBlMTc1OWFlMzRjZmE5Y2JmNWU0ZGYwN2I4ZWZk.webp', b'0', '2024-11-29 19:55:40', 'Cristiano Ronaldo tizenegyesből és akcióból is betalált, az Al-Naszr 2–0-ra megverte a Damakot a szaúdi labdarúgó-bajnokság 14. fordulójában.', 'A pénteki korai meccsen az Al-Kvadiszija 1–0-ra legyőzte az Al-Haledzset, így az Al-Naszr is győzelmi kényszerben volt, ha vissza akarta szerezni a harmadik helyet.\n\nEz végül sikerült is Cristiano Ronaldo duplájának köszönhetően: a portugál klasszis a 17. percben büntetőből volt eredményes, majd a 80. percben Navaf Bu Vasl passza után hat méterről balról lőtt a kapuba, végleg eldöntve a meccset. A Damak ekkor már tíz emberrel játszott, Abdelkader Bedrant az 56. percben kiállította a francia Benoit Bastien játékvezető.\n\nCristiano Ronaldo ezzel a duplával már 915 gólnál jár pályafutása során.\n\nFÉRFI LABDARÚGÁS, SZAÚD-ARÁBIAI BAJNOKSÁG\n14. FORDULÓ\nAl-Naszr–Damak 2–0', 'Cristiano Ronaldo duplázott, nyert az Al-Naszr', 8),
(11, 'https://cdn.nemzetisport.hu/2024/11/hu3Sm1heT_zcx7sdPpE62ykxGd0x-gY3qy09fEGinsM/fill/1347/758/no/1/aHR0cHM6Ly9jbXNjZG4uYXBwLmNvbnRlbnQucHJpdmF0ZS9jb250ZW50LzQyOTA2YWY5OTI3MDQ1NzZiNTUyOWZlZmRlNzUyZjg4.webp', b'1', '2024-11-29 19:57:17', '   0 Tetszik Vágólapra másolva! Címkék sífutás téli sport sífutó-vk Kónya Ádám a 84., míg Büki Ádám a 87. helyen zárt pénteken 10 kilométeren a sífutók világkupa-sorozatának első versenyén.', 'A vk-sorozat nyitóállomásának a finnországi Ruka ad otthont, ahol pénteken a férfiaknak és a nőknek is 10 kilométeres klasszikus stílusú viadalt rendeztek. A nemzetközi szövetség honlapja szerint a férfiaknál 89-en rajtoltak el és az első helyet a hazaiak háromszoros olimpiai bajnoka, Iivo Niskanen szerezte meg.\n\n A magyarok közül Kónya a győztes idejétől 4:26.6 perccel elmaradva ért célba, míg Büki 6:16.9 perccel maradt el Niskanen eredményétől. \n\nRukában szombaton sprintversenyeket rendeznek, vasárnap pedig 20 kilométeres tömegrajtos számra kerül sor, melyen a férfiaknak és a nőknek is szabadstílusban kell majd síelniük.', 'A háromszoros olimpiai bajnok Niskanen győzött, a magyarok is célba értek az első sífutó vk-versenyen', 8),
(12, 'https://cdn.nemzetisport.hu/2024/11/CqQBRiEVbnrXBoWXYs17tT9iZA7SS-xqmg-VlIypXZg/fill/1347/758/no/1/aHR0cHM6Ly9jbXNjZG4uYXBwLmNvbnRlbnQucHJpdmF0ZS9jb250ZW50LzI3Y2Q4OTc5ZTBjMTRmMDZiYTU3M2ExZDA1ODJlMjA5.webp', b'1', '2024-11-29 19:59:55', 'A hónap utánpótlásedzőjének választott sportlövőtréner, Jákó Csaba igyekszik igazi közösséget építeni versenyzőiből.', 'Mint arról beszámoltunk, az alapítók döntése értelmében Jákó Csaba sportlövőtréneré lett A hónap utánpótlásedzője októberi díja. A zsombói Cél-Tudat SE-t „családi vállalkozásként” felépítő és vezető szakember az után részesült az elismerésben, hogy 20 éves lánya, egyben legsikeresebb tanítványa, Jákó Miriam a Peru fővárosában, Limában rendezett junior sportlövő-világbajnokságon az 50 méteres pisztolyos versenyszámban fantasztikus teljesítményt nyújtott: 546 körös korosztályos világcsúccsal nyert aranyérmert. Jákó Csabával a Magyar Sport Házában rendezett díjátadót követően beszélgettünk.\n\n– 2022 márciusában már elnyerte A hónap utánpótlásedzője díjat. Hogyan fogadta az újbóli elismerést?\n\n– Nem számítottam rá, de természetesen nagyon jólesik. Amikor az ember munkával van elfoglalva, nem gondolkozik azon, hogy milyen elismerésekre számíthat. Örülök, hogy az eredményeinket illetően mondhatom, a két és fél évvel ezelőtti díj óta még rátettünk egy lapáttal. Felejthetetlen élmény marad az akkori díjátadó is, hiszen azt a kitüntetést még példaképemtől, Hammerl Lászlótól vehettem át. Hiszem, hogy fentről most is büszkén tekint le ránk. Rengeteget köszönhetek neki, és azt a munkát igyekszem továbbvinni, mint amit évtizedeken keresztül ő is végzett. Puskás versenyzőként három olimpiai éremmel, közte egy arannyal gazdagította az országot, majd pályafutása után is elképesztő mértékben segítette a sportágat. Bár versenyzőként én nem jártam hozzá hasonló magaslatokban, edzőként arra törekszem, hogy a tanítványaim eljussanak arra a szintre.', 'Jákó Csaba: Az összes tanítványomra a gyerekemként tekintek', 8),
(13, 'https://cdn.nemzetisport.hu/2024/11/au4uBBdsJDOZojYxgRcAosBHpAUJ3kmJ8WXdMkT-PXk/fill/1347/758/no/1/aHR0cHM6Ly9jbXNjZG4uYXBwLmNvbnRlbnQucHJpdmF0ZS9jb250ZW50L2ZiN2ViOThjOTYyNTQ4YzNiM2RjMTU0ZjU5NTRkOTIw.webp', b'0', '2024-11-29 20:02:07', ' játékosok kulcsmeccsként készülnek ellenünk', 'Szombaton jön a Svédország elleni telt házas csoportrangadó női kézilabda-válogatottunk számára a részben hazai rendezésű Európa-bajnokságon. A mindkét csapat számára komoly téttel bíró mérkőzés előtt a skandinávok NB I-es légiósaival beszéltünk a várakozásaikról, miközben Tomas Axnér azzal próbálja levenni a terhet az együtteséről, hogy a mieinkre nehezedő nyomást hangsúlyozza.\n \n\nA legutóbbi hét évben két felkészülési mérkőzés mellett két olimpián, két világbajnokságon, egy Eb-n és az idei, sokáig emlékezetes debreceni olimpiai selejtezőtornán is megmérkőzött a magyar és a svéd együttes, öt svéd siker mellett három magyar győzelem született. \n\nAz utóbbi világversenyeken rendre az élmezőnyben záró skandinávok keretében három NB I-es légiós van: a győri Linn Blohm, valamint az egyaránt debreceni Jessica Ryde és Kristin Thorleifsdóttir. Mellettük fontos láncszem még a 2017–2018-as idényben Érden légióskodó Jamina Roberts, Johanna Bundsen, Jenny Carlson vagy Nathalie Hagman is.\n\nOtthon érezheti magát tehát Debrecenben Kristin Thorleifsdóttir, a svédek balátlövője, aki a 2024–2025-ös idény előtt csatlakozott a DVSC Schaefflerhez. \n\n„Kellemes érzések fogtak el, amikor a csapattal együtt megérkeztünk Debrecenbe – mintha hazajöttem volna. A nyáron nemcsak új klubhoz kerültem, hanem új országba és kultúrába is érkeztem, különösen a magyar nyelvvel gyűlt meg a bajom. A lányok és a DVSC körül dolgozók azonban az első perctől kezdve mindenben segítettek nekem, úgyhogy megkönnyítették a beilleszkedésemet. Elmondhatom, hogy igazán jól érzem magam Debrecenben.”', 'Női kézilabda Eb: az NB I-ben szereplő svéd játékosok kulcsmeccsként készülnek ellenünk', 8),
(14, 'https://cdn.nemzetisport.hu/2024/11/Ebk_NDDFy8itBU-M5cU3mmAumhDUH9EOMeDEHvdzqww/fill/1347/758/no/1/aHR0cHM6Ly9jbXNjZG4uYXBwLmNvbnRlbnQucHJpdmF0ZS9jb250ZW50L2QzZGIxY2YwNmY5MDQwYjQ5YzM3MGNkOGE3ZTEzM2Qz.webp', b'0', '2024-11-29 20:09:10', 'Azi vagy Desh', 'Közülük került-e a ki a befutó vagy egy harmadik előadó női kézilabda-válogatottunk irányítójának a kedvenc magyar előadója? Videónkból kiderül!', 'Azahriah vagy Desh? – Simon Petrának nehéz volt a választás', 8),
(15, 'https://kultura.hu/uploads/media/default/0003/17/thumb_216555_default_medium.jpg', b'0', '2024-11-29 20:10:56', 'Mostantól mindenki megnézheti, hogyan tért vissza az AWS', 'Idén tavasszal jelent meg az AWS zenekar Innen szép nyerni című visszatérő nagylemeze, amelyet május 25-én a közönség élőben is meghallgathatott a Budapest Parkban. A csapat rajongói által régóta várt eseményt a Hajógyár stábja is megörökítette, két anyagot, egy százperces koncertfilmet és egy, a színfalak mögötti eseményeket rögzítő rövidfilmet is készítve a buliról. A Sófalvi-Kiss Csaba rendező, Szepesi Zsolt kreatív producer és Talum Fruzsina szerkesztő nevével fémjelzett Innen szép nyerni  című film – amely a Carson Coma, a Tankcsapda és Azahriah egy-egy nagy sikerű fellépéséről készült alkotás után a Hajógyár negyedik koncertfilmje – a forgatócsoport és a zenekar együttműködésének gyümölcse. Az alkotók szerették volna elkerülni a műfajban megszokott kliséket, nem akarták csupán közvetíteni a koncertet, hanem a csapat visszatérésének történetét is szerették volna vele együtt bemutatni, és ezzel üzenni mindenkinek: az újrakezdés igenis lehetséges.\n\n', 'Idén tavasszal jelent meg az AWS zenekar', 8),
(16, 'https://cdn.nemzetisport.hu/2024/11/npTs1HrMuxqo7f1YOSJUp602o9uvDxUuKA86w6NCBa0/fill/1347/758/no/1/aHR0cHM6Ly9jbXNjZG4uYXBwLmNvbnRlbnQucHJpdmF0ZS9jb250ZW50L2EyMWMyM2IwMzNjZTQyNWI4MTYwMjdmODE1ZDRiM2U5.webp', b'0', '2024-11-29 20:15:34', ' Az észak-amerikai profi amerikaifutball-bajnokságban (NFL) szereplő Chicago Bears saját hivatalos oldalain jelentette be Matt Eberflus vezetőedző menesztését.', 'A szakember irányítása alatt négyszer nyert a Chicago, nyolcszor kikapott, és az utolsó hat meccsén kivétel nélkül vereséget szenvedett.\n\nEberflus 2022-ben vette át a Chicagót, korábban három évig az Indianapolis Colts védelmi koordinátoraként dolgozott.\n\nAz 54 éves szakvezető helyét ideiglenes jelleggel Thomas Brown veszi át, aki a mostani idényben lett a csapat támadójáték-koordinátora.', '  0 Tetszik Vágólapra másolva! Címkék NFL Matt Eberflus Chicago Bears', 8),
(17, 'https://www.hwsw.hu/kepek/hirek/2024/11/raspberry-pi-cm5-launched.jpg?1732796686404', b'0', '2024-11-29 20:24:13', 'Négy évvel az előd bemutatkozása után itt az újabb ipari környezetbe szánt, kompaktabb lapka.', 'Az ötödik generációs főterméknek megfelelően található rajta a szokásos 30 tűs GPIO csatoló, és támogatott a PCI Express perifériák közvetlen csatlakoztatása. A fedélzeten emellett Bluetooth 5.0-nak, és 802.11ac szabványokat támogató Wi-Finek is jutott hely.\n\nA lapka 2/4/8 GB SDRAM memóriával, valamint 16/32/64 GB MLC eMMC integrált háttértárral választható, de jövőre elérhetővé válik a 16 GB SDRAM memóriás változat is az ígéretek szerint. A hardver indulóára ezúttal kicsit magasabb mint az elődők esetében volt, nettó 45 dollár, ami Európában 55 euró körül alakul majd.\n\nSok vállalat használ Raspberry Pi számítási modulokat kereskedelmi termékekben, 2023-ban a hobbifejlesztők és oktatási szegmens az eladott lapkák 28%-át, míg az ipari és beágyazott szegmens szereplői az eladások 72%-át tették ki.\n\n Facebook\nHibát találtam\n', 'Bemutatkozott a Raspberry Pi Compute Module 5', 8),
(18, 'https://raketa.hu/uploads/2024/11/GettyImages-1476359993-768x473.jpg', b'0', '2024-11-29 20:30:43', 'Múlt héten derült fény arra, hogy megsérült két,', 'A vezetékek Finnország és Németország, illetve Litvánia és a svéd Gotland sziget között futnak, az előbbi több mint ezer kilométer, az utóbbi valamivel több, mint kétszáz kilométer hosszú. Metszik egymást ugyan, de a sérülés nem azon a ponton keletkezett. A finn-német kapcsolat kiesése nem jelentett fennakadást az internetforgalomban, Litvániában szakértők szerint a lakosság szintén nem érezhette, hogy a kapacitás az ötödével esett vissza.\n\nAmint az köztudott, az internet felépítése szándékosan decentralizált, így ha egy csomópont vagy út kiesik, a forgalmat automatikusan át lehet terelni más irányokba, ám az infrastruktúra javítása rengeteg időbe és pénzbe kerül. A BBC a német védelmi minisztert, Boris Pistoriust idézte múlt kedden, aki szerint\n\n\"senki sem gondolja, hogy ezeket a vezetékeket véletlenül vágták át\".\n\nSvéd miniszterek azt nyilatkozták, hogy mindezt az Oroszország jelentette fenyegetettség tükrében kell értelmezni; ezzel egy időben rendőrségi vizsgálatok kezdődtek több érintett országban is. A The Verge egy hét elteltével már arról számolt be, hogy egy kínai kereskedelmi hajó, az orosz műtrágyát szállító Yi Peng 3 szándékosan leengedett horgonnyal közlekedett, így vágta át a kábeleket. A nyugati hírszerzők egyelőre azt feltételezik, hogy ennek ellenére nem a kínaiakat kell sejteni az akció mögött, a nyomozás célja, hogy kiderítsék, hogy az oroszok rendelték-e el a vezetékek megrongálását. Oroszország tagadja, hogy köze volna az eseményekhez. Az Északi Áramlat gázvezetéken két évvel ezelőtt, nem messze innen hajtottak végre robbantást. Idén augusztusban már arról jelentek meg hírek, hogy azt az akciót Ukrajna', 'Szándékosan leengedett horgonyával vághatta át a balti internetvezetékeket egy kínai hajó', 8),
(19, 'https://magyarmezogazdasag.hu/app/uploads/2024/11/kis_voroshangya_izeltlabuak-1920x1288.jpg', b'0', '2024-11-29 20:36:10', 'Az kis vöröshangya (Formica polyctena) több lehet, mint egy rovar az erdőben. ', 'A Microbial Ecology-ban megjelent tanulmány arra mutat rá, hogy a kis vöröshangya képes kordában tartani több növénybetegséget, melyek többek közt az almára is veszélyesek. Emellett egy sor kártevő rovart is levadásznak, melyek közvetlenül a fákat támadnák meg.\n\nEnnek fényében a kutatók elindították az „AntFarm” (hangya farm) projektet, melynek keretében\n\nazt vizsgálják, hogyan tudnák tenyészteni a kis vöröshangyát annak érdekében, hogy a bio almáskertekben hasznosíthatóak legyenek A hangyák óriási kolóniákban élnek, meglehetősen közel egymáshoz. A nagy egyedsűrűség miatt a betegségek igen gyorsan terjedhetnének közöttük. Az evolúciós fejlődésük során azonban többféle védekezési mód is kialakult.\n\n„A hangyák extrém módon tiszták” – magyarázta Joachim Offenberg, az Aarhus Egyetem Ökotudományi karának szenior kutatója. Offenberg évek óta kutatja a hangyakolóniákat, és a mostani tanulmány társszerzője.\n\nPéldául saját trágyadombot tartanak fent, mely megfelelően távol van a fészektől. Sőt, saját „szemétszállítóik” is vannak.\nEgyes fajok nemcsak kiviszik a hulladékot a kolóniából, hanem a patatokba dobva azok messzire szállítódnak. A hangya az egyetlen olyan (jelenleg ismert) állat, melynek testében egy speciális szerv antibiotikus hatású anyagot választ ki.\n\nA hangyák és a baktériumok\nAz apró ízeltlábúaknak azonban még több trükk van a tarsolyában. A kutatók már korábban felfedezték, hogy erdei hangyafajok képesek csökkenteni például olyan betegségek megtelepedését az almaültetvényekben, mint a varasodás és a rothadás. Azt azonban eddig homály fedte, hogy miként.', 'Hangyák, mint a biokertészek barátai?', 8),
(20, 'https://magyarmezogazdasag.hu/app/uploads/2024/11/disposal-1846033_1280-768x512.jpg', b'0', '2024-11-29 20:45:16', 'A norvég nemzetközi fejlesztési miniszter több mint 60 országot képvisel', 'Az ENSZ tárgyalásain, amelyeket a dél-koreai Busan városában tartanak november 27. és december 1. között, a világ első átfogó műanyag-szennyezést szabályozó egyezményéről döntenek. Tvinnereim elismerte, hogy az olajtermelő országok és a más nemzetek közötti megosztottság miatt a „tökéletes egyezmény” létrejötte nem valószínű. Ugyanakkor reméli, hogy születhet olyan megállapodás, amelyet idővel tovább lehet erősíteni.\n\nA műanyagok egészségügyi és környezeti hatásai egyre nagyobb aggodalomra adnak okot. Kutatások során mikroműanyagokat találtak emberi méhlepényekben, artériákban, valamint a herékben és a spermában, ami súlyos egészségügyi kockázatokra utal. A műanyagszennyezés fenyegeti továbbá a biodiverzitást és hozzájárul a klímaváltozáshoz.\n„Természetesen szükség van az újrahasznosítás és a hulladékkezelés javítására, de ha nem csökkentjük a gyártást és a fogyasztást, tíz év múlva képtelenek leszünk megbirkózni a műanyag mennyiségével” – hangsúlyozta Tvinnereim.', 'Tíz éven belül már képtelenek leszünk megbirkózni a műanyaghulladék mennyiségével', 8),
(21, 'https://magyarmezogazdasag.hu/app/uploads/2024/03/closeup-classic-fresh-espresso-served-dark-surface_1220-5375.jpg', b'0', '2024-11-29 20:48:35', 'A kutatók egy jelentős különbséget találtak a két csoport között: a Lawsonibacter asaccharolyticus nevű baktérium populációjának számát.', 'Azoknál az embereknél, akik rendszeresen kávét ittak, a baktériumok szintje nyolcszorosa volt azokhoz képest, akik nem ittak kávét – és ez a különbség a világ minden tájáról származó embereknél stabilan fennmaradt.\n\nA kutatócsoport elismeri, hogy nem tudják, milyen hatással lehet az emberekre az L. asaccharolyticus magasabb szintje, de azt sugallják, hogy valószínűleg összefüggésbe hozható a kávéfogyasztásnak tulajdonított egészségügyi előnyökkel. Emellett azt sugallja, hogy egyetlen élelmiszer vagy étel is jelentős hatással lehet az emberi bélmikrobiomra.', 'A kávéfogyasztás megváltoztatja a bélmikrobiomot', 8),
(22, 'https://cdn.nemzetisport.hu/2024/11/02rGfa5Crf-BorocwPlVX5wCLw5uPdAKGlpEnK9x8Kc/fill/1347/758/no/1/aHR0cHM6Ly9jbXNjZG4uYXBwLmNvbnRlbnQucHJpdmF0ZS9jb250ZW50L2JmYTBkMGJhZDY5MDRkODdhNzBkNzFiYTdhZjM3MDBi.webp', b'0', '2024-11-29 20:57:14', 'A Leicester City labdarúgócsapata saját hivatalos oldalain jelentette be, hogy Ruud van Nistelrooy lett a csapat új menedzsere.', 'A Leicester a Chelsea elleni 2–1-es vereség után menesztette a nyáron érkezett Steve Coopert, miután a csapat az utolsó négy PL-meccsén csak egy pontot szerzett, és a 16. helyről várhatja a fordulót.\n\nPéntek este a Premier League újonca bejelentette, hogy Ruud van Nistelrooy veszi át Cooper helyét a kispadon, a 48 éves egykori kiváló csatár 2027-ig írt alá.\n\nA korábban a Hamburggal is szóba hozott Van Nistelrooy a Brentford elleni szombati bajnokin csak nézőként lesz jelen, a menedzseri feladatokat vasárnaptól látja el. A West Ham ellen kedden lesz az első mérkőzése.\n\nA holland szakember ebben az idényben a Manchester Unitedet megbízott edzőként irányította, érdekesség, hogy a négy meccséből kettőt a Leicester ellen vívott.', 'Van Nistelrooy lett a Leicester menedzsere – hivatalos', 8),
(23, 'https://s.24.hu/app/uploads/2024/11/ad95086c-57de-4049-aefb-e189350a906d-e1732885627744-1140x641.jpg', b'0', '2024-11-29 21:04:44', 'Varga Zs. András, a Kúria elnöke két évre eltiltott egy kúriai tanácselnököt a munkaköre gyakorlásától.', 'A tegnapi napon egy konkrét ügyben is képviselt nyilvános jogi álláspontom miatt – mely egyes részleteiben ellentétes a Kúria elnökének álláspontjával – a Kúria elnöke a tanácselnöki munkaköröm gyakorlásától két évre eltiltott, azzal, hogy megfelelő magatartás esetén egy év múlva felülvizsgálja az intézkedést\n\n– írta Kovács András, a tanácselnöki munkaköréből ideiglenesen felfüggesztett kúriai bíró a Magyar Bírói Egyesület honlapján közzétett nyilatkozatában.\n\nA közigazgatási ügyekben ítélkező Kovács András szerint ebben az ügyben nem az ő személye fontos, „hanem az a tény, hogy az ilyen és hasonló vezetői szankció az elmozdíthatatlanságba vetett hitet visszafordíthatatlanul rendítheti meg a bírói karban”. A bíró szerint Varga Zs. András a lépésével tulajdonképpen a bírói függetlenséget veszélyezteti.\n\n„A bírói függetlenségnek számos személyes és szakmai összetevője van, amelyek együttesen garantálják a bíró döntés autonómiáját. A bíró szakmai integritásának alkotmányos garanciája az elmozdíthatatlanság, ami nem kevesebbet jelent, mint hogy mélységesen hisz abban, miszerint jogi álláspontja miatt beosztásából nem távolítható el” – fejtette ki Kovács András, aki egyúttal bírálta a bírósági szervezetek kormánnyal kötött múlt heti megállapodását. Attól tart ugyanis, hogy a jogkereső közönség hamar érdemben is tapasztalni fogja, hogy „a bírói függetlenség a sérülékeny helyzetbe taszított bírák esetén már csak fikció”.\n\n„A becsület nem eladó, a bírói függetlenség nem feladható!” – zárta levelét a Kúria bírája.\n\nKerestük Kovács Andrást, hogy megtudjuk, pontosan milyen ügyben volt véleménykülönbség közte és a Kúria elnöke között, illetve a Kúrián keresztül Varga Zs. Andrást is, amint válaszolnak, frissítjük az írásunkat.', 'Két évre eltiltott egy tanácselnököt a Kúria elnöke, a felfüggesztett bíró szerint a jogi álláspontja miatt', 8),
(24, 'https://s.24.hu/app/uploads/2022/03/iszb-20220331-2-1140x641.jpg', b'0', '2024-11-29 21:12:31', 'Kívülállónak nem könnyű követnie, milyen meccset vív egymással a Kúria és az Alkotmánybíróság', 'Minden, magára valamit is adó cég elvárja, hogy alkalmazottai lojálisak legyenek hozzá. Lojálisak a szó jó értelmében: ne tegyenek, ne mondjanak, ne híreszteljenek olyat, ami árt a cég jó hírnevének. Ne ingassák meg az emberek bizalmát a vállalatban. De vajon mi a helyzet akkor, ha ezt az írott vagy íratlan szabályt éppen a cég vezetője sérti meg? Ráadásul egy olyan helyen, ahol az alkalmazottat a törvény hallgatásra kötelezi.\n\nA „cég” ez esetben a Kúria, a „cégvezető” pedig nem más, mint a Kúria elnöke, Varga Zs. András, a törvény által hallgatásra kötelezett „alkalmazottak” pedig a Kúria bírái. Konkrétan az a bírói tanács, amelyik két esetben is a kormányhű alkotmánybírák véleményével szemben ragaszkodott a saját, megalapozott, szakmai meggyőződéséhez.\n\nAz idáig vezető történet 2020 decemberében kezdődött. Akkor indult be a Vakcinainfó elnevezésű oldal, ahová azok regisztrálhattak, akik koronavírus elleni oltást szeretnének kapni. A Telex már ekkor kiszúrta, hogy az oldal adatkezelési tájékoztatója adatvédelmi szempontból „aggályos”. (Ez Péterfalvi Attilának, az adatvédelmi hatóság elnökének szavajárása, aki ugyan sokat aggódik, de keveset tesz.)\n\nA regisztrációs oldalon található első nyilatkozattal nincs baj, mert annak elfogadásával ahhoz járul hozzá az aláíró, hogy adatait továbbíthassák a Nemzeti Egészségbiztosítási Alapkezelőnek. Ez logikus, hisz általuk lehet az oltakozást megszervezni. A második nyilatkozat megtétele azonban a személyes adatok felhasználásának túl széles körét biztosítja a Miniszterelnöki Kabinetiroda számára:\n\nhozzájárulok, hogy későbbi kapcsolattartás céljából a megadott kapcsolattartási adataimat visszavonásomig kezeljék az adatkezelési tájékoztatóban foglaltak szerint.\n\nHogy egyáltalán miért a kabinetiroda gyűjtötte az adatokat, az csak két évvel később vált világossá.\n\nA 2021-es év sem telt eseménytelenül. A Kúria Kovács András vezette tanácsa kimondta, hogy nem lehet a „gyermekvédelmi” népszavazásra bocsátani azt a kérdést, amely így szól: „támogatja-e ön, hogy kiskorú gyermekek számára is elérhetőek legyenek nemátalakító kezelések?” Kovácsot persze személyében is kikezdte a kormánypárti sajtó, de ez nem hír. Az viszont igen, hogy a döntést a kabinet megtámadta az Alkotmánybíróságon, mondván, a Kúria döntése a tisztességes eljáráshoz való jogát sérti. Az Alkotmánybíróság – óriási meglepetésre – a kormánynak adott igazat: megsemmisítette a Kúria végzését, emiatt pedig új eljárást kellett indítani.', 'Így lett az oltásinformációból ellenzéki lejáratás', 8),
(25, 'https://s.24.hu/app/uploads/2024/11/central-0924360848-masolat-1140x641.jpg', b'0', '2024-11-29 21:13:39', 'az nem egy mókás helyzet', 'Az ügyvédi szakmát nem lehet könnyű összekötni a standupozással, Dr. Ujvárosi Veronika életében viszont vígan megfér a kettő egymás mellett. Az osztrák fővárosban praktizáló jogász képviselte a két évvel ezelőtti, bécsi kettős gyilkosság magyar áldozatait, és bár ezzel az esettel nyilván nem poénkodik, bőven akad annyi meredek története, ami kitesz egy egész estet. Az ügyvédnő Ausztriában és Magyarországon is telt ház előtt lépett fel, mi Budapesten beszélgettünk vele a többi között arról, hogy mely esetek működnek a színpadon, és melyek nem, mit szólnak a sokszor keménykötésű ügyfelei, ha az ő történeteiken röhög a közönség, illetve miért nem szerencsés a tárgyalóteremben standupolni.', 'Amikor két órán át ott ül a gyilkos melletted, az nem egy mókás helyzet', 8),
(27, 'https://s.24.hu/app/uploads/2024/11/ill24_haromharmad_cover_00-masolata-768x432.jpg', b'0', '2024-11-29 21:24:25', 'Mi következik a friss közvélemény-kutatásokból?', 'Mi következik a friss közvélemény-kutatásokból? Kit tart felelősnek romló életszínvonaláért a nép? Mit üzen Dombóvár? És mit üzen az, hogy Lévai Anikó is megjelent Szájer József rehabilitációján? Bánszegi Rebeka, Bita Dániel, valamint Nagy József a stúdióban.', 'A Fidesz csinál erős, magabiztos, kompetens vezetőt Magyar Péterből?', 26),
(28, 'https://s.24.hu/app/uploads/2024/11/karacsonygergely-e1732861811410-1140x642.jpg', b'0', '2024-11-29 21:27:11', 'Öt év után kapott újra meghívást a közmédiába Karácsony Gergely, aki a közmédia 48 perc című műsorának vendége volt csütörtökön este.', 'A Telex cikke szerint a főpolgármestert a műsorvezető arról faggatta először, hogy mi lesz a helyetteseivel, akik ugye jelenleg nincsenek neki. Karácsony úgy felelt: összetett a válasz, de azt látja, hogy a fővárosi közgyűlésre vonatkozó szabályok módosításával a kormány valóban elérte a zavart. Karácsony jelezte, hogy Vitézyt is javasolta főpolgármester-helyettesnek, de belátja, ő sem gondolta, hogy meg fogják őt szavazni. Hozzátette, nagyobb bajnak látja ennél, hogy nincs a fővárosnak pénze.\n\nA riporter ugyanakkor nem hagyta annyiban, és azt mondogatta Karácsonynak, hogy így törvénytelen lesz a közgyűlés. A politikus pedig újra azt felelte, a pénzkérdés nagyobb probléma.\n\nEttől még jár a metró, folyik a víz a csapból, van közvilágítás\n\n– mondta Karácsony arra, hogyha nincs főpolgármester-helyettes, Budapest akkor is működik.\n\nA riporter kapott az alkalmon, és megjegyezte, hogy csütörtökön reggel a metró pont nem járt, de Karácsony ezt is kivédte, mondván a metrók pontosabbak, mint a vonatok, utalva a MÁV sorozatos gondjaira az elmúlt hetekből.\n\nKarácsony kérdésre válaszolva azt mondta, nem Magyar Péter kedvéért jelölte Vitézy Dávidot helyettesnek. Közölte, Vitézy Dáviddal, a Podmaniczky Mozgalom vezetőjével szívesen dolgozna egy csapat részeként Budapest érdekében, de úgy tűnik, hogy a Fővárosi Közgyűlés egy olyan sziget az országban, ahol ez nem lehetséges. Annak kapcsán, hogy a fővárosi képviselők nem szavaztak a főpolgármester-helyettesekről a Fővárosi Közgyűlés szerdai ülésén, mert az erről szóló javaslatot levették a napirendről, azt mondta: szerinte szavazni kellett volna, és kiderült volna az, hogy egyik jelöltnek sincsen támogatottsága, és így a közgyűlésen nagyobb lett volna a súly, hogy van egy feladat, amelyet nem végeztek el.\n\nMegjegyezte, az általa előterjesztett jelöltek megválasztására ő sem látott nagyon nagy matematikai esélyt.\n\nDe újra előjött, hogy akkor mi lesz a helyettesekkel, mire Karácsony visszakérdezett:', '„Azért a metrók pontosabbak, mint a vonatok” – Öt év után ült be a köztévébe Karácsony Gergely', 26),
(29, 'https://s.24.hu/app/uploads/2024/11/fiumei-e1732788565879.jpg', b'0', '2024-11-29 21:38:20', 'Holtan találtak pár nappal ezelőtt egy embert', 'A Vas Vármegyei Rendőr-főkapitányság sajtóosztálya az esettel kapcsolatos megkeresésünkre azt közölte, hogy a Körmendi Rendőrkapitányság szakértő bevonásával, közigazgatási hatósági eljárás keretében vizsgálja az eset körülményeit. És hogy bővebb információt nem áll módjukban adni.', 'Holtan találtak pár nappal ezelőtt egy embert Budapest VIII. kerületében', 26),
(30, 'https://s.24.hu/app/uploads/2024/11/central-0426366982-e1732652826339-1140x641.jpg', b'0', '2024-11-29 21:44:36', 'Egy kis csoport várta a salgótarjáni református templom előtt az oda meghívott Balog Zoltán püspököt a napokban', 'Egy kis csoport várta a salgótarjáni református templom előtt az oda meghívott Balog Zoltán püspököt a napokban– írja az atv.hu. „Egy bátor csapat hozott egy molinót, amelyre az volt írva, hogy szégyelljétek magatokat. Ezzel utalva a püspöki kegyelmi botrányra. Mi pedig ezt csendben szerettük volna tudatni az emberekkel, hogy ez a véleményünk. Nem akartunk ebből botrányt, de sajnos a lelkész asszonynak a férje elénk ugrott és leszaggatta a molinót, illetve a telefonom előtt ugrált is ki akarta szedni a kezemből a telefont” – mondta el Tóth-Beeri Szilvia református gyülekezeti tag az ATV Híradójának.', 'Balhé lett abból, hogy református tiltakozók várták Balog Zoltánt a templom előtt', 26),
(31, 'https://s.24.hu/app/uploads/2024/11/banyakes.png', b'0', '2024-11-29 21:46:25', 'Nyolc év börtönre ítélte a Tatabányai Törvényszék azt az ukrán férfit, aki kis híján megölte az egyik tatabánya', 'Stoller Katalin, a Komárom-Esztergom Vármegyei Főügyészség helyettes szóvivője az üggyel kapcsolatos megkeresésünkre azt közölte, hogy az ügyész hosszabb tartalmú börtönbüntetésért és közügyektől eltiltásért, míg a vádlott és védője a büntetés enyhítéséért fellebbeztek.\n\nA vádirat szerint az ukrán férfi egy lakótelepen sétált hazafelé Tatabányán, amikor egy lépcsősoron szembetalálkozott a hat fiatalból álló baráti társaságával arra sétáló sértettel. Amikor az elkövető élettársa és a fiatal férfi a haladásuk során egymás mellé értek, a vállukkal érintőlegesen egymásnak ütköztek.\n\nA későbbi áldozat megkérdezte a nőt, hogy véletlenül ment-e neki, mire az bocsánatot kért tőle. A terhelt ekkor dühében elővett egy kést, és háromszor is megszúrta vele az áldozatát. A szúrásokat követően a fiatal férfi a barátaival elmenekült a helyszínről, mentőt hívtak hozzá, majd a kórházban megműtötték.\n\nA Tatabányai Törvényszék közleménye szerint a szúrások eredményeképpen az áldozatnak egy bordája eltörött, továbbá a mellüregének megnyílása miatt vérmell és légmell alakult ki nála, mely sérülések orvosi ellátás nélkül a halálához vezethettek volna. A bíróság nyolc év börtönre ítélte az emberölési kísérlettel vádolt férfit.', 'Nyolc évet kapott a férfi, aki megszurkálta a barátnője vállához véletlenül hozzáérő gyalogost', 26),
(32, 'https://s.24.hu/app/uploads/2024/11/nissan_1-1024x682.jpg', b'0', '2024-11-29 21:47:33', 'A legfontosabb teendők év végén', 'A legfontosabb teendők év végén\n\nÁm mielőtt rátérnénk a szabad forrással kapcsolatos legésszerűbb teendőre, azelőtt érdemes pár szót ejteni arról, hogy a cégvezetők mi alapján gondolhatják úgy, hogy cégük stabilan és jól működik. Mik azok a feladatok, amelyeket minden év végén el kell végezniük ahhoz, hogy tiszta képet kapjanak vállalkozásuk jelenlegi és jövőbeni helyzetéről. Hiszen szinte minden cégvezető tudja, hogy a pénzügyi év forduló napja számtalan lehetőséget nyújt a jobb működésre. Ilyenkor lehetőség adódik a cég átfogó értékelésére, az addigi stratégiák felülvizsgálatára, a következő üzleti év legfontosabb céljainak meghatározására. Emellett a következő feladatokra is sort kell keríteni:\n\nAdókötelezettségek teljesítése\n\nAz adófizetések rendezése és adóoptimalizálás.\n\nPénzügyi beszámoló készítése\n\nAz éves pénzügyi eredmények összegzése.\n\nLikviditás felmérése\n\nA rövid távú pénzügyi kötelezettségek teljesítési képességének számbavétele.', 'Nissan X-Trail: fektessen be okosan, vásároljon céges autót jobb áron!', 26),
(33, 'https://s.24.hu/app/uploads/2024/11/nissan_5.jpg?_gl=1*1y6r824*_ga*MTA1ODk0ODcyNS4xNzMyODg5MzA5*_ga_WQCPVWN1XZ*MTczMjkxMDU1OS41LjEuMTczMjkxNDQ0OC4wLjAuMA..', b'1', '2024-11-29 22:08:16', 'Nissan', 'A legfontosabb teendők év végén\n\nÁm mielőtt rátérnénk a szabad forrással kapcsolatos legésszerűbb teendőre, azelőtt érdemes pár szót ejteni arról, hogy a cégvezetők mi alapján gondolhatják úgy, hogy cégük stabilan és jól működik. Mik azok a feladatok, amelyeket minden év végén el kell végezniük ahhoz, hogy tiszta képet kapjanak vállalkozásuk jelenlegi és jövőbeni helyzetéről. Hiszen szinte minden cégvezető tudja, hogy a pénzügyi év forduló napja számtalan lehetőséget nyújt a jobb működésre. Ilyenkor lehetőség adódik a cég átfogó értékelésére, az addigi stratégiák felülvizsgálatára, a következő üzleti év legfontosabb céljainak meghatározására. Emellett a következő feladatokra is sort kell keríteni:\n\nAdókötelezettségek teljesítése\n\nAz adófizetések rendezése és adóoptimalizálás.\n\nPénzügyi beszámoló készítése\n\nAz éves pénzügyi eredmények összegzése.\n\nLikviditás felmérése\n\nA rövid távú pénzügyi kötelezettségek teljesítési képességének számbavétele.\n\nKöltségvetés tervezése\n\nA következő év pénzügyi céljainak és forrásainak meghatározása.', 'Nissan X-Trail: fektessen be okosan, vásároljon céges autót jobb áron', 26),
(34, 'https://noklapja.p3k.hu/uploads/2024/11/Csokor-alaku-melldisz-17-szazad-kozepe-arany-gyongy-rubin-kovek-zomanc-960x720.jpg', b'0', '2024-11-29 22:10:02', 'Néhány héttel ezelőtt, október 18-án nyílt meg az MNMKK Magyar Nemzeti Múzeum új időszaki kiállítása Ragyogj!', 'Néhány héttel ezelőtt, október 18-án nyílt meg az MNMKK Magyar Nemzeti Múzeum új időszaki kiállítása Ragyogj! – Ékszerek ideje címmel, amely a múzeum ékszergyűjteményének legkülönlegesebb darabjait, illetve Spengler Katalin műgyűjtőnek és a Moholy-Nagy Művészeti Egyetem egykori és jelenlegi hallgatóinak, valamint oktatóinak kortárs ékszereit mutatja be.\nIdőtlen idők óta az ékszerek hordozzák a legkomplexebb üzenetet az emberről, életében és halálában is. Az ékszereket nemcsak az értékes anyag, a gondos kialakítás, hanem a szellemi érték, a mögöttes tartalom és a személyes kötődések teszik időtlenné, mégis millió módon egyedivé és megismételhetetlenné. Legyenek akár a test, akár a viselet ékei, az ékszerek sosem magukban léteznek, hanem egy társadalmi kontextuson belül, egyedül ezen keresztül értelmezhetőek teljességükben.', 'III. Béla király méreggyűrűjét is megcsodálhatjuk az új ékszerkiállításon (x)', 26),
(35, 'https://s.24.hu/app/uploads/2024/11/nok-elleni-idoszak-afp-e1732879392795.jpg', b'1', '2024-11-29 22:29:22', 'Európai viszonylatban Magyarországon a legmagasabb a bántalmazó', 'Tíz év után először jelent meg reprezentatív felmérés a nők elleni erőszak mértékéről Magyarországon – közölte a Patent Egyesület. Az EU-s tagállamokban készített felmérés független közvélemény-kutatók segítségével készülhetett csak el, mivel a magyar kormány nem egyezett bele a részvételbe.\n\nA kutatás a 2020 szeptembere és a 2024 márciusa közötti intervallumot foglalja magába, és 115 000 nő vett benne részt Európa minden pontjáról. A Patent szerint lesújtóak az adatok, hiszen a bántalmazott nők aránya Magyarországon toronymagasan kiemelkedik a többi európai országhoz képest.\n\nA kutatás a lelki- és fizikai erőszakkal, fenyegetéssel, szexuális erőszakkal, és szexuális zaklatással kapcsolatos adatokat vizsgálta.\n\nAz összesített átlag alapján az európai nők 31,8 százaléka, míg ehhez képest a magyar nők 54,6 százaléka szenved el valamilyen formában erőszakot élete során.\n\nA kutatás összefoglalója az alábbi adatokat közli:\n\nAz EU-ban 3 nőből 1 élt már át felnőttkorában fizikai vagy szexuális erőszakot, illetve fenyegetést.\nAz EU-ban 6 nőből 1 tapasztalt felnőttkorában szexuális erőszakot, ideértve a nemi erőszakot is.\nSok nő számára nem mindig biztonságos az otthon: 5 nőből 1 szenvedett már el a partnere, rokona vagy a háztartás más tagja által elkövetett fizikai vagy szexuális erőszakot.\n3 nőből 1 élt már át szexuális zaklatást a munkahelyén. A fiatalabb nők nagyobb gyakoriságról számolnak be: 5-ből 2 fiatal nő tapasztalt már szexuális zaklatást a munkahelyén.\nBár az erőszakot átélt nők többsége beszélt erről egy hozzá közel álló személlyel, csak minden ötödik nő fordult egészségügyi vagy szociális szolgáltatóhoz, és csak minden nyolcadik nő jelentette az esetet a rendőrségnek.\nA magyar nőkre vonatkozóan a felmérésben szereplő arányok a következők:\n\nA magyar nők 41 százaléka szenvedett már el fizikai erőszakot vagy fenyegetést, és/vagy szexuális erőszakot a partnerétől.\nA magyar nők 7,6 százaléka él jelenleg bántalmazó párkapcsolatban.\nMinden második magyar nő szenved el fizikai és/vagy szexuális erőszakot vagy fenyegetést élete folyamán.\nA magyar nők 18 százaléka szenved el szexuális erőszakot élete során.', 'Európai viszonylatban Magyarországon a legmagasabb a bántalmazó', 26),
(36, 'https://s.24.hu/app/uploads/2023/06/306806597_5153215648141305_852541841906198198_n-e1663067379340.jpg', b'0', '2024-11-29 22:30:40', 'A leggyakrabban olyan nők döntenek így, akiknek már van legalább egy gyermekük, és felmérik, fel tudnak-e nevelni még egyet.', 'Ezt mondta a Klubrádió reggeli műsorában Les Krisztina, a Patent Egyesület munkatársa arra reagálva, hogy kiderült, nem csökkent, hanem nőtt az abortuszok száma, miután megjelent tavaly ősszel Pintér Sándor belügyminiszter szívhangrendelete. A nők jogaival foglalkozó civil szervezet egyébként már korábban is jelezte, az ilyen lépések nincsenek hatással arra, hányan döntenek terhességük megszakítása mellett, a Válasz Online elemzése ezt igazolta.\n\nLes Krisztina szerint a 2022-es év azonos szakaszához viszonyítva 100 élveszületésre több abortusz jut, noha a kormánynak lennének hatékony eszközei a tendencia javítására. Mint mondta, jelenleg négy esetben lehetséges abortusz. Az egyik, ha a terhes nő súlyos válsághelyzetben van, és legtöbben erre hivatkozva is kezdeményezik.\n\nNoha a pontos adatok nem nyilvánosak, de indokoltnak tűnik, hogy az életszínvonal csökkenése miatt növekedett az abortuszok száma. Emlékeztetett rá, a KSH 2016-ban kiadott egy részletes statisztikát, ami egyértelműen cáfolta azt a tévhitet, amely szerint „fiatal tinilányok rohangálnak abortuszra”. Olyan nők döntenek leggyakrabban így, akiknek már van legalább egy gyermekük, fel tudják mérni azt, hogy fel tudnak-e nevelni egy újabbat, vagy sem.\n\nKorábban Pintér Sándor döntését Dúró Dóra (Mi Hazánk) és a MOK Etikai Bizottsága támogatta, a Nőkért Egyesület elnöke, Antoni Rita viszont attól tartott, hogy az utat nyit az illegális – a nők számára akár életveszélyes – abortuszok felé, az állam semmilyen eszközzel nem tudja a nők akaratát befolyásolni, de az abortuszok számát TB-támogatott fogamzásgátlással és átfogó iskolai szexedukációval csökkenthetné.', 'Tévhit, hogy tinilányok rohangálnak abortuszra ', 26);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `news_type`
--

CREATE TABLE `news_type` (
  `news_id` bigint(20) NOT NULL,
  `type_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_bin;

--
-- A tábla adatainak kiíratása `news_type`
--

INSERT INTO `news_type` (`news_id`, `type_id`) VALUES
(3, 2),
(5, 1),
(5, 5),
(6, 3),
(7, 1),
(9, 1),
(9, 5),
(10, 4),
(11, 4),
(12, 4),
(13, 4),
(14, 4),
(15, 3),
(16, 4),
(17, 7),
(18, 7),
(19, 6),
(20, 6),
(21, 6),
(22, 4),
(23, 1),
(24, 3),
(25, 2),
(27, 1),
(27, 5),
(28, 1),
(28, 5),
(29, 1),
(30, 1),
(30, 5),
(31, 1),
(31, 5),
(32, 6),
(33, 1),
(33, 4),
(33, 6),
(33, 7),
(34, 3),
(35, 1),
(35, 5),
(36, 1);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) NOT NULL,
  `title` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_bin;

--
-- A tábla adatainak kiíratása `roles`
--

INSERT INTO `roles` (`id`, `title`) VALUES
(1, 'ADMIN'),
(2, 'USER'),
(3, 'WRITER');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `type_of_news`
--

CREATE TABLE `type_of_news` (
  `id` bigint(20) NOT NULL,
  `title` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_bin;

--
-- A tábla adatainak kiíratása `type_of_news`
--

INSERT INTO `type_of_news` (`id`, `title`) VALUES
(1, 'BELFÖLD'),
(2, 'KÜLFÖLD'),
(3, 'KULTÚRA'),
(4, 'SPORT'),
(5, 'POLITIKA'),
(6, 'GAZDASÁG'),
(7, 'INFORMATIKA');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `users`
--

CREATE TABLE `users` (
  `id` bigint(20) NOT NULL,
  `chat_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `image_path` varchar(255) DEFAULT NULL,
  `locked` bit(1) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `sec_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_bin;

--
-- A tábla adatainak kiíratása `users`
--

INSERT INTO `users` (`id`, `chat_name`, `email`, `first_name`, `image_path`, `locked`, `password`, `sec_name`) VALUES
(1, 'Admin1234', 'iamadmin@gmail.com', 'Admin', './uploads/image.jpeg', b'0', 'admin1234', 'Ádám'),
(2, 'irobela', 'irobela@gmail.com', 'Író', './uploads/2024_11_29_23_38_05.jpeg', b'0', 'irobela1234', 'Béla'),
(8, 'irokálmán', 'irokalman@gmail.com', 'Író', './uploads/2024_11_29_23_38_35.jpeg', b'0', 'irokalman1234', 'Kálmán'),
(26, 'IroAttila', 'iroAttila@gmail.com', 'Iro', './uploads/2024_11_29_23_38_56.jpeg', b'0', 'iroattila', 'Attila');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `users_comment`
--

CREATE TABLE `users_comment` (
  `users_id` bigint(20) NOT NULL,
  `comment_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_bin;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `user_news_likes`
--

CREATE TABLE `user_news_likes` (
  `news_id` bigint(20) NOT NULL,
  `users_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_bin;

--
-- A tábla adatainak kiíratása `user_news_likes`
--

INSERT INTO `user_news_likes` (`news_id`, `users_id`) VALUES
(3, 1);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `user_roles`
--

CREATE TABLE `user_roles` (
  `roles_id` bigint(20) NOT NULL,
  `users_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_bin;

--
-- A tábla adatainak kiíratása `user_roles`
--

INSERT INTO `user_roles` (`roles_id`, `users_id`) VALUES
(1, 1),
(3, 2),
(3, 8),
(2, 8),
(2, 26),
(3, 26);

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKnxm8x9npdhuwxv2x2wxsghm17` (`news_id`),
  ADD KEY `FKesq8qbb4pp4k3gsxku3tqvgmn` (`writer_id`);

--
-- A tábla indexei `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKk96uwasqk515xy3lls81wk5x0` (`users_id`);

--
-- A tábla indexei `news_type`
--
ALTER TABLE `news_type`
  ADD PRIMARY KEY (`news_id`,`type_id`),
  ADD KEY `FKn69n9ikqf0r99gsp91onu549v` (`type_id`);

--
-- A tábla indexei `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `type_of_news`
--
ALTER TABLE `type_of_news`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_6dotkott2kjsp8vw4d0m25fb7` (`email`);

--
-- A tábla indexei `users_comment`
--
ALTER TABLE `users_comment`
  ADD UNIQUE KEY `UK_mlyptc694kw1gjvh35tc3hnvg` (`comment_id`),
  ADD KEY `FKbhrf71sd7uxe6tklkq55dvg3q` (`users_id`);

--
-- A tábla indexei `user_news_likes`
--
ALTER TABLE `user_news_likes`
  ADD PRIMARY KEY (`news_id`,`users_id`),
  ADD KEY `FKacvjwf2kb8j4rgdflhloo29aq` (`users_id`);

--
-- A tábla indexei `user_roles`
--
ALTER TABLE `user_roles`
  ADD KEY `FKoovdgg7vvr1hb8vw6ivcrv3tb` (`users_id`),
  ADD KEY `FKdbv8tdyltxa1qjmfnj9oboxse` (`roles_id`);

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `FKesq8qbb4pp4k3gsxku3tqvgmn` FOREIGN KEY (`writer_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `FKnxm8x9npdhuwxv2x2wxsghm17` FOREIGN KEY (`news_id`) REFERENCES `news` (`id`);

--
-- Megkötések a táblához `news`
--
ALTER TABLE `news`
  ADD CONSTRAINT `FKk96uwasqk515xy3lls81wk5x0` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`);

--
-- Megkötések a táblához `news_type`
--
ALTER TABLE `news_type`
  ADD CONSTRAINT `FK50htu8j3cvbx4t9lam44an6r4` FOREIGN KEY (`news_id`) REFERENCES `news` (`id`),
  ADD CONSTRAINT `FKn69n9ikqf0r99gsp91onu549v` FOREIGN KEY (`type_id`) REFERENCES `type_of_news` (`id`);

--
-- Megkötések a táblához `users_comment`
--
ALTER TABLE `users_comment`
  ADD CONSTRAINT `FKbhrf71sd7uxe6tklkq55dvg3q` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `FKs7dgtylluu1beqnvwwip907hy` FOREIGN KEY (`comment_id`) REFERENCES `comment` (`id`);

--
-- Megkötések a táblához `user_news_likes`
--
ALTER TABLE `user_news_likes`
  ADD CONSTRAINT `FKacvjwf2kb8j4rgdflhloo29aq` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `FKarnuuoyh6kyrb680f2j0gvylw` FOREIGN KEY (`news_id`) REFERENCES `news` (`id`);

--
-- Megkötések a táblához `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `FKdbv8tdyltxa1qjmfnj9oboxse` FOREIGN KEY (`roles_id`) REFERENCES `roles` (`id`),
  ADD CONSTRAINT `FKoovdgg7vvr1hb8vw6ivcrv3tb` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`);
--
-- Adatbázis: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(10) UNSIGNED NOT NULL,
  `dbase` varchar(255) NOT NULL DEFAULT '',
  `user` varchar(255) NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `query` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) NOT NULL,
  `col_name` varchar(64) NOT NULL,
  `col_type` varchar(64) NOT NULL,
  `col_length` text DEFAULT NULL,
  `col_collation` varchar(64) NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) DEFAULT '',
  `col_default` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `column_name` varchar(64) NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `transformation` varchar(255) NOT NULL DEFAULT '',
  `transformation_options` varchar(255) NOT NULL DEFAULT '',
  `input_transformation` varchar(255) NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) NOT NULL,
  `settings_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL,
  `export_type` varchar(10) NOT NULL,
  `template_name` varchar(64) NOT NULL,
  `template_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

--
-- A tábla adatainak kiíratása `pma__export_templates`
--

INSERT INTO `pma__export_templates` (`id`, `username`, `export_type`, `template_name`, `template_data`) VALUES
(1, 'root', 'table', 'fakenews', '{\"quick_or_custom\":\"quick\",\"what\":\"sql\",\"allrows\":\"1\",\"aliases_new\":\"\",\"output_format\":\"sendit\",\"filename_template\":\"@TABLE@\",\"remember_template\":\"on\",\"charset\":\"utf-8\",\"compression\":\"none\",\"maxsize\":\"\",\"codegen_structure_or_data\":\"data\",\"codegen_format\":\"0\",\"csv_separator\":\",\",\"csv_enclosed\":\"\\\"\",\"csv_escaped\":\"\\\"\",\"csv_terminated\":\"AUTO\",\"csv_null\":\"NULL\",\"csv_columns\":\"something\",\"csv_structure_or_data\":\"data\",\"excel_null\":\"NULL\",\"excel_columns\":\"something\",\"excel_edition\":\"win\",\"excel_structure_or_data\":\"data\",\"json_structure_or_data\":\"data\",\"json_unicode\":\"something\",\"latex_caption\":\"something\",\"latex_structure_or_data\":\"structure_and_data\",\"latex_structure_caption\":\"@TABLE@ tÃ¡bla szerkezete\",\"latex_structure_continued_caption\":\"@TABLE@ tÃ¡bla szerkezete (folytatÃ¡s)\",\"latex_structure_label\":\"tab:@TABLE@-structure\",\"latex_relation\":\"something\",\"latex_comments\":\"something\",\"latex_mime\":\"something\",\"latex_columns\":\"something\",\"latex_data_caption\":\"@TABLE@ tÃ¡bla tartalma\",\"latex_data_continued_caption\":\"@TABLE@ tÃ¡bla tartalma (folytatÃ¡s)\",\"latex_data_label\":\"tab:@TABLE@-data\",\"latex_null\":\"\\\\textit{NULL}\",\"mediawiki_structure_or_data\":\"data\",\"mediawiki_caption\":\"something\",\"mediawiki_headers\":\"something\",\"htmlword_structure_or_data\":\"structure_and_data\",\"htmlword_null\":\"NULL\",\"ods_null\":\"NULL\",\"ods_structure_or_data\":\"data\",\"odt_structure_or_data\":\"structure_and_data\",\"odt_relation\":\"something\",\"odt_comments\":\"something\",\"odt_mime\":\"something\",\"odt_columns\":\"something\",\"odt_null\":\"NULL\",\"pdf_report_title\":\"\",\"pdf_structure_or_data\":\"data\",\"phparray_structure_or_data\":\"data\",\"sql_include_comments\":\"something\",\"sql_header_comment\":\"\",\"sql_use_transaction\":\"something\",\"sql_compatibility\":\"NONE\",\"sql_structure_or_data\":\"structure_and_data\",\"sql_create_table\":\"something\",\"sql_auto_increment\":\"something\",\"sql_create_view\":\"something\",\"sql_create_trigger\":\"something\",\"sql_backquotes\":\"something\",\"sql_type\":\"INSERT\",\"sql_insert_syntax\":\"both\",\"sql_max_query_size\":\"50000\",\"sql_hex_for_binary\":\"something\",\"sql_utc_time\":\"something\",\"texytext_structure_or_data\":\"structure_and_data\",\"texytext_null\":\"NULL\",\"xml_structure_or_data\":\"data\",\"xml_export_events\":\"something\",\"xml_export_functions\":\"something\",\"xml_export_procedures\":\"something\",\"xml_export_tables\":\"something\",\"xml_export_triggers\":\"something\",\"xml_export_views\":\"something\",\"xml_export_contents\":\"something\",\"yaml_structure_or_data\":\"data\",\"\":null,\"lock_tables\":null,\"csv_removeCRLF\":null,\"excel_removeCRLF\":null,\"json_pretty_print\":null,\"htmlword_columns\":null,\"ods_columns\":null,\"sql_dates\":null,\"sql_relation\":null,\"sql_mime\":null,\"sql_disable_fk\":null,\"sql_views_as_tables\":null,\"sql_metadata\":null,\"sql_drop_table\":null,\"sql_if_not_exists\":null,\"sql_simple_view_export\":null,\"sql_view_current_user\":null,\"sql_or_replace_view\":null,\"sql_procedure_function\":null,\"sql_truncate\":null,\"sql_delayed\":null,\"sql_ignore\":null,\"texytext_columns\":null}');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db` varchar(64) NOT NULL DEFAULT '',
  `table` varchar(64) NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp(),
  `sqlquery` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) NOT NULL,
  `item_name` varchar(64) NOT NULL,
  `item_type` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- A tábla adatainak kiíratása `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"fakenews\",\"table\":\"users\"},{\"db\":\"fakenews\",\"table\":\"user_roles\"},{\"db\":\"fakenews\",\"table\":\"type_of_news\"},{\"db\":\"fakenews\",\"table\":\"roles\"},{\"db\":\"fakenews\",\"table\":\"news\"},{\"db\":\"fakenews\",\"table\":\"user_news_likes\"},{\"db\":\"fakenews\",\"table\":\"users_comment\"},{\"db\":\"fakenews\",\"table\":\"news_type\"},{\"db\":\"fakenews\",\"table\":\"comment\"},{\"db\":\"fakenews\",\"table\":\"hibernate_sequence\"}]');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) NOT NULL DEFAULT '',
  `master_table` varchar(64) NOT NULL DEFAULT '',
  `master_field` varchar(64) NOT NULL DEFAULT '',
  `foreign_db` varchar(64) NOT NULL DEFAULT '',
  `foreign_table` varchar(64) NOT NULL DEFAULT '',
  `foreign_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `search_name` varchar(64) NOT NULL DEFAULT '',
  `search_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT 0,
  `x` float UNSIGNED NOT NULL DEFAULT 0,
  `y` float UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `display_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `prefs` text NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

--
-- A tábla adatainak kiíratása `pma__table_uiprefs`
--

INSERT INTO `pma__table_uiprefs` (`username`, `db_name`, `table_name`, `prefs`, `last_update`) VALUES
('root', 'fakenews', 'user_roles', '{\"sorted_col\":\"`users_id` ASC\"}', '2024-11-29 14:51:25');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text NOT NULL,
  `schema_sql` text DEFAULT NULL,
  `data_sql` longtext DEFAULT NULL,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `config_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- A tábla adatainak kiíratása `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2024-11-29 22:32:26', '{\"Console\\/Mode\":\"collapse\",\"lang\":\"hu\",\"NavigationWidth\":259}');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) NOT NULL,
  `tab` varchar(64) NOT NULL,
  `allowed` enum('Y','N') NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) NOT NULL,
  `usergroup` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- A tábla indexei `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- A tábla indexei `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- A tábla indexei `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- A tábla indexei `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- A tábla indexei `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- A tábla indexei `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- A tábla indexei `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- A tábla indexei `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- A tábla indexei `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- A tábla indexei `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- A tábla indexei `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- A tábla indexei `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- A tábla indexei `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- A tábla indexei `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- A tábla indexei `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- A tábla indexei `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- A tábla indexei `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT a táblához `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Adatbázis: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
