import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'ro', 'de', 'es'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? roText = '',
    String? deText = '',
    String? esText = '',
  }) =>
      [enText, roText, deText, esText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // HomePage
  {
    '607zjzqu': {
      'en': 'Winning Starts Here!',
      'de': 'Das Gewinnen beginnt hier!',
      'es': '¡Ganar comienza aquí!',
      'ro': 'Câștigurile începe aici!',
    },
    '19doflgy': {
      'en': 'UK & EU -  Free  shipping',
      'de': 'UK & EU – Kostenloser Versand',
      'es': 'Reino Unido y UE: envío gratuito',
      'ro': 'Marea Britanie și UE - Livrare gratuită',
    },
    'tfx3osre': {
      'en': 'Brand new Prizes or Cash alternative',
      'de': 'Brandneue Preise oder Bargeldalternative',
      'es': 'Nuevos premios o alternativa en efectivo',
      'ro': 'Premii noi sau alternativă în numerar',
    },
    'e6kvshcz': {
      'en': ' Full  Transparency',
      'de': 'Volle Transparenz',
      'es': 'Transparencia total',
      'ro': 'Transparență deplină',
    },
    'mvghbqpn': {
      'en': 'Unique Features',
      'de': 'Einzigartige Funktionen',
      'es': 'Características unicas',
      'ro': 'Caracteristici unice',
    },
    'ekb4onxn': {
      'en': 'Why to Choose Us?',
      'de': 'Warum sollten Sie sich für uns entscheiden?',
      'es': '¿Por qué elegirnos?',
      'ro': 'De ce să ne alegeți?',
    },
    '44jp6pgw': {
      'en': 'Great Odds',
      'de': 'Tolle Chancen',
      'es': 'Grandes probabilidades',
      'ro': 'Cote mari',
    },
    'fcdilg9x': {
      'en': 'Limited number of tickets in each draw',
      'de': 'Begrenzte Anzahl an Losen pro Ziehung',
      'es': 'Número limitado de boletos en cada sorteo.',
      'ro': 'Număr limitat de bilete la fiecare extragere',
    },
    'gllly9xg': {
      'en': 'Transparency',
      'de': 'Transparenz',
      'es': 'Transparencia',
      'ro': 'Transparenţă',
    },
    '613ke73c': {
      'en': 'Entry counts are alwasy visible',
      'de': 'Die Anzahl der Einträge ist immer sichtbar',
      'es': 'Los recuentos de entradas siempre son visibles',
      'ro': 'Numărul de intrări este întotdeauna vizibil',
    },
    'fdjte21i': {
      'en': 'Real Winners',
      'de': 'Echte Gewinner',
      'es': 'verdaderos ganadores',
      'ro': 'Câștigători adevărați',
    },
    'r0vxd7dt': {
      'en': 'Guaranteed winners all the time.\nYou can be the next one!',
      'de': 'Garantiert immer Gewinner.\nSie können der Nächste sein!',
      'es':
          'Ganadores garantizados todo el tiempo.\n¡Tú puedes ser el próximo!',
      'ro': 'Câștigători garantați tot timpul.\nPuteți fi următorul!',
    },
    'jgevmpxu': {
      'en': 'Live Draws',
      'de': 'Live-Ziehungen',
      'es': 'Sorteos en vivo',
      'ro': 'Trageri live',
    },
    '29pme1e2': {
      'en': 'Real-time draws are broadcast live on Facebook',
      'de': 'Echtzeit-Ziehungen werden live auf Facebook übertragen',
      'es':
          'Los sorteos en tiempo real se retransmiten en directo por Facebook',
      'ro': 'Extragerile în timp real sunt transmise în direct pe Facebook',
    },
    'cy8lc9on': {
      'en': 'Free Shipping',
      'de': 'Kostenloser Versand',
      'es': 'Envío gratis',
      'ro': 'Transport gratuit',
    },
    '95ryrb57': {
      'en': 'No headaches, prizes are shipped free of charge in EU and UK',
      'de':
          'Kein Problem, die Preise werden in der EU und im Vereinigten Königreich kostenlos verschickt',
      'es':
          'Sin dolores de cabeza, los premios se envían de forma gratuita en la UE y el Reino Unido',
      'ro':
          'Fără bătăi de cap, premiile sunt livrate gratuit în UE și Marea Britanie',
    },
    'eugigkt6': {
      'en': 'Brand New',
      'de': 'Brandneu',
      'es': 'Para estrenar',
      'ro': 'Nou nouț',
    },
    '4yfehyse': {
      'en':
          'Right from the shop, directly in your hand. All our products are brand New!',
      'de':
          'Direkt aus dem Shop, direkt in Ihrer Hand. Alle unsere Produkte sind brandneu!',
      'es':
          'Directamente de la tienda, directamente en tu mano. ¡Todos nuestros productos son nuevos!',
      'ro':
          'Chiar din magazin, direct în mână. Toate produsele noastre sunt noi!',
    },
    'w2j1pzn7': {
      'en': 'How to Play',
      'de': 'Spielanleitung',
      'es': 'Cómo jugar',
      'ro': 'Cum să joci',
    },
    '6q30wknx': {
      'en': 'Active Competitions',
      'de': 'Aktive Wettbewerbe',
      'es': 'Competiciones activas',
      'ro': 'Competiții active',
    },
    '5y72zfi3': {
      'en': 'Social Media',
      'de': 'Sozialen Medien',
      'es': 'Medios de comunicación social',
      'ro': 'Social Media',
    },
    '1viy95jo': {
      'en': 'Home',
      'de': 'Heim',
      'es': 'Hogar',
      'ro': 'Acasă',
    },
  },
  // Competitions
  {
    'hhtjxm38': {
      'en': 'Competitions in progress',
      'de': 'Wettbewerbe laufen',
      'es': 'Competiciones en curso',
      'ro': 'Competiții în desfășurare',
    },
    'n1z3rooj': {
      'en':
          'Choose a competition, grab your tickets, and tune in for the Live draw for a chance to Win your dream prize for a fraction of the cost.',
      'de':
          'Wählen Sie einen Wettbewerb, schnappen Sie sich Ihre Tickets und nehmen Sie an der Live-Ziehung teil, um die Chance zu haben, Ihren Traumpreis zu einem Bruchteil der Kosten zu gewinnen.',
      'es':
          'Elija una competencia, consiga sus boletos y sintonice el sorteo en vivo para tener la oportunidad de ganar el premio de sus sueños por una fracción del costo.',
      'ro':
          'Alegeți o competiție, luați-vă biletele și conectați-vă la extragerea Live pentru a avea șansa de a câștiga premiul visat pentru o fracțiune din cost.',
    },
    'rd1ydmzh': {
      'en': 'Competitions',
      'de': 'Wettbewerbe',
      'es': 'Competiciones',
      'ro': 'Concursuri',
    },
  },
  // Winners
  {
    'aasmkdpr': {
      'en': 'Winners',
      'de': 'Gewinner',
      'es': 'Ganadores',
      'ro': 'Câștigători',
    },
    'wa42169b': {
      'en': 'Winners',
      'de': 'Gewinner',
      'es': 'Ganadores',
      'ro': 'Câștigători',
    },
  },
  // TicketsList
  {
    'gia0nfln': {
      'en': 'Tickets List',
      'de': 'Ticketliste',
      'es': 'Lista de entradas',
      'ro': 'Lista de bilete',
    },
    'ja9xicbn': {
      'en': 'Active competitions',
      'de': 'Aktive Wettbewerbe',
      'es': 'Competiciones activas',
      'ro': 'Competiții active',
    },
    'c2htmo8e': {
      'en': 'Ended competitions',
      'de': 'Beendete Wettbewerbe',
      'es': 'Competiciones finalizadas',
      'ro': 'Concursuri încheiate',
    },
    'zkummwj9': {
      'en': 'Tickets',
      'de': 'Tickets',
      'es': 'Entradas',
      'ro': 'Bilete',
    },
  },
  // TicketsListDetails
  {
    'rv5s39wg': {
      'en': 'Tickets List',
      'de': 'Ticketliste',
      'es': 'Lista de entradas',
      'ro': 'Lista de bilete',
    },
    'ldt3773q': {
      'en': '*Click on Search if results are not show!',
      'de': '*Klicken Sie auf Suchen, wenn keine Ergebnisse angezeigt werden!',
      'es': '*¡Haga clic en Buscar si no se muestran los resultados!',
      'ro': '*Faceți clic pe Căutare dacă rezultatele nu sunt afișate!',
    },
    'nblukhr0': {
      'en': 'Search name/ ticket number',
      'de': 'Suche nach Name/Ticketnummer',
      'es': 'Buscar nombre/número de billete',
      'ro': 'Căutați numele/numărul biletului',
    },
    'hbvixcz9': {
      'en': 'Search',
      'de': 'Suchen',
      'es': 'Buscar',
      'ro': 'Căutare',
    },
    'zmclyaob': {
      'en': 'Order Number',
      'de': 'Bestellnummer',
      'es': 'Número de orden',
      'ro': 'Număr de ordine',
    },
    'igpyurwm': {
      'en': 'Name',
      'de': 'Name',
      'es': 'Nombre',
      'ro': 'Nume',
    },
    '366xka4y': {
      'en': 'Ticket Number',
      'de': 'Ticketnummer',
      'es': 'Numero de ticket',
      'ro': 'Număr de bilet',
    },
    'utl9mmt2': {
      'en': 'Name',
      'de': 'Name',
      'es': 'Nombre',
      'ro': 'Nume',
    },
    '4us173vk': {
      'en': 'Ticket\nNumber',
      'de': 'Ticketnummer',
      'es': 'Boleto\nNúmero',
      'ro': 'Bilet\nNumăr',
    },
    'm6x85a7l': {
      'en': 'Home',
      'de': 'Heim',
      'es': 'Hogar',
      'ro': 'Acasă',
    },
  },
  // CompetitionsDetails
  {
    'r8qw6ab8': {
      'en':
          'Ready to win big? \nDon\'t miss out – you could be the next winner! ',
      'de':
          'Bereit für den großen Gewinn? \nVerpassen Sie es nicht – Sie könnten der nächste Gewinner sein!',
      'es':
          '¿Listo para ganar a lo grande?\n¡No te lo pierdas: ¡podrías ser el próximo ganador!',
      'ro': 'Ești gata să câștigi?\nNu rata – poți fi următorul câștigător!',
    },
    'yedq634b': {
      'en': 'Ready to win big? \n Don\'t miss out !',
      'de': 'Bereit für den großen Gewinn? \nVerpassen Sie es nicht!',
      'es': '¿Listo para ganar a lo grande?\n ¡No te lo pierdas!',
      'ro': 'Ești gata să câștigi?\n Nu rata!',
    },
    'znu3wkl5': {
      'en': 'Competition closes in:',
      'de': 'Der Wettbewerb endet am:',
      'es': 'La competencia cierra en:',
      'ro': 'Concursul se incheie in:',
    },
    '90qr17ag': {
      'en':
          'Competition will close early if all entries are sold prior to end date. ',
      'de':
          'Der Wettbewerb endet vorzeitig, wenn alle Einträge vor dem Enddatum verkauft werden.',
      'es':
          'La competencia cerrará temprano si todas las entradas se venden antes de la fecha de finalización.',
      'ro':
          'Competiția se va închide mai devreme dacă toate înscrierile sunt vândute înainte de data de încheiere.',
    },
    'ac7gztk9': {
      'en': 'The draws takes place live on',
      'de': 'Die Ziehungen finden live statt auf',
      'es': 'Los sorteos se realizan en vivo',
      'ro': 'Deciderea castigatorului are loc în direct pe',
    },
    'p6aas6s9': {
      'en': ' Facebook ',
      'de': 'Facebook',
      'es': 'Facebook',
      'ro': 'Facebook',
    },
    '739tzeyx': {
      'en': 'and ',
      'de': 'Und',
      'es': 'y',
      'ro': 'și',
    },
    'zppzs1ch': {
      'en': 'TikTok',
      'de': 'TikTok',
      'es': 'TikTok',
      'ro': 'TikTok',
    },
    '4rrqq7kn': {
      'en': '  entries',
      'de': 'Einträge',
      'es': 'entradas',
      'ro': 'intrări',
    },
    'wlosy5ay': {
      'en': 'Max  ',
      'de': 'Max',
      'es': 'máx.',
      'ro': 'Max',
    },
    '4hu3teus': {
      'en': '  per person',
      'de': 'pro Person',
      'es': 'por persona',
      'ro': 'pe persoană',
    },
    'zva8ldzp': {
      'en': 'Tickets sold: ',
      'de': 'Verkaufte Tickets:',
      'es': 'Entradas vendidas:',
      'ro': 'Biletele vândute:',
    },
    'iiik4e5v': {
      'en': 'Price',
      'de': 'Preis',
      'es': 'Precio',
      'ro': 'Preț',
    },
    'z97190y6': {
      'en': 'Enter Now',
      'de': 'Trete jetzt ein',
      'es': 'Entra ahora',
      'ro': 'Intra acum',
    },
    '4bcz89a0': {
      'en': 'Free Postal Entry',
      'de': 'Kostenloser Postversand',
      'es': 'Entrada postal gratuita',
      'ro': 'Intrare poștală gratuită',
    },
    'g24gl6bv': {
      'en': 'Competition closes in:',
      'de': 'Der Wettbewerb endet am:',
      'es': 'La competencia cierra en:',
      'ro': 'Competiția se incheie in:',
    },
    'rcbqj2ed': {
      'en':
          'Competition will close early if all entries are sold prior to end date. ',
      'de':
          'Der Wettbewerb endet vorzeitig, wenn alle Einträge vor dem Enddatum verkauft werden.',
      'es':
          'La competencia cerrará temprano si todas las entradas se venden antes de la fecha de finalización.',
      'ro':
          'Competiția se va închide mai devreme dacă toate înscrierile sunt vândute înainte de data de încheiere.',
    },
    'tr4po93b': {
      'en': 'The draws takes place live on',
      'de': 'Die Ziehungen finden live statt auf',
      'es': 'Los sorteos se realizan en vivo',
      'ro': 'Deciderea castigatorului are loc în direct pe',
    },
    '1vhadmc7': {
      'en': ' Facebook ',
      'de': 'Facebook',
      'es': 'Facebook',
      'ro': 'Facebook',
    },
    'btza3eoj': {
      'en': 'and ',
      'de': 'Und',
      'es': 'y',
      'ro': 'și',
    },
    '3iuh2hhc': {
      'en': 'TikTok!',
      'de': 'Tik Tok',
      'es': 'Tik Tok!',
      'ro': 'Tik Tok',
    },
    'ig48yz3y': {
      'en': '  entries',
      'de': 'Einträge',
      'es': 'entradas',
      'ro': 'Bilete',
    },
    '9n6yfny4': {
      'en': 'Max  ',
      'de': 'Max',
      'es': 'máx.',
      'ro': 'Max',
    },
    'gxha0efm': {
      'en': '  per person',
      'de': 'pro Person',
      'es': 'por persona',
      'ro': 'pe persoană',
    },
    '9ydtnt8z': {
      'en': 'Enter Now',
      'de': 'Trete jetzt ein',
      'es': 'Entra ahora',
      'ro': 'Intra acum',
    },
    '73419qix': {
      'en': 'Free Postal Entry',
      'de': 'Kostenloser Postversand',
      'es': 'Entrada postal gratuita',
      'ro': 'Intrare poștală gratuită',
    },
    'yuc13x5l': {
      'en': 'Description',
      'de': 'Beschreibung',
      'es': 'Descripción',
      'ro': 'Descriere',
    },
    '2phuajmn': {
      'en': 'See more  active competitions',
      'de': 'Weitere aktive Wettbewerbe anzeigen',
      'es': 'Ver más competiciones activas',
      'ro': 'Vedeți mai multe competiții active',
    },
    'kgaeyuzq': {
      'en': 'Home',
      'de': 'Heim',
      'es': 'Hogar',
      'ro': 'Acasă',
    },
  },
  // Login
  {
    'tvzxzihx': {
      'en': 'Create Account',
      'de': 'Benutzerkonto erstellen',
      'es': 'Crear una cuenta',
      'ro': 'Creează cont',
    },
    'q6aoqrsq': {
      'en': 'Create Account',
      'de': 'Benutzerkonto erstellen',
      'es': 'Crear una cuenta',
      'ro': 'Creează cont',
    },
    '0utp3k2c': {
      'en': 'Let\'s get started by filling out the form below.',
      'de': 'Beginnen wir mit dem Ausfüllen des untenstehenden Formulars.',
      'es': 'Comencemos completando el formulario a continuación.',
      'ro': 'Să începem prin a completa formularul de mai jos.',
    },
    'pwstrise': {
      'en': 'Email',
      'de': 'Email',
      'es': 'Correo electrónico',
      'ro': 'E-mail',
    },
    'j16o8xnd': {
      'en': 'Password',
      'de': 'Passwort',
      'es': 'Contraseña',
      'ro': 'Parola',
    },
    'ok7m7klz': {
      'en': 'Confirm Password',
      'de': 'Bestätige das Passwort',
      'es': 'confirmar Contraseña',
      'ro': 'Confirmă parola',
    },
    't9m5etdx': {
      'en': 'Get Started',
      'de': 'Loslegen',
      'es': 'Empezar',
      'ro': 'Incepe',
    },
    'k27cwkqu': {
      'en': 'Or sign up with',
      'de': 'Oder melden Sie sich an',
      'es': 'O regístrate con',
      'ro': 'Sau înscrieți-vă cu',
    },
    'nxkdqosr': {
      'en': 'Log In',
      'de': 'Anmeldung',
      'es': 'Acceso',
      'ro': 'Log in',
    },
    'r8icx119': {
      'en': 'Welcome Back',
      'de': 'Willkommen zurück',
      'es': 'Bienvenido de nuevo',
      'ro': 'Bine ai revenit',
    },
    '3mdfi8eh': {
      'en': 'Fill out the information below in order to access your account.',
      'de':
          'Füllen Sie die folgenden Informationen aus, um auf Ihr Konto zuzugreifen.',
      'es': 'Complete la información a continuación para acceder a su cuenta.',
      'ro': 'Completați informațiile de mai jos pentru a vă accesa contul.',
    },
    '9gafx513': {
      'en': 'Email',
      'de': 'Email',
      'es': 'Correo electrónico',
      'ro': 'E-mail',
    },
    '0244nmn8': {
      'en': 'Password',
      'de': 'Passwort',
      'es': 'Contraseña',
      'ro': 'Parola',
    },
    'ldip1erz': {
      'en': 'Sign In',
      'de': 'Anmelden',
      'es': 'Iniciar sesión',
      'ro': 'Conectare',
    },
    '480ijnf3': {
      'en': 'Or sign in with',
      'de': 'Oder melden Sie sich mit an',
      'es': 'O inicia sesión con',
      'ro': 'Sau conectați-vă cu',
    },
    'w1fjg56y': {
      'en': 'Forgot Password?',
      'de': 'Passwort vergessen?',
      'es': '¿Has olvidado tu contraseña?',
      'ro': 'Aţi uitat parola?',
    },
    'ne5u4or4': {
      'en': 'Home',
      'de': 'Heim',
      'es': 'Hogar',
      'ro': 'Acasă',
    },
  },
  // FAQ
  {
    'wr5tz0te': {
      'en': 'FAQS',
      'de': 'Häufig gestellte Fragen',
      'es': 'Preguntas frecuentes',
      'ro': 'Întrebări frecvente',
    },
    '0l33ys2a': {
      'en': 'How will I be notified if I win?',
      'de': 'Wie werde ich benachrichtigt, wenn ich gewinne?',
      'es': '¿Cómo me notificarán si gano?',
      'ro': 'Cum voi fi anunțat dacă câștig?',
    },
    'pf6tslyp': {
      'en':
          'The winner will be notified via telephone or email within 7 days of the competition\'s closing date. \nIf you update any of your contact information before the closing date, please inform us. \nWe will attempt to reach you using the provided contact details. \nIf we are unable to reach you within 14 days of the closing date, we reserve the right to select another winner, and you forfeit your claim to the prize.',
      'de':
          'Der Gewinner wird innerhalb von 7 Tagen nach Ende des Gewinnspiels per Telefon oder E-Mail benachrichtigt. \nWenn Sie Ihre Kontaktinformationen vor dem Einsendeschluss aktualisieren, informieren Sie uns bitte. \nWir werden versuchen, Sie über die angegebenen Kontaktdaten zu erreichen. \nWenn wir Sie nicht innerhalb von 14 Tagen nach Einsendeschluss erreichen können, behalten wir uns das Recht vor, einen anderen Gewinner auszuwählen, und Sie verlieren Ihren Anspruch auf den Preis.',
      'es':
          'El ganador será notificado por teléfono o correo electrónico dentro de los 7 días posteriores a la fecha de cierre del concurso. \nSi actualiza su información de contacto antes de la fecha de cierre, infórmenos. \nIntentaremos comunicarnos con usted utilizando los datos de contacto proporcionados. \nSi no podemos comunicarnos con usted dentro de los 14 días posteriores a la fecha límite, nos reservamos el derecho de seleccionar otro ganador y usted perderá su derecho al premio.',
      'ro':
          'Câștigătorul va fi anunțat prin telefon sau e-mail în termen de 7 zile de la data încheierii concursului. \nDacă actualizați oricare dintre informațiile dvs. de contact înainte de data limită, vă rugăm să ne informați. \nVom încerca să vă contactăm folosind datele de contact furnizate. \nDacă nu vă putem contacta în termen de 14 zile de la data închiderii, ne rezervăm dreptul de a selecta un alt câștigător, iar dvs. pierdeți dreptul la premiu.',
    },
    '5lkekbwf': {
      'en': 'How can I find out who the winner is?',
      'de': 'Wie kann ich herausfinden, wer der Gewinner ist?',
      'es': '¿Cómo puedo saber quién es el ganador?',
      'ro': 'Cum pot afla cine este câștigătorul?',
    },
    'fs6zngxm': {
      'en':
          'Please navigate to the Winners page for a comprehensive list of all our past winners.\nAdditionally, you can view the posts of the social media  pages.',
      'de':
          'Bitte navigieren Sie zur Seite „Gewinner“, um eine umfassende Liste aller unserer früheren Gewinner zu erhalten.\nDarüber hinaus können Sie sich die Beiträge der Social-Media-Seiten ansehen.',
      'es':
          'Navegue a la página de Ganadores para obtener una lista completa de todos nuestros ganadores anteriores.\nAdemás, puede ver las publicaciones de las páginas de redes sociales.',
      'ro':
          'Vă rugăm să navigați la pagina Câștigători pentru o listă cuprinzătoare a tuturor câștigătorilor noștri din trecut.\nÎn plus, puteți vedea postările paginilor de pe rețelele sociale.',
    },
    '0o9iri23': {
      'en': 'What is the probability of my winning?',
      'de': 'Wie hoch ist die Wahrscheinlichkeit, dass ich gewinne?',
      'es': '¿Cuál es la probabilidad de que gane?',
      'ro': 'Care este probabilitatea de a câștiga?',
    },
    '571lbsxf': {
      'en':
          'The likelihood of winning varies depending on the maximum number of entries allowed in each competition. \n\nFor instance, if the maximum entries are capped at 2000 and you purchase one entry with the correct answer, your chances of winning would be no worse than 1 in 2000.\n\nTo enhance your chances of winning, you can opt to acquire more entries.\n For example, if you buy 10 entries in the same scenario and provide the correct answer, your odds of winning would be no worse than 1 in 200.\n\nIt\'s essential to understand that we use the term \"no worse than\" because the total number of tickets sold by the competition\'s closing time cannot be predetermined.',
      'de':
          'Die Gewinnwahrscheinlichkeit variiert je nach der maximal zulässigen Teilnehmerzahl für jeden Wettbewerb. \n\nWenn beispielsweise die maximale Anzahl an Einsendungen auf 2.000 begrenzt ist und Sie einen Eintrag mit der richtigen Antwort kaufen, sind Ihre Gewinnchancen nicht schlechter als 1 zu 2.000.\n\nUm Ihre Chancen zu erhöhen Wenn Sie gewinnen möchten, können Sie sich für den Erwerb weiterer Einträge entscheiden.\n Wenn Sie beispielsweise 10 Einträge im selben Szenario kaufen und die richtige Antwort geben, sind Ihre Gewinnchancen nicht schlechter als 1 zu 200.\n\nEs ist wichtig zu verstehen, dass wir den Begriff „nicht schlechter als“ verwenden, da die Gesamtzahl der bis zum Ende des Wettbewerbs verkauften Tickets nicht vorherbestimmt werden kann.',
      'es':
          'La probabilidad de ganar varía dependiendo del número máximo de inscripciones permitidas en cada concurso. \n\nPor ejemplo, si el máximo de entradas tiene un límite de 2000 y usted compra una entrada con la respuesta correcta, sus posibilidades de ganar no serán peores que 1 entre 2000.\n\nPara mejorar sus posibilidades de ganar, puede optar por adquirir más entradas.\n Por ejemplo, si compra 10 entradas en el mismo escenario y proporciona la respuesta correcta, sus probabilidades de ganar no serán peores que 1 entre 200.\n\nEs fundamental comprender que utilizamos el término \"no peor que\" porque no se puede predeterminar el número total de entradas vendidas antes del cierre del concurso.',
      'ro':
          'Probabilitatea de câștig variază în funcție de numărul maxim de înscrieri permis în fiecare competiție. \n\nDe exemplu, dacă numărul maxim de intrări este limitat la 2000 și achiziționați o înregistrare cu răspunsul corect, șansele dvs. de câștig nu ar fi mai mici de 1 în 2000.\n\nPentru a vă spori șansele de câștig, puteți opta pentru a obține mai multe intrări.\n De exemplu, dacă cumpărați 10 intrări în același scenariu și oferiți răspunsul corect, șansele dvs. de câștig nu ar fi mai mici de 1 la 200.\n\nEste esențial să înțelegem că folosim termenul „nu mai rău decât” deoarece numărul total de bilete vândute până la ora de închidere a competiției nu poate fi predeterminat.',
    },
    '6po76kyk': {
      'en': 'Will the prize be delivered to my address?',
      'de': 'Wird der Gewinn an meine Adresse geliefert?',
      'es': '¿El premio será entregado en mi dirección?',
      'ro': 'Va fi livrat premiul la adresa mea?',
    },
    '4m24gues': {
      'en':
          'Yes, the prize will be shipped to your address in any EU country or the UK.\nIf customs fees or taxes are required for certain countries, the winner will be responsible for covering these expenses.',
      'de':
          'Ja, der Preis wird an Ihre Adresse in einem beliebigen EU-Land oder im Vereinigten Königreich versandt.\nFalls für bestimmte Länder Zollgebühren oder Steuern anfallen, ist der Gewinner für die Deckung dieser Kosten verantwortlich.',
      'es':
          'Sí, el premio se enviará a su dirección en cualquier país de la UE o el Reino Unido.\nSi se requieren tasas o impuestos aduaneros para ciertos países, el ganador será responsable de cubrir estos gastos.',
      'ro':
          'Da, premiul va fi expediat la adresa dumneavoastră în orice țară din UE sau Marea Britanie.\nDacă sunt necesare taxe vamale sau taxe pentru anumite țări, câștigătorul va fi responsabil pentru acoperirea acestor cheltuieli.',
    },
    'iv5sjk64': {
      'en': 'Where can I find my email confirming ?',
      'de': 'Wo finde ich meine E-Mail-Bestätigung?',
      'es': '¿Dónde puedo encontrar mi correo electrónico de confirmación?',
      'ro': 'Unde pot găsi e-mailul meu de confirmare?',
    },
    'tgfr5shn': {
      'en':
          'After purchasing your tickets, you\'ll receive a confirmation email containing your entry details.\nThis usually happens within 5-10 minutes, though during busy periods, it might take a few hours. ',
      'de':
          'Nach dem Kauf Ihrer Tickets erhalten Sie eine Bestätigungs-E-Mail mit Ihren Eintrittsdaten.\nDies geschieht normalerweise innerhalb von 5–10 Minuten, in Stoßzeiten kann es jedoch einige Stunden dauern.',
      'es':
          'Después de comprar sus boletos, recibirá un correo electrónico de confirmación con los detalles de su entrada.\nEsto generalmente sucede entre 5 y 10 minutos, aunque durante los períodos de mayor actividad, puede demorar algunas horas.',
      'ro':
          'După achiziționarea biletelor, veți primi un e-mail de confirmare care conține detaliile de intrare.\nAcest lucru se întâmplă de obicei în 5-10 minute, deși în perioadele aglomerate, poate dura câteva ore.',
    },
    '434bqgmt': {
      'en': 'How I can participate in the competition?',
      'de': 'Wie kann ich am Wettbewerb teilnehmen?',
      'es': '¿Cómo puedo participar en el concurso?',
      'ro': 'Cum pot participa la concurs?',
    },
    'rlozlfuw': {
      'en':
          'To participate in the competition:\n\na. Visit the website and select the competition you want to join.\nb. Provide your answer to the competition question.\nc. Choose the desired number of entries and proceed to checkout.\nd. Log in or register if you haven\'t already.\ne. Agree to the Terms and Conditions and complete your purchase.\n',
      'de':
          'Um am Wettbewerb teilzunehmen:\n\na. Besuchen Sie die Website und wählen Sie den Wettbewerb aus, an dem Sie teilnehmen möchten.\nb. Geben Sie Ihre Antwort auf die Wettbewerbsfrage an.\nc. Wählen Sie die gewünschte Anzahl an Einträgen und gehen Sie zur Kasse.\nd. Melden Sie sich an oder registrieren Sie sich, falls Sie dies noch nicht getan haben.\ne. Akzeptieren Sie die Allgemeinen Geschäftsbedingungen und schließen Sie Ihren Kauf ab.',
      'es':
          'Para participar en el concurso:\n\na. Visite el sitio web y seleccione la competencia a la que desea unirse.\nb. Proporcione su respuesta a la pregunta del concurso.\nc. Elija el número deseado de entradas y proceda al pago.\nd. Inicie sesión o regístrese si aún no lo ha hecho.\ne. Acepte los Términos y condiciones y complete su compra.',
      'ro':
          'Pentru a participa la concurs:\n\na. Vizitați site-ul web și selectați competiția la care doriți să vă alăturați.\nb. Furnizați răspunsul dvs. la întrebarea concurenței.\nc. Alegeți numărul dorit de intrări și treceți la finalizare.\nd. Conectați-vă sau înregistrați-vă dacă nu ați făcut-o deja.\ne. Acceptați Termenii și condițiile și finalizați achiziția.',
    },
    '4umqwui5': {
      'en': 'Where can I find my ticket numbers?',
      'de': 'Wo finde ich meine Ticketnummern?',
      'es': '¿Dónde puedo encontrar los números de mis billetes?',
      'ro': 'Unde pot găsi numerele mele de bilet?',
    },
    'czv8pgyt': {
      'en': 'Can be found in My Tickets page\n',
      'de': ' Zu finden auf der Seite „Meine Tickets“.',
      'es': 'Se puede encontrar en la página Mis entradas.',
      'ro': ' Pot  fi găsite în pagina Biletele mele',
    },
    '0qij55lc': {
      'en': 'Where can I find my orders?',
      'de': 'Wo finde ich meine Bestellungen?',
      'es': '¿Dónde puedo encontrar mis pedidos?',
      'ro': 'Unde pot găsi comenzile mele?',
    },
    '94yaboem': {
      'en':
          '1. Your order confirmation and details will be sent by email afer purchasing to you. \n2. Can be found in My Orders page\n',
      'de':
          '1. Ihre Bestellbestätigung und Einzelheiten werden Ihnen nach dem Kauf per E-Mail zugesandt. \n2. Zu finden auf der Seite „Meine Bestellungen“.',
      'es':
          '1. La confirmación y los detalles de su pedido se le enviarán por correo electrónico después de realizar la compra. \n2. Se puede encontrar en la página Mis pedidos.',
      'ro':
          '1. Confirmarea comenzii și detaliile dumneavoastră vă vor fi trimise prin e-mail după cumpărare. \n2. Poate fi găsit în pagina Comenzile mele',
    },
    '7xdgbsz6': {
      'en':
          'What occurs if all tickets are not sold by the end of the allotted time?',
      'de':
          'Was passiert, wenn nicht alle Tickets bis zum Ablauf der vorgegebenen Zeit verkauft sind?',
      'es':
          '¿Qué ocurre si no se venden todas las entradas al final del tiempo asignado?',
      'ro':
          'Ce se întâmplă dacă toate biletele nu sunt vândute până la sfârșitul timpului alocat?',
    },
    'yd7d25de': {
      'en':
          'We reserve the right to extend the competition until we have sold 80% of the total number of tickets available.\n',
      'de':
          'Wir behalten uns das Recht vor, das Gewinnspiel zu verlängern, bis wir 80 % der Gesamtzahl der verfügbaren Tickets verkauft haben.',
      'es':
          'Nos reservamos el derecho de ampliar el concurso hasta haber vendido el 80% del total de entradas disponibles.',
      'ro':
          'Ne rezervăm dreptul de a prelungi competiția până când vom vinde 80% din numărul total de bilete disponibile.',
    },
    'tfqz9a63': {
      'en': 'Is it possible to receive a refund for my entry fee?',
      'de': 'Ist eine Rückerstattung meines Startgeldes möglich?',
      'es': '¿Es posible recibir un reembolso por mi tarifa de inscripción?',
      'ro': 'Este posibil să primesc o rambursare pentru taxa mea de intrare?',
    },
    'ubn5e07m': {
      'en': 'Entry fees are non-refundable according to our policy.\n',
      'de':
          'Teilnahmegebühren sind gemäß unserer Richtlinie nicht erstattungsfähig.',
      'es':
          'Las tarifas de inscripción no son reembolsables de acuerdo con nuestra política.',
      'ro': 'Taxele de intrare nu sunt rambursabile conform politicii noastre.',
    },
    '1rzq51ur': {
      'en': 'How is the winner selected?',
      'de': 'Wie wird der Gewinner ausgewählt?',
      'es': '¿Cómo se selecciona al ganador?',
      'ro': 'Cum este selectat câștigătorul?',
    },
    'q1n94rtb': {
      'en':
          'Once all entries are logged and the draw is closed we will utilize Google\'s random number generator to select a winning number LIVE on Facebook.\n ',
      'de':
          'Sobald alle Einsendungen protokolliert sind und die Verlosung abgeschlossen ist, nutzen wir den Zufallszahlengenerator von Google, um LIVE auf Facebook eine Gewinnzahl auszuwählen.',
      'es':
          'Una vez que se hayan registrado todas las entradas y se haya cerrado el sorteo, utilizaremos el generador de números aleatorios de Google para seleccionar un número ganador EN VIVO en Facebook.',
      'ro':
          'Odată ce toate înscrierile sunt înregistrate și tragerea la sorți este închisă, vom folosi generatorul de numere aleatorii Google pentru a selecta un număr câștigător LIVE pe Facebook.',
    },
    'o0gk19dy': {
      'en': 'I still haven\'t found the answer to my question here.',
      'de': 'Ich habe hier immer noch keine Antwort auf meine Frage gefunden.',
      'es': 'Todavía no he encontrado la respuesta a mi pregunta aquí.',
      'ro': 'Inca nu am gasit aici raspunsul la intrebarea mea.',
    },
    'q0ml31x6': {
      'en':
          'If you have any questions that have not been answered here, please email us at contact@bountyfever.com and we will happily answer them for you.\n ',
      'de':
          'Wenn Sie Fragen haben, die hier nicht beantwortet wurden, senden Sie uns bitte eine E-Mail an contact@bountyfever.com und wir werden diese gerne für Sie beantworten.',
      'es':
          'Si tiene alguna pregunta que no haya sido respondida aquí, envíenos un correo electrónico a contact@bountyfever.com y estaremos encantados de responderla por usted.',
      'ro':
          'Dacă aveți întrebări la care nu s-a răspuns aici, vă rugăm să ne trimiteți un e-mail la contact@bountyfever.com și vă vom răspunde cu plăcere.',
    },
    'tun6hoio': {
      'en': 'Home',
      'de': 'Heim',
      'es': 'Hogar',
      'ro': 'Acasă',
    },
  },
  // mytickets
  {
    '63w6nu3l': {
      'en': 'My Tickets',
      'de': 'Meine Tickets',
      'es': 'Mis entradas',
      'ro': 'Biletele mele',
    },
    '42mq7ee7': {
      'en': '        Active \nCompetitions',
      'de': 'Aktive \nWettbewerbe',
      'es': '\nCompeticiones activas',
      'ro': '\nCompetiții active',
    },
    'dhbjf8qf': {
      'en': 'Total Active Competitions ',
      'de': 'Gesamtzahl der aktiven Wettbewerbe',
      'es': 'Competiciones activas totales',
      'ro': 'Total Competiții active',
    },
    'sdz3rbgz': {
      'en': 'Total  Tickets ',
      'de': 'Gesamtzahl der Tickets',
      'es': 'Entradas totales',
      'ro': 'Total bilete',
    },
    'omi7hhzw': {
      'en': 'Tickets Details ',
      'de': 'Ticketdetails',
      'es': 'Detalles de las entradas',
      'ro': 'Detalii bilete',
    },
    'xphjased': {
      'en': 'Competition Name:  ',
      'de': 'Wettbewerbsname:',
      'es': 'Nombre de la competencia:',
      'ro': 'Numele competiției:',
    },
    'wtsw9670': {
      'en': 'Competition Name:',
      'de': 'Wettbewerbsname:',
      'es': 'Nombre de la competencia:',
      'ro': 'Numele competiției:',
    },
    'da8dd9n1': {
      'en': 'Number of tickets:  ',
      'de': 'Anzahl Tickets:',
      'es': 'Número de entradas:',
      'ro': 'Numar de bilete:',
    },
    'p8aq4sy3': {
      'en': 'See Tickets ',
      'de': 'Siehe Tickets',
      'es': 'Ver Entradas',
      'ro': 'Vezi Bilete',
    },
    '0n6kxqgo': {
      'en': '       Ended \nCompetitions',
      'de': 'Beendete \nWettbewerbe',
      'es': '\nConcursos finalizados',
      'ro': 'Competiții încheiate',
    },
    '25wcnd7r': {
      'en': 'Total Ended Competitions ',
      'de': 'Gesamtzahl beendeter Wettbewerbe',
      'es': 'Total de competiciones finalizadas',
      'ro': 'Total competiții încheiate',
    },
    'je5yx6tc': {
      'en': 'Total  Tickets ',
      'de': 'Gesamtzahl der Tickets',
      'es': 'Entradas totales',
      'ro': 'Total bilete',
    },
    'kh7k91dv': {
      'en': 'Tickets Details ',
      'de': 'Ticketdetails',
      'es': 'Detalles de las entradas',
      'ro': 'Detalii bilete',
    },
    'nzvftch2': {
      'en': 'Competition Name: ',
      'de': 'Wettbewerbsname:',
      'es': 'Nombre de la competencia:',
      'ro': 'Numele competiției:',
    },
    '1wfpcb53': {
      'en': 'Competition Name: ',
      'de': 'Wettbewerbsname:',
      'es': 'Nombre de la competencia:',
      'ro': 'Numele competiției:',
    },
    '4az1ec0r': {
      'en': 'Number of tickets: ',
      'de': 'Anzahl Tickets:',
      'es': 'Número de entradas:',
      'ro': 'Numar de bilete:',
    },
    '25d5tq7a': {
      'en': 'Number of tickets: ',
      'de': 'Anzahl Tickets:',
      'es': 'Número de entradas:',
      'ro': 'Numar de bilete:',
    },
    '7zb3klqj': {
      'en': 'Tickets : ',
      'de': 'Tickets:',
      'es': 'Entradas :',
      'ro': 'Bilete:',
    },
    'ee0t1ljj': {
      'en': 'Tickets :',
      'de': 'Tickets:',
      'es': 'Entradas :',
      'ro': 'Bilete:',
    },
    'frlu1cot': {
      'en': 'Home',
      'de': 'Heim',
      'es': 'Hogar',
      'ro': 'Acasă',
    },
  },
  // myaccount
  {
    '4pf99dbs': {
      'en': 'My Account',
      'de': 'Mein Konto',
      'es': 'Mi cuenta',
      'ro': 'Contul meu',
    },
    '2x3fa3af': {
      'en': 'Edit Profile',
      'de': 'Profil bearbeiten',
      'es': 'Editar perfil',
      'ro': 'Editează profilul',
    },
    '8l4nzyl6': {
      'en': 'Home',
      'de': 'Heim',
      'es': 'Hogar',
      'ro': 'Acasă',
    },
  },
  // myorders
  {
    's9h8hcab': {
      'en': 'My Orders',
      'de': 'Meine Bestellungen',
      'es': 'Mis ordenes',
      'ro': 'Comenzile mele',
    },
    '2om2s2j4': {
      'en': 'Number of Orders Placed',
      'de': 'Anzahl der aufgegebenen Bestellungen',
      'es': 'Número de pedidos realizados',
      'ro': 'Numărul de comenzi plasate',
    },
    '6sx3hndy': {
      'en': 'Amount Spent',
      'de': 'Der bezahlte Betrag',
      'es': 'Cantidad gastada',
      'ro': 'Suma cheltuită',
    },
    '65zakugt': {
      'en': '£',
      'de': '£',
      'es': '£',
      'ro': '£',
    },
    'uid98xuo': {
      'en': 'Orders Details ',
      'de': 'Bestelldetails',
      'es': 'Detalles de pedidos',
      'ro': 'Detalii comenzi',
    },
    'h89zsuy5': {
      'en': 'Competition Name:  ',
      'de': 'Wettbewerbsname:',
      'es': 'Nombre de la competencia:',
      'ro': 'Numele competiției:',
    },
    'sl6uw4vs': {
      'en': 'Competition Name:',
      'de': 'Wettbewerbsname:',
      'es': 'Nombre de la competencia:',
      'ro': 'Numele competiției:',
    },
    'fp0c6q92': {
      'en': 'Date: ',
      'de': 'Datum:',
      'es': 'Fecha:',
      'ro': 'Data:',
    },
    'kic11fa7': {
      'en': 'Tickets',
      'de': 'Tickets',
      'es': 'Entradas',
      'ro': 'bilete',
    },
    'hw55mzhp': {
      'en': 'Amount :  ',
      'de': 'Menge :',
      'es': 'Cantidad :',
      'ro': 'Cantitate :',
    },
    'ctlzwf2n': {
      'en': ' £',
      'de': '£',
      'es': '£',
      'ro': '£',
    },
    '7que8gpi': {
      'en': 'Invoice : ',
      'de': 'Rechnung :',
      'es': 'Factura :',
      'ro': 'Factura fiscala :',
    },
    'hzw5vbm1': {
      'en': 'Link',
      'de': 'Verknüpfung',
      'es': 'Enlace',
      'ro': 'Legătură',
    },
    '6toxby7g': {
      'en': 'Number of tickets:  ',
      'de': 'Anzahl Tickets:',
      'es': 'Número de entradas:',
      'ro': 'Numar de bilete:',
    },
    '1ukiq2we': {
      'en': 'Home',
      'de': 'Heim',
      'es': 'Hogar',
      'ro': 'Acasă',
    },
  },
  // editprofile
  {
    '05seac0m': {
      'en': 'Update Profile',
      'de': 'Profil aktualisieren',
      'es': 'Actualización del perfil',
      'ro': 'Actualizare profil',
    },
    'gjibn6hl': {
      'en': 'Update Profile',
      'de': 'Profil aktualisieren',
      'es': 'Actualización del perfil',
      'ro': 'Actualizare profil',
    },
    'pr6rwntg': {
      'en': 'Update your informations',
      'de': 'Aktualisieren Sie Ihre Informationen',
      'es': 'Actualiza tu información',
      'ro': 'Actualizați-vă informațiile',
    },
    'wo29ihuo': {
      'en':
          'Please kindly note that the information provided below is crucial for the shipping of your prize. \nIt\'s important that the details match those on your ID to ensure eligibility. \nThank you for your understanding!',
      'de':
          'Bitte beachten Sie, dass die unten angegebenen Informationen für den Versand Ihres Gewinns von entscheidender Bedeutung sind. \nEs ist wichtig, dass die Angaben mit denen auf Ihrem Ausweis übereinstimmen, um die Berechtigung sicherzustellen. \nVielen Dank für Ihr Verständnis!',
      'es':
          'Tenga en cuenta que la información proporcionada a continuación es crucial para el envío de su premio. \nEs importante que los detalles coincidan con los de su identificación para garantizar la elegibilidad. \n¡Gracias por su comprensión!',
      'ro':
          'Vă rugăm să rețineți că informațiile furnizate mai jos sunt cruciale pentru expedierea premiului dvs. \nEste important ca detaliile să se potrivească cu cele de pe actul dvs. de identitate pentru a vă asigura eligibilitatea. \nVă mulțumim pentru înțelegere!',
    },
    'xt266056': {
      'en': 'Your Name',
      'de': 'Ihr Name',
      'es': 'Su nombre',
      'ro': 'Numele dumneavoastră',
    },
    'ed73puto': {
      'en': 'Your Name',
      'de': 'Ihr Name',
      'es': 'Su nombre',
      'ro': 'Numele dumneavoastră',
    },
    '0qzrul87': {
      'en': 'Adress',
      'de': 'Ein Kleid',
      'es': 'Dirección',
      'ro': 'Adresa',
    },
    '0kzk07z4': {
      'en': 'Your Adress',
      'de': 'Deine Adresse',
      'es': 'Tu direccion',
      'ro': 'Adresa dvs',
    },
    '1anoz9ft': {
      'en': 'City',
      'de': 'Stadt',
      'es': 'Ciudad',
      'ro': 'Oraș',
    },
    'd6ulpq79': {
      'en': 'City your are living in',
      'de': 'Stadt, in der Sie leben',
      'es': 'Ciudad en la que vives',
      'ro': 'Orașul în care locuiești',
    },
    'p32kv84b': {
      'en': 'Country',
      'de': 'Land',
      'es': 'País',
      'ro': 'Țară',
    },
    '70v3ro25': {
      'en': 'Country you are living in',
      'de': 'Land, in dem Sie leben',
      'es': 'País en el que vives',
      'ro': 'Țara în care trăiești',
    },
    'ww0wja4f': {
      'en': 'Phone Number',
      'de': 'Telefonnummer',
      'es': 'Número de teléfono',
      'ro': 'Număr de telefon',
    },
    'leixfs3d': {
      'en': 'Phone Number',
      'de': 'Telefonnummer',
      'es': 'Número de teléfono',
      'ro': 'Număr de telefon',
    },
    'xz376gzd': {
      'en': 'Field is required',
      'de': 'Feld ist erforderlich',
      'es': 'Se requiere campo',
      'ro': 'Câmpul este obligatoriu',
    },
    'hnufp6yw': {
      'en': 'Please choose an option from the dropdown',
      'de': 'Bitte wählen Sie eine Option aus der Dropdown-Liste aus',
      'es': 'Por favor elija una opción del menú desplegable',
      'ro': 'Vă rugăm să alegeți o opțiune din meniul drop-down',
    },
    'ja5bunf9': {
      'en': 'Field is required',
      'de': 'Feld ist erforderlich',
      'es': 'Se requiere campo',
      'ro': 'Câmpul este obligatoriu',
    },
    'ovkpg7xg': {
      'en': 'Please choose an option from the dropdown',
      'de': 'Bitte wählen Sie eine Option aus der Dropdown-Liste aus',
      'es': 'Por favor elija una opción del menú desplegable',
      'ro': 'Vă rugăm să alegeți o opțiune din meniul drop-down',
    },
    '5dofp955': {
      'en': 'Field is required',
      'de': 'Feld ist erforderlich',
      'es': 'Se requiere campo',
      'ro': 'Câmpul este obligatoriu',
    },
    'kf7p09h5': {
      'en': 'Please choose an option from the dropdown',
      'de': 'Bitte wählen Sie eine Option aus der Dropdown-Liste aus',
      'es': 'Por favor elija una opción del menú desplegable',
      'ro': 'Vă rugăm să alegeți o opțiune din meniul drop-down',
    },
    '5dzskc8w': {
      'en': 'Field is required',
      'de': 'Feld ist erforderlich',
      'es': 'Se requiere campo',
      'ro': 'Câmpul este obligatoriu',
    },
    '4k8to5wd': {
      'en': 'Please choose an option from the dropdown',
      'de': 'Bitte wählen Sie eine Option aus der Dropdown-Liste aus',
      'es': 'Por favor elija una opción del menú desplegable',
      'ro': 'Vă rugăm să alegeți o opțiune din meniul drop-down',
    },
    '8k0rptgv': {
      'en': 'Field is required',
      'de': 'Feld ist erforderlich',
      'es': 'Se requiere campo',
      'ro': 'Câmpul este obligatoriu',
    },
    '0t2s8g1q': {
      'en': 'Please choose an option from the dropdown',
      'de': 'Bitte wählen Sie eine Option aus der Dropdown-Liste aus',
      'es': 'Por favor elija una opción del menú desplegable',
      'ro': 'Vă rugăm să alegeți o opțiune din meniul drop-down',
    },
    'az8s7w1u': {
      'en': 'Save Changes',
      'de': 'Änderungen speichern',
      'es': 'Guardar cambios',
      'ro': 'Salvează modificările',
    },
    'fyod1wrh': {
      'en': 'Home',
      'de': 'Heim',
      'es': 'Hogar',
      'ro': 'Acasă',
    },
  },
  // onboardinguser
  {
    '4pil88sv': {
      'en': 'Create Profile',
      'de': 'Profil erstellen',
      'es': 'Crear perfil',
      'ro': 'Creeaza un profil',
    },
    '9f69uws6': {
      'en': 'Create Profile',
      'de': 'Profil erstellen',
      'es': 'Crear perfil',
      'ro': 'Creeaza un profil',
    },
    '152vav1y': {
      'en': 'Your Details',
      'de': 'Deine Details',
      'es': 'Tus detalles',
      'ro': 'Detaliile tale',
    },
    'l1tdf0fn': {
      'en':
          'Please kindly note that the information provided below is crucial for the shipping of your prize. \nIt\'s important that the details match those on your ID to ensure eligibility. \nThank you for your understanding!',
      'de':
          'Bitte beachten Sie, dass die unten angegebenen Informationen für den Versand Ihres Gewinns von entscheidender Bedeutung sind. \nEs ist wichtig, dass die Angaben mit denen auf Ihrem Ausweis übereinstimmen, um die Berechtigung sicherzustellen. \nVielen Dank für Ihr Verständnis!',
      'es':
          'Tenga en cuenta que la información proporcionada a continuación es crucial para el envío de su premio. \nEs importante que los detalles coincidan con los de su identificación para garantizar la elegibilidad. \n¡Gracias por su comprensión!',
      'ro':
          'Vă rugăm să rețineți că informațiile furnizate mai jos sunt cruciale pentru expedierea premiului dvs. \nEste important ca detaliile să se potrivească cu cele de pe actul dvs. de identitate pentru a vă asigura eligibilitatea. \nVă mulțumim pentru înțelegere!',
    },
    '5v8304g3': {
      'en': 'Your Name',
      'de': 'Ihr Name',
      'es': 'Su nombre',
      'ro': 'Numele dumneavoastră',
    },
    'gezul6oe': {
      'en': 'Your Name',
      'de': 'Ihr Name',
      'es': 'Su nombre',
      'ro': 'Numele dumneavoastră',
    },
    'wdr2wk93': {
      'en': 'Adress',
      'de': 'Ein Kleid',
      'es': 'Dirección',
      'ro': 'Adresa',
    },
    'f120rkc8': {
      'en': 'Your Adress',
      'de': 'Deine Adresse',
      'es': 'Tu direccion',
      'ro': 'Adresa dvs',
    },
    'crxq6e8z': {
      'en': 'City',
      'de': 'Stadt',
      'es': 'Ciudad',
      'ro': 'Oraș',
    },
    'v5w4skde': {
      'en': 'City your are living in',
      'de': 'Stadt, in der Sie leben',
      'es': 'Ciudad en la que vives',
      'ro': 'Orașul în care locuiești',
    },
    '56p1llat': {
      'en': 'Country',
      'de': 'Land',
      'es': 'País',
      'ro': 'Țară',
    },
    'nbaohquj': {
      'en': 'Country you are living in',
      'de': 'Land, in dem Sie leben',
      'es': 'País en el que vives',
      'ro': 'Țara în care trăiești',
    },
    '4k4yq159': {
      'en': 'Phone Number',
      'de': 'Telefonnummer',
      'es': 'Número de teléfono',
      'ro': 'Număr de telefon',
    },
    'lkhdf5hk': {
      'en': 'Phone Number',
      'de': 'Telefonnummer',
      'es': 'Número de teléfono',
      'ro': 'Număr de telefon',
    },
    '0yzjimoq': {
      'en': 'Field is required',
      'de': 'Feld ist erforderlich',
      'es': 'Se requiere campo',
      'ro': 'Câmpul este obligatoriu',
    },
    'ywpt4gh8': {
      'en': 'Please choose an option from the dropdown',
      'de': 'Bitte wählen Sie eine Option aus der Dropdown-Liste aus',
      'es': 'Por favor elija una opción del menú desplegable',
      'ro': 'Vă rugăm să alegeți o opțiune din meniul drop-down',
    },
    '4wqos8yg': {
      'en': 'Field is required',
      'de': 'Feld ist erforderlich',
      'es': 'Se requiere campo',
      'ro': 'Câmpul este obligatoriu',
    },
    'cn9iuc6v': {
      'en': 'Please choose an option from the dropdown',
      'de': 'Bitte wählen Sie eine Option aus der Dropdown-Liste aus',
      'es': 'Por favor elija una opción del menú desplegable',
      'ro': 'Vă rugăm să alegeți o opțiune din meniul drop-down',
    },
    'e6v3rqte': {
      'en': 'Field is required',
      'de': 'Feld ist erforderlich',
      'es': 'Se requiere campo',
      'ro': 'Câmpul este obligatoriu',
    },
    'opj8oled': {
      'en': 'Please choose an option from the dropdown',
      'de': 'Bitte wählen Sie eine Option aus der Dropdown-Liste aus',
      'es': 'Por favor elija una opción del menú desplegable',
      'ro': 'Vă rugăm să alegeți o opțiune din meniul drop-down',
    },
    '1w5735pb': {
      'en': 'Field is required',
      'de': 'Feld ist erforderlich',
      'es': 'Se requiere campo',
      'ro': 'Câmpul este obligatoriu',
    },
    'p1dzu52t': {
      'en': 'Please choose an option from the dropdown',
      'de': 'Bitte wählen Sie eine Option aus der Dropdown-Liste aus',
      'es': 'Por favor elija una opción del menú desplegable',
      'ro': 'Vă rugăm să alegeți o opțiune din meniul drop-down',
    },
    'v3cimfuh': {
      'en': 'Field is required',
      'de': 'Feld ist erforderlich',
      'es': 'Se requiere campo',
      'ro': 'Câmpul este obligatoriu',
    },
    '3lo6v44r': {
      'en': 'Please choose an option from the dropdown',
      'de': 'Bitte wählen Sie eine Option aus der Dropdown-Liste aus',
      'es': 'Por favor elija una opción del menú desplegable',
      'ro': 'Vă rugăm să alegeți o opțiune din meniul drop-down',
    },
    'gtvt51v2': {
      'en': 'Save Changes',
      'de': 'Änderungen speichern',
      'es': 'Guardar cambios',
      'ro': 'Salvează modificările',
    },
    'lgymitqq': {
      'en': 'Home',
      'de': 'Heim',
      'es': 'Hogar',
      'ro': 'Acasă',
    },
  },
  // myticketsdetails
  {
    '2099b3lf': {
      'en': 'My Tickets Details',
      'de': 'Meine Ticketdetails',
      'es': 'Detalles de mis entradas',
      'ro': 'Detalii Biletele mele',
    },
    '3nhm0y52': {
      'en': 'All tickets Number:',
      'de': 'Alle Tickets Nummer:',
      'es': 'Todos los billetes Número:',
      'ro': 'Numărul tuturor biletelor:',
    },
    'cjz44seh': {
      'en': 'Home',
      'de': 'Heim',
      'es': 'Hogar',
      'ro': 'Acasă',
    },
  },
  // privacypolicy
  {
    '7chd1870': {
      'en': 'Privay Policy',
      'de': 'Datenschutzbestimmungen',
      'es': 'Política de privacidad',
      'ro': 'Politica de confidențialitate',
    },
    'gsps49so': {
      'en': 'Privay Policy',
      'de': 'Datenschutzbestimmungen',
      'es': 'Política de privacidad',
      'ro': 'Politica de confidențialitate',
    },
    'jufcs71l': {
      'en': 'Introduction',
      'de': 'Einführung',
      'es': 'Introducción',
      'ro': 'Introducere',
    },
    '48t7mtek': {
      'en':
          'Welcome to the privacy policy of Bounty Fever.\n\nBounty Fever, operated by BlueDash Limited, holds your privacy in high regard and is dedicated to safeguarding your personal data. This privacy policy outlines how we handle and safeguard your personal data when you access our website, regardless of your location. It also details your privacy rights and the legal protections afforded to you.\n\nFeel free to refer to the Glossary for explanations of certain terms used in this privacy policy.',
      'de':
          'Willkommen zur Datenschutzrichtlinie von Bounty Fever.\n\nBounty Fever, betrieben von BlueDash Limited, legt großen Wert auf Ihre Privatsphäre und ist dem Schutz Ihrer persönlichen Daten verpflichtet. Diese Datenschutzerklärung erläutert, wie wir Ihre personenbezogenen Daten verarbeiten und schützen, wenn Sie auf unsere Website zugreifen, unabhängig von Ihrem Standort. Außerdem werden Ihre Datenschutzrechte und die Ihnen gewährten rechtlichen Schutzmaßnahmen detailliert beschrieben.\n\nErläuterungen zu bestimmten in dieser Datenschutzrichtlinie verwendeten Begriffen finden Sie im Glossar.',
      'es':
          'Bienvenido a la política de privacidad de Bounty Fever.\n\nBounty Fever, operado por BlueDash Limited, tiene en alta estima su privacidad y se dedica a salvaguardar sus datos personales. Esta política de privacidad describe cómo manejamos y salvaguardamos sus datos personales cuando accede a nuestro sitio web, independientemente de su ubicación. También detalla sus derechos de privacidad y las protecciones legales que se le brindan.\n\nNo dude en consultar el Glosario para obtener explicaciones de ciertos términos utilizados en esta política de privacidad.',
      'ro':
          'Bine ați venit la politica de confidențialitate a Bounty Fever.\n\nBounty Fever, operat de BlueDash Limited, ține cont de confidențialitatea dumneavoastră și este dedicat protejării datelor dumneavoastră personale. Această politică de confidențialitate prezintă modul în care gestionăm și protejăm datele dumneavoastră cu caracter personal atunci când accesați site-ul nostru web, indiferent de locația dvs. De asemenea, detaliază drepturile dvs. de confidențialitate și protecțiile legale care vi se oferă.\n\nNu ezitați să consultați Glosar pentru explicații ale anumitor termeni folosiți în această politică de confidențialitate.',
    },
    'l9dg8804': {
      'en': 'Purpose of this privacy policy',
      'de': 'Zweck dieser Datenschutzerklärung',
      'es': 'Propósito de esta política de privacidad',
      'ro': 'Scopul acestei politici de confidențialitate',
    },
    '6rwiyfgx': {
      'en':
          '\nThis privacy policy aims to inform you about how BlueDash Limited collects and processes your personal data when you use this website. This includes any information you may provide through the website, such as when you sign up for our newsletter, make purchases, or participate in contests or competitions.\n\nPlease note that this website is not intended for children, and we do not knowingly collect data related to children.\n\nIt\'s essential to read this privacy policy alongside any other privacy or fair processing policies we may provide on specific occasions when collecting or processing your personal data. This ensures you have a comprehensive understanding of how and why we use your data. This privacy policy complements other notices and policies and does not supersede them.',
      'de':
          'Diese Datenschutzerklärung soll Sie darüber informieren, wie BlueDash Limited Ihre personenbezogenen Daten erhebt und verarbeitet, wenn Sie diese Website nutzen. Dazu gehören alle Informationen, die Sie über die Website bereitstellen, beispielsweise wenn Sie sich für unseren Newsletter anmelden, Einkäufe tätigen oder an Wettbewerben oder Wettbewerben teilnehmen.\n\nBitte beachten Sie, dass diese Website nicht für Kinder gedacht ist und wir Sammeln Sie wissentlich keine Daten über Kinder.\n\nEs ist wichtig, diese Datenschutzrichtlinie zusammen mit allen anderen Datenschutz- oder fairen Verarbeitungsrichtlinien zu lesen, die wir möglicherweise zu bestimmten Anlässen bei der Erhebung oder Verarbeitung Ihrer personenbezogenen Daten bereitstellen. Dadurch stellen wir sicher, dass Sie ein umfassendes Verständnis darüber haben, wie und warum wir Ihre Daten verwenden. Diese Datenschutzrichtlinie ergänzt andere Hinweise und Richtlinien und ersetzt diese nicht.',
      'es':
          'Esta política de privacidad tiene como objetivo informarle sobre cómo BlueDash Limited recopila y procesa sus datos personales cuando utiliza este sitio web. Esto incluye cualquier información que pueda proporcionar a través del sitio web, como cuando se suscribe a nuestro boletín informativo, realiza compras o participa en concursos o competencias.\n\nTenga en cuenta que este sitio web no está destinado a niños y no recopile intencionalmente datos relacionados con niños.\n\nEs esencial leer esta política de privacidad junto con cualquier otra política de privacidad o procesamiento justo que podamos proporcionar en ocasiones específicas al recopilar o procesar sus datos personales. Esto garantiza que tenga una comprensión integral de cómo y por qué utilizamos sus datos. Esta política de privacidad complementa otros avisos y políticas y no los reemplaza.',
      'ro':
          'Această politică de confidențialitate are scopul de a vă informa despre modul în care BlueDash Limited colectează și prelucrează datele dumneavoastră personale atunci când utilizați acest site web. Aceasta include orice informații pe care le puteți furniza prin intermediul site-ului web, cum ar fi atunci când vă înscrieți pentru buletinul nostru informativ, faceți achiziții sau participați la concursuri sau competiții.\n\nVă rugăm să rețineți că acest site web nu este destinat copiilor, iar noi nu colectați cu bună știință date referitoare la copii.\n\nEste esențial să citiți această politică de confidențialitate alături de orice alte politici de confidențialitate sau de procesare corectă pe care le putem furniza în anumite ocazii atunci când colectăm sau procesăm datele dumneavoastră cu caracter personal. Acest lucru vă asigură că aveți o înțelegere completă a modului și de ce folosim datele dvs. Această politică de confidențialitate completează alte notificări și politici și nu le înlocuiește.',
    },
    '3vpw8qyp': {
      'en': 'Controller',
      'de': 'Regler',
      'es': 'Controlador',
      'ro': 'Controlor',
    },
    'gue3k1nd': {
      'en':
          'BlueDash Limited acts as the controller and is accountable for your personal data, referred to collectively as \"BlueDash,\" \"we,\" \"us,\" or \"our\" in this privacy policy.\n\nWe have designated a data privacy manager responsible for addressing inquiries regarding this privacy policy. If you have any questions about this policy or wish to exercise your legal rights, please contact the data privacy manager using the provided details below.',
      'de':
          'BlueDash Limited fungiert als Verantwortlicher und ist für Ihre personenbezogenen Daten verantwortlich, die in dieser Datenschutzrichtlinie gemeinsam als „BlueDash“, „wir“, „uns“ oder „unser“ bezeichnet werden.\n\nWir haben Daten benannt Datenschutzbeauftragter, der für die Bearbeitung von Anfragen zu dieser Datenschutzrichtlinie verantwortlich ist. Wenn Sie Fragen zu dieser Richtlinie haben oder Ihre gesetzlichen Rechte ausüben möchten, wenden Sie sich bitte über die unten angegebenen Kontaktdaten an den Datenschutzbeauftragten.',
      'es':
          'BlueDash Limited actúa como controlador y es responsable de sus datos personales, denominados colectivamente \"BlueDash\", \"nosotros\", \"nos\" o \"nuestro\" en esta política de privacidad.\n\nHemos designado un dato administrador de privacidad responsable de atender consultas relacionadas con esta política de privacidad. Si tiene alguna pregunta sobre esta política o desea ejercer sus derechos legales, comuníquese con el administrador de privacidad de datos utilizando los detalles proporcionados a continuación.',
      'ro':
          'BlueDash Limited acționează ca operator și este responsabil pentru datele dumneavoastră cu caracter personal, denumite în mod colectiv „BlueDash”, „noi”, „noi” sau „nostru” în această politică de confidențialitate.\n\nAm desemnat o date manager de confidențialitate responsabil cu adresarea întrebărilor referitoare la această politică de confidențialitate. Dacă aveți întrebări despre această politică sau doriți să vă exercitați drepturile legale, vă rugăm să contactați managerul de confidențialitate a datelor folosind detaliile furnizate mai jos.',
    },
    'zeicl6ol': {
      'en': 'Contact details',
      'de': 'Kontaktdetails',
      'es': 'Detalles de contacto',
      'ro': 'Detalii de contact',
    },
    'rjepyqcz': {
      'en':
          '\nIf you have any inquiries regarding this privacy policy or our privacy practices, please don\'t hesitate to contact our data privacy manager through the following means:\n\nFull name of legal entity: BlueDash Limited\n\nName of data privacy manager: Alin Matei\n\nEmail address: contact@bluedash.co.uk\n\nPostal address: 382 Kenton Road, Harrow, Greater London, United Kingdom, HA3 8DP\n\nTelephone number: +447452335020\n\nYou retain the right to lodge a complaint with the Information Commissioner’s Office (ICO), the UK supervisory authority for data protection matters (www.ico.org.uk), at any time. However, we kindly request that you reach out to us initially to address any concerns you may have before contacting the ICO',
      'de':
          'Wenn Sie Fragen zu dieser Datenschutzrichtlinie oder unseren Datenschutzpraktiken haben, wenden Sie sich bitte wie folgt an unseren Datenschutzbeauftragten:\n\nVollständiger Name der juristischen Person: BlueDash Limited\n\n Name des Datenschutzbeauftragten: Alin Matei\n\nE-Mail-Adresse: contact@bluedash.co.uk\n\nPostanschrift: 382 Kenton Road, Harrow, Greater London, Vereinigtes Königreich, HA3 8DP\n \nTelefonnummer: +447452335020\n\nSie behalten sich das Recht vor, eine Beschwerde beim Information Commissioner\'s Office (ICO), der britischen Aufsichtsbehörde für Datenschutzfragen (www.ico.org.uk), einzureichen jederzeit. Wir bitten Sie jedoch höflich, sich zunächst an uns zu wenden, um etwaige Bedenken auszuräumen, bevor Sie sich an das ICO wenden',
      'es':
          'Si tiene alguna consulta sobre esta política de privacidad o nuestras prácticas de privacidad, no dude en comunicarse con nuestro gerente de privacidad de datos a través de los siguientes medios:\n\nNombre completo de la entidad legal: BlueDash Limited\n\n Nombre del responsable de privacidad de datos: Alin Matei\n\nDirección de correo electrónico: contact@bluedash.co.uk\n\nDirección postal: 382 Kenton Road, Harrow, Greater London, Reino Unido, HA3 8DP\n \nNúmero de teléfono: +447452335020\n\nUsted conserva el derecho de presentar una queja ante la Oficina del Comisionado de Información (ICO), la autoridad supervisora ​​del Reino Unido en materia de protección de datos (www.ico.org.uk), en en cualquier momento. Sin embargo, le rogamos que se comunique con nosotros inicialmente para abordar cualquier inquietud que pueda tener antes de comunicarse con la ICO.',
      'ro':
          'Dacă aveți întrebări cu privire la această politică de confidențialitate sau practicile noastre de confidențialitate, vă rugăm să nu ezitați să contactați managerul nostru de confidențialitate a datelor prin următoarele mijloace:\n\nNumele complet al entității juridice: BlueDash Limited\n\n Numele managerului de confidențialitate a datelor: Alin Matei\n\nAdresă de e-mail: contact@bluedash.co.uk\n\nAdresă poștală: 382 Kenton Road, Harrow, Greater London, Marea Britanie, HA3 8DP\n \nNumăr de telefon: +447452335020\n\nVă păstrați dreptul de a depune o plângere la Biroul Comisarului pentru Informații (ICO), autoritatea de supraveghere a Regatului Unit pentru problemele de protecție a datelor (www.ico.org.uk), la adresa oricând. Cu toate acestea, vă rugăm să ne contactați inițial pentru a rezolva orice nelămuriri pe care le puteți avea înainte de a contacta ICO',
    },
    '0f6mvevs': {
      'en':
          'Changes to the privacy policy and your duty to inform us of changes',
      'de':
          'Änderungen der Datenschutzerklärung und Ihre Pflicht, uns über Änderungen zu informieren',
      'es':
          'Cambios en la política de privacidad y su deber de informarnos de los cambios',
      'ro':
          'Modificări ale politicii de confidențialitate și obligația dvs. de a ne informa cu privire la modificări',
    },
    'cejpoqwg': {
      'en':
          'We consistently review our privacy policy to ensure its relevance and effectiveness. The version you are currently viewing was last updated on 25/03/2024.\n\nMaintaining accurate and current personal data is crucial to us. Kindly inform us of any changes to your personal data during your association with us to ensure its accuracy.',
      'de':
          'Wir überprüfen unsere Datenschutzrichtlinie regelmäßig, um deren Relevanz und Wirksamkeit sicherzustellen. Die Version, die Sie gerade ansehen, wurde zuletzt am 25.03.2024 aktualisiert.\n\nDie Pflege korrekter und aktueller personenbezogener Daten ist für uns von entscheidender Bedeutung. Bitte informieren Sie uns über alle Änderungen Ihrer personenbezogenen Daten während Ihrer Zusammenarbeit mit uns, um deren Richtigkeit sicherzustellen.',
      'es':
          'Revisamos constantemente nuestra política de privacidad para garantizar su relevancia y eficacia. La versión que está viendo actualmente se actualizó por última vez el 25/03/2024.\n\nMantener datos personales precisos y actualizados es fundamental para nosotros. Por favor, infórmenos sobre cualquier cambio en sus datos personales durante su asociación con nosotros para garantizar su exactitud.',
      'ro':
          'Ne revizuim în mod constant politica de confidențialitate pentru a ne asigura relevanța și eficacitatea. Versiunea pe care o vizualizați în prezent a fost actualizată ultima dată pe 25.03.2024.\n\nPăstrarea datelor personale exacte și actuale este crucială pentru noi. Vă rugăm să ne informați cu privire la orice modificări aduse datelor dumneavoastră cu caracter personal în timpul asocierii dumneavoastră cu noi pentru a asigura acuratețea acestora.',
    },
    'nefqpdme': {
      'en': 'Third-party links',
      'de': 'Links von Drittanbietern',
      'es': 'Enlaces de terceros',
      'ro': 'Link-uri de la terți',
    },
    '3t40rd2k': {
      'en':
          'This website may contain links to third-party websites, plug-ins, and applications. Clicking on these links or enabling such connections may result in third parties collecting or sharing data about you. We do not oversee these third-party websites and cannot be held responsible for their privacy statements. We recommend reviewing the privacy policy of each website you visit when you leave our site.\n\nData Collection:\nPersonal data, also known as personal information, refers to any information about an individual that can identify them. It does not include data where the identity has been removed (anonymous data).\n\nWe may collect, use, store, and transfer various types of personal data about you, categorized as follows:\n\nIdentity Data: This includes your first name, last name, username or similar identifier, and date of birth.\nContact Data: This encompasses your billing address, email address, and telephone numbers.\nFinancial Data: Please note that we do not collect financial data directly; our payment provider is ',
      'de':
          'Diese Website kann Links zu Websites, Plug-ins und Anwendungen Dritter enthalten. Das Klicken auf diese Links oder das Aktivieren solcher Verbindungen kann dazu führen, dass Dritte Daten über Sie sammeln oder weitergeben. Wir überwachen diese Websites Dritter nicht und können nicht für deren Datenschutzerklärungen verantwortlich gemacht werden. Wir empfehlen, die Datenschutzrichtlinien jeder von Ihnen besuchten Website zu lesen, wenn Sie unsere Website verlassen.\n\nDatenerfassung:\nPersonenbezogene Daten, auch personenbezogene Daten genannt, beziehen sich auf alle Informationen über eine Person, die diese identifizieren können. Dazu gehören keine Daten, bei denen die Identität entfernt wurde (anonyme Daten).\n\nWir können verschiedene Arten personenbezogener Daten über Sie erfassen, verwenden, speichern und übertragen, die wie folgt kategorisiert werden:\n\n Identitätsdaten: Dazu gehören Ihr Vorname, Nachname, Benutzername oder eine ähnliche Kennung sowie Ihr Geburtsdatum.\nKontaktdaten: Dazu gehören Ihre Rechnungsadresse, E-Mail-Adresse und Telefonnummern.\nFinanzdaten: Bitte beachten Sie dies wir erfassen Finanzdaten nicht direkt; Unser Zahlungsanbieter ist',
      'es':
          'Este sitio web puede contener enlaces a sitios web, complementos y aplicaciones de terceros. Al hacer clic en estos enlaces o habilitar dichas conexiones, es posible que terceros recopilen o compartan datos sobre usted. No supervisamos estos sitios web de terceros y no nos hacemos responsables de sus declaraciones de privacidad. Recomendamos revisar la política de privacidad de cada sitio web que visite cuando abandone nuestro sitio.\n\nRecopilación de datos:\nLos datos personales, también conocidos como información personal, se refieren a cualquier información sobre un individuo que pueda identificarlo. No incluye datos donde se ha eliminado la identidad (datos anónimos).\n\nPodemos recopilar, usar, almacenar y transferir varios tipos de datos personales sobre usted, categorizados de la siguiente manera:\n\n Datos de identidad: esto incluye su nombre, apellido, nombre de usuario o identificador similar y fecha de nacimiento.\nDatos de contacto: esto incluye su dirección de facturación, dirección de correo electrónico y números de teléfono.\nDatos financieros: tenga en cuenta que no recopilamos datos financieros directamente; nuestro proveedor de pagos es',
      'ro':
          'Acest site web poate conține link-uri către site-uri web, pluginuri și aplicații ale terților. Făcând clic pe aceste link-uri sau activarea unor astfel de conexiuni poate duce la colectarea sau partajarea de către terți a datelor despre dvs. Nu supraveghem aceste site-uri web ale terților și nu putem fi făcuți responsabili pentru declarațiile lor de confidențialitate. Vă recomandăm să revizuiți politica de confidențialitate a fiecărui site web pe care îl vizitați atunci când părăsiți site-ul nostru.\n\nColectarea datelor:\nDatele personale, cunoscute și ca informații personale, se referă la orice informații despre o persoană care le poate identifica. Nu include date pentru care identitatea a fost eliminată (date anonime).\n\nPutem colecta, folosi, stoca și transfera diferite tipuri de date personale despre dvs., clasificate după cum urmează:\n\n Date de identitate: Acestea includ prenumele, prenumele, numele de utilizator sau identificatorul similar și data nașterii.\nDate de contact: Acestea includ adresa dvs. de facturare, adresa de e-mail și numerele de telefon.\n Date financiare: Vă rugăm să rețineți că nu colectăm date financiare în mod direct; furnizorul nostru de plăți este',
    },
    'g8aly646': {
      'en': 'Stripe  ',
      'de': 'Streifen',
      'es': 'Raya',
      'ro': 'Dunga',
    },
    'm5jchkva': {
      'en':
          'and is responsible for financial data.\nTransaction Data: This consists of details about payments to and from you, as well as other information regarding products and services you have purchased from us.\nTechnical Data: This incorporates your internet protocol (IP) address, login data, browser type and version, time zone setting and location, browser plug-in types and versions, operating system and platform, and other technology on the devices you use to access our website.\nProfile Data: This includes your username, password, and any purchases or orders made by you.\nUsage Data: This comprises information about how you use our website, products, and services.\nMarketing and Communications Data: This refers to your preferences regarding receiving marketing communications from us and our third parties, as well as your communication preferences.\nAdditionally, we collect, use, and share Aggregated Data such as statistical or demographic data for various purposes. Aggregated Data does not directly or indirectly reveal your identity. However, if Aggregated Data is combined or connected with your personal data in a way that identifies you, we treat the combined data as personal data and handle it accordingly under this privacy policy.\n\nWe do not collect any Special Categories of Personal Data about you, which include details about your race or ethnicity, religious or philosophical beliefs, sex life, sexual orientation, political opinions, trade union membership, information about your health, and genetic and biometric data. We also do not collect information about criminal convictions and offences.\n\nWhen necessary, we may collect the minimum amount of personal data required for you to participate in any prize draws or competitions and to facilitate the administration of promotions. If you win, we may need to collect more detailed information from you in order to award your prize. You will be informed of this requirement at the time of notification if you are selected as a winner.',
      'de':
          'und ist für die Finanzdaten verantwortlich.\nTransaktionsdaten: Dazu gehören Details zu Zahlungen an und von Ihnen sowie andere Informationen zu Produkten und Dienstleistungen, die Sie bei uns gekauft haben.\nTechnische Daten: Dazu gehört Ihr Internetprotokoll (IP-)Adresse, Anmeldedaten, Browsertyp und -version, Zeitzoneneinstellung und -standort, Browser-Plug-in-Typen und -Versionen, Betriebssystem und Plattform sowie andere Technologien auf den Geräten, die Sie für den Zugriff auf unsere Website verwenden.\nProfildaten : Dazu gehören Ihr Benutzername, Ihr Passwort und alle von Ihnen getätigten Einkäufe oder Bestellungen.\nNutzungsdaten: Dies umfasst Informationen darüber, wie Sie unsere Website, Produkte und Dienstleistungen nutzen.\nMarketing- und Kommunikationsdaten: Dies bezieht sich auf Ihre Präferenzen bezüglich des Erhalts von Marketingmitteilungen von uns und unseren Dritten sowie Ihre Kommunikationspräferenzen.\nDarüber hinaus erfassen, verwenden und teilen wir aggregierte Daten wie statistische oder demografische Daten für verschiedene Zwecke. Aggregierte Daten geben weder direkt noch indirekt Auskunft über Ihre Identität. Wenn jedoch aggregierte Daten mit Ihren personenbezogenen Daten in einer Weise kombiniert oder verknüpft werden, die Sie identifiziert, behandeln wir die kombinierten Daten als personenbezogene Daten und behandeln sie entsprechend dieser Datenschutzrichtlinie.\n\nWir erfassen keine Sonderkategorien personenbezogener Daten über Sie, darunter Angaben zu Ihrer Rasse oder ethnischen Zugehörigkeit, Ihren religiösen oder philosophischen Überzeugungen, Ihrem Sexualleben, Ihrer sexuellen Orientierung, politischen Meinungen, Ihrer Gewerkschaftsmitgliedschaft, Informationen zu Ihrer Gesundheit sowie genetischen und biometrischen Daten. Wir erfassen auch keine Informationen über strafrechtliche Verurteilungen und Straftaten.\n\nBei Bedarf erfassen wir möglicherweise die Mindestmenge an personenbezogenen Daten, die für die Teilnahme an Gewinnspielen oder Wettbewerben erforderlich ist und um die Verwaltung von Werbeaktionen zu erleichtern. Wenn Sie gewinnen, müssen wir möglicherweise detailliertere Informationen von Ihnen sammeln, um Ihren Preis vergeben zu können. Wenn Sie als Gewinner ausgewählt werden, werden Sie zum Zeitpunkt der Benachrichtigung über diese Anforderung informiert.',
      'es':
          'y es responsable de los datos financieros.\nDatos de transacción: consisten en detalles sobre pagos hacia y desde usted, así como otra información sobre los productos y servicios que nos ha comprado.\nDatos técnicos: incorpora su protocolo de Internet (IP), datos de inicio de sesión, tipo y versión del navegador, configuración y ubicación de la zona horaria, tipos y versiones de complementos del navegador, sistema operativo y plataforma, y ​​otra tecnología en los dispositivos que utiliza para acceder a nuestro sitio web.\nDatos de perfil : Esto incluye su nombre de usuario, contraseña y cualquier compra o pedido realizado por usted.\nDatos de uso: esto comprende información sobre cómo utiliza nuestro sitio web, productos y servicios.\nDatos de marketing y comunicaciones: esto se refiere a su preferencias con respecto a recibir comunicaciones de marketing nuestras y de nuestros terceros, así como sus preferencias de comunicación.\nAdemás, recopilamos, utilizamos y compartimos datos agregados, como datos estadísticos o demográficos, para diversos fines. Los datos agregados no revelan directa o indirectamente su identidad. Sin embargo, si los Datos Agregados se combinan o conectan con sus datos personales de una manera que lo identifique, trataremos los datos combinados como datos personales y los manejaremos en consecuencia según esta política de privacidad.\n\nNo recopilamos ninguna Categoría Especial de Datos Personales sobre usted, que incluyen detalles sobre su raza o etnia, creencias religiosas o filosóficas, vida sexual, orientación sexual, opiniones políticas, afiliación sindical, información sobre su salud y datos genéticos y biométricos. Tampoco recopilamos información sobre condenas y delitos penales.\n\nCuando sea necesario, podemos recopilar la cantidad mínima de datos personales necesarios para que usted participe en cualquier sorteo o concurso y para facilitar la administración de promociones. Si gana, es posible que necesitemos recopilar información más detallada sobre usted para poder otorgarle su premio. Se le informará de este requisito en el momento de la notificación si resulta seleccionado como ganador.',
      'ro':
          'și este responsabil pentru datele financiare.\nDate despre tranzacții: acestea constau în detalii despre plățile către și de la dvs., precum și alte informații referitoare la produsele și serviciile pe care le-ați achiziționat de la noi.\nDate tehnice: acestea încorporează protocolul dvs. de internet (IP) adresa, datele de conectare, tipul și versiunea browserului, setarea și locația fusului orar, tipurile și versiunile de plug-in ale browserului, sistemul de operare și platforma și alte tehnologii de pe dispozitivele pe care le utilizați pentru a accesa site-ul nostru web.\nDate de profil. : Acestea includ numele dvs. de utilizator, parola și orice achiziții sau comenzi efectuate de dvs.\nDate de utilizare: Acestea includ informații despre modul în care utilizați site-ul nostru web, produsele și serviciile.\nDate de marketing și comunicații: Se referă la dvs. preferințele privind primirea de comunicări de marketing de la noi și terții noștri, precum și preferințele dvs. de comunicare.\nÎn plus, colectăm, folosim și partajăm Date agregate, cum ar fi date statistice sau demografice, în diferite scopuri. Datele agregate nu vă dezvăluie direct sau indirect identitatea. Cu toate acestea, dacă Datele agregate sunt combinate sau conectate cu datele dumneavoastră personale într-un mod care vă identifică, tratăm datele combinate ca date cu caracter personal și le gestionăm în consecință în conformitate cu această politică de confidențialitate.\n\nNu colectăm nicio categorie specială. de Date personale despre dvs., care includ detalii despre rasa sau etnia dvs., convingerile religioase sau filozofice, viața sexuală, orientarea sexuală, opiniile politice, apartenența la sindicat, informații despre sănătatea dvs. și date genetice și biometrice. De asemenea, nu colectăm informații despre condamnări și infracțiuni penale.\n\nAtunci când este necesar, putem colecta cantitatea minimă de date cu caracter personal necesare pentru a participa la orice extrageri sau concursuri și pentru a facilita administrarea promoțiilor. Dacă câștigați, este posibil să fie nevoie să colectăm informații mai detaliate de la dvs. pentru a vă acorda premiul. Veți fi informat despre această cerință în momentul notificării dacă sunteți selectat ca câștigător.',
    },
    '90gd84es': {
      'en':
          'This website may contain links to third-party websites, plug-ins, and applications. Clicking on these links or enabling such connections may result in third parties collecting or sharing data about you. We do not oversee these third-party websites and cannot be held responsible for their privacy statements. We recommend reviewing the privacy policy of each website you visit when you leave our site.\n\nData Collection:\nPersonal data, also known as personal information, refers to any information about an individual that can identify them. It does not include data where the identity has been removed (anonymous data).\n\nWe may collect, use, store, and transfer various types of personal data about you, categorized as follows:\n\nIdentity Data: This includes your first name, last name, username or similar identifier, and date of birth.\nContact Data: This encompasses your billing address, email address, and telephone numbers.\nFinancial Data: Please note that we do not collect financial data directly; our payment providers Stripe is responsible for financial data.\nTransaction Data: This consists of details about payments to and from you, as well as other information regarding products and services you have purchased from us.\nTechnical Data: This incorporates your internet protocol (IP) address, login data, browser type and version, time zone setting and location, browser plug-in types and versions, operating system and platform, and other technology on the devices you use to access our website.\nProfile Data: This includes your username, password, and any purchases or orders made by you.\nUsage Data: This comprises information about how you use our website, products, and services.\nMarketing and Communications Data: This refers to your preferences regarding receiving marketing communications from us and our third parties, as well as your communication preferences.\nAdditionally, we collect, use, and share Aggregated Data such as statistical or demographic data for various purposes. Aggregated Data does not directly or indirectly reveal your identity. However, if Aggregated Data is combined or connected with your personal data in a way that identifies you, we treat the combined data as personal data and handle it accordingly under this privacy policy.\n\nWe do not collect any Special Categories of Personal Data about you, which include details about your race or ethnicity, religious or philosophical beliefs, sex life, sexual orientation, political opinions, trade union membership, information about your health, and genetic and biometric data. We also do not collect information about criminal convictions and offences.\n\nWhen necessary, we may collect the minimum amount of personal data required for you to participate in any prize draws or competitions and to facilitate the administration of promotions. If you win, we may need to collect more detailed information from you in order to award your prize. You will be informed of this requirement at the time of notification if you are selected as a winne',
      'de':
          'Diese Website kann Links zu Websites, Plug-ins und Anwendungen Dritter enthalten. Das Klicken auf diese Links oder das Aktivieren solcher Verbindungen kann dazu führen, dass Dritte Daten über Sie sammeln oder weitergeben. Wir überwachen diese Websites Dritter nicht und können nicht für deren Datenschutzerklärungen verantwortlich gemacht werden. Wir empfehlen, die Datenschutzrichtlinien jeder von Ihnen besuchten Website zu lesen, wenn Sie unsere Website verlassen.\n\nDatenerfassung:\nPersonenbezogene Daten, auch personenbezogene Daten genannt, beziehen sich auf alle Informationen über eine Person, die diese identifizieren können. Dazu gehören keine Daten, bei denen die Identität entfernt wurde (anonyme Daten).\n\nWir können verschiedene Arten personenbezogener Daten über Sie erfassen, verwenden, speichern und übertragen, die wie folgt kategorisiert werden:\n\n Identitätsdaten: Dazu gehören Ihr Vorname, Nachname, Benutzername oder eine ähnliche Kennung sowie Ihr Geburtsdatum.\nKontaktdaten: Dazu gehören Ihre Rechnungsadresse, E-Mail-Adresse und Telefonnummern.\nFinanzdaten: Bitte beachten Sie dies wir erfassen Finanzdaten nicht direkt; Unser Zahlungsanbieter Stripe ist für die Finanzdaten verantwortlich.\nTransaktionsdaten: Dazu gehören Details zu Zahlungen an und von Ihnen sowie andere Informationen zu Produkten und Dienstleistungen, die Sie bei uns gekauft haben.\nTechnische Daten: Dazu gehören Ihre Internet Protocol (IP)-Adresse, Anmeldedaten, Browsertyp und -version, Zeitzoneneinstellung und Standort, Browser-Plug-in-Typen und -Versionen, Betriebssystem und Plattform sowie andere Technologien auf den Geräten, die Sie für den Zugriff auf unsere Website verwenden.<__FFNL__ >Profildaten: Dazu gehören Ihr Benutzername, Ihr Passwort und alle von Ihnen getätigten Käufe oder Bestellungen.\nNutzungsdaten: Dies umfasst Informationen darüber, wie Sie unsere Website, Produkte und Dienstleistungen nutzen.\nMarketing- und Kommunikationsdaten: Dies bezieht sich auf Ihre Präferenzen hinsichtlich des Erhalts von Marketingmitteilungen von uns und unseren Dritten sowie auf Ihre Kommunikationspräferenzen.\nDarüber hinaus erfassen, verwenden und teilen wir aggregierte Daten wie statistische oder demografische Daten für verschiedene Zwecke. Aggregierte Daten geben weder direkt noch indirekt Auskunft über Ihre Identität. Wenn jedoch aggregierte Daten mit Ihren personenbezogenen Daten in einer Weise kombiniert oder verknüpft werden, die Sie identifiziert, behandeln wir die kombinierten Daten als personenbezogene Daten und behandeln sie entsprechend dieser Datenschutzrichtlinie.\n\nWir erfassen keine Sonderkategorien personenbezogener Daten über Sie, darunter Angaben zu Ihrer Rasse oder ethnischen Zugehörigkeit, Ihren religiösen oder philosophischen Überzeugungen, Ihrem Sexualleben, Ihrer sexuellen Orientierung, politischen Meinungen, Ihrer Gewerkschaftsmitgliedschaft, Informationen zu Ihrer Gesundheit sowie genetischen und biometrischen Daten. Wir erfassen auch keine Informationen über strafrechtliche Verurteilungen und Straftaten.\n\nBei Bedarf erfassen wir möglicherweise die Mindestmenge an personenbezogenen Daten, die für die Teilnahme an Gewinnspielen oder Wettbewerben erforderlich ist und um die Verwaltung von Werbeaktionen zu erleichtern. Wenn Sie gewinnen, müssen wir möglicherweise detailliertere Informationen von Ihnen sammeln, um Ihren Preis vergeben zu können. Wenn Sie als Gewinner ausgewählt werden, werden Sie zum Zeitpunkt der Benachrichtigung über diese Anforderung informiert',
      'es':
          'Este sitio web puede contener enlaces a sitios web, complementos y aplicaciones de terceros. Al hacer clic en estos enlaces o habilitar dichas conexiones, es posible que terceros recopilen o compartan datos sobre usted. No supervisamos estos sitios web de terceros y no nos hacemos responsables de sus declaraciones de privacidad. Recomendamos revisar la política de privacidad de cada sitio web que visite cuando abandone nuestro sitio.\n\nRecopilación de datos:\nLos datos personales, también conocidos como información personal, se refieren a cualquier información sobre un individuo que pueda identificarlo. No incluye datos donde se ha eliminado la identidad (datos anónimos).\n\nPodemos recopilar, usar, almacenar y transferir varios tipos de datos personales sobre usted, categorizados de la siguiente manera:\n\n Datos de identidad: esto incluye su nombre, apellido, nombre de usuario o identificador similar y fecha de nacimiento.\nDatos de contacto: esto incluye su dirección de facturación, dirección de correo electrónico y números de teléfono.\nDatos financieros: tenga en cuenta que no recopilamos datos financieros directamente; nuestros proveedores de pagos Stripe es responsable de los datos financieros.\nDatos de transacción: consisten en detalles sobre pagos hacia y desde usted, así como otra información sobre los productos y servicios que nos ha comprado.\nDatos técnicos: esto incorpora su dirección de protocolo de Internet (IP), datos de inicio de sesión, tipo y versión del navegador, configuración y ubicación de la zona horaria, tipos y versiones de complementos del navegador, sistema operativo y plataforma, y ​​otra tecnología en los dispositivos que utiliza para acceder a nuestro sitio web.<__FFNL__ >Datos de perfil: esto incluye su nombre de usuario, contraseña y cualquier compra o pedido realizado por usted.\nDatos de uso: esto comprende información sobre cómo utiliza nuestro sitio web, productos y servicios.\nDatos de marketing y comunicaciones: esto se refiere a sus preferencias con respecto a recibir comunicaciones de marketing nuestras y de nuestros terceros, así como sus preferencias de comunicación.\nAdemás, recopilamos, utilizamos y compartimos datos agregados, como datos estadísticos o demográficos, para diversos fines. Los datos agregados no revelan directa o indirectamente su identidad. Sin embargo, si los Datos Agregados se combinan o conectan con sus datos personales de una manera que lo identifique, trataremos los datos combinados como datos personales y los manejaremos en consecuencia según esta política de privacidad.\n\nNo recopilamos ninguna Categoría Especial de Datos Personales sobre usted, que incluyen detalles sobre su raza o etnia, creencias religiosas o filosóficas, vida sexual, orientación sexual, opiniones políticas, afiliación sindical, información sobre su salud y datos genéticos y biométricos. Tampoco recopilamos información sobre condenas y delitos penales.\n\nCuando sea necesario, podemos recopilar la cantidad mínima de datos personales necesarios para que usted participe en cualquier sorteo o concurso y para facilitar la administración de promociones. Si gana, es posible que necesitemos recopilar información más detallada sobre usted para poder otorgarle su premio. Se le informará de este requisito en el momento de la notificación si es seleccionado como ganador.',
      'ro':
          'Acest site web poate conține link-uri către site-uri web, pluginuri și aplicații ale terților. Făcând clic pe aceste link-uri sau activarea unor astfel de conexiuni poate duce la colectarea sau partajarea de către terți a datelor despre dvs. Nu supraveghem aceste site-uri web ale terților și nu putem fi făcuți responsabili pentru declarațiile lor de confidențialitate. Vă recomandăm să revizuiți politica de confidențialitate a fiecărui site web pe care îl vizitați atunci când părăsiți site-ul nostru.\n\nColectarea datelor:\nDatele personale, cunoscute și ca informații personale, se referă la orice informații despre o persoană care le poate identifica. Nu include date pentru care identitatea a fost eliminată (date anonime).\n\nPutem colecta, folosi, stoca și transfera diferite tipuri de date personale despre dvs., clasificate după cum urmează:\n\n Date de identitate: Acestea includ prenumele, prenumele, numele de utilizator sau identificatorul similar și data nașterii.\nDate de contact: Acestea includ adresa dvs. de facturare, adresa de e-mail și numerele de telefon.\n Date financiare: Vă rugăm să rețineți că nu colectăm date financiare în mod direct; furnizorii noștri de plăți Stripe este responsabil pentru datele financiare.\nDate despre tranzacții: acestea constau în detalii despre plățile către și de la dvs., precum și alte informații referitoare la produsele și serviciile pe care le-ați achiziționat de la noi.\nDate tehnice: acestea includ adresa dvs. de protocol de internet (IP), datele de conectare, tipul și versiunea browserului, setarea și locația fusului orar, tipurile și versiunile de plug-in ale browserului, sistemul de operare și platforma și alte tehnologii de pe dispozitivele pe care le utilizați pentru a accesa site-ul nostru web.<__FFNL__ >Date de profil: Acestea includ numele dvs. de utilizator, parola și orice achiziții sau comenzi efectuate de dvs.\nDate de utilizare: Acestea includ informații despre modul în care utilizați site-ul web, produsele și serviciile noastre.\nDate de marketing și comunicații: Aceasta se referă la preferințele dvs. cu privire la primirea de comunicări de marketing de la noi și terții noștri, precum și la preferințele dvs. de comunicare.\nÎn plus, colectăm, folosim și partajăm Date agregate, cum ar fi date statistice sau demografice, în diferite scopuri. Datele agregate nu vă dezvăluie direct sau indirect identitatea. Cu toate acestea, dacă Datele agregate sunt combinate sau conectate cu datele dumneavoastră personale într-un mod care vă identifică, tratăm datele combinate ca date cu caracter personal și le gestionăm în consecință în conformitate cu această politică de confidențialitate.\n\nNu colectăm nicio categorie specială. de Date personale despre dvs., care includ detalii despre rasa sau etnia dvs., convingerile religioase sau filozofice, viața sexuală, orientarea sexuală, opiniile politice, apartenența la sindicat, informații despre sănătatea dvs. și date genetice și biometrice. De asemenea, nu colectăm informații despre condamnări și infracțiuni penale.\n\nAtunci când este necesar, putem colecta cantitatea minimă de date cu caracter personal necesare pentru a participa la orice extrageri sau concursuri și pentru a facilita administrarea promoțiilor. Dacă câștigați, este posibil să fie nevoie să colectăm informații mai detaliate de la dvs. pentru a vă acorda premiul. Veți fi informat despre această cerință în momentul notificării dacă sunteți selectat ca câștigător',
    },
    'mu43er8y': {
      'en': 'If you fail to provide personal data',
      'de': 'Bei Nichtbereitstellung personenbezogener Daten',
      'es': 'Si no proporciona datos personales',
      'ro': 'Dacă nu reușiți să furnizați date personale',
    },
    'jlj6ya8m': {
      'en':
          'In situations where we are required by law or under the terms of a contract to collect personal data from you, failure to provide such data upon request may result in our inability to fulfill the contract we have with you or are attempting to establish (for instance, to provide goods or services or to enroll you in a competition). \nConsequently, we may need to cancel a product or service you have with us or deny your participation in a competition. If this situation arises, we will promptly notify you accordingly.',
      'de':
          'In Situationen, in denen wir gesetzlich oder aufgrund eines Vertrags dazu verpflichtet sind, personenbezogene Daten von Ihnen zu erheben, kann die Nichtbereitstellung dieser Daten auf Anfrage dazu führen, dass wir den Vertrag, den wir mit Ihnen haben oder den wir schließen möchten, nicht erfüllen können (z. B , um Waren oder Dienstleistungen bereitzustellen oder Sie für ein Gewinnspiel anzumelden). \nInfolgedessen müssen wir möglicherweise ein Produkt oder eine Dienstleistung, die Sie bei uns haben, stornieren oder Ihre Teilnahme an einem Wettbewerb verweigern. Sollte diese Situation eintreten, werden wir Sie umgehend darüber informieren.',
      'es':
          'En situaciones en las que estamos obligados por ley o según los términos de un contrato a recopilar datos personales suyos, no proporcionar dichos datos cuando lo solicite puede resultar en nuestra incapacidad para cumplir el contrato que tenemos con usted o que estamos intentando establecer (por ejemplo , para proporcionar bienes o servicios o para inscribirlo en una competencia). \nEn consecuencia, es posible que necesitemos cancelar un producto o servicio que tiene con nosotros o negar su participación en una competencia. Si surge esta situación, se lo notificaremos de inmediato.',
      'ro':
          'În situațiile în care suntem obligați prin lege sau în temeiul unui contract să colectăm date cu caracter personal de la dvs., nefurnizarea acestor date la cerere poate duce la incapacitatea noastră de a îndeplini contractul pe care îl avem cu dvs. sau încercăm să îl stabilim (de exemplu , pentru a furniza bunuri sau servicii sau pentru a vă înscrie la un concurs). \nÎn consecință, este posibil să fie nevoie să anulăm un produs sau un serviciu pe care îl aveți la noi sau să vă refuzăm participarea la un concurs. Dacă apare această situație, vă vom anunța cu promptitudine în consecință.',
    },
    'avzjevpe': {
      'en': 'Marketing',
      'de': 'Marketing',
      'es': 'Marketing',
      'ro': 'Marketing',
    },
    'b69q8pjl': {
      'en':
          'We endeavor to offer you options regarding specific uses of your personal data, particularly concerning marketing and advertising.',
      'de':
          'Wir sind bestrebt, Ihnen Möglichkeiten zur konkreten Verwendung Ihrer personenbezogenen Daten, insbesondere im Bereich Marketing und Werbung, anzubieten.',
      'es':
          'Nos esforzamos por ofrecerle opciones con respecto a usos específicos de sus datos personales, particularmente en materia de marketing y publicidad.',
      'ro':
          'Ne străduim să vă oferim opțiuni cu privire la utilizări specifice ale datelor dumneavoastră cu caracter personal, în special în ceea ce privește marketingul și publicitatea.',
    },
    'az90whrp': {
      'en': 'Promotional offers from us',
      'de': 'Aktionsangebote von uns',
      'es': 'Ofertas promocionales nuestras',
      'ro': 'Oferte promotionale de la noi',
    },
    'qtlfyh9x': {
      'en':
          'We may utilize your Identity, Contact, Technical, Usage, and Profile Data to develop insights into your potential interests or needs. This helps us determine which products, services, and offers may be pertinent to you, a practice commonly referred to as marketing.\n\nYou will receive marketing communications from us if you have requested information, made purchases, entered competitions or prize draws, and have not opted out of receiving such communications.',
      'de':
          'Wir können Ihre Identitäts-, Kontakt-, Technik-, Nutzungs- und Profildaten nutzen, um Erkenntnisse über Ihre potenziellen Interessen oder Bedürfnisse zu gewinnen. Dies hilft uns zu bestimmen, welche Produkte, Dienstleistungen und Angebote für Sie relevant sein könnten, eine Praxis, die gemeinhin als Marketing bezeichnet wird.\n\nSie erhalten Marketingmitteilungen von uns, wenn Sie Informationen angefordert, Einkäufe getätigt, an Wettbewerben teilgenommen haben oder an Gewinnspielen teilgenommen und den Erhalt solcher Mitteilungen nicht abgelehnt haben.',
      'es':
          'Podemos utilizar su identidad, contacto, datos técnicos, de uso y de perfil para desarrollar información sobre sus posibles intereses o necesidades. Esto nos ayuda a determinar qué productos, servicios y ofertas pueden ser pertinentes para usted, una práctica comúnmente conocida como marketing.\n\nRecibirá nuestras comunicaciones de marketing si solicitó información, realizó compras, participó en concursos o sorteos de premios y no ha optado por no recibir dichas comunicaciones.',
      'ro':
          'Putem folosi datele dvs. de identitate, de contact, tehnice, de utilizare și de profil pentru a dezvolta informații despre interesele sau nevoile dvs. potențiale. Acest lucru ne ajută să stabilim ce produse, servicii și oferte pot fi relevante pentru dvs., o practică denumită în mod obișnuit marketing.\n\nVeți primi comunicări de marketing de la noi dacă ați solicitat informații, ați făcut achiziții, ați participat la concursuri sau extrageri de premii și nu au optat pentru a nu primi astfel de comunicări.',
    },
    'cggu3kzz': {
      'en': 'Promotional offers from us',
      'de': 'Aktionsangebote von uns',
      'es': 'Ofertas promocionales nuestras',
      'ro': 'Oferte promotionale de la noi',
    },
    'mw28rcdf': {
      'en':
          'We may utilize your Identity, Contact, Technical, Usage, and Profile Data to develop insights into your potential interests or needs. This helps us determine which products, services, and offers may be pertinent to you, a practice commonly referred to as marketing.\n\nYou will receive marketing communications from us if you have requested information, made purchases, entered competitions or prize draws, and have not opted out of receiving such communications.',
      'de':
          'Wir können Ihre Identitäts-, Kontakt-, Technik-, Nutzungs- und Profildaten nutzen, um Erkenntnisse über Ihre potenziellen Interessen oder Bedürfnisse zu gewinnen. Dies hilft uns zu bestimmen, welche Produkte, Dienstleistungen und Angebote für Sie relevant sein könnten, eine Praxis, die gemeinhin als Marketing bezeichnet wird.\n\nSie erhalten Marketingmitteilungen von uns, wenn Sie Informationen angefordert, Einkäufe getätigt, an Wettbewerben teilgenommen haben oder an Gewinnspielen teilgenommen und den Erhalt solcher Mitteilungen nicht abgelehnt haben.',
      'es':
          'Podemos utilizar su identidad, contacto, datos técnicos, de uso y de perfil para desarrollar información sobre sus posibles intereses o necesidades. Esto nos ayuda a determinar qué productos, servicios y ofertas pueden ser pertinentes para usted, una práctica comúnmente conocida como marketing.\n\nRecibirá nuestras comunicaciones de marketing si solicitó información, realizó compras, participó en concursos o sorteos de premios y no ha optado por no recibir dichas comunicaciones.',
      'ro':
          'Putem folosi datele dvs. de identitate, de contact, tehnice, de utilizare și de profil pentru a dezvolta informații despre interesele sau nevoile dvs. potențiale. Acest lucru ne ajută să stabilim ce produse, servicii și oferte pot fi relevante pentru dvs., o practică denumită în mod obișnuit marketing.\n\nVeți primi comunicări de marketing de la noi dacă ați solicitat informații, ați făcut achiziții, ați participat la concursuri sau extrageri de premii și nu au optat pentru a nu primi astfel de comunicări.',
    },
    'fij7xlrx': {
      'en': 'Third-party marketing',
      'de': 'Marketing durch Dritte',
      'es': 'Comercialización de terceros',
      'ro': 'Marketing de la terți',
    },
    'm42jk11g': {
      'en':
          'Before sharing your personal data with any third party for marketing purposes, we will obtain your explicit opt-in consent.',
      'de':
          'Bevor wir Ihre personenbezogenen Daten zu Marketingzwecken an Dritte weitergeben, holen wir Ihre ausdrückliche Einwilligung ein.',
      'es':
          'Antes de compartir sus datos personales con terceros con fines de marketing, obtendremos su consentimiento explícito.',
      'ro':
          'Înainte de a vă partaja datele personale cu orice terță parte în scopuri de marketing, vom obține consimțământul dvs. explicit de participare.',
    },
    'c4vuwos4': {
      'en': 'Declining involvement',
      'de': 'Abnehmendes Engagement',
      'es': 'Participación decreciente',
      'ro': 'Scăderea implicării',
    },
    'b0ejnv7v': {
      'en':
          'You have the option to request us or third parties to cease sending you marketing messages at any time by utilizing the opt-out links provided in any marketing communication or by reaching out to us directly.\n\nPlease note that opting out of receiving marketing messages does not extend to personal data submitted to us as a consequence of product/service purchases, warranty registrations, product/service experiences, or other transactions.',
      'de':
          'Sie haben die Möglichkeit, uns oder Dritte jederzeit aufzufordern, Ihnen keine Marketingnachrichten mehr zu senden, indem Sie die in jeder Marketingmitteilung bereitgestellten Opt-out-Links verwenden oder sich direkt an uns wenden.\n\nBitte beachten Sie, dass das Opt-out nicht möglich ist Der Erhalt von Marketingnachrichten erstreckt sich nicht auf personenbezogene Daten, die uns im Rahmen von Produkt-/Dienstleistungskäufen, Garantieregistrierungen, Produkt-/Dienstleistungserfahrungen oder anderen Transaktionen übermittelt werden.',
      'es':
          'Tiene la opción de solicitarnos a nosotros o a terceros que dejemos de enviarle mensajes de marketing en cualquier momento utilizando los enlaces de exclusión voluntaria proporcionados en cualquier comunicación de marketing o comunicándose con nosotros directamente.\n\nTenga en cuenta que la exclusión voluntaria de recibir mensajes de marketing no se extiende a los datos personales que se nos envían como consecuencia de compras de productos/servicios, registros de garantía, experiencias de productos/servicios u otras transacciones.',
      'ro':
          'Aveți opțiunea de a ne solicita nouă sau terților să încetăm să vă trimitem mesaje de marketing în orice moment, utilizând linkurile de renunțare furnizate în orice comunicare de marketing sau contactându-ne direct.\n\n Vă rugăm să rețineți că renunțarea de primire a mesajelor de marketing nu se extinde la datele personale transmise nouă ca o consecință a achizițiilor de produse/servicii, înregistrări de garanție, experiențe de produse/servicii sau alte tranzacții.',
    },
    'z7r6c8c7': {
      'en': 'Cookies',
      'de': 'Kekse',
      'es': 'Galletas',
      'ro': 'Cookie-uri',
    },
    'glvn3hpb': {
      'en':
          'You have the option to configure your browser settings to reject all or certain browser cookies, or to receive alerts when websites attempt to set or access cookies. However, if you choose to disable or refuse cookies, please be aware that certain sections of this website may become inaccessible or may not function correctly. For further details regarding the cookies we utilize, please refer to the section on cookies.',
      'de':
          'Sie haben die Möglichkeit, Ihre Browsereinstellungen so zu konfigurieren, dass alle oder bestimmte Browser-Cookies abgelehnt werden oder Sie Benachrichtigungen erhalten, wenn Websites versuchen, Cookies zu setzen oder darauf zuzugreifen. Wenn Sie sich jedoch dafür entscheiden, Cookies zu deaktivieren oder abzulehnen, beachten Sie bitte, dass bestimmte Bereiche dieser Website möglicherweise nicht mehr zugänglich sind oder nicht richtig funktionieren. Weitere Einzelheiten zu den von uns verwendeten Cookies finden Sie im Abschnitt über Cookies.',
      'es':
          'Tiene la opción de configurar los ajustes de su navegador para rechazar todas o algunas de las cookies del navegador, o para recibir alertas cuando los sitios web intenten establecer o acceder a las cookies. Sin embargo, si elige deshabilitar o rechazar las cookies, tenga en cuenta que ciertas secciones de este sitio web pueden volverse inaccesibles o no funcionar correctamente. Para obtener más detalles sobre las cookies que utilizamos, consulte la sección sobre cookies.',
      'ro':
          'Aveți opțiunea de a configura setările browserului pentru a respinge toate sau anumite module cookie de browser sau pentru a primi alerte atunci când site-urile web încearcă să seteze sau să acceseze module cookie. Cu toate acestea, dacă alegeți să dezactivați sau să refuzați cookie-urile, vă rugăm să rețineți că anumite secțiuni ale acestui site web pot deveni inaccesibile sau pot să nu funcționeze corect. Pentru mai multe detalii despre cookie-urile pe care le folosim, vă rugăm să consultați secțiunea despre cookie-uri.',
    },
    '4jze19dq': {
      'en': 'Change of purpose',
      'de': 'Zweckänderung',
      'es': 'Cambio de propósito',
      'ro': 'Schimbarea scopului',
    },
    'mh2mlj68': {
      'en':
          'We will solely utilize your personal data for the purposes for which it was initially collected, unless we reasonably determine that we need to employ it for another purpose that is compatible with the original intent. If you seek clarification regarding the compatibility of the processing for the new purpose with the original one, please feel free to reach out to us.\n\nIn the event that we need to use your personal data for an unrelated purpose, we will inform you accordingly and provide an explanation regarding the legal basis that permits us to do so. It\'s important to note that we may process your personal data without your knowledge or explicit consent, in adherence to the aforementioned principles, where such processing is mandated or permitted by law.',
      'de':
          'Wir werden Ihre personenbezogenen Daten ausschließlich für die Zwecke verwenden, für die sie ursprünglich erhoben wurden, es sei denn, wir kommen nach vernünftigem Ermessen zu dem Schluss, dass wir sie für einen anderen Zweck verwenden müssen, der mit der ursprünglichen Absicht vereinbar ist. Wenn Sie Fragen zur Vereinbarkeit der Verarbeitung für den neuen Zweck mit dem ursprünglichen Zweck haben, wenden Sie sich bitte an uns.\n\nFür den Fall, dass wir Ihre personenbezogenen Daten für einen anderen Zweck verwenden müssen, Wir werden Sie hierüber informieren und Ihnen die Rechtsgrundlage erläutern, die uns dazu berechtigt. Es ist wichtig zu beachten, dass wir Ihre personenbezogenen Daten ohne Ihr Wissen oder Ihre ausdrückliche Zustimmung unter Einhaltung der oben genannten Grundsätze verarbeiten können, sofern eine solche Verarbeitung gesetzlich vorgeschrieben oder zulässig ist.',
      'es':
          'Utilizaremos sus datos personales únicamente para los fines para los que fueron recopilados inicialmente, a menos que determinemos razonablemente que necesitamos emplearlos para otro fin que sea compatible con la intención original. Si necesita una aclaración sobre la compatibilidad del procesamiento para el nuevo propósito con el original, no dude en comunicarse con nosotros.\n\nEn el caso de que necesitemos utilizar sus datos personales para un propósito no relacionado, le informaremos al respecto y le explicaremos la base legal que nos permite hacerlo. Es importante tener en cuenta que podemos procesar sus datos personales sin su conocimiento o consentimiento explícito, de conformidad con los principios antes mencionados, cuando dicho procesamiento sea obligatorio o permitido por la ley.',
      'ro':
          'Vom folosi datele dumneavoastră cu caracter personal exclusiv în scopurile pentru care au fost colectate inițial, cu excepția cazului în care stabilim în mod rezonabil că trebuie să le folosim în alt scop care este compatibil cu intenția inițială. Dacă solicitați clarificări cu privire la compatibilitatea prelucrării pentru noul scop cu cel original, vă rugăm să nu ezitați să ne contactați.\n\nÎn cazul în care trebuie să folosim datele dumneavoastră personale într-un scop care nu are legătură, vă vom informa în consecință și vă vom oferi o explicație cu privire la temeiul legal care ne permite să facem acest lucru. Este important să rețineți că putem prelucra datele dumneavoastră cu caracter personal fără știrea dumneavoastră sau fără consimțământul dumneavoastră explicit, în conformitate cu principiile menționate mai sus, acolo unde o astfel de prelucrare este impusă sau permisă de lege.',
    },
    'osh4qqzh': {
      'en': 'Disclosures of your personal data',
      'de': 'Offenlegung Ihrer personenbezogenen Daten',
      'es': 'Divulgaciones de sus datos personales',
      'ro': 'Dezvăluiri ale datelor dumneavoastră personale',
    },
    'jhmp44ks': {
      'en':
          'We may disclose your personal data to the following parties for the purposes outlined in the table \"Purposes for which we will use your personal data\" above:\n\nExternal Third Parties as defined in the Glossary.\nSpecific third parties listed in the table \"Purposes for which we will use your personal data\" above.\nThird parties to whom we may opt to sell, transfer, or merge parts of our business or assets. Conversely, we may explore opportunities to acquire other businesses or merge with them. In the event of such changes to our business, the new owners may utilize your personal data in the same manner as outlined in this privacy policy.\nWe mandate that all third parties uphold the security of your personal data and handle it in compliance with relevant laws. We do not permit our third-party service providers to use your personal data for their own purposes. Instead, we only authorize them to process your personal data for specified purposes and in accordance with our instructions',
      'de':
          'Wir können Ihre personenbezogenen Daten an die folgenden Parteien für die in der Tabelle „Zwecke, für die wir Ihre personenbezogenen Daten verwenden“ oben aufgeführten Zwecke weitergeben:\n\nExterne Dritte, wie im Glossar definiert.\nSpezifischer Dritter Parteien, die in der Tabelle „Zwecke, für die wir Ihre personenbezogenen Daten verwenden“ oben aufgeführt sind.\nDritte, an die wir Teile unseres Unternehmens oder unserer Vermögenswerte verkaufen, übertragen oder fusionieren können. Umgekehrt prüfen wir möglicherweise Möglichkeiten, andere Unternehmen zu erwerben oder mit ihnen zu fusionieren. Im Falle solcher Änderungen in unserem Unternehmen können die neuen Eigentümer Ihre personenbezogenen Daten auf die gleiche Weise verwenden, wie in dieser Datenschutzrichtlinie beschrieben.\nWir verpflichten alle Dritten, die Sicherheit Ihrer personenbezogenen Daten zu wahren und diese konform zu behandeln mit einschlägigen Gesetzen. Wir gestatten unseren Drittanbietern nicht, Ihre personenbezogenen Daten für eigene Zwecke zu nutzen. Stattdessen ermächtigen wir sie, Ihre personenbezogenen Daten nur für bestimmte Zwecke und gemäß unseren Anweisungen zu verarbeiten',
      'es':
          'Podemos divulgar sus datos personales a las siguientes partes para los fines descritos en la tabla \"Propósitos para los cuales usaremos sus datos personales\" anterior:\n\nTerceros externos según se define en el Glosario.\nTerceros específicos partes enumeradas en la tabla \"Propósitos para los cuales usaremos sus datos personales\" anterior.\nTerceros a quienes podemos optar por vender, transferir o fusionar partes de nuestro negocio o activos. Por el contrario, podemos explorar oportunidades para adquirir otros negocios o fusionarnos con ellos. En caso de que se produzcan tales cambios en nuestro negocio, los nuevos propietarios pueden utilizar sus datos personales de la misma manera que se describe en esta política de privacidad.\nExigimos que todos los terceros mantengan la seguridad de sus datos personales y los manejen de conformidad con las leyes pertinentes. No permitimos que nuestros proveedores de servicios externos utilicen sus datos personales para sus propios fines. En cambio, solo les autorizamos a procesar sus datos personales para fines específicos y de acuerdo con nuestras instrucciones.',
      'ro':
          'Putem dezvălui datele dumneavoastră cu caracter personal următoarelor părți în scopurile prezentate în tabelul „Scopul pentru care vom folosi datele dumneavoastră cu caracter personal” de mai sus:\n\nTerți externi, așa cum sunt definite în Glosar.\nTerț specific părțile enumerate în tabelul „Scopul pentru care vom folosi datele dumneavoastră cu caracter personal” de mai sus.\nTerți cărora le putem alege să vindem, să transferăm sau să fuzionem părți ale afacerii sau activelor noastre. În schimb, putem explora oportunități de a achiziționa alte afaceri sau de a fuziona cu acestea. În cazul unor astfel de modificări ale afacerii noastre, noii proprietari pot utiliza datele dumneavoastră cu caracter personal în același mod ca cel descris în această politică de confidențialitate.\nObligăm ca toate terții să mențină securitatea datelor dumneavoastră cu caracter personal și să le gestioneze în conformitate. cu legile relevante. Nu le permitem furnizorilor noștri de servicii terți să utilizeze datele dumneavoastră cu caracter personal în propriile lor scopuri. În schimb, îi autorizăm să prelucreze datele dumneavoastră cu caracter personal numai în scopuri specificate și în conformitate cu instrucțiunile noastre',
    },
    'r7hko8ui': {
      'en': 'International transfers',
      'de': 'Internationale Überweisungen',
      'es': 'Transferencias internacionales',
      'ro': 'Transferuri internaționale',
    },
    'kn42bl7a': {
      'en':
          'Many of our external third parties are situated outside the UK, which means that the processing of your personal data by these parties may involve transferring it outside the UK. When we transfer your personal data out of the UK, we ensure that a similar level of protection is maintained. This is achieved by implementing at least one of the following safeguards:\n\nWe only transfer your personal data to countries that have been recognized to offer an adequate level of protection for personal data.\nWhen utilizing certain service providers, we may employ specific contracts that have been approved for use in the UK. These contracts ensure that your personal data receives the same level of protection as it does in the UK.\nIf you require further details about the specific mechanism employed by us when transferring your personal data out of the UK, please don\'t hesitate to contact us.',
      'de':
          'Viele unserer externen Dritten haben ihren Sitz außerhalb des Vereinigten Königreichs, was bedeutet, dass die Verarbeitung Ihrer personenbezogenen Daten durch diese Parteien eine Übermittlung dieser Daten außerhalb des Vereinigten Königreichs beinhalten kann. Wenn wir Ihre personenbezogenen Daten aus dem Vereinigten Königreich übertragen, stellen wir sicher, dass ein ähnliches Schutzniveau gewahrt bleibt. Dies wird durch die Umsetzung mindestens einer der folgenden Schutzmaßnahmen erreicht:\n\nWir übermitteln Ihre personenbezogenen Daten nur in Länder, die anerkanntermaßen ein angemessenes Schutzniveau für personenbezogene Daten bieten.\nBei der Nutzung bestimmter Dienstleister , können wir bestimmte Verträge nutzen, die für die Verwendung im Vereinigten Königreich genehmigt wurden. Diese Verträge stellen sicher, dass Ihre personenbezogenen Daten das gleiche Schutzniveau wie im Vereinigten Königreich genießen.\nWenn Sie weitere Einzelheiten zu dem spezifischen Mechanismus benötigen, den wir bei der Übermittlung Ihrer personenbezogenen Daten aus dem Vereinigten Königreich einsetzen, zögern Sie bitte nicht um uns zu kontaktieren.',
      'es':
          'Muchos de nuestros terceros externos están ubicados fuera del Reino Unido, lo que significa que el procesamiento de sus datos personales por parte de estos terceros puede implicar su transferencia fuera del Reino Unido. Cuando transferimos sus datos personales fuera del Reino Unido, nos aseguramos de mantener un nivel similar de protección. Esto se logra implementando al menos una de las siguientes salvaguardas:\n\nSolo transferimos sus datos personales a países que han sido reconocidos por ofrecer un nivel adecuado de protección de datos personales.\nCuando utilizamos ciertos proveedores de servicios , podemos emplear contratos específicos que hayan sido aprobados para su uso en el Reino Unido. Estos contratos garantizan que sus datos personales reciban el mismo nivel de protección que en el Reino Unido.\nSi necesita más detalles sobre el mecanismo específico que empleamos al transferir sus datos personales fuera del Reino Unido, no lo dude. para contactarnos.',
      'ro':
          'Mulți dintre terții noștri externi se află în afara Regatului Unit, ceea ce înseamnă că prelucrarea datelor dumneavoastră cu caracter personal de către aceste părți poate implica transferul acestora în afara Regatului Unit. Când transferăm datele dumneavoastră cu caracter personal în afara Regatului Unit, ne asigurăm că este menținut un nivel similar de protecție. Acest lucru se realizează prin implementarea a cel puțin uneia dintre următoarele măsuri de protecție:\n\nTransferăm datele dumneavoastră cu caracter personal numai în țări care au fost recunoscute pentru a oferi un nivel adecvat de protecție a datelor cu caracter personal.\nCând folosim anumiți furnizori de servicii. , putem folosi anumite contracte care au fost aprobate pentru utilizare în Regatul Unit. Aceste contracte asigură că datele dumneavoastră cu caracter personal primesc același nivel de protecție ca și în Regatul Unit.\nDacă aveți nevoie de detalii suplimentare despre mecanismul specific folosit de noi atunci când transferăm datele dumneavoastră cu caracter personal în afara Regatului Unit, vă rugăm să nu ezitați pentru a ne contacta.',
    },
    '2fr7zkgk': {
      'en': 'Data security',
      'de': 'Datensicherheit',
      'es': 'Seguridad de datos',
      'ro': 'Securitatea datelor',
    },
    'g5gxfd4f': {
      'en':
          'We have implemented suitable security measures to prevent your personal data from being inadvertently lost, accessed, used, or disclosed without authorization, or altered. Additionally, we restrict access to your personal data to employees, agents, contractors, and other third parties who have a legitimate business need to access it. These individuals will only process your personal data in accordance with our instructions and are bound by confidentiality obligations.\n\nFurthermore, we have established procedures to address any suspected breaches of personal data. In the event of such a breach, where legally required, we will notify you and any relevant regulatory authorities.',
      'de':
          'Wir haben geeignete Sicherheitsmaßnahmen implementiert, um zu verhindern, dass Ihre personenbezogenen Daten unbeabsichtigt verloren gehen, abgerufen, verwendet, unbefugt weitergegeben oder verändert werden. Darüber hinaus beschränken wir den Zugriff auf Ihre personenbezogenen Daten auf Mitarbeiter, Vertreter, Auftragnehmer und andere Dritte, die einen berechtigten geschäftlichen Bedarf daran haben. Diese Personen werden Ihre personenbezogenen Daten nur gemäß unseren Anweisungen verarbeiten und sind an die Vertraulichkeitsverpflichtung gebunden.\n\nDarüber hinaus haben wir Verfahren eingerichtet, um bei vermuteten Verstößen gegen personenbezogene Daten vorzugehen. Im Falle eines solchen Verstoßes werden wir Sie und alle zuständigen Aufsichtsbehörden benachrichtigen, sofern dies gesetzlich vorgeschrieben ist.',
      'es':
          'Hemos implementado medidas de seguridad adecuadas para evitar que sus datos personales se pierdan, accedan, utilicen o divulguen inadvertidamente sin autorización o sean alterados. Además, restringimos el acceso a sus datos personales a empleados, agentes, contratistas y otros terceros que tengan una necesidad comercial legítima de acceder a ellos. Estas personas solo procesarán sus datos personales de acuerdo con nuestras instrucciones y están sujetas a obligaciones de confidencialidad.\n\nAdemás, hemos establecido procedimientos para abordar cualquier sospecha de violación de datos personales. En caso de tal incumplimiento, cuando así lo exija la ley, se lo notificaremos a usted y a las autoridades reguladoras pertinentes.',
      'ro':
          'Am implementat măsuri de securitate adecvate pentru a preveni pierderea, accesarea, utilizarea sau dezvăluirea din greșeală a datelor dumneavoastră cu caracter personal fără autorizație sau modificate. În plus, restricționăm accesul la datele dumneavoastră cu caracter personal la angajați, agenți, contractori și alte terțe părți care au o nevoie legitimă de a le accesa. Aceste persoane vor prelucra datele dumneavoastră cu caracter personal numai în conformitate cu instrucțiunile noastre și sunt supuse obligațiilor de confidențialitate.\n\nÎn plus, am stabilit proceduri pentru a aborda orice suspectare a încălcării datelor cu caracter personal. În cazul unei astfel de încălcări, acolo unde este necesar din punct de vedere legal, vă vom notifica pe dumneavoastră și orice autorități de reglementare relevante.',
    },
    'b6dl5toy': {
      'en': 'How long will you use my personal data for?',
      'de': 'Wie lange werden Sie meine personenbezogenen Daten verwenden?',
      'es': '¿Durante cuánto tiempo utilizarán mis datos personales?',
      'ro': 'Cât timp veți folosi datele mele personale?',
    },
    'bvt0jao0': {
      'en':
          'We will retain your personal data only for as long as reasonably necessary to fulfill the purposes for which we collected it, including meeting any legal, regulatory, tax, accounting, or reporting requirements. In cases of complaints or when there is a reasonable belief of potential litigation regarding our relationship with you, we may retain your personal data for an extended period.\n\nTo determine the appropriate retention period for personal data, we consider various factors, including the type, nature, and sensitivity of the data, the potential risk of unauthorized use or disclosure, the purposes for which we process the data, and whether those purposes can be achieved through alternative means. Additionally, we take into account applicable legal, regulatory, tax, accounting, or other requirements.\n\nSpecific details regarding retention periods for different categories of personal data are outlined in our retention policy, which you can request from us. In certain circumstances, you have the right to request the deletion of your data—please refer to the \"Your legal rights\" section below for further details.\n\nFurthermore, in some instances, we may anonymize your personal data for research or statistical purposes, rendering it no longer identifiable to you. In such cases, we may use this anonymized information indefinitely without providing further notice.',
      'de':
          'Wir werden Ihre personenbezogenen Daten nur so lange aufbewahren, wie es vernünftigerweise erforderlich ist, um die Zwecke zu erfüllen, für die wir sie erhoben haben, einschließlich der Erfüllung gesetzlicher, behördlicher, steuerlicher, buchhalterischer oder Berichtspflichten. Im Falle von Beschwerden oder wenn begründeter Verdacht auf einen möglichen Rechtsstreit in Bezug auf unsere Beziehung zu Ihnen besteht, können wir Ihre personenbezogenen Daten für einen längeren Zeitraum aufbewahren.\n\nUm die angemessene Aufbewahrungsfrist für personenbezogene Daten zu bestimmen, berücksichtigen wir verschiedene Faktoren, einschließlich der Art, Natur und Sensibilität der Daten, des potenziellen Risikos einer unbefugten Nutzung oder Offenlegung, der Zwecke, für die wir die Daten verarbeiten, und der Frage, ob diese Zwecke mit alternativen Mitteln erreicht werden können. Darüber hinaus berücksichtigen wir geltende gesetzliche, behördliche, steuerliche, buchhalterische oder andere Anforderungen.\n\nSpezifische Einzelheiten zu den Aufbewahrungsfristen für verschiedene Kategorien personenbezogener Daten finden Sie in unserer Aufbewahrungsrichtlinie, die Sie bei uns anfordern können. Unter bestimmten Umständen haben Sie das Recht, die Löschung Ihrer Daten zu verlangen – weitere Einzelheiten finden Sie im Abschnitt „Ihre gesetzlichen Rechte“ unten.\n\nDarüber hinaus können wir in einigen Fällen Ihre personenbezogenen Daten anonymisieren zu Forschungs- oder statistischen Zwecken verwendet werden, sodass Sie nicht mehr identifizierbar sind. In solchen Fällen können wir diese anonymisierten Informationen ohne weitere Ankündigung auf unbestimmte Zeit verwenden.',
      'es':
          'Conservaremos sus datos personales solo durante el tiempo razonablemente necesario para cumplir con los fines para los que los recopilamos, incluido el cumplimiento de cualquier requisito legal, reglamentario, fiscal, contable o de presentación de informes. En casos de quejas o cuando existe una creencia razonable de un posible litigio con respecto a nuestra relación con usted, podemos conservar sus datos personales durante un período prolongado.\n\nPara determinar el período de retención apropiado para los datos personales, consideramos varios factores, incluido el tipo, la naturaleza y la sensibilidad de los datos, el riesgo potencial de uso o divulgación no autorizados, los fines para los cuales procesamos los datos y si esos fines se pueden lograr a través de medios alternativos. Además, tenemos en cuenta los requisitos legales, reglamentarios, impositivos, contables u otros aplicables.\n\nLos detalles específicos sobre los períodos de retención para diferentes categorías de datos personales se describen en nuestra política de retención, que puede solicitarnos. En determinadas circunstancias, tiene derecho a solicitar la eliminación de sus datos; consulte la sección \"Sus derechos legales\" a continuación para obtener más detalles.\n\nAdemás, en algunos casos, podemos anonimizar sus datos personales para fines de investigación o estadísticos, haciendo que ya no sea identificable para usted. En tales casos, podemos utilizar esta información anónima indefinidamente sin previo aviso.',
      'ro':
          'Vom păstra datele dumneavoastră cu caracter personal numai atât timp cât este necesar în mod rezonabil pentru a îndeplini scopurile pentru care le-am colectat, inclusiv îndeplinirea oricăror cerințe legale, de reglementare, fiscale, contabile sau de raportare. În cazurile de plângeri sau atunci când există o credință rezonabilă a unui potențial litigiu cu privire la relația noastră cu dvs., este posibil să păstrăm datele dumneavoastră cu caracter personal pentru o perioadă extinsă.\n\nPentru a determina perioada de păstrare adecvată a datelor personale, luăm în considerare diferite factori, inclusiv tipul, natura și sensibilitatea datelor, riscul potențial de utilizare sau dezvăluire neautorizată, scopurile pentru care procesăm datele și dacă aceste scopuri pot fi atinse prin mijloace alternative. În plus, luăm în considerare cerințele legale, de reglementare, fiscale, contabile sau de altă natură aplicabile.\n\nDetaliile specifice privind perioadele de păstrare pentru diferite categorii de date cu caracter personal sunt prezentate în politica noastră de păstrare, pe care le puteți solicita de la noi. În anumite circumstanțe, aveți dreptul de a solicita ștergerea datelor dvs. — vă rugăm să consultați secțiunea „Drepturile dumneavoastră legale” de mai jos pentru mai multe detalii.\n\nÎn plus, în unele cazuri, este posibil să vă anonimizăm datele personale pentru în scopuri de cercetare sau statistice, făcându-l să nu mai fie identificabil pentru dvs. În astfel de cazuri, este posibil să folosim aceste informații anonimizate pe termen nelimitat fără a furniza o notificare suplimentară.',
    },
    'lk628knx': {
      'en': 'Your legal rights',
      'de': 'Ihre gesetzlichen Rechte',
      'es': 'Tus derechos legales',
      'ro': 'Drepturile tale legale',
    },
    'l0xmchqw': {
      'en':
          'Under specific circumstances, you possess rights under data protection laws concerning your personal data.\n\nIf you intend to exercise any of these rights, kindly reach out to us.',
      'de':
          'Unter bestimmten Umständen haben Sie datenschutzrechtliche Rechte in Bezug auf Ihre personenbezogenen Daten.\n\nWenn Sie beabsichtigen, eines dieser Rechte auszuüben, wenden Sie sich bitte an uns.',
      'es':
          'En circunstancias específicas, usted posee derechos según las leyes de protección de datos relacionados con sus datos personales.\n\nSi tiene la intención de ejercer cualquiera de estos derechos, comuníquese con nosotros.',
      'ro':
          'În anumite circumstanțe, aveți drepturi conform legilor privind protecția datelor cu privire la datele dumneavoastră cu caracter personal.\n\nDacă intenționați să vă exercitați oricare dintre aceste drepturi, vă rugăm să ne contactați.',
    },
    'wskriz1v': {
      'en': 'No fee usually required',
      'de': 'Normalerweise ist keine Gebühr erforderlich',
      'es': 'Generalmente no se requiere tarifa',
      'ro': 'De obicei, nu este necesară nicio taxă',
    },
    '4c7rfacb': {
      'en':
          'You will not be charged a fee to access your personal data or to exercise any of your other rights. However, if your request is deemed to be unfounded, repetitive, or excessive, we may charge a reasonable fee. Alternatively, we reserve the right to refuse to comply with your request in such circumstances.',
      'de':
          'Für den Zugriff auf Ihre personenbezogenen Daten oder die Ausübung anderer Rechte wird Ihnen keine Gebühr berechnet. Wenn Ihre Anfrage jedoch als unbegründet, sich wiederholend oder übertrieben erachtet wird, können wir eine angemessene Gebühr erheben. Alternativ behalten wir uns das Recht vor, unter solchen Umständen die Bearbeitung Ihrer Anfrage abzulehnen.',
      'es':
          'No se le cobrará una tarifa por acceder a sus datos personales ni por ejercer cualquiera de sus otros derechos. Sin embargo, si su solicitud se considera infundada, repetitiva o excesiva, podremos cobrarle una tarifa razonable. Alternativamente, nos reservamos el derecho de negarnos a cumplir con su solicitud en tales circunstancias.',
      'ro':
          'Nu vi se va percepe o taxă pentru a vă accesa datele personale sau pentru a vă exercita oricare dintre celelalte drepturi. Cu toate acestea, dacă cererea dumneavoastră este considerată nefondată, repetitivă sau excesivă, este posibil să percepem o taxă rezonabilă. În mod alternativ, ne rezervăm dreptul de a refuza să ne conformăm solicitării dumneavoastră în astfel de circumstanțe.',
    },
    'okji3fxs': {
      'en': 'What we may need from you',
      'de': 'Was wir von Ihnen benötigen könnten',
      'es': 'Lo que podemos necesitar de usted',
      'ro': 'Ce putem avea nevoie de la tine',
    },
    'ms3itmxm': {
      'en':
          'In order to confirm your identity and ensure your right to access your personal data or to exercise any of your other rights, we may need to request specific information from you. This serves as a security measure to prevent the disclosure of personal data to unauthorized individuals. Additionally, we may reach out to you for further information related to your request to expedite our response.',
      'de':
          'Um Ihre Identität zu bestätigen und sicherzustellen, dass Sie das Recht haben, auf Ihre personenbezogenen Daten zuzugreifen oder Ihre anderen Rechte auszuüben, müssen wir möglicherweise bestimmte Informationen von Ihnen anfordern. Dies dient als Sicherheitsmaßnahme, um die Weitergabe personenbezogener Daten an Unbefugte zu verhindern. Darüber hinaus können wir Sie um weitere Informationen zu Ihrer Anfrage bitten, um unsere Antwort zu beschleunigen.',
      'es':
          'Para confirmar su identidad y garantizar su derecho a acceder a sus datos personales o ejercer cualquiera de sus otros derechos, es posible que necesitemos solicitarle información específica. Esto sirve como medida de seguridad para evitar la divulgación de datos personales a personas no autorizadas. Además, podemos comunicarnos con usted para obtener más información relacionada con su solicitud para acelerar nuestra respuesta.',
      'ro':
          'Pentru a vă confirma identitatea și a vă asigura dreptul de a vă accesa datele personale sau de a vă exercita oricare dintre celelalte drepturi, este posibil să fie nevoie să vă solicităm informații specifice. Aceasta servește ca măsură de securitate pentru a preveni dezvăluirea datelor cu caracter personal către persoane neautorizate. În plus, vă putem contacta pentru mai multe informații legate de solicitarea dvs. de a accelera răspunsul nostru.',
    },
    'px722rdm': {
      'en': 'Time limit to respond',
      'de': 'Zeitlimit für die Antwort',
      'es': 'Plazo para responder',
      'ro': 'Limită de timp pentru a răspunde',
    },
    '9v5lon8i': {
      'en':
          'We aim to address all legitimate requests within one month. However, if your request is exceptionally complex or if multiple requests have been made, it may take longer than a month. If such circumstances arise, we will notify you and provide regular updates on the progress of your request.',
      'de':
          'Unser Ziel ist es, alle berechtigten Anfragen innerhalb eines Monats zu bearbeiten. Wenn Ihre Anfrage jedoch besonders komplex ist oder mehrere Anfragen gestellt wurden, kann es länger als einen Monat dauern. Wenn solche Umstände eintreten, werden wir Sie benachrichtigen und regelmäßig über den Fortschritt Ihrer Anfrage informieren.',
      'es':
          'Nuestro objetivo es abordar todas las solicitudes legítimas en el plazo de un mes. Sin embargo, si su solicitud es excepcionalmente compleja o si se han realizado varias solicitudes, puede tardar más de un mes. Si surgen tales circunstancias, le notificaremos y le proporcionaremos actualizaciones periódicas sobre el progreso de su solicitud.',
      'ro':
          'Ne propunem să răspundem tuturor solicitărilor legitime în termen de o lună. Cu toate acestea, dacă solicitarea dumneavoastră este excepțional de complexă sau dacă au fost făcute mai multe solicitări, poate dura mai mult de o lună. Dacă apar astfel de circumstanțe, vă vom anunța și vă vom oferi actualizări regulate cu privire la progresul solicitării dumneavoastră.',
    },
    'r6tu5cov': {
      'en': 'Glossary',
      'de': 'Glossar',
      'es': 'Glosario',
      'ro': 'Glosar',
    },
    'z5wo3vi1': {
      'en': 'Lawful Basis',
      'de': 'Rechtsgrundlage',
      'es': 'Base legal',
      'ro': 'Baza legală',
    },
    'gdbza0mo': {
      'en':
          'Legitimate Interest:\nRefers to the interest of our business in conducting and managing our operations to provide you with the best service, product, and secure experience. We ensure to carefully assess and balance any potential positive or negative impact on you and your rights before processing your personal data for our legitimate interests. We refrain from using your personal data for activities that may override your interests, unless we have obtained your consent or are otherwise obligated or permitted by law to do so. For further details on how we evaluate our legitimate interests against potential impacts on you regarding specific activities, please feel free to contact us.\n\nPerformance of Contract:\nThis involves processing your data when it is necessary for fulfilling a contract to which you are a party or for undertaking steps at your request before entering into such a contract.\n\nCompliance with a Legal Obligation:\nThis entails processing your personal data when it is necessary for adhering to a legal obligation that we are obligated to comply with.',
      'de':
          'Berechtigtes Interesse:\nBezieht sich auf das Interesse unseres Unternehmens an der Durchführung und Verwaltung unserer Geschäftstätigkeit, um Ihnen den besten Service, das beste Produkt und die beste sichere Erfahrung zu bieten. Wir stellen sicher, dass wir alle potenziellen positiven oder negativen Auswirkungen auf Sie und Ihre Rechte sorgfältig prüfen und abwägen, bevor wir Ihre personenbezogenen Daten für unsere berechtigten Interessen verarbeiten. Wir unterlassen es, Ihre personenbezogenen Daten für Aktivitäten zu nutzen, die Ihre Interessen überwiegen könnten, es sei denn, wir haben Ihre Einwilligung eingeholt oder sind anderweitig gesetzlich dazu verpflichtet oder berechtigt. Für weitere Einzelheiten dazu, wie wir unsere berechtigten Interessen im Hinblick auf mögliche Auswirkungen bestimmter Aktivitäten auf Sie abwägen, können Sie sich gerne an uns wenden.\n\nVertragserfüllung:\nHierbei handelt es sich um die Verarbeitung Ihrer Daten, wenn dies zur Erfüllung erforderlich ist eines Vertrags, dessen Vertragspartei Sie sind, oder um auf Ihren Wunsch hin Maßnahmen zu ergreifen, bevor Sie einen solchen Vertrag abschließen.\n\nEinhaltung einer gesetzlichen Verpflichtung:\nDies beinhaltet die Verarbeitung Ihrer personenbezogenen Daten, wenn dies für die Einhaltung erforderlich ist eine gesetzliche Verpflichtung, zu deren Einhaltung wir verpflichtet sind.',
      'es':
          'Interés legítimo:\nSe refiere al interés de nuestro negocio en realizar y administrar nuestras operaciones para brindarle el mejor servicio, producto y experiencia segura. Nos aseguramos de evaluar y equilibrar cuidadosamente cualquier posible impacto positivo o negativo sobre usted y sus derechos antes de procesar sus datos personales para nuestros intereses legítimos. Nos abstenemos de utilizar sus datos personales para actividades que puedan anular sus intereses, a menos que hayamos obtenido su consentimiento o estemos obligados o permitidos por la ley a hacerlo. Para obtener más detalles sobre cómo evaluamos nuestros intereses legítimos frente a posibles impactos en usted con respecto a actividades específicas, no dude en contactarnos.\n\nCumplimiento del contrato:\nEsto implica procesar sus datos cuando sea necesario para cumplir un contrato en el que usted es parte o para tomar medidas a su solicitud antes de celebrar dicho contrato.\n\nCumplimiento de una obligación legal:\nEsto implica procesar sus datos personales cuando sea necesario para cumplir con una obligación legal que estamos obligados a cumplir.',
      'ro':
          'Interes legitim:\nSe referă la interesul afacerii noastre de a conduce și gestiona operațiunile noastre pentru a vă oferi cele mai bune servicii, produse și experiență sigură. Ne asigurăm că evaluăm și echilibrăm cu atenție orice impact pozitiv sau negativ potențial asupra dumneavoastră și asupra drepturilor dumneavoastră înainte de a vă prelucra datele personale pentru interesele noastre legitime. Ne abținem să folosim datele dumneavoastră cu caracter personal pentru activități care pot depăși interesele dumneavoastră, cu excepția cazului în care v-am obținut consimțământul sau suntem obligați sau autorizați prin lege să facem acest lucru. Pentru mai multe detalii despre modul în care ne evaluăm interesele legitime în raport cu impactul potențial asupra dvs. cu privire la activități specifice, vă rugăm să nu ezitați să ne contactați.\n\nExecutarea contractului:\nAcest lucru implică prelucrarea datelor dumneavoastră atunci când este necesar pentru îndeplinirea un contract la care sunteți parte sau pentru a întreprinde pași la cererea dumneavoastră înainte de a încheia un astfel de contract.\n\nRespectarea unei obligații legale:\nAceasta implică prelucrarea datelor dumneavoastră cu caracter personal atunci când este necesar pentru aderarea la o obligație legală pe care suntem obligați să o respectăm.',
    },
    '4vo7yum3': {
      'en': 'External Third Parties',
      'de': 'Externe Dritte',
      'es': 'Terceros Externos',
      'ro': 'Terți externi',
    },
    'kcfxmj2i': {
      'en':
          '- Service providers acting as processors based in the United Kingdom who offer IT and system administration services.\n- Professional advisers acting as processors or joint controllers, including lawyers, bankers, auditors, and insurers based in the United Kingdom, who provide consultancy, banking, legal, insurance, and accounting services.\n- HM Revenue & Customs, regulators, and other authorities such as the Advertising Standards Authority acting as processors or joint controllers based in the United Kingdom, who require reporting of processing activities in certain circumstances.\n- Marketing providers such as Text Global Limited and Mailchimp, utilized for marketing campaigns with customer approval.\n',
      'de':
          '- Dienstleister, die als Auftragsverarbeiter mit Sitz im Vereinigten Königreich fungieren und IT- und Systemadministrationsdienste anbieten.\n- Professionelle Berater, die als Auftragsverarbeiter oder gemeinsame Verantwortliche fungieren, darunter Rechtsanwälte, Banker, Wirtschaftsprüfer und Versicherer mit Sitz im Vereinigten Königreich, die Beratung anbieten , Bank-, Rechts-, Versicherungs- und Buchhaltungsdienstleistungen.\n- HM Revenue & Customs, Regulierungsbehörden und andere Behörden wie die Advertising Standards Authority, die als Auftragsverarbeiter oder gemeinsame Verantwortliche mit Sitz im Vereinigten Königreich fungieren und die Meldung von Verarbeitungsaktivitäten in verlangen Unter bestimmten Umständen.\n- Marketinganbieter wie Text Global Limited und Mailchimp, die für Marketingkampagnen mit Zustimmung des Kunden eingesetzt werden.',
      'es':
          '- Proveedores de servicios que actúan como procesadores con sede en el Reino Unido que ofrecen servicios de administración de sistemas y TI.\n- Asesores profesionales que actúan como procesadores o controladores conjuntos, incluidos abogados, banqueros, auditores y aseguradores con sede en el Reino Unido, que brindan consultoría , servicios bancarios, legales, de seguros y de contabilidad.\n- HM Revenue & Customs, reguladores y otras autoridades, como la Advertising Standards Authority, que actúan como procesadores o controladores conjuntos con sede en el Reino Unido, que exigen informes de las actividades de procesamiento en determinadas circunstancias.\n- Proveedores de marketing como Text Global Limited y Mailchimp, utilizados para campañas de marketing con la aprobación del cliente.',
      'ro':
          '- Furnizori de servicii care acționează ca procesatori cu sediul în Regatul Unit și care oferă servicii IT și de administrare a sistemelor.\n- Consilieri profesioniști care acționează ca procesatori sau controlori comune, inclusiv avocați, bancheri, auditori și asigurători cu sediul în Regatul Unit, care oferă consultanță , servicii bancare, juridice, de asigurări și de contabilitate.\n- HM Revenue & Customs, autoritățile de reglementare și alte autorități, cum ar fi Advertising Standards Authority, care acționează ca procesatori sau controlori în comun cu sediul în Regatul Unit, care solicită raportarea activităților de prelucrare în anumite circumstanțe.\n- Furnizori de marketing precum Text Global Limited și Mailchimp, utilizați pentru campanii de marketing cu aprobarea clienților.',
    },
    '7drs7clx': {
      'en': 'Your Legal Rights',
      'de': 'Ihre gesetzlichen Rechte',
      'es': 'Sus derechos legales',
      'ro': 'Drepturile dumneavoastră legale',
    },
    'rke0jli4': {
      'en':
          'You have the right to:\n\n1. Request access to your personal data:\n   This allows you to receive a copy of the personal data we hold about you and verify that we are lawfully processing it.\n\n2. Request correction of your personal data:\n   You can request correction of any incomplete or inaccurate data we hold about you. We may need to verify the accuracy of the new data you provide.\n\n3. Request erasure of your personal data:\n   You can ask us to delete or remove personal data where there is no valid reason for us to continue processing it. You also have the right to request deletion or removal of your personal data where you have successfully objected to processing, where processing was unlawful, or where erasure is required to comply with local law. However, we may not always be able to comply with your request for specific legal reasons, which will be communicated to you if applicable.\n\n4.Object to processing of your personal data:\n   If we are processing your personal data based on legitimate interests (or those of a third party) and there is something about your particular situation that makes you want to object to processing, you have the right to do so. You also have the right to object where we are processing your personal data for direct marketing purposes. However, we may demonstrate that we have compelling legitimate grounds to process your information that override your rights and freedoms.\n\n5. Request restriction of processing of your personal data:\n   You can ask us to suspend the processing of your personal data in certain situations:\n   - If you want us to establish the accuracy of the data.\n   - Where our use of the data is unlawful but you do not want us to erase it.\n   - Where you need us to hold the data even if we no longer require it, as you need it to establish, exercise, or defend legal claims.\n   - You have objected to our use of your data but we need to verify whether we have overriding legitimate grounds to use it.\n\n6. Request the transfer of your personal data:\n   We will provide you, or a third party you have chosen, with your personal data in a structured, commonly used, machine-readable format. Please note that this right only applies to automated information which you initially provided consent for us to use, or where we used the information to perform a contract with you.\n\n7. Withdraw consent:\n   You have the right to withdraw your consent at any time where we are relying on consent to process your personal data. However, this will not affect the lawfulness of any processing carried out before you withdrew your consent. If you withdraw your consent, we may not be able to provide certain products or services to you, and we will inform you if this is the case at the time you withdraw your consent.',
      'de':
          'Sie haben das Recht:\n\n1. Fordern Sie Zugriff auf Ihre personenbezogenen Daten an:\n Dadurch erhalten Sie eine Kopie der personenbezogenen Daten, die wir über Sie gespeichert haben, und können überprüfen, ob wir diese rechtmäßig verarbeiten.\n\n2. Fordern Sie die Korrektur Ihrer personenbezogenen Daten an:\n Sie können die Korrektur unvollständiger oder unrichtiger Daten beantragen, die wir über Sie gespeichert haben. Möglicherweise müssen wir die Richtigkeit der von Ihnen bereitgestellten neuen Daten überprüfen.\n\n3. Fordern Sie die Löschung Ihrer personenbezogenen Daten an:\n Sie können uns auffordern, personenbezogene Daten zu löschen oder zu entfernen, wenn kein triftiger Grund dafür besteht, dass wir sie weiterhin verarbeiten. Sie haben außerdem das Recht, die Löschung oder Entfernung Ihrer personenbezogenen Daten zu verlangen, wenn Sie der Verarbeitung erfolgreich widersprochen haben, die Verarbeitung unrechtmäßig war oder die Löschung zur Einhaltung lokaler Gesetze erforderlich ist. Aus bestimmten rechtlichen Gründen, die Ihnen gegebenenfalls mitgeteilt werden, können wir Ihrer Anfrage jedoch möglicherweise nicht immer nachkommen.\n\n4.Widerspruch gegen die Verarbeitung Ihrer personenbezogenen Daten:\n Wenn wir Daten verarbeiten Wenn Sie Ihre personenbezogenen Daten auf der Grundlage berechtigter Interessen (oder der Interessen Dritter) verarbeiten und Ihre besondere Situation Anlass zu einem Widerspruch gegen die Verarbeitung gibt, haben Sie das Recht, dies zu tun. Sie haben außerdem das Recht, Widerspruch einzulegen, wenn wir Ihre personenbezogenen Daten für Direktmarketingzwecke verarbeiten. Wir können jedoch nachweisen, dass wir zwingende legitime Gründe für die Verarbeitung Ihrer Daten haben, die Vorrang vor Ihren Rechten und Freiheiten haben.\n\n5. Beantragen Sie die Einschränkung der Verarbeitung Ihrer personenbezogenen Daten:\n Sie können uns bitten, die Verarbeitung Ihrer personenbezogenen Daten in bestimmten Situationen auszusetzen:\n - Wenn Sie möchten, dass wir die Richtigkeit der Daten feststellen.\n - Wo unsere Die Verwendung der Daten ist rechtswidrig, Sie möchten jedoch nicht, dass wir sie löschen.\n – Wenn Sie verlangen, dass wir die Daten aufbewahren, auch wenn wir sie nicht mehr benötigen, da Sie sie zur Geltendmachung, Ausübung oder Verteidigung von Rechtsansprüchen benötigen. \n – Sie haben der Verwendung Ihrer Daten durch uns widersprochen, wir müssen jedoch prüfen, ob wir übergeordnete berechtigte Gründe für die Verwendung Ihrer Daten haben.\n\n6. Fordern Sie die Übermittlung Ihrer personenbezogenen Daten an:\n Wir stellen Ihnen oder einem von Ihnen ausgewählten Dritten Ihre personenbezogenen Daten in einem strukturierten, gängigen, maschinenlesbaren Format zur Verfügung. Bitte beachten Sie, dass dieses Recht nur für automatisierte Informationen gilt, für deren Nutzung Sie uns zunächst Ihre Einwilligung erteilt haben oder für die wir die Informationen zur Erfüllung eines Vertrags mit Ihnen verwendet haben.\n\n7. Einwilligung widerrufen:\n Sie haben das Recht, Ihre Einwilligung jederzeit zu widerrufen, wenn wir uns bei der Verarbeitung Ihrer personenbezogenen Daten auf eine Einwilligung stützen. Dies hat jedoch keinen Einfluss auf die Rechtmäßigkeit einer Verarbeitung, die vor Ihrem Widerruf Ihrer Einwilligung erfolgt ist. Wenn Sie Ihre Einwilligung widerrufen, können wir Ihnen möglicherweise bestimmte Produkte oder Dienstleistungen nicht zur Verfügung stellen. Wir werden Sie darüber informieren, wenn dies zum Zeitpunkt des Widerrufs Ihrer Einwilligung der Fall ist.',
      'es':
          'Tienes derecho a:\n\n1. Solicitar acceso a sus datos personales:\n Esto le permite recibir una copia de los datos personales que tenemos sobre usted y verificar que los estamos procesando legalmente.\n\n2. Solicitar la corrección de sus datos personales:\n Puede solicitar la corrección de cualquier dato incompleto o inexacto que tengamos sobre usted. Es posible que necesitemos verificar la exactitud de los nuevos datos que usted proporcione.\n\n3. Solicitar la eliminación de sus datos personales:\n Puede solicitarnos que eliminemos o eliminemos datos personales cuando no exista una razón válida para que sigamos procesándolos. También tiene derecho a solicitar la eliminación o eliminación de sus datos personales cuando se haya opuesto exitosamente al procesamiento, cuando el procesamiento fuera ilegal o cuando se requiera la eliminación para cumplir con la ley local. Sin embargo, es posible que no siempre podamos cumplir con su solicitud por razones legales específicas, que se le comunicarán si corresponde.\n\n4.Objetar el procesamiento de sus datos personales:\n Si estamos procesando tus datos personales en base a intereses legítimos (o los de un tercero) y hay algo en tu situación particular que te hace querer oponerte al procesamiento, tienes derecho a hacerlo. También tiene derecho a oponerse cuando procesamos sus datos personales con fines de marketing directo. Sin embargo, podemos demostrar que tenemos motivos legítimos convincentes para procesar su información que anulan sus derechos y libertades.\n\n5. Solicitar la restricción del procesamiento de sus datos personales:\n Puede solicitarnos que suspendamos el procesamiento de sus datos personales en determinadas situaciones:\n - Si desea que establezcamos la exactitud de los datos.\n - Donde nuestro El uso de los datos es ilegal pero usted no desea que los borremos.\n - Cuando necesita que conservemos los datos incluso si ya no los necesitamos, ya que los necesita para establecer, ejercer o defender reclamos legales. \n - Usted se ha opuesto a que usemos sus datos, pero necesitamos verificar si tenemos motivos legítimos imperiosos para usarlos.\n\n6. Solicite la transferencia de sus datos personales:\n Le proporcionaremos a usted, o a un tercero que haya elegido, sus datos personales en un formato estructurado, de uso común y legible por máquina. Tenga en cuenta que este derecho solo se aplica a la información automatizada para la cual usted inicialmente nos dio su consentimiento para usar, o cuando usamos la información para ejecutar un contrato con usted.\n\n7. Retirar el consentimiento:\n Tiene derecho a retirar su consentimiento en cualquier momento cuando dependamos del consentimiento para procesar sus datos personales. Sin embargo, esto no afectará la legalidad de cualquier procesamiento realizado antes de que usted retirara su consentimiento. Si retira su consentimiento, es posible que no podamos proporcionarle ciertos productos o servicios, y le informaremos si este es el caso en el momento en que retire su consentimiento.',
      'ro':
          'Aveți dreptul la:\n\n1. Solicitați acces la datele dvs. personale:\n Acest lucru vă permite să primiți o copie a datelor personale pe care le deținem despre dvs. și să verificați că le procesăm în mod legal.\n\n2. Solicitați corectarea datelor dumneavoastră personale:\n Puteți solicita corectarea oricăror date incomplete sau inexacte pe care le deținem despre dumneavoastră. Este posibil să fie nevoie să verificăm acuratețea noilor date pe care le furnizați.\n\n3. Solicitați ștergerea datelor dvs. cu caracter personal:\n Ne puteți cere să ștergem sau să ștergem datele cu caracter personal acolo unde nu există niciun motiv valabil pentru ca noi să le continuăm procesarea. Aveți, de asemenea, dreptul de a solicita ștergerea sau ștergerea datelor dumneavoastră cu caracter personal atunci când v-ați opus cu succes prelucrării, când prelucrarea a fost ilegală sau când ștergerea este necesară pentru a respecta legislația locală. Cu toate acestea, este posibil să nu reușim întotdeauna să răspundem solicitării dumneavoastră din motive legale specifice, care vă vor fi comunicate dacă este cazul.\n\n4. Obiectul prelucrării datelor dumneavoastră cu caracter personal:\n Dacă procesăm datele dumneavoastră cu caracter personal bazate pe interese legitime (sau ale unui terț) și există ceva în situația dumneavoastră particulară care vă face să doriți să vă opuneți prelucrării, aveți dreptul să faceți acest lucru. De asemenea, aveți dreptul de a vă opune în cazul în care prelucrăm datele dumneavoastră cu caracter personal în scopuri de marketing direct. Cu toate acestea, putem demonstra că avem motive legitime convingătoare pentru a vă prelucra informațiile care prevalează asupra drepturilor și libertăților dumneavoastră.\n\n5. Solicitați restricționarea prelucrării datelor dumneavoastră cu caracter personal:\n Ne puteți cere să suspendăm prelucrarea datelor dumneavoastră cu caracter personal în anumite situații:\n - Dacă doriți să stabilim exactitatea datelor.\n - În cazul în care noastre utilizarea datelor este ilegală, dar nu doriți să o ștergem.\n - În cazul în care aveți nevoie de noi să păstrăm datele chiar dacă nu le mai solicităm, deoarece aveți nevoie de ele pentru a stabili, exercita sau apăra pretenții legale. \n - V-ați opus utilizării de către noi a datelor dvs., dar trebuie să verificăm dacă avem motive legitime prevalente pentru a le folosi.\n\n6. Solicitați transferul datelor dumneavoastră cu caracter personal:\n Vă vom furniza dumneavoastră sau unei terțe părți alese de dvs. datele dumneavoastră personale într-un format structurat, utilizat în mod obișnuit, care poate fi citit de mașină. Vă rugăm să rețineți că acest drept se aplică numai informațiilor automate pe care inițial ne-ați dat consimțământul pentru ca noi să le folosim sau în cazul în care am folosit informațiile pentru a îndeplini un contract cu dvs.\n\n7. Retragerea consimțământului:\n Aveți dreptul de a vă retrage consimțământul în orice moment, în cazul în care ne bazăm pe consimțământ pentru a vă prelucra datele personale. Cu toate acestea, acest lucru nu va afecta legalitatea vreunei prelucrări efectuate înainte de a vă retrage consimțământul. Dacă vă retrageți consimțământul, este posibil să nu vă putem oferi anumite produse sau servicii și vă vom informa dacă acesta este cazul în momentul în care vă retrageți consimțământul.',
    },
    '21c5ungb': {
      'en': 'Home',
      'de': 'Heim',
      'es': 'Hogar',
      'ro': 'Acasă',
    },
  },
  // termsandconditions
  {
    'xusqg97l': {
      'en': 'Terms And Conditions',
      'de': 'Geschäftsbedingungen',
      'es': 'Términos y condiciones',
      'ro': 'Termeni și condiții',
    },
    '0jtwb846': {
      'en': 'Terms And Conditions',
      'de': 'Geschäftsbedingungen',
      'es': 'Términos y condiciones',
      'ro': 'Termeni și condiții',
    },
    '12poommu': {
      'en': 'The Promoter',
      'de': 'Der Promoter',
      'es': 'El Promotor',
      'ro': 'Promotorul',
    },
    'l3v0g6hy': {
      'en':
          '- The Promoter conducting the promotion is BLUEDASH Limited, identified by Company Number 15584865, with its registered address situated at 382 Kenton Road, Harrow, Greater London, England, HA3 8DP.\n- For any inquiries or concerns, feel free to reach out to us via email at contact@bluedash.co.uk.',
      'de':
          '- Der Veranstalter, der die Werbeaktion durchführt, ist BLUEDASH Limited mit der Firmennummer 15584865 und der eingetragenen Adresse 382 Kenton Road, Harrow, Greater London, England, HA3 8DP.\n- Bei Fragen oder Bedenken können Sie sich jederzeit an uns wenden Schicken Sie uns eine E-Mail an contact@bluedash.co.uk.',
      'es':
          '- El promotor que realiza la promoción es BLUEDASH Limited, identificado con el número de empresa 15584865, con domicilio social situado en 382 Kenton Road, Harrow, Greater London, Inglaterra, HA3 8DP.\n- Para cualquier consulta o inquietud, no dude en comunicarse escríbanos por correo electrónico a contact@bluedash.co.uk.',
      'ro':
          '- Promotorul care desfășoară promoția este BLUEDASH Limited, identificat prin numărul companiei 15584865, cu adresa sa înregistrată situată la 382 Kenton Road, Harrow, Greater London, England, HA3 8DP.\n- Pentru orice întrebări sau nelămuriri, nu ezitați să contactați trimiteți-ne prin e-mail la contact@bluedash.co.uk.',
    },
    'whzcg6nm': {
      'en': 'The competition',
      'de': 'Der Wettbewerb',
      'es': 'La competencia',
      'ro': 'Competitia',
    },
    'd14fqy7h': {
      'en':
          '1. These terms and conditions (referred to as the \"T&Cs\") are applicable to all competitions featured on the Promoter’s website, located at bountyfever.com (referred to as the “Website”), encompassing both standard competitions (\"Standard Competitions\") and online \"instant win\" competitions (\"Instant Win Competitions\"). They govern all interactions between the Promoter and participants. Standard Competitions and Instant Win Competitions collectively are referred to as \"Competitions\" within these T&Cs, and any mention of a \"Competition\" implies either a Standard Competition or an Instant Win Competition.\n\n2. In case of any discrepancy between these T&Cs and any information provided on the Website, advertisement, or other promotional materials regarding a competition by the Promoter, these T&Cs will take precedence.\n\n3. To qualify for a chance of winning, every individual entering the Competition (referred to as an “Entrant”) must accurately respond to a question or solve a problem posed by the Promoter (referred to as the “Competition Question”).\n\n4. Each Competition involves a Competition Question, and an entry fee is required for each entry made into a Competition. In instances where the Promoter presents an easy or multiple-choice question, an alternative free entry method is available.',
      'de':
          '1. Diese Allgemeinen Geschäftsbedingungen (im Folgenden als „AGB“ bezeichnet) gelten für alle Wettbewerbe, die auf der Website des Veranstalters unter bountyfever.com (im Folgenden als „Website“ bezeichnet) angeboten werden, und umfassen sowohl Standardwettbewerbe („Standardwettbewerbe“). ) und Online-„Sofortgewinn“-Wettbewerbe („Sofortgewinnwettbewerbe“). Sie regeln alle Interaktionen zwischen dem Veranstalter und den Teilnehmern. Standardwettbewerbe und Sofortgewinnwettbewerbe werden in diesen AGB gemeinsam als „Wettbewerbe“ bezeichnet, und jede Erwähnung eines „Wettbewerbs“ impliziert entweder einen Standardwettbewerb oder einen Sofortgewinnwettbewerb.\n\n2. Im Falle einer Diskrepanz zwischen diesen AGB und den auf der Website, in der Werbung oder in anderen Werbematerialien bereitgestellten Informationen zu einem Wettbewerb des Veranstalters haben diese AGB Vorrang.\n\n3. Um sich für eine Gewinnchance zu qualifizieren, muss jede am Wettbewerb teilnehmende Person (als „Teilnehmer“ bezeichnet) eine vom Veranstalter gestellte Frage genau beantworten oder ein Problem lösen (als „Wettbewerbsfrage“ bezeichnet).\n \n4. Jeder Wettbewerb beinhaltet eine Wettbewerbsfrage und für jede Teilnahme an einem Wettbewerb ist eine Teilnahmegebühr erforderlich. In Fällen, in denen der Veranstalter eine einfache oder Multiple-Choice-Frage stellt, steht eine alternative kostenlose Teilnahmemethode zur Verfügung.',
      'es':
          '1. Estos términos y condiciones (denominados \"TyC\") son aplicables a todos los concursos presentados en el sitio web del Promotor, ubicado en bountyfever.com (denominado el \"Sitio web\"), abarcando ambos concursos estándar (\"Concursos estándar\" ) y competiciones en línea de \"ganancia instantánea\" (\"Concursos de ganancia instantánea\"). Gobiernan todas las interacciones entre el Promotor y los participantes. Las Competiciones estándar y las Competiciones con premios instantáneos en conjunto se denominan \"Competiciones\" en estos Términos y condiciones, y cualquier mención de una \"Competición\" implica una Competición estándar o una Competición con premios instantáneos.\n\n2. En caso de cualquier discrepancia entre estos TyC y cualquier información proporcionada en el sitio web, publicidad u otros materiales promocionales con respecto a una competencia realizada por el Promotor, estos TyC tendrán prioridad.\n\n3. Para calificar para tener la oportunidad de ganar, cada individuo que ingresa al Concurso (denominado \"Participante\") debe responder con precisión a una pregunta o resolver un problema planteado por el Promotor (denominado \"Pregunta del Concurso\").\n \n4. Cada competencia implica una pregunta de competencia y se requiere una tarifa de inscripción por cada participación realizada en una competencia. En los casos en que el Promotor presente una pregunta fácil o de opción múltiple, hay disponible un método de entrada gratuito alternativo.',
      'ro':
          '1. Acești termeni și condiții (denumite „T&C”) sunt aplicabile tuturor competițiilor prezentate pe site-ul Promotorului, situat la bountyfever.com (denumit „Site-ul”), cuprinzând ambele competiții standard („Competiții standard” ) și competiții online „câștig instant” („Competiții cu câștig instantaneu”). Acestea guvernează toate interacțiunile dintre Promotor și participanți. Competițiile Standard și Competițiile Instant Win sunt denumite în mod colectiv „Competiții” în cadrul acestor T&C și orice mențiune despre o „Competiție” implică fie o Competiție Standard, fie o Competiție Instant Win.\n\n2. În cazul oricărei discrepanțe între aceste T&C și orice informații furnizate pe site, reclamă sau alte materiale promoționale referitoare la o competiție de către Promotor, aceste T&C vor avea prioritate.\n\n3. Pentru a se califica pentru o șansă de câștig, fiecare persoană care intră în Competiție (denumită „Participant”) trebuie să răspundă cu precizie la o întrebare sau să rezolve o problemă pusă de Promotor (denumită „Întrebarea Competiției”).\n \n4. Fiecare Competiție implică o Întrebare de Concurs și este necesară o taxă de înscriere pentru fiecare înscriere într-o Competiție. În cazurile în care Promotorul prezintă o întrebare ușoară sau cu răspunsuri multiple, este disponibilă o metodă alternativă de intrare gratuită.',
    },
    '43qe42ec': {
      'en': 'How to enter',
      'de': 'So geben Sie ein',
      'es': 'Cómo entrar',
      'ro': 'Cum să intri',
    },
    'oj6f9eev': {
      'en':
          '1. Competitions will operate within the designated opening and closing dates as specified on the Website. These dates are termed as the “Opening Date” and “Closing Date” respectively. All times and dates mentioned are in accordance with London, England time.\n\n2. Should it become absolutely necessary, the Promoter retains the right to modify the Opening and Closing Dates. In the event of such changes, the updated details will be presented on the Website. The Promoter will not extend the Closing Date solely to increase entry sales.\n\n3. All entries for competitions must reach the Promoter no later than the specified time on the Closing Date. Entries received after this time are automatically disqualified, with no refunds issued.\n\n4. The maximum number of entries allowed for a Competition will be indicated on the Website. If the maximum entry limit is reached, the number of entries per individual may be restricted.\n\n5. Entries, whether paid or free, are restricted per person per Competition. The maximum number of entries per Entrant for a Competition will be detailed on the Competition\'s webpage on the Website. Further entries will not be permitted once the maximum entry limit is reached.\n\n6. Steps to enter a Standard Competition using the paid entry method:\n\n    1. Visit the Website and select the Standard Competition you wish to participate in.\n    2. Provide your response to the Competition Question.\n    3. Choose the desired number of entries and proceed to checkout.\n    4. Log in or register if not already logged in.\n    5. Accept the T&Cs and complete the purchase.\n\n7. Steps to enter an Instant Win Competition using the paid entry method:\n\n    1. Visit the Website and select the Instant Win Competition you wish to enter.\n    2. Choose the desired number of entries and proceed to checkout.\n    3. Log in or register if not already logged in.\n    4. Accept the T&Cs and finalize your purchase.\n\n8. The use of Stripe is restricted to individuals over 18 years old and residents of mainland UK. Refer to Stripe\'s terms and conditions for usage guidelines.\n\n9. Upon online purchase of a Competition entry, the Promoter will send confirmation of receipt.\n\n10. The Promoter will not be held responsible for incomplete, lost, or delayed Competition entries, regardless of the cause, including equipment failures, technical glitches, or other system malfunctions.\n\n11. By purchasing entries and/or submitting a Competition entry (whether purchased online or entered for free), you affirm your eligibility to participate, acknowledge entering into a contract with the Promoter, and agree to abide by these T&Cs.\n\n12. You may enter a Competition (whether a Standard Competition or an Instant Win Competition) for free by adhering to the following conditions:\n\n    1. Send your entry via pre-paid first or second class post to the Promoter at the provided address.\n    2. Hand-delivered entries will not be accepted or entered into the random draw.\n    3. Include the following information with your entry:\n        - Details of the Competition you wish to enter.\n        - Your full name.\n        - Your date of birth.\n        - Your postal address.\n        - A contact telephone number and email address.\n        - Your response to any Competition Question.\n    4. Incomplete or illegible entries will be disqualified.\n    5. Multiple free entries for any Competition are permitted up to the limit set by the Promoter. Each free entry must be submitted separately.\n    6. Free entries for a Standard Competition must reach the Promoter before the Closing Date and before all tickets are allocated. Entries received within 48 hours after the Closing Date or after all tickets have been sold/allocated may be entered into the next available Competition at the Promoter\'s discretion. Proof of posting does not guarantee entry into the random draw.\n    7. Free entries for an Instant Win Competition must be received before all tickets are sold/allocated or within forty-eight hours (48 hours) after the Closing Date to be considered for entry.\n    8. If the entry cap or limit is reached before your free entry is received, you will not be entered into the Competition or any other Competition (except as specified in paragraph 12.6 above).\n    9. Entrants must have an account on the website/app for a free entry to be processed, with all details matching the account information.',
      'de':
          '1. Die Wettbewerbe finden innerhalb der auf der Website angegebenen Eröffnungs- und Schlusstermine statt. Diese Daten werden als „Eröffnungsdatum“ bzw. „Abschlussdatum“ bezeichnet. Alle genannten Zeiten und Daten entsprechen der Zeit in London, England.\n\n2. Sollte es unbedingt erforderlich sein, behält sich der Veranstalter das Recht vor, die Eröffnungs- und Schlusstermine zu ändern. Im Falle solcher Änderungen werden die aktualisierten Details auf der Website angezeigt. Der Veranstalter wird den Teilnahmeschluss nicht nur verlängern, um die Teilnahmeverkäufe zu steigern.\n\n3. Alle Einsendungen für Wettbewerbe müssen spätestens zum angegebenen Zeitpunkt am Einsendeschluss beim Veranstalter eingehen. Beiträge, die nach diesem Zeitpunkt eingehen, werden automatisch disqualifiziert und es erfolgt keine Rückerstattung.\n\n4. Die maximal zulässige Teilnehmerzahl für einen Wettbewerb wird auf der Website angegeben. Bei Erreichen der maximalen Teilnahmegrenze kann die Anzahl der Teilnahmen pro Person eingeschränkt werden.\n\n5. Die Teilnahme ist, egal ob kostenpflichtig oder kostenlos, pro Person und Wettbewerb beschränkt. Die maximale Anzahl der Einsendungen pro Teilnehmer für einen Wettbewerb wird auf der Webseite des Wettbewerbs detailliert beschrieben. Sobald die maximale Teilnehmerzahl erreicht ist, sind keine weiteren Anmeldungen mehr möglich.\n\n6. Schritte zur Teilnahme an einem Standardwettbewerb mit der kostenpflichtigen Teilnahmemethode:\n\n 1. Besuchen Sie die Website und wählen Sie den Standardwettbewerb aus, an dem Sie teilnehmen möchten.\n 2. Geben Sie Ihre Antwort auf die Wettbewerbsfrage.\n 3. Wählen Sie die gewünschte Anzahl an Einträgen und gehen Sie zur Kasse.\n 4. Melden Sie sich an oder registrieren Sie sich, falls Sie noch nicht angemeldet sind.\n 5. Akzeptieren Sie die AGB und schließen Sie den Kauf ab.\n\n7. Schritte zur Teilnahme an einem Sofortgewinnwettbewerb mit der kostenpflichtigen Teilnahmemethode:\n\n 1. Besuchen Sie die Website und wählen Sie den Sofortgewinnwettbewerb aus, an dem Sie teilnehmen möchten.\n 2. Wählen Sie die gewünschte Anzahl an Teilnahmen und gehen Sie zur Kasse .\n 3. Melden Sie sich an oder registrieren Sie sich, falls Sie noch nicht angemeldet sind.\n 4. Akzeptieren Sie die AGB und schließen Sie Ihren Kauf ab.\n\n8. Die Nutzung von Stripe ist auf Personen über 18 Jahre und Einwohner des britischen Festlandes beschränkt. Nutzungsrichtlinien finden Sie in den Allgemeinen Geschäftsbedingungen von Stripe.\n\n9. Beim Online-Kauf eines Wettbewerbsbeitrags sendet der Veranstalter eine Empfangsbestätigung.\n\n10. Der Veranstalter haftet nicht für unvollständige, verlorene oder verspätete Wettbewerbsbeiträge, unabhängig von der Ursache, einschließlich Geräteausfällen, technischen Störungen oder anderen Systemstörungen.\n\n11. Durch den Kauf von Beiträgen und/oder die Einreichung eines Wettbewerbsbeitrags (ob online gekauft oder kostenlos) bestätigen Sie Ihre Teilnahmeberechtigung, bestätigen den Abschluss eines Vertrags mit dem Veranstalter und erklären sich mit der Einhaltung dieser AGB einverstanden.\n\n 12. Sie können kostenlos an einem Wettbewerb (ob Standardwettbewerb oder Sofortgewinnwettbewerb) teilnehmen, indem Sie die folgenden Bedingungen einhalten:\n\n 1. Senden Sie Ihre Teilnahme per vorausbezahlter Post erster oder zweiter Klasse an den Veranstalter unter angegebene Adresse.\n 2. Persönlich abgegebene Einsendungen werden nicht akzeptiert oder nehmen nicht an der Zufallsverlosung teil.\n 3. Fügen Sie Ihrer Einsendung die folgenden Informationen bei:\n - Einzelheiten des Wettbewerbs, an dem Sie teilnehmen möchten.< __FFNL__> – Ihr vollständiger Name.\n – Ihr Geburtsdatum.\n – Ihre Postanschrift.\n – Eine Kontakttelefonnummer und E-Mail-Adresse.\n – Ihre Antwort auf alle Wettbewerbsfragen.\n 4. Unvollständige oder unleserliche Einsendungen werden disqualifiziert.\n 5. Mehrere kostenlose Einsendungen für jeden Wettbewerb sind bis zu dem vom Veranstalter festgelegten Limit zulässig. Jeder kostenlose Eintrag muss separat eingereicht werden.\n 6. Kostenlose Einträge für einen Standardwettbewerb müssen vor dem Einsendeschluss und vor der Zuteilung aller Tickets beim Veranstalter eingehen. Beiträge, die innerhalb von 48 Stunden nach dem Einsendeschluss oder nachdem alle Tickets verkauft/zugeteilt wurden, eingehen, können nach Ermessen des Veranstalters am nächsten verfügbaren Wettbewerb teilnehmen. Der Nachweis der Veröffentlichung garantiert nicht die Teilnahme an der Zufallsverlosung.\n 7. Kostenlose Teilnahmen für einen Sofortgewinnwettbewerb müssen vor dem Verkauf/Zuteilung aller Tickets oder innerhalb von achtundvierzig Stunden (48 Stunden) nach dem Einsendeschluss eingegangen sein für die Teilnahme berücksichtigt.\n 8. Wenn die Teilnahmeobergrenze oder -grenze erreicht ist, bevor Sie Ihre kostenlose Teilnahme erhalten haben, nehmen Sie nicht am Wettbewerb oder einem anderen Wettbewerb teil (außer wie in Absatz 12.6 oben angegeben).\n 9 Um eine kostenlose Teilnahme zu ermöglichen, müssen Teilnehmer über ein Konto auf der Website/App verfügen, wobei alle Angaben mit den Kontoinformationen übereinstimmen müssen.',
      'es':
          '1. Los concursos se llevarán a cabo dentro de las fechas de apertura y cierre designadas como se especifica en el sitio web. Estas fechas se denominan “Fecha de Apertura” y “Fecha de Cierre” respectivamente. Todas las horas y fechas mencionadas están de acuerdo con la hora de Londres, Inglaterra.\n\n2. Si fuera absolutamente necesario, el Promotor se reserva el derecho de modificar las Fechas de Apertura y Cierre. En caso de dichos cambios, los detalles actualizados se presentarán en el sitio web. El Promotor no extenderá la Fecha de cierre únicamente para aumentar las ventas de entradas.\n\n3. Todas las inscripciones para concursos deben llegar al Promotor a más tardar a la hora especificada en la Fecha de cierre. Las inscripciones recibidas después de este tiempo quedan descalificadas automáticamente y no se emiten reembolsos.\n\n4. El número máximo de inscripciones permitidas para un Concurso se indicará en el Sitio web. Si se alcanza el límite máximo de inscripciones, se puede restringir el número de inscripciones por persona.\n\n5. Las inscripciones, ya sean gratuitas o pagadas, están restringidas por persona por Competición. El número máximo de inscripciones por Participante para un Concurso se detallará en la página web del Concurso en el Sitio web. No se permitirán más entradas una vez que se alcance el límite máximo de entradas.\n\n6. Pasos para participar en una competencia estándar utilizando el método de inscripción paga:\n\n 1. Visite el sitio web y seleccione la competencia estándar en la que desea participar.\n 2. Proporcione su respuesta a la pregunta de la competencia.\n 3. Elija el número deseado de entradas y proceda al pago.\n 4. Inicie sesión o regístrese si aún no ha iniciado sesión.\n 5. Acepte los términos y condiciones y complete la compra.\n\n7. Pasos para participar en un Concurso de premios instantáneos utilizando el método de inscripción paga:\n\n 1. Visite el sitio web y seleccione el Concurso de premios instantáneos en el que desea participar.\n 2. Elija el número deseado de entradas y proceda al pago .\n 3. Inicie sesión o regístrese si aún no lo ha hecho.\n 4. Acepte los T&C y finalice su compra.\n\n8. El uso de Stripe está restringido a personas mayores de 18 años y residentes del Reino Unido continental. Consulte los términos y condiciones de Stripe para conocer las pautas de uso.\n\n9. Tras la compra en línea de una entrada al Concurso, el Promotor enviará una confirmación de recepción.\n\n10. El Promotor no será responsable de las inscripciones al Concurso incompletas, perdidas o retrasadas, independientemente de la causa, incluidas fallas en el equipo, fallos técnicos u otros fallos del sistema.\n\n11. Al comprar inscripciones y/o enviar una inscripción al Concurso (ya sea comprada en línea o inscrita de forma gratuita), usted afirma su elegibilidad para participar, reconoce haber celebrado un contrato con el Promotor y acepta cumplir con estos Términos y condiciones.\n\n 12. Puede participar en un Concurso (ya sea un Concurso estándar o un Concurso con premios instantáneos) de forma gratuita si cumple con las siguientes condiciones:\n\n 1. Envíe su participación por correo prepago de primera o segunda clase al Promotor en la dirección proporcionada.\n 2. Las participaciones entregadas personalmente no se aceptarán ni participarán en el sorteo aleatorio.\n 3. Incluya la siguiente información con su participación:\n - Detalles del concurso en el que desea participar.\n __FFNL__> - Su nombre completo.\n - Su fecha de nacimiento.\n - Su dirección postal.\n - Un número de teléfono de contacto y dirección de correo electrónico.\n - Su respuesta a cualquier pregunta de la competencia.\n 4. Las inscripciones incompletas o ilegibles serán descalificadas.\n 5. Se permiten múltiples inscripciones gratuitas para cualquier Competición hasta el límite establecido por el Promotor. Cada entrada gratuita debe enviarse por separado.\n 6. Las entradas gratuitas para una competición estándar deben llegar al promotor antes de la fecha límite y antes de que se asignen todas las entradas. Las inscripciones recibidas dentro de las 48 horas posteriores a la Fecha de cierre o después de que se hayan vendido/asignado todos los boletos podrán participar en el siguiente Concurso disponible a discreción del Promotor. La prueba de publicación no garantiza la participación en el sorteo aleatorio.\n 7. Las inscripciones gratuitas para un Concurso de premios instantáneos deben recibirse antes de que se vendan/asignen todos los boletos o dentro de las cuarenta y ocho horas (48 horas) posteriores a la Fecha de cierre que se considerado para la inscripción.\n 8. Si se alcanza el límite de inscripción antes de recibir su inscripción gratuita, no podrá participar en el Concurso ni en ningún otro Concurso (excepto lo especificado en el párrafo 12.6 anterior).\n 9 Los participantes deben tener una cuenta en el sitio web/aplicación para que se procese una entrada gratuita, con todos los detalles que coincidan con la información de la cuenta.',
      'ro':
          '1. Competițiile se vor desfășura în datele de deschidere și de închidere specificate pe site. Aceste date sunt denumite „Data de deschidere” și, respectiv, „Data de închidere”. Toate orele și datele menționate sunt în conformitate cu ora Londrei, Angliei.\n\n2. În cazul în care devine absolut necesar, Promotorul își rezervă dreptul de a modifica Datele de Deschidere și Închidere. În cazul unor astfel de modificări, detaliile actualizate vor fi prezentate pe Site. Promotorul nu va prelungi Data de închidere doar pentru a crește vânzările de înscrieri.\n\n3. Toate înscrierile pentru concursuri trebuie să ajungă la Promotor nu mai târziu de ora specificată la Data Închiderii. Înscrierile primite după această oră sunt automat descalificate, fără a fi emise rambursări.\n\n4. Numărul maxim de înscrieri permis pentru o Competiție va fi indicat pe site. Dacă este atinsă limita maximă de intrare, numărul de intrări per persoană poate fi restricționat.\n\n5. Înscrierile, fie plătite, fie gratuite, sunt restricționate de persoană pe Competiție. Numărul maxim de înscrieri per Participant pentru o Competiție va fi detaliat pe pagina web a Competiției de pe site. Nu vor fi permise alte intrări odată ce limita maximă de intrare este atinsă.\n\n6. Pași pentru a intra într-o competiție standard folosind metoda de înscriere plătită:\n\n 1. Vizitați site-ul web și selectați Competiția standard la care doriți să participați.\n 2. Furnizați răspunsul dvs. la întrebarea competiției.\n 3. Alegeți numărul dorit de intrări și treceți la finalizare.\n 4. Conectați-vă sau înregistrați-vă dacă nu v-ați conectat deja.\n 5. Acceptați T&C și finalizați achiziția.\n\n7. Pași pentru a intra într-o Competiție Instant Win folosind metoda de înscriere plătită:\n\n 1. Vizitați site-ul web și selectați Competiția Instant Win la care doriți să participați.\n 2. Alegeți numărul dorit de înscrieri și treceți la finalizarea plății .\n 3. Conectați-vă sau înregistrați-vă dacă nu v-ați conectat deja.\n 4. Acceptați T&C și finalizați achiziția.\n\n8. Utilizarea Stripe este limitată persoanelor cu vârsta peste 18 ani și rezidenților din Regatul Unit continental. Consultați termenii și condițiile Stripe pentru instrucțiunile de utilizare.\n\n9. La achiziționarea online a unei înscrieri la Competiție, Promotorul va trimite confirmarea de primire.\n\n10. Promotorul nu va fi responsabil pentru înscrierile incomplete, pierdute sau întârziate la Competiție, indiferent de cauză, inclusiv defecțiuni ale echipamentelor, defecțiuni tehnice sau alte defecțiuni ale sistemului.\n\n11. Prin achiziționarea de înscrieri și/sau trimiterea unei înscrieri la Competiție (fie că este achiziționată online sau intrat gratuit), vă confirmați eligibilitatea de a participa, confirmați încheierea unui contract cu Promotorul și sunteți de acord să respectați aceste T&C.\n\n 12. Vă puteți înscrie gratuit într-o Competiție (fie o Competiție Standard sau o Competiție Instant Win) respectând următoarele condiții:\n\n 1. Trimiteți înscrierea dvs. prin poștă preplătită de clasa întâi sau a doua către Promotor la adresa adresa furnizată.\n 2. Înscrierile livrate de mână nu vor fi acceptate sau intrate în tragere la sorți.\n 3. Includeți următoarele informații la înscrierea dvs.:\n - Detalii ale Competiției la care doriți să participați.< __FFNL__> - Numele dvs. complet.\n - Data dvs. de naștere.\n - Adresa dvs. poștală.\n - Un număr de telefon de contact și o adresă de e-mail.\n - Răspunsul dvs. la orice întrebare de concurs.\n 4. Înscrierile incomplete sau ilizibile vor fi descalificate.\n 5. Înscrierile multiple gratuite pentru orice Competiție sunt permise până la limita stabilită de Promotor. Fiecare înscriere gratuită trebuie trimisă separat.\n 6. Intrările gratuite pentru o Competiție Standard trebuie să ajungă la Promotor înainte de Data Închiderii și înainte ca toate biletele să fie alocate. Înscrierile primite în termen de 48 de ore de la Data Închiderii sau după ce toate biletele au fost vândute/alocate pot fi înscrise în următoarea Competiție disponibilă, la discreția Promotorului. Dovada postării nu garantează intrarea în tragere la sorți.\n 7. Înscrierile gratuite pentru o Competiție Instant Win trebuie să fie primite înainte ca toate biletele să fie vândute/alocate sau în termen de patruzeci și opt de ore (48 de ore) de la data de închidere care urmează să fie luat în considerare pentru înscriere.\n 8. Dacă limita sau limita de înscriere este atinsă înainte de a primi intrarea dumneavoastră gratuită, nu veți fi înscris în Competiție sau în orice altă Competiție (cu excepția celor specificate în paragraful 12.6 de mai sus).\n 9 Participanții trebuie să aibă un cont pe site-ul web/aplicație pentru ca o intrare gratuită să fie procesată, cu toate detaliile care se potrivesc cu informațiile contului.',
    },
    '0sohc6cx': {
      'en': 'Choosing a winner',
      'de': 'Auswahl eines Gewinners',
      'es': 'Elegir un ganador',
      'ro': 'Alegerea unui câștigător',
    },
    'vdaqkuqf': {
      'en':
          '1. For Standard Competitions, all Entrants who correctly answer the Competition Question will be placed into a draw and an Entrant will be chosen by random draw to be eligible to receive the Prize. The random draw will take place as soon as reasonably possible and, in any event, within 7 days of the Closing Date (“Draw Date“).\n\n2. All Standard Competition Entrants will have their names and entry numbers included on a spreadsheet which may be published on the Website and may be visible during the live draw. If you do not wish to have your name included on this spreadsheet you must contact the Promoter via email at contact@bluedash.co.uk as soon as reasonably possible after you have completed your entry and in any event, at least 48 hours before the live draw takes place.\n\n3. For Instant Win Competitions, prizes are allocated at random to numbers in a spreadsheet. Each entry into the Instant Win Competition which correctly answers the Competition Question is then randomly allocated a number in that spreadsheet. If the number matches a prize, then the Entrant wins that prize.\n\n1. Entrants who pay for their entry online, will be notified whether they have won (and, if they have won, what prize they have won) following submission of their entry;\n\n2. Free entries into the Instant Win Competition, will, so long as the entries are valid in accordance with these T&Cs, be randomly allocated a number on receipt by the Promoter. The Promoter will notify the Entrant if they are successful by an automated email sent to the contact email address that the Entrant provided with their entry. The email will be sent automatically as soon as the Entrant\'s number is identified as a prize winner. Unsuccessful Entrants via the free entry route will not be notified.\n\n4. Those Entrants eligible to win a Prize as set out in 4.1 and 4.3 above shall be individually a \"Winner\"and collectively the \"Winners\".\n\n5. For help with entries, please contact us on +447452335020 or email us at contact@bluedash.co.uk',
      'de':
          '1. Bei Standardwettbewerben nehmen alle Teilnehmer, die die Wettbewerbsfrage richtig beantworten, an einer Verlosung teil und ein Teilnehmer wird per Zufallsprinzip ausgewählt, um den Preis zu erhalten. Die zufällige Auslosung erfolgt so bald wie möglich und auf jeden Fall innerhalb von 7 Tagen nach dem Schlussdatum („Auslosungsdatum“).\n\n2. Die Namen und Teilnehmernummern aller Teilnehmer des Standardwettbewerbs werden in einer Tabelle aufgeführt, die auf der Website veröffentlicht und während der Live-Auslosung sichtbar sein kann. Wenn Sie nicht möchten, dass Ihr Name in dieser Tabelle aufgeführt wird, müssen Sie den Veranstalter per E-Mail unter contact@bluedash.co.uk so bald wie möglich nach Abschluss Ihrer Anmeldung kontaktieren, auf jeden Fall jedoch mindestens 48 Stunden vor der Teilnahme Es findet eine Live-Auslosung statt.\n\n3. Bei Sofortgewinnwettbewerben werden die Preise nach dem Zufallsprinzip den Zahlen in einer Tabelle zugewiesen. Jedem Teilnehmer am Sofortgewinn-Wettbewerb, der die Wettbewerbsfrage richtig beantwortet, wird dann nach dem Zufallsprinzip eine Nummer in dieser Tabelle zugewiesen. Wenn die Zahl mit einem Preis übereinstimmt, gewinnt der Teilnehmer diesen Preis.\n\n1. Teilnehmer, die ihre Teilnahme online bezahlen, werden nach Einreichung ihrer Teilnahme benachrichtigt, ob sie gewonnen haben (und, falls sie gewonnen haben, welchen Preis sie gewonnen haben);\n\n2. Kostenlose Teilnahmen am Sofortgewinn-Wettbewerb werden, sofern die Teilnahmen gemäß diesen AGB gültig sind, nach Erhalt durch den Veranstalter nach dem Zufallsprinzip vergeben. Der Veranstalter benachrichtigt den Teilnehmer, wenn er erfolgreich ist, indem er eine automatisierte E-Mail an die Kontakt-E-Mail-Adresse sendet, die der Teilnehmer bei seiner Teilnahme angegeben hat. Die E-Mail wird automatisch versendet, sobald die Nummer des Teilnehmers als Gewinner ermittelt wurde. Nicht erfolgreiche Teilnehmer über den kostenlosen Teilnahmeweg werden nicht benachrichtigt.\n\n4. Die Teilnehmer, die gemäß 4.1 und 4.3 oben zum Gewinn eines Preises berechtigt sind, gelten einzeln als „Gewinner“ und gemeinsam als „Gewinner“.\n\n5. Wenn Sie Hilfe bei der Eingabe benötigen, kontaktieren Sie uns bitte unter +447452335020 oder senden Sie eine E-Mail an contact@bluedash.co.uk',
      'es':
          '1. Para las Concursos estándar, todos los Participantes que respondan correctamente a la Pregunta del Concurso participarán en un sorteo y se elegirá un Participante mediante sorteo aleatorio para que sea elegible para recibir el Premio. El sorteo aleatorio se llevará a cabo tan pronto como sea razonablemente posible y, en cualquier caso, dentro de los 7 días posteriores a la Fecha de cierre (“Fecha del sorteo”).\n\n2. Todos los Participantes del Concurso Estándar tendrán sus nombres y números de inscripción incluidos en una hoja de cálculo que podrá publicarse en el sitio web y podrá ser visible durante el sorteo en vivo. Si no desea que su nombre se incluya en esta hoja de cálculo, debe comunicarse con el Promotor por correo electrónico a contact@bluedash.co.uk tan pronto como sea razonablemente posible después de haber completado su inscripción y, en cualquier caso, al menos 48 horas antes de la Se lleva a cabo el sorteo en vivo.\n\n3. Para los concursos de premios instantáneos, los premios se asignan aleatoriamente a números en una hoja de cálculo. A cada participación en el Concurso de premios instantáneos que responda correctamente a la pregunta del concurso se le asigna aleatoriamente un número en esa hoja de cálculo. Si el número coincide con un premio, entonces el Participante gana ese premio.\n\n1. Los participantes que paguen su inscripción en línea serán notificados si ganaron (y, si ganaron, qué premio ganaron) luego de enviar su inscripción;\n\n2. A las inscripciones gratuitas en el Concurso de premios instantáneos, siempre que sean válidas de acuerdo con estos Términos y condiciones, se les asignará un número al azar cuando el Promotor las reciba. El Promotor notificará al Participante si tiene éxito mediante un correo electrónico automático enviado a la dirección de correo electrónico de contacto que el Participante proporcionó con su inscripción. El correo electrónico se enviará automáticamente tan pronto como se identifique el número del Participante como ganador del premio. Los participantes que no hayan tenido éxito a través de la ruta de entrada gratuita no serán notificados.\n\n4. Aquellos Participantes elegibles para ganar un Premio según lo establecido en 4.1 y 4.3 anteriores serán individualmente un \"Ganador\" y colectivamente los \"Ganadores\".\n\n5. Para obtener ayuda con las inscripciones, contáctenos al +447452335020 o envíenos un correo electrónico a contact@bluedash.co.uk',
      'ro':
          '1. Pentru Competițiile Standard, toți Participanții care răspund corect la Întrebarea Concursului vor fi plasați într-o tragere la sorți, iar un Participant va fi ales prin tragere la sorți pentru a fi eligibil pentru a primi Premiul. Tragerea la sorți va avea loc cât mai curând posibil și, în orice caz, în termen de 7 zile de la Data Închiderii („Data Tragerii”).\n\n2. Toți participanții la Competiția Standard vor avea numele și numerele de înscriere incluse într-o foaie de calcul care poate fi publicată pe site și poate fi vizibilă în timpul extragerii live. Dacă nu doriți ca numele dvs. să fie inclus în această foaie de calcul, trebuie să contactați promotorul prin e-mail la contact@bluedash.co.uk cât mai curând posibil după ce ați finalizat înscrierea și, în orice caz, cu cel puțin 48 de ore înainte de are loc extragerea live.\n\n3. Pentru Competițiile Instant Win, premiile sunt alocate aleatoriu numerelor dintr-o foaie de calcul. Fiecare intrare în Competiția Instant Win care răspunde corect la întrebarea competiției este apoi alocat aleatoriu un număr în foaia de calcul respectivă. Dacă numărul se potrivește cu un premiu, atunci Participantul câștigă acel premiu.\n\n1. Participanții care își plătesc înscrierea online vor fi notificați dacă au câștigat (și, dacă au câștigat, ce premiu au câștigat) după depunerea înscrierii;\n\n2. Înscrierile gratuite în Competiția Instant Win, atâta timp cât înscrierile sunt valabile în conformitate cu aceste T&C, vor fi alocate aleatoriu un număr la primirea de către Promotor. Promotorul va anunța Participantul dacă are succes printr-un e-mail automat trimis la adresa de e-mail de contact pe care Participantul a furnizat-o odată cu înscrierea. E-mailul va fi trimis automat de îndată ce numărul Participantului este identificat ca câștigător al premiului. Participanții nereușiți prin ruta de intrare gratuită nu vor fi notificați.\n\n4. Acei Participanți eligibili pentru a câștiga un Premiu, așa cum este stabilit la 4.1 și 4.3 de mai sus, vor fi individual „Câștigători” și, în mod colectiv, „Câștigători”.\n\n5. Pentru ajutor cu înscrieri, vă rugăm să ne contactați la +447452335020 sau să ne trimiteți un e-mail la contact@bluedash.co.uk',
    },
    'ok815ynk': {
      'en': 'Eligibility',
      'de': 'Teilnahmeberechtigung',
      'es': 'Elegibilidad',
      'ro': 'Eligibilitate',
    },
    'yk9h25j8': {
      'en':
          '1. The competition welcomes participation from all residents of the United Kingdom,  Republic of Ireland & EU countyes aged 18 years or above, with the following exceptions:\n\n    1. Employees of the Promoter.\n    2. Employees of agents or suppliers of the Promoter, professionally linked with the competition or its management.\n    3. Immediate family members or households of individuals mentioned in (a) and (b) above.\n\n2. Upon entering the competition, you affirm your eligibility to participate and claim any prize won. The Promoter may request proof of eligibility for entry and prize claim. Failure to provide such proof or necessary information within a reasonable timeframe may result in disqualification from the competition.\n\n3. Entries generated automatically by computer or incomplete entries will not be accepted by the Promoter.\n\n4. The Promoter retains the right to disqualify individuals whose conduct contradicts the spirit or purpose of the prize competition. This includes instances of rudeness or abuse towards the Promoter or any associated parties.\n\n5. Except as stated in clause 11.3 below, no refunds of the entry fee will be issued under any circumstances, including:\n\n    1. Discovery of ineligibility to enter the competition or claim the Prize after entry.\n    2. Changes in eligibility criteria for entry or prize claim after entry.\n    3. Disqualification from the competition by the Promoter for any reason.\n\n6. In cases where the Entrant engages in:\n\n    1. Any form of fraud (actual or perceived).\n    2. Fraudulent misrepresentation.\n    3. Fraudulent concealment.\n    4. Hacking or interference with the proper functioning of the Website.\n    5. Modification or unauthorized use of any website code.\n\nAll their entries will be deemed void, no refunds will be issued, and they may be barred from participating in future Competitions.',
      'de':
          '1. Am Wettbewerb können alle Einwohner des Vereinigten Königreichs, der Republik Irland und der EU-Länder ab 18 Jahren teilnehmen, mit folgenden Ausnahmen:\n\n 1. Mitarbeiter des Veranstalters.\n 2. Mitarbeiter von Vertretern oder Lieferanten des Veranstalters, die beruflich mit dem Wettbewerb oder seinem Management verbunden sind.\n 3. Unmittelbare Familienangehörige oder Haushalte der oben in (a) und (b) genannten Personen.\n\n2. Mit der Teilnahme am Wettbewerb bestätigen Sie Ihre Teilnahmeberechtigung und beanspruchen den gewonnenen Preis. Der Veranstalter kann einen Nachweis der Teilnahmeberechtigung und des Preisanspruchs verlangen. Werden solche Nachweise oder erforderlichen Informationen nicht innerhalb einer angemessenen Frist vorgelegt, kann dies zur Disqualifikation vom Wettbewerb führen.\n\n3. Automatisch per Computer generierte oder unvollständige Einsendungen werden vom Veranstalter nicht akzeptiert.\n\n4. Der Veranstalter behält sich das Recht vor, Personen zu disqualifizieren, deren Verhalten dem Geist oder Zweck des Gewinnspiels widerspricht. Hierzu zählen auch Fälle von Unhöflichkeit oder Beleidigung gegenüber dem Veranstalter oder verbundenen Parteien.\n\n5. Sofern in Klausel 11.3 unten nicht anders angegeben, erfolgt unter keinen Umständen eine Rückerstattung der Teilnahmegebühr, einschließlich:\n\n 1. Feststellung der Nichtberechtigung zur Teilnahme am Wettbewerb oder Anspruch auf den Preis nach der Teilnahme.\n 2. Änderungen der Zulassungskriterien für die Teilnahme oder den Preisanspruch nach der Teilnahme.\n 3. Disqualifikation vom Wettbewerb durch den Veranstalter aus irgendeinem Grund.\n\n6. In Fällen, in denen der Teilnehmer Folgendes begeht:\n\n 1. Jede Form von Betrug (tatsächlich oder vermeintlich).\n 2. Betrügerische Falschdarstellung.\n 3. Betrügerische Verschleierung.\n 4. Hacking oder Eingriffe mit dem ordnungsgemäßen Funktionieren der Website.\n 5. Änderung oder unbefugte Nutzung eines Website-Codes.\n\nAlle ihre Teilnahmen gelten als ungültig, es werden keine Rückerstattungen gewährt und sie können von der Teilnahme ausgeschlossen werden zukünftige Wettbewerbe.',
      'es':
          '1. El concurso da la bienvenida a la participación de todos los residentes del Reino Unido, la República de Irlanda y los condados de la UE mayores de 18 años, con las siguientes excepciones:\n\n 1. Empleados del Promotor.\n 2. Empleados de agentes o proveedores del Promotor, vinculados profesionalmente con el concurso o su gestión.\n 3. Familiares inmediatos o hogares de las personas mencionadas en (a) y (b) anteriores.\n\n2. Al participar en la competencia, usted afirma su elegibilidad para participar y reclamar cualquier premio ganado. El Promotor podrá solicitar prueba de elegibilidad para participar y reclamar el premio. No proporcionar dicha prueba o información necesaria dentro de un plazo razonable puede resultar en la descalificación de la competencia.\n\n3. El Promotor no aceptará las inscripciones generadas automáticamente por computadora o incompletas.\n\n4. El Promotor se reserva el derecho de descalificar a personas cuya conducta contradiga el espíritu o propósito del concurso de premios. Esto incluye casos de mala educación o abuso hacia el Promotor o cualquier parte asociada.\n\n5. Excepto lo establecido en la cláusula 11.3 a continuación, no se emitirán reembolsos de la tarifa de inscripción bajo ninguna circunstancia, incluyendo:\n\n 1. Descubrimiento de inelegibilidad para participar en el concurso o reclamar el premio después de la inscripción.\n 2. Cambios en los criterios de elegibilidad para participar o reclamar el premio después de la inscripción.\n 3. Descalificación del concurso por parte del Promotor por cualquier motivo.\n\n6. En los casos en que el Participante participe en:\n\n 1. Cualquier forma de fraude (real o percibido).\n 2. Tergiversación fraudulenta.\n 3. Ocultación fraudulenta.\n 4. Hackeo o interferencia con el correcto funcionamiento del sitio web.\n 5. Modificación o uso no autorizado de cualquier código del sitio web.\n\nTodas sus inscripciones se considerarán nulas, no se emitirán reembolsos y se les podrá prohibir participar en Competiciones futuras.',
      'ro':
          '1. Competiția salută participarea tuturor rezidenților din Regatul Unit, Republica Irlanda și județele UE cu vârsta de 18 ani sau peste, cu următoarele excepții:\n\n 1. Angajații Promotorului.\n 2. Angajații de agenți sau furnizori ai Promotorului, legați profesional de competiție sau de conducerea acesteia.\n 3. Membrii de familie sau gospodăriile apropiate ale persoanelor menționate la (a) și (b) de mai sus.\n\n2. La înscrierea în competiție, vă confirmați eligibilitatea de a participa și revendicați orice premiu câștigat. Promotorul poate solicita dovada eligibilității pentru intrare și revendicarea premiului. Neprezentarea unei astfel de dovezi sau informații necesare într-un interval de timp rezonabil poate duce la descalificarea din competiție.\n\n3. Înscrierile generate automat de computer sau intrările incomplete nu vor fi acceptate de către Promotor.\n\n4. Promotorul își rezervă dreptul de a descalifica persoanele a căror conduită contravine spiritului sau scopului concursului de premii. Acestea includ cazuri de grosolănie sau abuz față de Promotor sau orice părți asociate.\n\n5. Cu excepția celor menționate în clauza 11.3 de mai jos, nu se vor face rambursări ale taxei de înscriere în nicio circumstanță, inclusiv:\n\n 1. Descoperirea neeligibilității pentru a participa la concurs sau a revendica Premiul după înscriere.\n 2. Modificări ale criteriilor de eligibilitate pentru înscriere sau revendicare a premiului după înscriere.\n 3. Descalificarea din competiție de către Promotor din orice motiv.\n\n6. În cazurile în care Participantul se angajează în:\n\n 1. Orice formă de fraudă (reală sau percepută).\n 2. Denaturare frauduloasă.\n 3. Ascundere frauduloasă.\n 4. Hacking sau interferență. cu buna funcționare a site-ului web.\n 5. Modificarea sau utilizarea neautorizată a oricărui cod de site web.\n\nToate înscrierile acestora vor fi considerate nule, nu vor fi emise rambursări și li se poate interzice participarea la viitoare competitii.',
    },
    '7r5t6rj2': {
      'en': 'The prize',
      'de': 'Der Preis',
      'es': 'El premio',
      'ro': 'Premiul',
    },
    't8872697': {
      'en':
          '1. The Prize for each competition is detailed on the Website (referred to as the “Prize”). As of the Opening Date, the Promoter believes the Prize details provided are accurate.\n\n2. Prizes are subject to availability. The Promoter reserves the right to substitute any Prize with one of equal or greater value. Should any details of the Prize change, the Promoter will make efforts to update the Website promptly. In Instant Win Competitions, the Prizes listed on the Website are available to be won, but there\'s no guarantee that all Prizes will be won. The number of Prizes won depends on the number of entries received.\n\n3. The Promoter takes reasonable measures to award the Prize as described on the Website. However, the Promoter does not provide additional assurances or warranties regarding the Prize, its value, condition, or any other information on the Website. The accuracy, completeness, or timeliness of the information on the Website is not guaranteed by the Promoter.\n\n4. Unless otherwise stated, there is no cash alternative for the Prize. However, the Promoter may, at its discretion, offer a cash alternative if the Winner prefers cash over the Prize.\n\n5. The Prize cannot be refunded, negotiated, or transferred.\n\n6. If the Prize is a vehicle/motorcycle:\n\n    1. The Promoter will ensure, unless otherwise specified, that it comes with a valid MOT (if required).\n    2. Insurance is not included with the Prize, and it is the Winner\'s responsibility to ensure the vehicle is adequately insured before driving it on public roads (if permitted).\n    3. Once delivered, the Promoter holds no responsibility for the Prize. The Winner must comply with all relevant laws and regulations regarding the vehicle\'s operation and ensure safe and responsible use.\n    4. Road tax is not included.\n    5. The Winner must possess the necessary licenses, qualifications, knowledge, and experience to operate the vehicle legally and safely.\n    6. The Winner is solely responsible for having all required safety equipment and attire (e.g., helmets, boots, gloves) and wearing them while operating the vehicle.\n\n7. If the Prize is a holiday or event:\n\n    1. The Prize description will specify the number of tickets, travel class, carrier type, and destination. Depending on the Prize type, date flexibility may be available for the Winner (e.g., fixed date for Grand Prix tickets versus flexible dates for a generic holiday). Excluded dates for holiday prizes are as listed on the Website. The Prize does not cover travel insurance, transfers to and from airports or stations, meals, spending money, taxes, or personal expenses unless explicitly stated otherwise on the Website. Any additional costs incidental to Prize fulfillment are the responsibility of the winner(s). Cash supplements, if expressly stated on the Website, are the extent of the Promoter\'s liability.\n    2. You are responsible for ensuring that you and any accompanying individuals have valid passports, necessary visas, and travel documents for the specified holiday dates. Once notified to the travel agent, dates cannot be changed.1. The Prize for each competition is detailed on the Website (referred to as the “Prize”). As of the Opening Date, the Promoter believes the Prize details provided are accurate.\n\n2. Prizes are subject to availability. The Promoter reserves the right to substitute any Prize with one of equal or greater value. Should any details of the Prize change, the Promoter will make efforts to update the Website promptly. In Instant Win Competitions, the Prizes listed on the Website are available to be won, but there\'s no guarantee that all Prizes will be won. The number of Prizes won depends on the number of entries received.\n\n3. The Promoter takes reasonable measures to award the Prize as described on the Website. However, the Promoter does not provide additional assurances or warranties regarding the Prize, its value, condition, or any other information on the Website. The accuracy, completeness, or timeliness of the information on the Website is not guaranteed by the Promoter.\n\n4. Unless otherwise stated, there is no cash alternative for the Prize. However, the Promoter may, at its discretion, offer a cash alternative if the Winner prefers cash over the Prize.\n\n5. The Prize cannot be refunded, negotiated, or transferred.\n\n6. If the Prize is a vehicle/motorcycle:\n\n    1. The Promoter will ensure, unless otherwise specified, that it comes with a valid MOT (if required).\n    2. Insurance is not included with the Prize, and it is the Winner\'s responsibility to ensure the vehicle is adequately insured before driving it on public roads (if permitted).\n    3. Once delivered, the Promoter holds no responsibility for the Prize. The Winner must comply with all relevant laws and regulations regarding the vehicle\'s operation and ensure safe and responsible use.\n    4. Road tax is not included.\n    5. The Winner must possess the necessary licenses, qualifications, knowledge, and experience to operate the vehicle legally and safely.\n    6. The Winner is solely responsible for having all required safety equipment and attire (e.g., helmets, boots, gloves) and wearing them while operating the vehicle.\n\n7. If the Prize is a holiday or event:\n\n    1. The Prize description will specify the number of tickets, travel class, carrier type, and destination. Depending on the Prize type, date flexibility may be available for the Winner (e.g., fixed date for Grand Prix tickets versus flexible dates for a generic holiday). Excluded dates for holiday prizes are as listed on the Website. The Prize does not cover travel insurance, transfers to and from airports or stations, meals, spending money, taxes, or personal expenses unless explicitly stated otherwise on the Website. Any additional costs incidental to Prize fulfillment are the responsibility of the winner(s). Cash supplements, if expressly stated on the Website, are the extent of the Promoter\'s liability.\n    2. You are responsible for ensuring that you and any accompanying individuals have valid passports, necessary visas, and travel documents for the specified holiday dates. Once notified to the travel agent, dates cannot be changed.',
      'de':
          '1. Der Preis für jeden Wettbewerb ist auf der Website aufgeführt (im Folgenden als „Preis“ bezeichnet). Zum Zeitpunkt der Eröffnung ist der Veranstalter davon überzeugt, dass die angegebenen Preisdetails korrekt sind.\n\n2. Die Preise unterliegen der Verfügbarkeit. Der Veranstalter behält sich das Recht vor, jeden Preis durch einen Preis mit gleichem oder höherem Wert zu ersetzen. Sollten sich Einzelheiten des Preises ändern, wird sich der Veranstalter bemühen, die Website umgehend zu aktualisieren. Bei Sofortgewinnwettbewerben können die auf der Website aufgeführten Preise gewonnen werden, es gibt jedoch keine Garantie dafür, dass alle Preise gewonnen werden. Die Anzahl der gewonnenen Preise hängt von der Anzahl der eingegangenen Einsendungen ab.\n\n3. Der Veranstalter ergreift angemessene Maßnahmen, um den Preis wie auf der Website beschrieben zu vergeben. Der Veranstalter gibt jedoch keine zusätzlichen Zusicherungen oder Gewährleistungen in Bezug auf den Preis, seinen Wert, seinen Zustand oder andere Informationen auf der Website. Der Veranstalter übernimmt keine Garantie für die Richtigkeit, Vollständigkeit oder Aktualität der Informationen auf der Website.\n\n4. Sofern nicht anders angegeben, gibt es keine Bargeldalternative für den Preis. Der Veranstalter kann jedoch nach eigenem Ermessen eine Bargeldalternative anbieten, wenn der Gewinner Bargeld dem Preis vorzieht.\n\n5. Der Preis kann nicht erstattet, ausgehandelt oder übertragen werden.\n\n6. Wenn es sich bei dem Preis um ein Fahrzeug/Motorrad handelt:\n\n 1. Der Veranstalter stellt, sofern nicht anders angegeben, sicher, dass es über einen gültigen TÜV verfügt (falls erforderlich).\n 2. Eine Versicherung ist nicht im Preis enthalten , und es liegt in der Verantwortung des Gewinners, sicherzustellen, dass das Fahrzeug ausreichend versichert ist, bevor es auf öffentlichen Straßen gefahren wird (falls zulässig).\n 3. Nach der Lieferung übernimmt der Veranstalter keine Verantwortung für den Preis. Der Gewinner muss alle relevanten Gesetze und Vorschriften bezüglich des Fahrzeugbetriebs einhalten und eine sichere und verantwortungsvolle Nutzung gewährleisten.\n 4. Die Kfz-Steuer ist nicht inbegriffen.\n 5. Der Gewinner muss über die erforderlichen Lizenzen, Qualifikationen, Kenntnisse usw. verfügen Erfahrung, um das Fahrzeug legal und sicher zu bedienen.\n 6. Der Gewinner ist allein dafür verantwortlich, über die erforderliche Sicherheitsausrüstung und -kleidung (z. B. Helme, Stiefel, Handschuhe) zu verfügen und diese während der Bedienung des Fahrzeugs zu tragen.\n\n 7. Wenn es sich bei dem Preis um einen Feiertag oder eine Veranstaltung handelt:\n\n 1. In der Preisbeschreibung werden die Anzahl der Tickets, die Reiseklasse, die Art der Fluggesellschaft und das Ziel angegeben. Abhängig von der Art des Preises steht dem Gewinner möglicherweise eine Terminflexibilität zur Verfügung (z. B. ein fester Termin für Grand-Prix-Tickets im Vergleich zu flexiblen Terminen für einen allgemeinen Feiertag). Ausgenommene Termine für Feiertagspreise sind auf der Website aufgeführt. Der Preis deckt keine Reiseversicherung, Transfers zu und von Flughäfen oder Bahnhöfen, Mahlzeiten, Taschengeld, Steuern oder persönliche Ausgaben ab, sofern auf der Website nicht ausdrücklich etwas anderes angegeben ist. Alle zusätzlichen Kosten, die mit der Erfüllung des Preises verbunden sind, liegen in der Verantwortung des/der Gewinner(s). Barzuschläge unterliegen, sofern auf der Website ausdrücklich angegeben, dem Umfang der Haftung des Veranstalters.\n 2. Sie sind dafür verantwortlich, sicherzustellen, dass Sie und alle Begleitpersonen über gültige Reisepässe, erforderliche Visa und Reisedokumente für die angegebenen Feiertage verfügen. Nach Mitteilung an das Reisebüro können die Daten nicht mehr geändert werden.1. Der Preis für jeden Wettbewerb ist auf der Website aufgeführt (im Folgenden als „Preis“ bezeichnet). Zum Zeitpunkt der Eröffnung ist der Veranstalter davon überzeugt, dass die angegebenen Preisdetails korrekt sind.\n\n2. Die Preise unterliegen der Verfügbarkeit. Der Veranstalter behält sich das Recht vor, jeden Preis durch einen Preis mit gleichem oder höherem Wert zu ersetzen. Sollten sich Einzelheiten des Preises ändern, wird sich der Veranstalter bemühen, die Website umgehend zu aktualisieren. Bei Sofortgewinnwettbewerben können die auf der Website aufgeführten Preise gewonnen werden, es gibt jedoch keine Garantie dafür, dass alle Preise gewonnen werden. Die Anzahl der gewonnenen Preise hängt von der Anzahl der eingegangenen Einsendungen ab.\n\n3. Der Veranstalter ergreift angemessene Maßnahmen, um den Preis wie auf der Website beschrieben zu vergeben. Der Veranstalter gibt jedoch keine zusätzlichen Zusicherungen oder Gewährleistungen in Bezug auf den Preis, seinen Wert, seinen Zustand oder andere Informationen auf der Website. Der Veranstalter übernimmt keine Garantie für die Richtigkeit, Vollständigkeit oder Aktualität der Informationen auf der Website.\n\n4. Sofern nicht anders angegeben, gibt es keine Bargeldalternative für den Preis. Der Veranstalter kann jedoch nach eigenem Ermessen eine Bargeldalternative anbieten, wenn der Gewinner Bargeld dem Preis vorzieht.\n\n5. Der Preis kann nicht erstattet, ausgehandelt oder übertragen werden.\n\n6. Wenn es sich bei dem Preis um ein Fahrzeug/Motorrad handelt:\n\n 1. Der Veranstalter stellt, sofern nicht anders angegeben, sicher, dass es über einen gültigen TÜV verfügt (falls erforderlich).\n 2. Eine Versicherung ist nicht im Preis enthalten , und es liegt in der Verantwortung des Gewinners, sicherzustellen, dass das Fahrzeug ausreichend versichert ist, bevor es auf öffentlichen Straßen gefahren wird (falls zulässig).\n 3. Nach der Lieferung übernimmt der Veranstalter keine Verantwortung für den Preis. Der Gewinner muss alle relevanten Gesetze und Vorschriften bezüglich des Fahrzeugbetriebs einhalten und eine sichere und verantwortungsvolle Nutzung gewährleisten.\n 4. Die Kfz-Steuer ist nicht inbegriffen.\n 5. Der Gewinner muss über die erforderlichen Lizenzen, Qualifikationen, Kenntnisse usw. verfügen Erfahrung, um das Fahrzeug legal und sicher zu bedienen.\n 6. Der Gewinner ist allein dafür verantwortlich, über die erforderliche Sicherheitsausrüstung und -kleidung (z. B. Helme, Stiefel, Handschuhe) zu verfügen und diese während der Bedienung des Fahrzeugs zu tragen.\n\n 7. Wenn es sich bei dem Preis um einen Feiertag oder eine Veranstaltung handelt:\n\n 1. In der Preisbeschreibung werden die Anzahl der Tickets, die Reiseklasse, die Art der Fluggesellschaft und das Ziel angegeben. Abhängig von der Art des Preises steht dem Gewinner möglicherweise eine Terminflexibilität zur Verfügung (z. B. ein fester Termin für Grand-Prix-Tickets im Vergleich zu flexiblen Terminen für einen allgemeinen Feiertag). Ausgenommene Termine für Feiertagspreise sind auf der Website aufgeführt. Der Preis deckt keine Reiseversicherung, Transfers zu und von Flughäfen oder Bahnhöfen, Mahlzeiten, Taschengeld, Steuern oder persönliche Ausgaben ab, sofern auf der Website nicht ausdrücklich etwas anderes angegeben ist. Alle zusätzlichen Kosten, die mit der Erfüllung des Preises verbunden sind, liegen in der Verantwortung des/der Gewinner(s). Barzuschläge unterliegen, sofern auf der Website ausdrücklich angegeben, dem Umfang der Haftung des Veranstalters.\n 2. Sie sind dafür verantwortlich, sicherzustellen, dass Sie und alle Begleitpersonen über gültige Reisepässe, erforderliche Visa und Reisedokumente für die angegebenen Feiertage verfügen. Nach Benachrichtigung des Reisebüros können die Daten nicht mehr geändert werden.',
      'es':
          '1. El Premio de cada concurso se detalla en el Sitio Web (denominado el “Premio”). A partir de la Fecha de Apertura, el Promotor cree que los detalles del Premio proporcionados son precisos.\n\n2. Los premios están sujetos a disponibilidad. El Promotor se reserva el derecho de sustituir cualquier Premio por uno de igual o mayor valor. Si algún detalle del Premio cambia, el Promotor se esforzará por actualizar el sitio web lo antes posible. En los concursos de premios instantáneos, los premios enumerados en el sitio web están disponibles para ganarse, pero no hay garantía de que se ganen todos los premios. La cantidad de premios ganados depende de la cantidad de inscripciones recibidas.\n\n3. El Promotor toma medidas razonables para otorgar el Premio como se describe en el Sitio web. Sin embargo, el Promotor no ofrece garantías adicionales con respecto al Premio, su valor, condición o cualquier otra información en el Sitio web. El Promotor no garantiza la exactitud, integridad o actualidad de la información contenida en el sitio web.\n\n4. A menos que se indique lo contrario, no existe alternativa en efectivo para el premio. Sin embargo, el Promotor puede, a su discreción, ofrecer una alternativa en efectivo si el Ganador prefiere el efectivo al premio.\n\n5. El Premio no puede reembolsarse, negociarse ni transferirse.\n\n6. Si el Premio es un vehículo/motocicleta:\n\n 1. El Promotor se asegurará, a menos que se especifique lo contrario, de que venga con una ITV válida (si es necesaria).\n 2. El seguro no está incluido con el Premio , y es responsabilidad del Ganador asegurarse de que el vehículo esté adecuadamente asegurado antes de conducirlo en la vía pública (si está permitido).\n 3. Una vez entregado, el Promotor no asume ninguna responsabilidad por el Premio. El Ganador debe cumplir con todas las leyes y regulaciones pertinentes con respecto al funcionamiento del vehículo y garantizar un uso seguro y responsable.\n 4. El impuesto de circulación no está incluido.\n 5. El Ganador debe poseer las licencias, calificaciones, conocimientos y experiencia para operar el vehículo de manera legal y segura.\n 6. El Ganador es el único responsable de tener todo el equipo y vestimenta de seguridad requeridos (por ejemplo, cascos, botas, guantes) y usarlos mientras opera el vehículo.\n\n 7. Si el Premio es un día festivo o evento:\n\n 1. La descripción del Premio especificará la cantidad de boletos, la clase de viaje, el tipo de aerolínea y el destino. Dependiendo del tipo de premio, la flexibilidad de fechas puede estar disponible para el ganador (por ejemplo, fecha fija para boletos de Gran Premio versus fechas flexibles para un feriado genérico). Las fechas excluidas para los premios navideños son las que se enumeran en el sitio web. El Premio no cubre seguros de viaje, traslados desde y hacia aeropuertos o estaciones, comidas, dinero para gastos, impuestos o gastos personales a menos que se indique explícitamente lo contrario en el Sitio Web. Cualquier costo adicional relacionado con el cumplimiento del Premio es responsabilidad del ganador. Los suplementos en efectivo, si se indican expresamente en el sitio web, son el alcance de la responsabilidad del Promotor.\n 2. Usted es responsable de garantizar que usted y sus acompañantes tengan pasaportes válidos, visas necesarias y documentos de viaje para las fechas de vacaciones especificadas. Una vez notificadas al agente de viajes, las fechas no se pueden cambiar.1. El Premio de cada concurso se detalla en el Sitio Web (denominado el “Premio”). A partir de la Fecha de Apertura, el Promotor cree que los detalles del Premio proporcionados son precisos.\n\n2. Los premios están sujetos a disponibilidad. El Promotor se reserva el derecho de sustituir cualquier Premio por uno de igual o mayor valor. Si algún detalle del Premio cambia, el Promotor se esforzará por actualizar el sitio web lo antes posible. En los concursos de premios instantáneos, los premios enumerados en el sitio web están disponibles para ganarse, pero no hay garantía de que se ganen todos los premios. La cantidad de premios ganados depende de la cantidad de inscripciones recibidas.\n\n3. El Promotor toma medidas razonables para otorgar el Premio como se describe en el Sitio web. Sin embargo, el Promotor no ofrece garantías adicionales con respecto al Premio, su valor, condición o cualquier otra información en el Sitio web. El Promotor no garantiza la exactitud, integridad o actualidad de la información contenida en el sitio web.\n\n4. A menos que se indique lo contrario, no existe alternativa en efectivo para el premio. Sin embargo, el Promotor puede, a su discreción, ofrecer una alternativa en efectivo si el Ganador prefiere el efectivo al premio.\n\n5. El Premio no puede reembolsarse, negociarse ni transferirse.\n\n6. Si el Premio es un vehículo/motocicleta:\n\n 1. El Promotor se asegurará, a menos que se especifique lo contrario, de que venga con una ITV válida (si es necesaria).\n 2. El seguro no está incluido con el Premio , y es responsabilidad del Ganador asegurarse de que el vehículo esté adecuadamente asegurado antes de conducirlo en la vía pública (si está permitido).\n 3. Una vez entregado, el Promotor no asume ninguna responsabilidad por el Premio. El Ganador debe cumplir con todas las leyes y regulaciones pertinentes con respecto al funcionamiento del vehículo y garantizar un uso seguro y responsable.\n 4. El impuesto de circulación no está incluido.\n 5. El Ganador debe poseer las licencias, calificaciones, conocimientos y experiencia para operar el vehículo de manera legal y segura.\n 6. El Ganador es el único responsable de tener todo el equipo y vestimenta de seguridad requeridos (por ejemplo, cascos, botas, guantes) y usarlos mientras opera el vehículo.\n\n 7. Si el Premio es un día festivo o evento:\n\n 1. La descripción del Premio especificará la cantidad de boletos, la clase de viaje, el tipo de aerolínea y el destino. Dependiendo del tipo de premio, la flexibilidad de fechas puede estar disponible para el ganador (por ejemplo, fecha fija para boletos de Gran Premio versus fechas flexibles para un feriado genérico). Las fechas excluidas para los premios navideños son las que se enumeran en el sitio web. El Premio no cubre seguros de viaje, traslados desde y hacia aeropuertos o estaciones, comidas, dinero para gastos, impuestos o gastos personales a menos que se indique explícitamente lo contrario en el Sitio Web. Cualquier costo adicional relacionado con el cumplimiento del Premio es responsabilidad del ganador. Los suplementos en efectivo, si se indican expresamente en el sitio web, son el alcance de la responsabilidad del Promotor.\n 2. Usted es responsable de garantizar que usted y sus acompañantes tengan pasaportes válidos, visas necesarias y documentos de viaje para las fechas de vacaciones especificadas. Una vez notificadas al agente de viajes, las fechas no se pueden cambiar.',
      'ro':
          '1. Premiul pentru fiecare competiție este detaliat pe site-ul web (numit „Premiul”). Începând cu Data deschiderii, Promotorul consideră că detaliile Premiului furnizate sunt corecte.\n\n2. Premiile sunt în funcție de disponibilitate. Promotorul își rezervă dreptul de a înlocui orice premiu cu unul de valoare egală sau mai mare. În cazul în care orice detalii ale Premiului se modifică, Promotorul va depune eforturi pentru a actualiza site-ul cu promptitudine. În Competițiile Instant Win, premiile enumerate pe site-ul web sunt disponibile pentru a fi câștigate, dar nu există nicio garanție că toate premiile vor fi câștigate. Numărul de premii câștigate depinde de numărul de înscrieri primite.\n\n3. Promotorul ia măsuri rezonabile pentru a acorda Premiul așa cum este descris pe site. Cu toate acestea, Promotorul nu oferă asigurări sau garanții suplimentare cu privire la Premiu, valoarea, starea acestuia sau orice alte informații de pe Site. Acuratețea, completitudinea sau actualitatea informațiilor de pe site nu este garantată de către Promotor.\n\n4. Dacă nu se specifică altfel, nu există o alternativă în numerar pentru premiu. Cu toate acestea, Promotorul poate, la discreția sa, să ofere o alternativă în numerar dacă Câștigătorul preferă banii în numerar decât Premiul.\n\n5. Premiul nu poate fi rambursat, negociat sau transferat.\n\n6. Dacă Premiul este un vehicul/motocicletă:\n\n 1. Promotorul se va asigura, dacă nu se specifică altfel, că acesta vine cu un MOT valid (dacă este necesar).\n 2. Asigurarea nu este inclusă în premiu , iar Câștigătorul este responsabilitatea de a se asigura că vehiculul este asigurat corespunzător înainte de a-l conduce pe drumurile publice (dacă este permis).\n 3. Odată livrat, Promotorul nu își asumă nicio responsabilitate pentru Premiu. Câștigătorul trebuie să respecte toate legile și reglementările relevante privind funcționarea vehiculului și să asigure o utilizare sigură și responsabilă.\n 4. Taxa rutieră nu este inclusă.\n 5. Câștigătorul trebuie să dețină licențele, calificările, cunoștințele și experiență de a conduce vehiculul în mod legal și în siguranță.\n 6. Câștigătorul este singurul responsabil pentru a avea toate echipamentele și ținutele de siguranță necesare (de exemplu, căști, bocanci, mănuși) și pentru a le purta în timpul conducerii vehiculului.\n\n 7. Dacă Premiul este o sărbătoare sau un eveniment:\n\n 1. Descrierea Premiului va specifica numărul de bilete, clasa de călătorie, tipul de transportator și destinația. În funcție de tipul de premiu, pentru Câștigător poate fi disponibilă flexibilitatea datei (de exemplu, dată fixă ​​pentru biletele Grand Prix versus date flexibile pentru o vacanță generală). Datele excluse pentru premiile de vacanță sunt cele enumerate pe site. Premiul nu acoperă asigurarea de călătorie, transferurile către și de la aeroporturi sau stații, mese, bani cheltuiți, taxe sau cheltuieli personale, cu excepția cazului în care se specifică în mod explicit altfel pe site. Orice costuri suplimentare legate de îndeplinirea premiului sunt responsabilitatea câștigătorului(i). Suplimentele în numerar, dacă sunt menționate în mod expres pe site-ul web, reprezintă întinderea răspunderii Promotorului.\n 2. Sunteți responsabil să vă asigurați că dumneavoastră și orice persoană însoțitoare aveți pașapoarte valabile, vizele necesare și documente de călătorie pentru datele de vacanță specificate. Odată notificate agentului de turism, datele nu pot fi modificate.1. Premiul pentru fiecare competiție este detaliat pe site-ul web (denumit „Premiul”). Începând cu Data deschiderii, Promotorul consideră că detaliile Premiului furnizate sunt corecte.\n\n2. Premiile sunt în funcție de disponibilitate. Promotorul își rezervă dreptul de a înlocui orice premiu cu unul de valoare egală sau mai mare. În cazul în care orice detalii ale Premiului se modifică, Promotorul va depune eforturi pentru a actualiza site-ul cu promptitudine. În Competițiile Instant Win, premiile enumerate pe site-ul web sunt disponibile pentru a fi câștigate, dar nu există nicio garanție că toate premiile vor fi câștigate. Numărul de premii câștigate depinde de numărul de înscrieri primite.\n\n3. Promotorul ia măsuri rezonabile pentru a acorda Premiul așa cum este descris pe site. Cu toate acestea, Promotorul nu oferă asigurări sau garanții suplimentare cu privire la Premiu, valoarea, starea acestuia sau orice alte informații de pe Site. Acuratețea, completitudinea sau actualitatea informațiilor de pe site nu este garantată de către Promotor.\n\n4. Dacă nu se specifică altfel, nu există o alternativă în numerar pentru premiu. Cu toate acestea, Promotorul poate, la discreția sa, să ofere o alternativă în numerar dacă Câștigătorul preferă banii în numerar decât Premiul.\n\n5. Premiul nu poate fi rambursat, negociat sau transferat.\n\n6. Dacă Premiul este un vehicul/motocicletă:\n\n 1. Promotorul se va asigura, dacă nu se specifică altfel, că acesta vine cu un MOT valid (dacă este necesar).\n 2. Asigurarea nu este inclusă în premiu , iar Câștigătorul este responsabilitatea de a se asigura că vehiculul este asigurat corespunzător înainte de a-l conduce pe drumurile publice (dacă este permis).\n 3. Odată livrat, Promotorul nu își asumă nicio responsabilitate pentru Premiu. Câștigătorul trebuie să respecte toate legile și reglementările relevante privind funcționarea vehiculului și să asigure o utilizare sigură și responsabilă.\n 4. Taxa rutieră nu este inclusă.\n 5. Câștigătorul trebuie să dețină licențele, calificările, cunoștințele și experiență de a conduce vehiculul în mod legal și în siguranță.\n 6. Câștigătorul este singurul responsabil pentru a avea toate echipamentele și ținutele de siguranță necesare (de exemplu, căști, bocanci, mănuși) și pentru a le purta în timpul conducerii vehiculului.\n\n 7. Dacă Premiul este o sărbătoare sau un eveniment:\n\n 1. Descrierea Premiului va specifica numărul de bilete, clasa de călătorie, tipul de transportator și destinația. În funcție de tipul de premiu, pentru Câștigător poate fi disponibilă flexibilitatea datei (de exemplu, dată fixă ​​pentru biletele Grand Prix versus date flexibile pentru o vacanță generală). Datele excluse pentru premiile de vacanță sunt cele enumerate pe site. Premiul nu acoperă asigurarea de călătorie, transferurile către și de la aeroporturi sau stații, mese, bani cheltuiți, taxe sau cheltuieli personale, cu excepția cazului în care se specifică în mod explicit altfel pe site. Orice costuri suplimentare legate de îndeplinirea premiului sunt responsabilitatea câștigătorului(i). Suplimentele în numerar, dacă sunt menționate în mod expres pe site-ul web, reprezintă întinderea răspunderii Promotorului.\n 2. Sunteți responsabil să vă asigurați că dumneavoastră și orice persoană însoțitoare aveți pașapoarte valabile, vizele necesare și documente de călătorie pentru datele de vacanță specificate. Odată notificate agentului de turism, datele nu pot fi modificate.',
    },
    'ad8r4upq': {
      'en':
          'This website may contain links to third-party websites, plug-ins, and applications. Clicking on these links or enabling such connections may result in third parties collecting or sharing data about you. We do not oversee these third-party websites and cannot be held responsible for their privacy statements. We recommend reviewing the privacy policy of each website you visit when you leave our site.\n\nData Collection:\nPersonal data, also known as personal information, refers to any information about an individual that can identify them. It does not include data where the identity has been removed (anonymous data).\n\nWe may collect, use, store, and transfer various types of personal data about you, categorized as follows:\n\nIdentity Data: This includes your first name, last name, username or similar identifier, and date of birth.\nContact Data: This encompasses your billing address, email address, and telephone numbers.\nFinancial Data: Please note that we do not collect financial data directly; our payment providers Stripe is responsible for financial data.\nTransaction Data: This consists of details about payments to and from you, as well as other information regarding products and services you have purchased from us.\nTechnical Data: This incorporates your internet protocol (IP) address, login data, browser type and version, time zone setting and location, browser plug-in types and versions, operating system and platform, and other technology on the devices you use to access our website.\nProfile Data: This includes your username, password, and any purchases or orders made by you.\nUsage Data: This comprises information about how you use our website, products, and services.\nMarketing and Communications Data: This refers to your preferences regarding receiving marketing communications from us and our third parties, as well as your communication preferences.\nAdditionally, we collect, use, and share Aggregated Data such as statistical or demographic data for various purposes. Aggregated Data does not directly or indirectly reveal your identity. However, if Aggregated Data is combined or connected with your personal data in a way that identifies you, we treat the combined data as personal data and handle it accordingly under this privacy policy.\n\nWe do not collect any Special Categories of Personal Data about you, which include details about your race or ethnicity, religious or philosophical beliefs, sex life, sexual orientation, political opinions, trade union membership, information about your health, and genetic and biometric data. We also do not collect information about criminal convictions and offences.\n\nWhen necessary, we may collect the minimum amount of personal data required for you to participate in any prize draws or competitions and to facilitate the administration of promotions. If you win, we may need to collect more detailed information from you in order to award your prize. You will be informed of this requirement at the time of notification if you are selected as a winne',
      'de':
          'Diese Website kann Links zu Websites, Plug-ins und Anwendungen Dritter enthalten. Das Klicken auf diese Links oder das Aktivieren solcher Verbindungen kann dazu führen, dass Dritte Daten über Sie sammeln oder weitergeben. Wir überwachen diese Websites Dritter nicht und können nicht für deren Datenschutzerklärungen verantwortlich gemacht werden. Wir empfehlen, die Datenschutzrichtlinien jeder von Ihnen besuchten Website zu lesen, wenn Sie unsere Website verlassen.\n\nDatenerfassung:\nPersonenbezogene Daten, auch personenbezogene Daten genannt, beziehen sich auf alle Informationen über eine Person, die diese identifizieren können. Dazu gehören keine Daten, bei denen die Identität entfernt wurde (anonyme Daten).\n\nWir können verschiedene Arten personenbezogener Daten über Sie erfassen, verwenden, speichern und übertragen, die wie folgt kategorisiert werden:\n\n Identitätsdaten: Dazu gehören Ihr Vorname, Nachname, Benutzername oder eine ähnliche Kennung sowie Ihr Geburtsdatum.\nKontaktdaten: Dazu gehören Ihre Rechnungsadresse, E-Mail-Adresse und Telefonnummern.\nFinanzdaten: Bitte beachten Sie dies wir erfassen Finanzdaten nicht direkt; Unser Zahlungsanbieter Stripe ist für die Finanzdaten verantwortlich.\nTransaktionsdaten: Dazu gehören Details zu Zahlungen an und von Ihnen sowie andere Informationen zu Produkten und Dienstleistungen, die Sie bei uns gekauft haben.\nTechnische Daten: Dazu gehören Ihre Internet Protocol (IP)-Adresse, Anmeldedaten, Browsertyp und -version, Zeitzoneneinstellung und Standort, Browser-Plug-in-Typen und -Versionen, Betriebssystem und Plattform sowie andere Technologien auf den Geräten, die Sie für den Zugriff auf unsere Website verwenden.<__FFNL__ >Profildaten: Dazu gehören Ihr Benutzername, Ihr Passwort und alle von Ihnen getätigten Käufe oder Bestellungen.\nNutzungsdaten: Dies umfasst Informationen darüber, wie Sie unsere Website, Produkte und Dienstleistungen nutzen.\nMarketing- und Kommunikationsdaten: Dies bezieht sich auf Ihre Präferenzen hinsichtlich des Erhalts von Marketingmitteilungen von uns und unseren Dritten sowie auf Ihre Kommunikationspräferenzen.\nDarüber hinaus erfassen, verwenden und teilen wir aggregierte Daten wie statistische oder demografische Daten für verschiedene Zwecke. Aggregierte Daten geben weder direkt noch indirekt Auskunft über Ihre Identität. Wenn jedoch aggregierte Daten mit Ihren personenbezogenen Daten in einer Weise kombiniert oder verknüpft werden, die Sie identifiziert, behandeln wir die kombinierten Daten als personenbezogene Daten und behandeln sie entsprechend dieser Datenschutzrichtlinie.\n\nWir erfassen keine Sonderkategorien personenbezogener Daten über Sie, darunter Angaben zu Ihrer Rasse oder ethnischen Zugehörigkeit, Ihren religiösen oder philosophischen Überzeugungen, Ihrem Sexualleben, Ihrer sexuellen Orientierung, politischen Meinungen, Ihrer Gewerkschaftsmitgliedschaft, Informationen zu Ihrer Gesundheit sowie genetischen und biometrischen Daten. Wir erfassen auch keine Informationen über strafrechtliche Verurteilungen und Straftaten.\n\nBei Bedarf erfassen wir möglicherweise die Mindestmenge an personenbezogenen Daten, die für die Teilnahme an Gewinnspielen oder Wettbewerben erforderlich ist und um die Verwaltung von Werbeaktionen zu erleichtern. Wenn Sie gewinnen, müssen wir möglicherweise detailliertere Informationen von Ihnen sammeln, um Ihren Preis vergeben zu können. Wenn Sie als Gewinner ausgewählt werden, werden Sie zum Zeitpunkt der Benachrichtigung über diese Anforderung informiert',
      'es':
          'Este sitio web puede contener enlaces a sitios web, complementos y aplicaciones de terceros. Al hacer clic en estos enlaces o habilitar dichas conexiones, es posible que terceros recopilen o compartan datos sobre usted. No supervisamos estos sitios web de terceros y no nos hacemos responsables de sus declaraciones de privacidad. Recomendamos revisar la política de privacidad de cada sitio web que visite cuando abandone nuestro sitio.\n\nRecopilación de datos:\nLos datos personales, también conocidos como información personal, se refieren a cualquier información sobre un individuo que pueda identificarlo. No incluye datos donde se ha eliminado la identidad (datos anónimos).\n\nPodemos recopilar, usar, almacenar y transferir varios tipos de datos personales sobre usted, categorizados de la siguiente manera:\n\n Datos de identidad: esto incluye su nombre, apellido, nombre de usuario o identificador similar y fecha de nacimiento.\nDatos de contacto: esto incluye su dirección de facturación, dirección de correo electrónico y números de teléfono.\nDatos financieros: tenga en cuenta que no recopilamos datos financieros directamente; nuestros proveedores de pagos Stripe es responsable de los datos financieros.\nDatos de transacción: consisten en detalles sobre pagos hacia y desde usted, así como otra información sobre los productos y servicios que nos ha comprado.\nDatos técnicos: esto incorpora su dirección de protocolo de Internet (IP), datos de inicio de sesión, tipo y versión del navegador, configuración y ubicación de la zona horaria, tipos y versiones de complementos del navegador, sistema operativo y plataforma, y ​​otra tecnología en los dispositivos que utiliza para acceder a nuestro sitio web.<__FFNL__ >Datos de perfil: esto incluye su nombre de usuario, contraseña y cualquier compra o pedido realizado por usted.\nDatos de uso: esto comprende información sobre cómo utiliza nuestro sitio web, productos y servicios.\nDatos de marketing y comunicaciones: esto se refiere a sus preferencias con respecto a recibir comunicaciones de marketing nuestras y de nuestros terceros, así como sus preferencias de comunicación.\nAdemás, recopilamos, utilizamos y compartimos datos agregados, como datos estadísticos o demográficos, para diversos fines. Los datos agregados no revelan directa o indirectamente su identidad. Sin embargo, si los Datos Agregados se combinan o conectan con sus datos personales de una manera que lo identifique, trataremos los datos combinados como datos personales y los manejaremos en consecuencia según esta política de privacidad.\n\nNo recopilamos ninguna Categoría Especial de Datos Personales sobre usted, que incluyen detalles sobre su raza o etnia, creencias religiosas o filosóficas, vida sexual, orientación sexual, opiniones políticas, afiliación sindical, información sobre su salud y datos genéticos y biométricos. Tampoco recopilamos información sobre condenas y delitos penales.\n\nCuando sea necesario, podemos recopilar la cantidad mínima de datos personales necesarios para que usted participe en cualquier sorteo o concurso y para facilitar la administración de promociones. Si gana, es posible que necesitemos recopilar información más detallada sobre usted para poder otorgarle su premio. Se le informará de este requisito en el momento de la notificación si es seleccionado como ganador.',
      'ro':
          'Acest site web poate conține link-uri către site-uri web, pluginuri și aplicații ale terților. Făcând clic pe aceste link-uri sau activarea unor astfel de conexiuni poate duce la colectarea sau partajarea de către terți a datelor despre dvs. Nu supraveghem aceste site-uri web ale terților și nu putem fi făcuți responsabili pentru declarațiile lor de confidențialitate. Vă recomandăm să revizuiți politica de confidențialitate a fiecărui site web pe care îl vizitați atunci când părăsiți site-ul nostru.\n\nColectarea datelor:\nDatele personale, cunoscute și ca informații personale, se referă la orice informații despre o persoană care le poate identifica. Nu include date pentru care identitatea a fost eliminată (date anonime).\n\nPutem colecta, folosi, stoca și transfera diferite tipuri de date personale despre dvs., clasificate după cum urmează:\n\n Date de identitate: Acestea includ prenumele, prenumele, numele de utilizator sau identificatorul similar și data nașterii.\nDate de contact: Acestea includ adresa dvs. de facturare, adresa de e-mail și numerele de telefon.\n Date financiare: Vă rugăm să rețineți că nu colectăm date financiare în mod direct; furnizorii noștri de plăți Stripe este responsabil pentru datele financiare.\nDate despre tranzacții: acestea constau în detalii despre plățile către și de la dvs., precum și alte informații referitoare la produsele și serviciile pe care le-ați achiziționat de la noi.\nDate tehnice: acestea includ adresa dvs. de protocol de internet (IP), datele de conectare, tipul și versiunea browserului, setarea și locația fusului orar, tipurile și versiunile de plug-in ale browserului, sistemul de operare și platforma și alte tehnologii de pe dispozitivele pe care le utilizați pentru a accesa site-ul nostru web.<__FFNL__ >Date de profil: Acestea includ numele dvs. de utilizator, parola și orice achiziții sau comenzi efectuate de dvs.\nDate de utilizare: Acestea includ informații despre modul în care utilizați site-ul web, produsele și serviciile noastre.\nDate de marketing și comunicații: Aceasta se referă la preferințele dvs. cu privire la primirea de comunicări de marketing de la noi și terții noștri, precum și la preferințele dvs. de comunicare.\nÎn plus, colectăm, folosim și partajăm Date agregate, cum ar fi date statistice sau demografice, în diferite scopuri. Datele agregate nu vă dezvăluie direct sau indirect identitatea. Cu toate acestea, dacă Datele agregate sunt combinate sau conectate cu datele dumneavoastră personale într-un mod care vă identifică, tratăm datele combinate ca date cu caracter personal și le gestionăm în consecință în conformitate cu această politică de confidențialitate.\n\nNu colectăm nicio categorie specială. de Date personale despre dvs., care includ detalii despre rasa sau etnia dvs., convingerile religioase sau filozofice, viața sexuală, orientarea sexuală, opiniile politice, apartenența la sindicat, informații despre sănătatea dvs. și date genetice și biometrice. De asemenea, nu colectăm informații despre condamnări și infracțiuni penale.\n\nAtunci când este necesar, putem colecta cantitatea minimă de date cu caracter personal necesare pentru a participa la orice extrageri sau concursuri și pentru a facilita administrarea promoțiilor. Dacă câștigați, este posibil să fie nevoie să colectăm informații mai detaliate de la dvs. pentru a vă acorda premiul. Veți fi informat despre această cerință în momentul notificării dacă sunteți selectat ca câștigător',
    },
    '12du1uk0': {
      'en': 'Winners',
      'de': 'Gewinner',
      'es': 'Ganadores',
      'ro': 'Câștigători',
    },
    '6icwt6gz': {
      'en':
          '1. The decision made by the Promoter is final, and no further correspondence or discussion will be entertained.\n\n2. In Standard Competitions, the Promoter will personally contact the Winner at the earliest opportunity following the draw date specified in the Competition listing on the Website (\"Draw Date\"), and no later than 7 days from the Draw Date. This contact will be made using the telephone number or email address provided during the Competition entry process. If the Winner cannot be reached, is unavailable, or fails to claim the Prize within 14 days of the Draw Date, the Promoter reserves the right to offer the Prize to the next eligible Entrant selected (in the same manner as the original Winner) from the correct entries received before the Closing Date.\n\n3. For Instant Win Competitions, Entrants using the paid-for entry route online will receive immediate notification online regarding their win status. Winners via the free entry route will be contacted personally by the Promoter at the earliest opportunity following their winning entry, and no later than 48 hours from the date of receipt of their entry. The Promoter will attempt contact using the telephone number or email address provided during the Competition entry process. If the Winner cannot be contacted, is unavailable, or fails to claim the Prize within 14 days of the Promoter\'s initial attempt to contact them, the Promoter reserves the right to assign a new number to the Prize and reintroduce the Prize into the prize pool for that Competition or dispose of the Prize as deemed appropriate, without any liability to the Winner.\n\n4. The Promoter is required to either publish or provide access to information confirming a valid award. To fulfill this obligation, the Promoter will publish the names and winning numbers of Winners on the Website and will also furnish this information to all Competition entrants.\n\n5. If you wish to object to the publication or availability of any or all of your name and winning entry, please contact the Promoter at contact@bluedash.co.uk prior to the Closing Date. Even in such circumstances, the Promoter is obligated to supply the information to the Advertising Standards Authority upon request.\n\nThe Promoter reserves the right to revoke a Prize if it has reasonable grounds to suspect that a Winner is ineligible or has failed to adhere to these T&Cs. In such instances, the Promoter may dispose of the Prize as it deems appropriate, at its sole discretion.',
      'de':
          '1. Die vom Veranstalter getroffene Entscheidung ist endgültig und es wird keine weitere Korrespondenz oder Diskussion geführt.\n\n2. Bei Standardwettbewerben wird der Veranstalter den Gewinner zum frühestmöglichen Zeitpunkt nach dem in der Wettbewerbsliste auf der Website angegebenen Ziehungsdatum („Ziehungsdatum“) persönlich kontaktieren, spätestens jedoch 7 Tage nach dem Ziehungsdatum. Die Kontaktaufnahme erfolgt über die Telefonnummer oder E-Mail-Adresse, die Sie bei der Teilnahme am Wettbewerb angegeben haben. Wenn der Gewinner nicht erreichbar ist, nicht verfügbar ist oder den Preis nicht innerhalb von 14 Tagen nach dem Ziehungsdatum in Anspruch nimmt, behält sich der Veranstalter das Recht vor, den Preis dem nächsten ausgewählten teilnahmeberechtigten Teilnehmer anzubieten (auf die gleiche Weise wie der ursprüngliche Gewinner). die korrekten Anmeldungen, die vor dem Einsendeschluss eingegangen sind.\n\n3. Bei Wettbewerben mit Sofortgewinnen erhalten Teilnehmer, die den kostenpflichtigen Online-Teilnahmeweg nutzen, sofort online eine Benachrichtigung über ihren Gewinnstatus. Gewinner über den kostenlosen Teilnahmeweg werden vom Veranstalter zum frühestmöglichen Zeitpunkt nach ihrer Gewinneinreichung, spätestens jedoch 48 Stunden nach Erhalt ihrer Einsendung, persönlich kontaktiert. Der Veranstalter wird versuchen, Kontakt über die Telefonnummer oder E-Mail-Adresse aufzunehmen, die während des Teilnahmevorgangs für den Wettbewerb angegeben wurde. Wenn der Gewinner nicht kontaktiert werden kann, nicht erreichbar ist oder den Preis nicht innerhalb von 14 Tagen nach dem ersten Kontaktversuch des Veranstalters anfordert, behält sich der Veranstalter das Recht vor, dem Preis eine neue Nummer zuzuweisen und den Preis erneut in den Preispool aufzunehmen Teilnahme an diesem Wettbewerb oder Verwertung des Preises nach eigenem Ermessen, ohne jegliche Haftung gegenüber dem Gewinner.\n\n4. Der Veranstalter ist verpflichtet, Informationen, die eine gültige Auszeichnung bestätigen, entweder zu veröffentlichen oder zugänglich zu machen. Um dieser Verpflichtung nachzukommen, veröffentlicht der Veranstalter die Namen und Gewinnzahlen der Gewinner auf der Website und stellt diese Informationen auch allen Wettbewerbsteilnehmern zur Verfügung.\n\n5. Wenn Sie der Veröffentlichung oder Verfügbarkeit eines Teils oder aller Ihrer Namen und Gewinnereinträge widersprechen möchten, wenden Sie sich bitte vor dem Einsendeschluss an den Veranstalter unter contact@bluedash.co.uk. Auch unter solchen Umständen ist der Veranstalter verpflichtet, der Advertising Standards Authority auf Anfrage diese Informationen zur Verfügung zu stellen.\n\nDer Veranstalter behält sich das Recht vor, einen Preis zu widerrufen, wenn er begründeten Anlass zu der Annahme hat, dass ein Gewinner nicht teilnahmeberechtigt ist oder nicht gegen diese AGB verstoßen hat. In solchen Fällen kann der Veranstalter nach eigenem Ermessen über den Preis verfügen, wie er es für angemessen hält.',
      'es':
          '1. La decisión tomada por el Promotor es definitiva y no se mantendrá ninguna correspondencia o discusión adicional.\n\n2. En las Competiciones estándar, el Promotor se comunicará personalmente con el Ganador lo antes posible después de la fecha del sorteo especificada en el listado de la Competición en el Sitio web (\"Fecha del sorteo\"), y a más tardar 7 días después de la Fecha del sorteo. Este contacto se realizará utilizando el número de teléfono o la dirección de correo electrónico proporcionada durante el proceso de inscripción al Concurso. Si no se puede localizar al Ganador, no está disponible o no reclama el Premio dentro de los 14 días posteriores a la Fecha del Sorteo, el Promotor se reserva el derecho de ofrecer el Premio al siguiente Participante elegible seleccionado (de la misma manera que el Ganador original) de las entradas correctas recibidas antes de la Fecha de Cierre.\n\n3. Para las competiciones con premios instantáneos, los participantes que utilicen la ruta de entrada paga en línea recibirán una notificación inmediata en línea sobre su estado ganador. El Promotor se pondrá en contacto personalmente con los ganadores a través de la ruta de entrada gratuita lo antes posible después de su entrada ganadora, y a más tardar 48 horas después de la fecha de recepción de su entrada. El Promotor intentará comunicarse utilizando el número de teléfono o la dirección de correo electrónico proporcionados durante el proceso de inscripción al Concurso. Si no se puede contactar al Ganador, no está disponible o no reclama el Premio dentro de los 14 días posteriores al intento inicial del Promotor de comunicarse con él, el Promotor se reserva el derecho de asignar un nuevo número al Premio y reintroducir el Premio en el fondo de premios para ese Concurso o disponer del Premio como se considere apropiado, sin responsabilidad alguna para con el Ganador.\n\n4. El Promotor debe publicar o proporcionar acceso a información que confirme un premio válido. Para cumplir con esta obligación, el Promotor publicará los nombres y números ganadores de los Ganadores en el Sitio web y también proporcionará esta información a todos los participantes del Concurso.\n\n5. Si desea oponerse a la publicación o disponibilidad de parte o la totalidad de su nombre y la participación ganadora, comuníquese con el Promotor en contact@bluedash.co.uk antes de la Fecha límite. Incluso en tales circunstancias, el Promotor está obligado a proporcionar la información a la Autoridad de Normas de Publicidad previa solicitud.\n\nEl Promotor se reserva el derecho de revocar un Premio si tiene motivos razonables para sospechar que un Ganador no es elegible o ha no cumplió con estos T&C. En tales casos, el Promotor podrá disponer del Premio como lo considere apropiado, a su exclusivo criterio.',
      'ro':
          '1. Decizia luată de Promotor este definitivă și nu va mai fi avută nicio corespondență sau discuție.\n\n2. În Competițiile Standard, Promotorul va contacta personal Câștigătorul în cel mai scurt timp de la data extragerii specificată în lista Competiției de pe site-ul web („Data extragerii”) și nu mai târziu de 7 zile de la Data extragerii. Acest contact se va face folosind numărul de telefon sau adresa de e-mail furnizate în timpul procesului de înscriere la Competiție. Dacă Câștigătorul nu poate fi contactat, este indisponibil sau nu reușește să revendice Premiul în termen de 14 zile de la Data Extragerii, Promotorul își rezervă dreptul de a oferi Premiul următorului Participant eligibil selectat (în același mod ca Câștigătorul inițial) de la înscrierile corecte primite înainte de Data Închiderii.\n\n3. Pentru Competițiile cu câștig instantaneu, participanții care folosesc drumul de intrare cu plată online vor primi o notificare online imediată cu privire la statutul lor de câștig. Câștigătorii prin ruta de intrare gratuită vor fi contactați personal de către Promotor cât mai curând posibil după înscrierea lor câștigătoare și nu mai târziu de 48 de ore de la data primirii înscrierii. Promotorul va încerca să contacteze folosind numărul de telefon sau adresa de e-mail furnizate în timpul procesului de înscriere la Competiție. Dacă Câștigătorul nu poate fi contactat, este indisponibil sau nu reușește să revendice Premiul în termen de 14 zile de la încercarea inițială a Promotorului de a-l contacta, Promotorul își rezervă dreptul de a atribui un nou număr Premiului și de a reintroduce Premiul în fondul de premii pentru Concursul respectiv sau dispuneți de Premiu după cum se consideră adecvat, fără nicio răspundere față de Câștigător.\n\n4. Promotorul trebuie să publice sau să ofere acces la informații care confirmă un premiu valabil. Pentru a îndeplini această obligație, Promotorul va publica pe site numele și numerele câștigătoare ale Câștigătorilor și va furniza, de asemenea, aceste informații tuturor participanților la Competiție.\n\n5. Dacă doriți să vă opuneți publicării sau disponibilității unuia sau a întregului nume și a înscrierii dvs. câștigătoare, vă rugăm să contactați Promotorul la contact@bluedash.co.uk înainte de Data de închidere. Chiar și în astfel de circumstanțe, Promotorul este obligat să furnizeze informațiile către Autoritatea pentru Standarde de Publicitate la cerere.\n\nPromotorul își rezervă dreptul de a revoca un Premiu dacă are motive rezonabile să suspecteze că un Câștigător este ineligibil sau a nu a respectat aceste T&C. În astfel de cazuri, Promotorul poate dispune de Premiu după cum consideră necesar, la discreția sa.',
    },
    '6dqt0yb2': {
      'en': 'Claiming the prize',
      'de': 'Anspruch auf den Preis',
      'es': 'Reclamando el premio',
      'ro': 'Revendicarea premiului',
    },
    'ua143fq0': {
      'en':
          '1. Winners are required to claim the Prize personally and cannot authorize a third party to claim it on their behalf. Information regarding how the Prize will be delivered to the Winner (or made available for collection) is available on the Website.\n\n2. Should there be any changes to your personal details, including contact information, you must promptly notify the Promoter. Notifications should be sent via email to contact@bluedash.co.uk . Ensure to include details of the competition entered, your previous details, and your updated details. If changes occur within 10 days of the Closing Date, the Promoter will use your old details if attempts are made to contact you.\n\n3. Any cash Prize will be directly transferred to the Winner\'s designated bank account. The Winner must provide evidence that they are the sole or joint beneficiary of the bank account. Failure to do so within 14 days will result in disqualification from the Competition, with the Winner forfeiting the Prize. In such instances, the Promoter reserves the right to offer the Prize to the next eligible Entrant selected from the correct entries received before the Closing Date. In the case of an Instant Win Competition, the Promoter may dispose of the Prize as deemed appropriate, without any liability to the Winner.\n\n4. The Promoter bears no responsibility and is not obligated to compensate if a Winner is unable to or chooses not to claim the Prize.\n\n5. The Promoter retains the right not to award any Prize if it remains unclaimed by the Winner in accordance with these T&Cs.',
      'de':
          '1. Die Gewinner sind verpflichtet, den Preis persönlich in Anspruch zu nehmen und können keinen Dritten bevollmächtigen, ihn in ihrem Namen in Anspruch zu nehmen. Informationen darüber, wie der Preis dem Gewinner zugestellt (oder zur Abholung bereitgestellt) wird, finden Sie auf der Website.\n\n2. Sollten sich Ihre persönlichen Daten, einschließlich Kontaktinformationen, ändern, müssen Sie den Veranstalter unverzüglich benachrichtigen. Benachrichtigungen sollten per E-Mail an contact@bluedash.co.uk gesendet werden. Stellen Sie sicher, dass Sie Einzelheiten zum Wettbewerb, an dem Sie teilgenommen haben, sowie Ihre bisherigen und aktualisierten Angaben angeben. Wenn innerhalb von 10 Tagen nach dem Einsendeschluss Änderungen eintreten, verwendet der Veranstalter Ihre alten Daten, wenn versucht wird, Sie zu kontaktieren.\n\n3. Jeder Geldpreis wird direkt auf das angegebene Bankkonto des Gewinners überwiesen. Der Gewinner muss nachweisen, dass er alleiniger oder Mitbegünstigter des Bankkontos ist. Gelingt dies nicht innerhalb von 14 Tagen, führt dies zum Ausschluss vom Wettbewerb und zum Verlust des Preises für den Gewinner. In solchen Fällen behält sich der Veranstalter das Recht vor, den Preis dem nächsten berechtigten Teilnehmer anzubieten, der aus den korrekten Einsendungen ausgewählt wird, die vor dem Einsendeschluss eingegangen sind. Im Falle eines Sofortgewinnwettbewerbs kann der Veranstalter über den Preis nach eigenem Ermessen verfügen, ohne dass eine Haftung gegenüber dem Gewinner besteht.\n\n4. Der Veranstalter trägt keine Verantwortung und ist nicht zur Entschädigung verpflichtet, wenn ein Gewinner den Preis nicht in Anspruch nehmen kann oder sich dafür entscheidet.\n\n5. Der Veranstalter behält sich das Recht vor, einen Preis nicht zu vergeben, wenn dieser vom Gewinner gemäß diesen AGB nicht beansprucht wird.',
      'es':
          '1. Los ganadores deben reclamar el Premio personalmente y no pueden autorizar a un tercero a reclamarlo en su nombre. La información sobre cómo se entregará el premio al ganador (o cómo se pondrá a disposición para su recogida) está disponible en el sitio web.\n\n2. En caso de que se produzca algún cambio en sus datos personales, incluida la información de contacto, deberá notificarlo de inmediato al Promotor. Las notificaciones deben enviarse por correo electrónico a contact@bluedash.co.uk. Asegúrese de incluir detalles del concurso ingresado, sus detalles anteriores y sus detalles actualizados. Si se producen cambios dentro de los 10 días posteriores a la Fecha de cierre, el Promotor utilizará sus datos antiguos si intenta comunicarse con usted.\n\n3. Cualquier premio en efectivo se transferirá directamente a la cuenta bancaria designada del ganador. El Ganador deberá acreditar que es beneficiario único o solidario de la cuenta bancaria. No hacerlo dentro de los 14 días resultará en la descalificación del Concurso y el Ganador perderá el Premio. En tales casos, el Promotor se reserva el derecho de ofrecer el premio al siguiente Participante elegible seleccionado entre las inscripciones correctas recibidas antes de la Fecha límite. En el caso de un Concurso con premio instantáneo, el Promotor podrá disponer del Premio según lo considere apropiado, sin ninguna responsabilidad para con el Ganador.\n\n4. El Promotor no asume ninguna responsabilidad y no está obligado a compensar si un Ganador no puede o decide no reclamar el Premio.\n\n5. El Promotor se reserva el derecho de no otorgar ningún premio si el Ganador no lo reclama de acuerdo con estos T&C.',
      'ro':
          '1. Câștigătorii trebuie să revendice personal premiul și nu pot autoriza o terță parte să-l revendice în numele lor. Informațiile referitoare la modul în care Premiul va fi livrat Câștigătorului (sau pus la dispoziție pentru colectare) sunt disponibile pe site-ul web.\n\n2. În cazul în care există modificări ale datelor dumneavoastră personale, inclusiv informațiile de contact, trebuie să anunțați prompt Promotorul. Notificările trebuie trimise prin e-mail la contact@bluedash.co.uk. Asigurați-vă că includeți detalii despre competiția înscrisă, detaliile dvs. anterioare și detaliile dvs. actualizate. Dacă apar modificări în termen de 10 zile de la Data Închiderii, Promotorul va folosi datele dumneavoastră vechi dacă se încearcă să vă contacteze.\n\n3. Orice premiu în numerar va fi transferat direct în contul bancar desemnat de Câștigător. Câștigătorul trebuie să facă dovada că este beneficiarul unic sau comun al contului bancar. Nerespectarea acestui lucru în termen de 14 zile va duce la descalificarea din Concurs, Câștigătorul pierzând premiul. În astfel de cazuri, Promotorul își rezervă dreptul de a oferi Premiul următorului Participant eligibil selectat dintre înscrierile corecte primite înainte de Data Închiderii. În cazul unei Competiții Instant Win, Promotorul poate dispune de Premiu după cum consideră adecvat, fără nicio răspundere față de Câștigător.\n\n4. Promotorul nu poartă nicio responsabilitate și nu este obligat să compenseze dacă un Câștigător nu poate sau alege să nu revendice Premiul.\n\n5. Promotorul își rezervă dreptul de a nu acorda niciun premiu dacă acesta rămâne nerevendicat de către Câștigător, în conformitate cu aceste T&C.',
    },
    't1rx9k8z': {
      'en': 'Limitation of liability',
      'de': 'Haftungsbeschränkung',
      'es': 'Limitación de responsabilidad',
      'ro': 'Limitare a răspunderii',
    },
    'uiuikg6e': {
      'en':
          '1. To the extent permitted by law, the Promoter, its agents, or distributors will not under any circumstances be liable to compensate the winner or accept any liability for any loss, damage, personal injury, or death arising from accepting the prize, except where such harm is caused by the negligence of the Promoter, its agents, or distributors, or that of their employees. Your statutory rights remain unaffected.\n\n2. The Promoter shall not be held liable for:\n\n    1. Entries not received due to incorrect or inaccurate entry information, faulty or failed data transmissions, or any other reason.\n    2. Unauthorized access to, theft, destruction of, or alterations to entries at any stage.\n    3. Technical malfunctions, errors, failures, interruptions, deletions, defects, delays in operation, or communication line failures, irrespective of the cause, concerning any equipment systems, networks, lines, satellites, servers, computers, or providers used in any aspect of the Competition\'s operation.\n    4. Inaccessibility or unavailability of network services, any wireless service, the internet, and/or a website (including but not limited to any online method for random selection of the Prize draw).\n    5. The Winner\'s use of the Prize.',
      'de':
          '1. Soweit gesetzlich zulässig, haften der Veranstalter, seine Vertreter oder Vertriebshändler unter keinen Umständen für eine Entschädigung des Gewinners oder übernehmen eine Haftung für Verluste, Schäden, Personenschäden oder Todesfälle, die sich aus der Annahme des Preises ergeben, außer wenn dieser Schaden durch die Fahrlässigkeit des Veranstalters, seiner Vertreter oder Vertriebshändler oder ihrer Mitarbeiter verursacht wird. Ihre gesetzlichen Rechte bleiben unberührt.\n\n2. Der Veranstalter übernimmt keine Haftung für:\n\n 1. Einsendungen, die aufgrund falscher oder ungenauer Teilnahmeinformationen, fehlerhafter oder fehlgeschlagener Datenübertragungen oder aus anderen Gründen nicht eingegangen sind.\n 2. Unbefugter Zugriff auf, Diebstahl, Zerstörung oder Änderung von Einträgen zu irgendeinem Zeitpunkt.\n 3. Technische Störungen, Fehler, Ausfälle, Unterbrechungen, Löschungen, Defekte, Verzögerungen im Betrieb oder Ausfälle von Kommunikationsleitungen, unabhängig von der Ursache, in Bezug auf Gerätesysteme, Netzwerke, Leitungen, Satelliten, Server, Computer oder Anbieter, die in irgendeinem Aspekt des Wettbewerbsbetriebs verwendet werden.\n 4. Unzugänglichkeit oder Nichtverfügbarkeit von Netzwerkdiensten, drahtlosen Diensten, dem Internet und/oder einer Website (einschließlich, aber nicht beschränkt auf alle Online-Methode zur zufälligen Auswahl der Verlosung).\n 5. Verwendung des Preises durch den Gewinner.',
      'es':
          '1. En la medida permitida por la ley, el Promotor, sus agentes o distribuidores no serán bajo ninguna circunstancia responsables de compensar al ganador ni aceptar ninguna responsabilidad por cualquier pérdida, daño, lesión personal o muerte que surja de la aceptación del premio, excepto cuando dicho daño sea causado por negligencia del Promotor, sus agentes o distribuidores, o la de sus empleados. Sus derechos legales no se verán afectados.\n\n2. El Promotor no será responsable de:\n\n 1. Inscripciones no recibidas debido a información de inscripción incorrecta o inexacta, transmisiones de datos defectuosas o fallidas, o cualquier otro motivo.\n 2. Acceso no autorizado, robo, destrucción o alteración de las entradas en cualquier etapa.\n 3. Mal funcionamiento técnico, errores, fallas, interrupciones, eliminaciones, defectos, retrasos en la operación o fallas en las líneas de comunicación, independientemente de la causa, relacionadas con cualquier sistema de equipo, redes, líneas, satélites, servidores, computadoras o proveedores utilizados en cualquier aspecto de la operación del Concurso.\n 4. Inaccesibilidad o indisponibilidad de servicios de red, cualquier servicio inalámbrico, Internet y/o un sitio web (incluido, entre otros, cualquier método en línea para la selección aleatoria del sorteo del Premio).\n 5. El uso del Premio por parte del Ganador.',
      'ro':
          '1. În măsura permisă de lege, Promotorul, agenții săi sau distribuitorii nu vor fi în nicio circumstanță obligați să despăgubească câștigătorul sau să accepte nicio răspundere pentru orice pierdere, daune, vătămare corporală sau deces rezultată din acceptarea premiului, cu excepția în cazul în care un astfel de prejudiciu este cauzat de neglijența Promotorului, a agenților săi sau a distribuitorilor sau a angajaților acestora. Drepturile dumneavoastră statutare rămân neafectate.\n\n2. Promotorul nu va fi tras la răspundere pentru:\n\n 1. Înscrieri neprimite din cauza informațiilor de intrare incorecte sau inexacte, transmisii de date greșite sau eșuate sau orice alt motiv.\n 2. Acces neautorizat la, furt, distrugerea sau modificarea intrărilor în orice etapă.\n 3. Defecțiuni tehnice, erori, defecțiuni, întreruperi, ștergeri, defecte, întârzieri în funcționare sau defecțiuni ale liniilor de comunicație, indiferent de cauză, referitoare la orice sisteme de echipamente, rețele, linii, sateliți, servere, computere sau furnizori utilizați în orice aspect al funcționării Competiției.\n 4. Inaccesibilitatea sau indisponibilitatea serviciilor de rețea, a oricărui serviciu fără fir, a internetului și/sau a unui site web (inclusiv, dar fără a se limita la orice metoda online de selectare aleatorie a extragerii premiului).\n 5. Utilizarea Premiului de către Câștigător.',
    },
    'duwbat28': {
      'en': 'Data protection and publicity',
      'de': 'Datenschutz und Öffentlichkeitsarbeit',
      'es': 'Protección de datos y publicidad',
      'ro': 'Protecția datelor și publicitate',
    },
    'w41enow4': {
      'en':
          '1. By participating in a Competition, you consent to the Promoter or its agents and suppliers holding and using any personal information provided by you solely for the administration of the Competition or as outlined in the Promoter’s Privacy Policy, available on the Website.\n\n2. As the Winner of a Competition, you agree that the Promoter may utilize your name, image, and location (town or county of residence) to announce the winner of the Competition. Additionally, you consent to engaging in any reasonable publicity activities required by the Promoter.\n\n3. Should a Winner prefer not to partake in any publicity, they must inform the Promoter before the Closing Date. Opting out of publicity will not impact your chances of winning the Prize. If you decline participation in publicity, the Promoter may still share your details with the Advertising Standards Authority, as legally required to demonstrate proper administration of the Competition and awarding of the Prize.\n\n4. Upon winning a Competition, you may be asked to provide additional personal information and proof of identity to confirm eligibility for claiming the Prize and transferring ownership. You hereby consent to the utilization of your information for this purpose. You retain the right to request further information regarding the use of your personal data. However, withdrawing consent may prevent the Prize from being transferred to you, resulting in forfeiture of the Prize and withdrawal from the Competition. In such cases, no entry fee refund will be provided. The Promoter reserves the right to offer the Prize from a Standard Competition to the next eligible Entrant or dispose of the Prize from an Instant Win Competition, without liability to the Winner.\n\n5. Under data protection laws, you have the right to request that the Promoter refrains from contacting you and removes your details from its database. If such a request is made, you will be considered withdrawn from the Competition as contacting you in the event of winning will not be feasible. No entry fee refund will be provided upon withdrawal. To ensure your personal details are not used for promotional purposes, please email the Promoter at contact@bluedash.co.uk before the Closing Date.',
      'de':
          '1. Durch die Teilnahme an einem Wettbewerb erklären Sie sich damit einverstanden, dass der Veranstalter oder seine Vertreter und Lieferanten die von Ihnen bereitgestellten personenbezogenen Daten ausschließlich für die Verwaltung des Wettbewerbs oder wie in der Datenschutzrichtlinie des Veranstalters beschrieben, die auf der Website verfügbar ist, speichern und verwenden.<__FFNL__ >\n2. Als Gewinner eines Wettbewerbs erklären Sie sich damit einverstanden, dass der Veranstalter Ihren Namen, Ihr Bild und Ihren Standort (Stadt oder Landkreis Ihres Wohnsitzes) verwenden darf, um den Gewinner des Wettbewerbs bekannt zu geben. Darüber hinaus erklären Sie sich damit einverstanden, sich an allen vom Veranstalter geforderten angemessenen Werbeaktivitäten zu beteiligen.\n\n3. Sollte ein Gewinner es vorziehen, nicht an Werbemaßnahmen teilzunehmen, muss er den Veranstalter vor dem Einsendeschluss informieren. Wenn Sie sich von der Veröffentlichung abmelden, hat dies keinen Einfluss auf Ihre Chancen, den Preis zu gewinnen. Wenn Sie die Teilnahme an Werbemaßnahmen ablehnen, kann der Veranstalter Ihre Daten dennoch an die Advertising Standards Authority weitergeben, sofern dies gesetzlich vorgeschrieben ist, um die ordnungsgemäße Durchführung des Wettbewerbs und die Vergabe des Preises nachzuweisen.\n\n4. Wenn Sie einen Wettbewerb gewinnen, werden Sie möglicherweise aufgefordert, zusätzliche persönliche Informationen und einen Identitätsnachweis anzugeben, um die Berechtigung zur Inanspruchnahme des Preises und zur Übertragung des Eigentums zu bestätigen. Hiermit erklären Sie sich mit der Nutzung Ihrer Daten zu diesem Zweck einverstanden. Sie behalten sich das Recht vor, weitere Informationen über die Verwendung Ihrer personenbezogenen Daten anzufordern. Der Widerruf der Einwilligung kann jedoch dazu führen, dass der Preis nicht an Sie übertragen wird, was zum Verlust des Preises und zum Rückzug aus dem Wettbewerb führt. In solchen Fällen erfolgt keine Rückerstattung des Startgeldes. Der Veranstalter behält sich das Recht vor, den Preis eines Standardwettbewerbs dem nächsten teilnahmeberechtigten Teilnehmer anzubieten oder über den Preis eines Sofortgewinnwettbewerbs zu verfügen, ohne gegenüber dem Gewinner zu haften.\n\n5. Gemäß den Datenschutzgesetzen haben Sie das Recht zu verlangen, dass der Veranstalter Sie nicht mehr kontaktiert und Ihre Daten aus seiner Datenbank löscht. Wenn ein solcher Antrag gestellt wird, gelten Sie als vom Wettbewerb ausgeschlossen, da eine Kontaktaufnahme im Falle eines Gewinns nicht möglich ist. Bei einem Rücktritt erfolgt keine Rückerstattung des Startgeldes. Um sicherzustellen, dass Ihre persönlichen Daten nicht für Werbezwecke verwendet werden, senden Sie bitte vor dem Einsendeschluss eine E-Mail an den Veranstalter unter contact@bluedash.co.uk.',
      'es':
          '1. Al participar en un Concurso, usted acepta que el Promotor o sus agentes y proveedores conserven y utilicen cualquier información personal proporcionada por usted únicamente para la administración del Concurso o como se describe en la Política de Privacidad del Promotor, disponible en el sitio web.<__FFNL__ >\n2. Como Ganador de un Concurso, usted acepta que el Promotor pueda utilizar su nombre, imagen y ubicación (ciudad o condado de residencia) para anunciar el ganador del Concurso. Además, usted acepta participar en cualquier actividad publicitaria razonable requerida por el Promotor.\n\n3. Si un Ganador prefiere no participar en ninguna publicidad, deberá informar al Promotor antes de la Fecha límite. La exclusión voluntaria de la publicidad no afectará sus posibilidades de ganar el premio. Si rechaza participar en publicidad, el Promotor aún puede compartir sus datos con la Autoridad de Normas de Publicidad, según lo exige la ley para demostrar la administración adecuada del Concurso y la concesión del Premio.\n\n4. Al ganar un Concurso, es posible que se le solicite que proporcione información personal adicional y prueba de identidad para confirmar su elegibilidad para reclamar el Premio y transferir la propiedad. Por la presente usted acepta la utilización de su información para este propósito. Usted conserva el derecho de solicitar más información sobre el uso de sus datos personales. Sin embargo, retirar el consentimiento puede impedir que se le transfiera el Premio, lo que resultará en la pérdida del Premio y la retirada del Concurso. En tales casos, no se proporcionará ningún reembolso de la tarifa de inscripción. El Promotor se reserva el derecho de ofrecer el Premio de un Concurso estándar al siguiente Participante elegible o disponer del Premio de un Concurso de premio instantáneo, sin responsabilidad para con el Ganador.\n\n5. Según las leyes de protección de datos, usted tiene derecho a solicitar que el Promotor se abstenga de contactarlo y elimine sus datos de su base de datos. Si se realiza dicha solicitud, se le considerará retirado del Concurso ya que no será posible contactarlo en caso de ganar. No se proporcionará ningún reembolso de la tarifa de inscripción al realizar el retiro. Para garantizar que sus datos personales no se utilicen con fines promocionales, envíe un correo electrónico al Promotor a contact@bluedash.co.uk antes de la Fecha de cierre.',
      'ro':
          '1. Prin participarea la o Competiție, sunteți de acord ca Promotorul sau agenții și furnizorii săi să dețină și să utilizeze orice informații personale furnizate de dvs. exclusiv pentru administrarea Competiției sau așa cum este descris în Politica de confidențialitate a Promotorului, disponibilă pe site.<__FFNL__ >\n2. În calitate de Câștigător al unui Concurs, sunteți de acord că Promotorul vă poate folosi numele, imaginea și locația (orașul sau județul de reședință) pentru a anunța câștigătorul Concursului. În plus, sunteți de acord să vă implicați în orice activitate publicitară rezonabilă cerută de Promotor.\n\n3. În cazul în care un Câștigător preferă să nu participe la nicio publicitate, acesta trebuie să informeze Promotorul înainte de Data Închiderii. Renunțarea la publicitate nu va afecta șansele dvs. de a câștiga Premiul. Dacă refuzați participarea la publicitate, Promotorul poate să vă împărtășească în continuare detaliile Autorității pentru Standarde de Publicitate, conform cerințelor legale pentru a demonstra administrarea corespunzătoare a Competiției și acordarea Premiului.\n\n4. La câștigarea unui Concurs, vi se poate cere să furnizați informații personale suplimentare și dovada identității pentru a confirma eligibilitatea pentru revendicarea Premiului și transferul dreptului de proprietate. Sunteți de acord cu utilizarea informațiilor dumneavoastră în acest scop. Vă păstrați dreptul de a solicita informații suplimentare cu privire la utilizarea datelor dumneavoastră cu caracter personal. Cu toate acestea, retragerea consimțământului poate împiedica transferul Premiului către dvs., ceea ce duce la pierderea Premiului și retragerea din Concurs. În astfel de cazuri, nu se va rambursa taxa de intrare. Promotorul își rezervă dreptul de a oferi Premiul dintr-o Competiție Standard următorului Participant eligibil sau de a dispune de Premiul dintr-o Competiție de Câștig Instantaneu, fără a răspunde câștigătorului.\n\n5. În conformitate cu legile privind protecția datelor, aveți dreptul de a solicita ca Promotorul să se abțină de la a vă contacta și să vă șteargă datele din baza de date. Dacă se face o astfel de solicitare, veți fi considerat retras din Competiție, deoarece nu va fi fezabilă să vă contactați în cazul câștigării. Nu se va rambursa taxa de intrare la retragere. Pentru a vă asigura că datele dumneavoastră personale nu sunt utilizate în scopuri promoționale, vă rugăm să trimiteți un e-mail la Promotor la contact@bluedash.co.uk înainte de Data de închidere.',
    },
    'eztyhkj9': {
      'en': 'General',
      'de': 'Allgemein',
      'es': 'General',
      'ro': 'General',
    },
    '1lyq0sdl': {
      'en':
          '1. The Promoter retains the right to modify these terms and conditions periodically. The most recent version of these terms and conditions will be accessible on the Website.\n\n2. In the event of suspected breach of these T&Cs, the Promoter reserves the discretion to exclude you from current and future Competitions.\n\n3. The Promoter reserves the right to void, suspend, cancel, or modify the Competition if circumstances beyond its control necessitate such action. In such instances, any entry fees paid will be refunded.\n\n4. There is no stipulated minimum number of entries, and the Promoter will proceed with the draw and Prize allocation irrespective of the quantity of entries received. Voiding, suspending, canceling, extending the Closing Date, or modifying the Competition due to insufficient entries will not occur.\n\n5. Competitions on the Website are not sponsored, endorsed, administered by, or associated with Facebook. By participating in the Competitions, Entrants acknowledge that Facebook bears no liability and is not responsible for the administration or promotion of said Competitions.\n\n6. These terms and conditions are governed by English law, and Entrants submit to the jurisdiction of the courts of England and Wales. Entrants residing in Scotland or Northern Ireland have or EU contryes the option to initiate claims in their respective countries.\n\n7. It is advisable to print a copy of these T&Cs for personal records.',
      'de':
          '1. Der Veranstalter behält sich das Recht vor, diese Allgemeinen Geschäftsbedingungen regelmäßig zu ändern. Die aktuellste Version dieser Allgemeinen Geschäftsbedingungen ist auf der Website verfügbar.\n\n2. Im Falle eines vermuteten Verstoßes gegen diese AGB behält sich der Veranstalter das Ermessen vor, Sie von aktuellen und zukünftigen Wettbewerben auszuschließen.\n\n3. Der Veranstalter behält sich das Recht vor, den Wettbewerb zu annullieren, auszusetzen, zu stornieren oder zu ändern, wenn Umstände, die außerhalb seiner Kontrolle liegen, eine solche Maßnahme erforderlich machen. In solchen Fällen werden die gezahlten Startgelder zurückerstattet.\n\n4. Es gibt keine festgelegte Mindestanzahl an Einsendungen und der Veranstalter führt die Auslosung und Preiszuteilung unabhängig von der Anzahl der eingegangenen Einsendungen durch. Eine Annullierung, Aussetzung, Absage, Verlängerung des Teilnahmeschlusses oder eine Änderung des Wettbewerbs aufgrund unzureichender Anmeldungen ist nicht möglich.\n\n5. Wettbewerbe auf der Website werden nicht von Facebook gesponsert, unterstützt, verwaltet oder sind mit Facebook verbunden. Durch die Teilnahme an den Wettbewerben erkennen die Teilnehmer an, dass Facebook keine Haftung übernimmt und nicht für die Verwaltung oder Werbung dieser Wettbewerbe verantwortlich ist.\n\n6. Diese Geschäftsbedingungen unterliegen englischem Recht und die Teilnehmer unterwerfen sich der Gerichtsbarkeit der Gerichte von England und Wales. Teilnehmer mit Wohnsitz in Schottland, Nordirland oder EU-Ländern haben die Möglichkeit, Ansprüche in ihren jeweiligen Ländern einzureichen.\n\n7. Für persönliche Unterlagen empfiehlt es sich, eine Kopie dieser AGB auszudrucken.',
      'es':
          '1. El Promotor se reserva el derecho de modificar estos términos y condiciones periódicamente. La versión más reciente de estos términos y condiciones estará accesible en el sitio web.\n\n2. En caso de sospecha de incumplimiento de estos Términos y condiciones, el Promotor se reserva la discreción de excluirlo de Concursos actuales y futuros.\n\n3. El Promotor se reserva el derecho de anular, suspender, cancelar o modificar el Concurso si circunstancias fuera de su control requieren tal acción. En tales casos, se reembolsará cualquier tarifa de inscripción pagada.\n\n4. No hay un número mínimo estipulado de inscripciones y el Promotor procederá con el sorteo y la asignación del Premio independientemente de la cantidad de inscripciones recibidas. No se realizará la anulación, suspensión, cancelación, extensión de la Fecha de cierre o modificación del Concurso debido a inscripciones insuficientes.\n\n5. Los concursos en el sitio web no están patrocinados, respaldados, administrados ni asociados con Facebook. Al participar en los Concursos, los Participantes reconocen que Facebook no asume ninguna responsabilidad ni es responsable de la administración o promoción de dichos Concursos.\n\n6. Estos términos y condiciones se rigen por la ley inglesa y los Participantes se someten a la jurisdicción de los tribunales de Inglaterra y Gales. Los participantes que residen en Escocia o Irlanda del Norte tienen o en países de la UE la opción de iniciar reclamaciones en sus respectivos países.\n\n7. Es recomendable imprimir una copia de estos T&C para registros personales.',
      'ro':
          '1. Promotorul își rezervă dreptul de a modifica periodic acești termeni și condiții. Cea mai recentă versiune a acestor termeni și condiții va fi accesibilă pe site.\n\n2. În cazul suspiciunii de încălcare a acestor T&C, Promotorul își rezervă dreptul de a vă exclude de la Competițiile actuale și viitoare.\n\n3. Promotorul își rezervă dreptul de a anula, suspenda, anula sau modifica Competiția dacă circumstanțe în afara controlului său necesită o astfel de acțiune. În astfel de cazuri, toate taxele de intrare plătite vor fi rambursate.\n\n4. Nu există un număr minim de înscrieri stipulat, iar Promotorul va proceda la extragerea și alocarea premiului, indiferent de cantitatea de înscrieri primite. Nu se va produce anularea, suspendarea, anularea, prelungirea Datei de Închidere sau modificarea Concursului din cauza înscrierilor insuficiente.\n\n5. Competițiile de pe site nu sunt sponsorizate, aprobate, administrate sau asociate cu Facebook. Prin participarea la Competiții, Participanții recunosc că Facebook nu poartă nicio răspundere și nu este responsabil pentru administrarea sau promovarea Competițiilor menționate.\n\n6. Acești termeni și condiții sunt guvernate de legea engleză, iar Participanții se supun jurisdicției instanțelor din Anglia și Țara Galilor. Participanții care au reședința în Scoția sau Irlanda de Nord au sau au UE opțiunea de a iniția cereri în țările lor respective.\n\n7. Este recomandabil să tipăriți o copie a acestor T&C pentru înregistrările personale.',
    },
    's3lw6vb7': {
      'en': 'Home',
      'de': 'Heim',
      'es': 'Hogar',
      'ro': 'Acasă',
    },
  },
  // CookiePolicy
  {
    '8otdisz2': {
      'en': 'Cookie Policy',
      'de': 'Cookie-Richtlinie',
      'es': 'Política de cookies',
      'ro': 'Politica de cookie-uri',
    },
    '4bocthny': {
      'en': 'Cookie Policy',
      'de': 'Cookie-Richtlinie',
      'es': 'Política de cookies',
      'ro': 'Politica de cookie-uri',
    },
    'pbbyhjj2': {
      'en': 'About this cookie policy',
      'de': 'Über diese Cookie-Richtlinie',
      'es': 'Acerca de esta política de cookies',
      'ro': 'Despre această politică privind cookie-urile',
    },
    'paamr1th': {
      'en':
          'This Cookie Policy elucidates the nature of cookies, their utilization, the varieties employed, the data they gather, and its application, as well as how to manage cookie preferences. For additional details on the handling, storage, and security of your personal information, please refer to our ',
      'de':
          'Diese Cookie-Richtlinie erläutert die Art von Cookies, ihre Verwendung, die verwendeten Sorten, die von ihnen erfassten Daten und ihre Anwendung sowie die Verwaltung der Cookie-Einstellungen. Weitere Einzelheiten zur Handhabung, Speicherung und Sicherheit Ihrer persönlichen Daten finden Sie in unserer',
      'es':
          'Esta Política de Cookies aclara la naturaleza de las cookies, su utilización, las variedades empleadas, los datos que recopilan y su aplicación, así como cómo gestionar las preferencias de cookies. Para obtener detalles adicionales sobre el manejo, almacenamiento y seguridad de su información personal, consulte nuestra',
      'ro':
          'Această Politică privind cookie-urile elucidează natura cookie-urilor, utilizarea lor, varietățile utilizate, datele pe care le adună și aplicarea acesteia, precum și modul de gestionare a preferințelor cookie. Pentru detalii suplimentare despre manipularea, stocarea și securitatea informațiilor dumneavoastră personale, vă rugăm să consultați pagina noastră',
    },
    'txwdj56z': {
      'en': 'Privacy Policy.\n',
      'de': 'Datenschutzrichtlinie.',
      'es': 'Política de privacidad.',
      'ro': 'Politica de confidențialitate.',
    },
    'r5y2swys': {
      'en':
          'You have the option to modify or retract your consent regarding the Cookie Declaration on our website at any given time. Additionally, you can access further insights into our identity, contact methods, and personal data processing in our ',
      'de':
          'Sie haben jederzeit die Möglichkeit, Ihre Einwilligung zur Cookie-Erklärung auf unserer Website zu ändern oder zu widerrufen. Darüber hinaus können Sie in unserem auf weitere Einblicke in unsere Identität, Kontaktmethoden und die Verarbeitung personenbezogener Daten zugreifen',
      'es':
          'Tiene la opción de modificar o retirar su consentimiento con respecto a la Declaración de cookies en nuestro sitio web en cualquier momento. Además, puede acceder a más información sobre nuestra identidad, métodos de contacto y procesamiento de datos personales en nuestra',
      'ro':
          'Aveți opțiunea de a modifica sau de a vă retrage consimțământul cu privire la Declarația privind cookie-urile de pe site-ul nostru în orice moment. În plus, puteți accesa informații suplimentare despre identitatea noastră, metodele de contact și prelucrarea datelor cu caracter personal în cadrul nostru',
    },
    'x8j4cpfv': {
      'en': ' Privacy Policy.\n',
      'de': 'Datenschutzrichtlinie.',
      'es': 'Política de privacidad.',
      'ro': 'Politica de confidențialitate.',
    },
    'lpjgj78f': {
      'en': 'Your consent pertains to the following domains: bountyfever.com',
      'de': 'Ihre Einwilligung gilt für die folgenden Domains: bountyfever.com',
      'es':
          'Su consentimiento se refiere a los siguientes dominios: bountyfever.com',
      'ro':
          'Consimțământul dumneavoastră se referă la următoarele domenii: bountyfever.com',
    },
    'oyg9anue': {
      'en':
          '\nThis Cookie Policy elucidates the nature of cookies, their utilization, the varieties employed, the data they gather, and its application, as well as how to manage cookie preferences. For additional details on the handling, storage, and security of your personal information, please refer to our Privacy Policy.\nYou have the option to modify or retract your consent regarding the Cookie Declaration on our website at any given time. Additionally, you can access further insights into our identity, contact methods, and personal data processing in our Privacy Policy.\nYour consent pertains to the following domains: bountyfever.com',
      'de':
          'Diese Cookie-Richtlinie erläutert die Art von Cookies, ihre Verwendung, die verwendeten Sorten, die von ihnen erfassten Daten und ihre Anwendung sowie die Verwaltung der Cookie-Einstellungen. Weitere Einzelheiten zur Handhabung, Speicherung und Sicherheit Ihrer personenbezogenen Daten finden Sie in unserer Datenschutzerklärung.\nSie haben jederzeit die Möglichkeit, Ihre Einwilligung zur Cookie-Erklärung auf unserer Website zu ändern oder zu widerrufen. Darüber hinaus können Sie in unserer Datenschutzrichtlinie auf weitere Einblicke in unsere Identität, Kontaktmethoden und Verarbeitung personenbezogener Daten zugreifen.\nIhre Einwilligung gilt für die folgenden Domains: bountyfever.com',
      'es':
          'Esta Política de Cookies aclara la naturaleza de las cookies, su utilización, las variedades empleadas, los datos que recopilan y su aplicación, así como cómo gestionar las preferencias de cookies. Para obtener detalles adicionales sobre el manejo, almacenamiento y seguridad de su información personal, consulte nuestra Política de Privacidad.\nTiene la opción de modificar o retirar su consentimiento con respecto a la Declaración de Cookies en nuestro sitio web en cualquier momento. Además, puede acceder a más información sobre nuestra identidad, métodos de contacto y procesamiento de datos personales en nuestra Política de Privacidad.\nSu consentimiento se refiere a los siguientes dominios: bountyfever.com',
      'ro':
          'Această Politică privind cookie-urile elucidează natura cookie-urilor, utilizarea lor, varietățile utilizate, datele pe care le adună și aplicarea acesteia, precum și modul de gestionare a preferințelor cookie. Pentru detalii suplimentare despre manipularea, stocarea și securitatea informațiilor dvs. personale, vă rugăm să consultați Politica noastră de confidențialitate.\nAveți opțiunea de a modifica sau de a vă retrage consimțământul cu privire la Declarația privind cookie-urile de pe site-ul nostru web în orice moment. În plus, puteți accesa informații suplimentare despre identitatea noastră, metodele de contact și prelucrarea datelor cu caracter personal în Politica noastră de confidențialitate.\nConsimțământul dvs. se referă la următoarele domenii: bountyfever.com',
    },
    'xhek6h3h': {
      'en': 'What are cookies ?',
      'de': 'Was sind Cookies?',
      'es': '¿Qué son las galletas?',
      'ro': 'Ce sunt cookie-urile?',
    },
    'q4xmkhh9': {
      'en':
          'Cookies, in the form of small text files, serve as repositories for tiny fragments of information. Upon loading the website on your browser, these files are stored on your device. They play a crucial role in ensuring the proper functioning of the website, enhancing security, improving user experience, and facilitating the analysis of website performance to identify areas for enhancement.',
      'de':
          'Cookies in Form kleiner Textdateien dienen als Speicher für winzige Informationsfragmente. Beim Laden der Website in Ihrem Browser werden diese Dateien auf Ihrem Gerät gespeichert. Sie spielen eine entscheidende Rolle bei der Gewährleistung des ordnungsgemäßen Funktionierens der Website, der Verbesserung der Sicherheit, der Verbesserung des Benutzererlebnisses und der Erleichterung der Analyse der Website-Leistung, um Bereiche für Verbesserungen zu identifizieren.',
      'es':
          'Las cookies, en forma de pequeños archivos de texto, sirven como depósitos de pequeños fragmentos de información. Al cargar el sitio web en su navegador, estos archivos se almacenan en su dispositivo. Desempeñan un papel crucial para garantizar el funcionamiento adecuado del sitio web, mejorar la seguridad, mejorar la experiencia del usuario y facilitar el análisis del rendimiento del sitio web para identificar áreas de mejora.',
      'ro':
          'Cookie-urile, sub formă de fișiere text mici, servesc drept depozite pentru fragmente minuscule de informații. La încărcarea site-ului web în browser, aceste fișiere sunt stocate pe dispozitivul dumneavoastră. Acestea joacă un rol crucial în asigurarea funcționării corespunzătoare a site-ului web, în ​​îmbunătățirea securității, în îmbunătățirea experienței utilizatorului și în facilitarea analizei performanței site-ului web pentru a identifica zonele de îmbunătățire.',
    },
    'n4d621ki': {
      'en': 'How do we use cookies?',
      'de': 'Wie verwenden wir Cookies?',
      'es': 'Cómo usamos las cookies?',
      'ro': 'Cum folosim cookie-urile?',
    },
    'gp2zg5r9': {
      'en':
          'Like many online platforms, our website employs both first-party and third-party cookies for various objectives. First-party cookies are primarily essential for the proper operation of the website and do not gather any personally identifiable information.\nThird-party cookies, on the other hand, serve purposes such as analyzing website performance, tracking user interactions, enhancing security measures, delivering targeted advertisements, and ultimately furnishing users with an enhanced and streamlined browsing experience, expediting future interactions with our website.',
      'de':
          'Wie viele Online-Plattformen verwendet unsere Website sowohl Erstanbieter- als auch Drittanbieter-Cookies für verschiedene Zwecke. Erstanbieter-Cookies sind in erster Linie für den ordnungsgemäßen Betrieb der Website unerlässlich und erfassen keine persönlich identifizierbaren Informationen.\nDrittanbieter-Cookies dienen hingegen Zwecken wie der Analyse der Website-Leistung, der Verfolgung von Benutzerinteraktionen und der Verbesserung der Sicherheit Maßnahmen, die Bereitstellung gezielter Werbung und letztendlich die Bereitstellung eines verbesserten und optimierten Surferlebnisses für Benutzer, wodurch zukünftige Interaktionen mit unserer Website beschleunigt werden.',
      'es':
          'Como muchas plataformas en línea, nuestro sitio web emplea cookies propias y de terceros para diversos objetivos. Las cookies de origen son principalmente esenciales para el funcionamiento adecuado del sitio web y no recopilan ninguna información de identificación personal.\nLas cookies de terceros, por otro lado, sirven para fines tales como analizar el rendimiento del sitio web, rastrear las interacciones del usuario y mejorar la seguridad. medidas, entregando anuncios dirigidos y, en última instancia, brindando a los usuarios una experiencia de navegación mejorada y optimizada, acelerando futuras interacciones con nuestro sitio web.',
      'ro':
          'La fel ca multe platforme online, site-ul nostru web folosește atât cookie-uri de la prima parte, cât și de la terți pentru diverse obiective. Cookie-urile de la prima parte sunt în primul rând esențiale pentru funcționarea corectă a site-ului web și nu adună informații de identificare personală.\nCookie-urile de la terți, pe de altă parte, servesc unor scopuri precum analiza performanței site-ului web, urmărirea interacțiunilor utilizatorilor, îmbunătățirea securității măsuri, oferind reclame direcționate și, în cele din urmă, oferind utilizatorilor o experiență de navigare îmbunătățită și simplificată, accelerând interacțiunile viitoare cu site-ul nostru.',
    },
    'x08d7p2e': {
      'en': 'What types of cookies do we use?',
      'de': 'Welche Arten von Cookies verwenden wir?',
      'es': '¿Qué tipos de cookies utilizamos?',
      'ro': 'Ce tipuri de cookie-uri folosim?',
    },
    'ai67ohls': {
      'en':
          'Essential: These cookies are vital for you to fully utilize the features of our site. They enable us to maintain user sessions and thwart any security risks. Importantly, they do not gather or retain any personal information. For instance, these cookies enable you to log in to your account, add products to your basket, and securely proceed to checkout.\nStatistics: These cookies record details such as the website\'s visitor count, unique visitors, visited pages, and traffic sources. This information aids us in comprehending and evaluating the website\'s performance, pinpointing areas for enhancement.\nFunctional: These cookies facilitate certain non-essential functionalities on our website. These functionalities encompass embedding content like videos or sharing website content on social media platforms.\nPreferences: These cookies assist us in storing your settings and browsing preferences, such as language preferences, ensuring a more efficient and personalized experience during your future visits to the website.',
      'de':
          'Unverzichtbar: Diese Cookies sind für die vollständige Nutzung der Funktionen unserer Website unerlässlich. Sie ermöglichen es uns, Benutzersitzungen aufrechtzuerhalten und etwaige Sicherheitsrisiken zu verhindern. Wichtig ist, dass sie keine persönlichen Daten sammeln oder speichern. Mit diesen Cookies können Sie sich beispielsweise bei Ihrem Konto anmelden, Produkte in Ihren Warenkorb legen und sicher zur Kasse gehen.\nStatistiken: Diese Cookies zeichnen Details wie die Besucherzahl der Website, einzelne Besucher, besuchte Seiten und den Datenverkehr auf Quellen. Diese Informationen helfen uns, die Leistung der Website zu verstehen und zu bewerten und Bereiche für Verbesserungen zu identifizieren.\nFunktional: Diese Cookies ermöglichen bestimmte nicht wesentliche Funktionen auf unserer Website. Diese Funktionen umfassen das Einbetten von Inhalten wie Videos oder das Teilen von Website-Inhalten auf Social-Media-Plattformen.\nEinstellungen: Diese Cookies helfen uns bei der Speicherung Ihrer Einstellungen und Browsing-Einstellungen, wie z. B. Spracheinstellungen, und sorgen so für ein effizienteres und personalisierteres Erlebnis bei Ihren zukünftigen Besuchen auf Die Webseite.',
      'es':
          'Esencial: estas cookies son vitales para que usted pueda utilizar plenamente las funciones de nuestro sitio. Nos permiten mantener las sesiones de los usuarios y frustrar cualquier riesgo de seguridad. Es importante destacar que no recopilan ni retienen ninguna información personal. Por ejemplo, estas cookies le permiten iniciar sesión en su cuenta, agregar productos a su carrito y realizar el pago de forma segura.\nEstadísticas: estas cookies registran detalles como el recuento de visitantes del sitio web, los visitantes únicos, las páginas visitadas y el tráfico. fuentes. Esta información nos ayuda a comprender y evaluar el rendimiento del sitio web, identificando áreas de mejora.\nFuncionales: Estas cookies facilitan ciertas funcionalidades no esenciales en nuestro sitio web. Estas funcionalidades abarcan incrustar contenido como videos o compartir contenido de sitios web en plataformas de redes sociales.\nPreferencias: estas cookies nos ayudan a almacenar su configuración y preferencias de navegación, como las preferencias de idioma, garantizando una experiencia más eficiente y personalizada durante sus futuras visitas a el sitio web.',
      'ro':
          'Esențial: Aceste cookie-uri sunt vitale pentru ca dvs. să utilizați pe deplin funcțiile site-ului nostru. Acestea ne permit să menținem sesiunile utilizatorilor și să împiedicăm orice riscuri de securitate. Important este că nu adună și nu rețin informații personale. De exemplu, aceste module cookie vă permit să vă conectați la contul dvs., să adăugați produse în coșul dvs. și să continuați în siguranță la finalizarea comenzii.\nStatistici: aceste module cookie înregistrează detalii precum numărul de vizitatori ai site-ului web, vizitatorii unici, paginile vizitate și traficul surse. Aceste informații ne ajută să înțelegem și să evaluăm performanța site-ului web, identificând zonele de îmbunătățire.\nFuncțional: Aceste cookie-uri facilitează anumite funcționalități neesențiale pe site-ul nostru. Aceste funcționalități includ încorporarea de conținut, cum ar fi videoclipuri sau partajarea conținutului site-ului pe platformele de rețele sociale.\nPreferințe: Aceste cookie-uri ne ajută să vă stocăm setările și preferințele de navigare, cum ar fi preferințele de limbă, asigurând o experiență mai eficientă și personalizată în timpul vizitelor dvs. viitoare la site-ul.',
    },
    'emwk4a2x': {
      'en': 'How can I control the cookie preferences?',
      'de': 'Wie kann ich die Cookie-Einstellungen steuern?',
      'es': '¿Cómo puedo controlar las preferencias de cookies?',
      'ro': 'Cum pot controla preferințele cookie-urilor?',
    },
    'ccfimvq8': {
      'en':
          'If you opt to adjust your preferences later during your browsing session, you can do so by clearing cookies and reloading the page. This action will prompt the consent notice to reappear, allowing you to customize your preferences or withdraw your consent entirely.\n\nMoreover, various browsers offer distinct methods to block and delete cookies utilized by websites. You can modify your browser settings to block or delete cookies. For further information on managing and deleting cookies, you can visit ',
      'de':
          'Wenn Sie Ihre Einstellungen später während Ihrer Browsersitzung anpassen möchten, können Sie dies tun, indem Sie Cookies löschen und die Seite neu laden. Durch diese Aktion wird die Einwilligungserklärung erneut angezeigt, sodass Sie Ihre Einstellungen anpassen oder Ihre Einwilligung vollständig widerrufen können.\n\nDarüber hinaus bieten verschiedene Browser unterschiedliche Methoden zum Blockieren und Löschen von von Websites verwendeten Cookies. Sie können Ihre Browsereinstellungen ändern, um Cookies zu blockieren oder zu löschen. Weitere Informationen zum Verwalten und Löschen von Cookies finden Sie unter',
      'es':
          'Si opta por ajustar sus preferencias más adelante durante su sesión de navegación, puede hacerlo borrando las cookies y recargando la página. Esta acción hará que vuelva a aparecer el aviso de consentimiento, lo que le permitirá personalizar sus preferencias o retirar su consentimiento por completo.\n\nAdemás, varios navegadores ofrecen distintos métodos para bloquear y eliminar las cookies utilizadas por los sitios web. Puede modificar la configuración de su navegador para bloquear o eliminar las cookies. Para más información sobre la gestión y eliminación de cookies, puede visitar',
      'ro':
          'Dacă alegeți să vă ajustați preferințele mai târziu în timpul sesiunii de navigare, puteți face acest lucru ștergând cookie-urile și reîncărcând pagina. Această acțiune va face ca notificarea de consimțământ să reapară, permițându-vă să vă personalizați preferințele sau să vă retrageți în totalitate consimțământul.\n\n În plus, diferite browsere oferă metode distincte de blocare și ștergere a cookie-urilor utilizate de site-uri web. Puteți modifica setările browserului pentru a bloca sau șterge cookie-urile. Pentru mai multe informații despre gestionarea și ștergerea cookie-urilor, puteți vizita',
    },
    'lc4sqdqk': {
      'en': 'wikipedia.org',
      'de': 'wikipedia.org',
      'es': 'wikipedia.org',
      'ro': 'wikipedia.org',
    },
    'h0su66i9': {
      'en': ' or',
      'de': 'oder',
      'es': 'o',
      'ro': 'sau',
    },
    'ec557b5j': {
      'en': ' www.allaboutcookies.org.',
      'de': 'www.allaboutcookies.org.',
      'es': 'www.allaboutcookies.org.',
      'ro': 'www.allaboutcookies.org.',
    },
    'n2wiur0f': {
      'en':
          'If you opt to adjust your preferences later during your browsing session, you can do so by clearing cookies and reloading the page. This action will prompt the consent notice to reappear, allowing you to customize your preferences or withdraw your consent entirely.\n\nMoreover, various browsers offer distinct methods to block and delete cookies utilized by websites. You can modify your browser settings to block or delete cookies. For further information on managing and deleting cookies, you can visit wikipedia.org or www.allaboutcookies.org.',
      'de':
          'Wenn Sie Ihre Einstellungen später während Ihrer Browsersitzung anpassen möchten, können Sie dies tun, indem Sie Cookies löschen und die Seite neu laden. Durch diese Aktion wird die Einwilligungserklärung erneut angezeigt, sodass Sie Ihre Einstellungen anpassen oder Ihre Einwilligung vollständig widerrufen können.\n\nDarüber hinaus bieten verschiedene Browser unterschiedliche Methoden zum Blockieren und Löschen von von Websites verwendeten Cookies. Sie können Ihre Browsereinstellungen ändern, um Cookies zu blockieren oder zu löschen. Weitere Informationen zum Verwalten und Löschen von Cookies finden Sie auf wikipedia.org oder www.allaboutcookies.org.',
      'es':
          'Si opta por ajustar sus preferencias más adelante durante su sesión de navegación, puede hacerlo borrando las cookies y recargando la página. Esta acción hará que vuelva a aparecer el aviso de consentimiento, lo que le permitirá personalizar sus preferencias o retirar su consentimiento por completo.\n\nAdemás, varios navegadores ofrecen distintos métodos para bloquear y eliminar las cookies utilizadas por los sitios web. Puede modificar la configuración de su navegador para bloquear o eliminar las cookies. Para obtener más información sobre cómo administrar y eliminar cookies, puede visitar wikipedia.org o www.allaboutcookies.org.',
      'ro':
          'Dacă alegeți să vă ajustați preferințele mai târziu în timpul sesiunii de navigare, puteți face acest lucru ștergând cookie-urile și reîncărcând pagina. Această acțiune va face ca notificarea de consimțământ să reapară, permițându-vă să vă personalizați preferințele sau să vă retrageți în totalitate consimțământul.\n\n În plus, diferite browsere oferă metode distincte de blocare și ștergere a cookie-urilor utilizate de site-uri web. Puteți modifica setările browserului pentru a bloca sau șterge cookie-urile. Pentru mai multe informații despre gestionarea și ștergerea cookie-urilor, puteți vizita wikipedia.org sau www.allaboutcookies.org.',
    },
    'f0s41a3t': {
      'en': 'Home',
      'de': 'Heim',
      'es': 'Hogar',
      'ro': 'Acasă',
    },
  },
  // AcceptableUsePolicy
  {
    'pxbv8hqc': {
      'en': 'Acceptable Use Policy',
      'de': 'Richtlinien zur akzeptablen Nutzung',
      'es': 'Política de uso aceptable',
      'ro': 'Politica de utilizare acceptabilă',
    },
    '6eeyeci7': {
      'en': 'Acceptable Use Policy',
      'de': 'Richtlinien zur akzeptablen Nutzung',
      'es': 'Política de uso aceptable',
      'ro': 'Politica de utilizare acceptabilă',
    },
    'x8pbqh7l': {
      'en': 'About us',
      'de': 'Über uns',
      'es': 'Sobre nosotros',
      'ro': 'Despre noi',
    },
    '614cfu9o': {
      'en':
          'This Acceptable Use Policy outlines the terms governing your use of our website ',
      'de':
          'Diese Richtlinie zur akzeptablen Nutzung beschreibt die Bedingungen, die Ihre Nutzung unserer Website regeln',
      'es':
          'Esta Política de uso aceptable describe los términos que rigen el uso de nuestro sitio web.',
      'ro':
          'Această politică de utilizare acceptabilă subliniază termenii care guvernează utilizarea site-ului nostru web',
    },
    'xre9hgac': {
      'en': 'www.bountyfever.com\n',
      'de': 'www.bountyfever.com',
      'es': 'www.bountyfever.com',
      'ro': 'www.bountyfever.com',
    },
    '14i6qu7c': {
      'en':
          '(referred to as \"our site\"). This policy is applicable to all users and visitors of our site.\n\nYour utilization of our site signifies your acceptance and adherence to all the provisions outlined in this Acceptable Use Policy, which complements our Terms of Website Use\n\nOur site is operated by BlueDash Limited (\"We\"). We are registered in England and Wales under company number 15584865, with our registered office located at DNS House, 382 Kenton Road, Harrow, Greater London, England HA3 8DP.\n\nShould you need to get in touch with us, please reach out via email at ',
      'de':
          '(im Folgenden als „unsere Website“ bezeichnet). Diese Richtlinie gilt für alle Benutzer und Besucher unserer Website.\n\nIhre Nutzung unserer Website bedeutet, dass Sie alle in dieser Richtlinie zur akzeptablen Nutzung dargelegten Bestimmungen akzeptieren und einhalten, die unsere Nutzungsbedingungen für die Website ergänzt\n \nUnsere Website wird von BlueDash Limited („Wir“) betrieben. Wir sind in England und Wales unter der Firmennummer 15584865 registriert. Unser eingetragener Firmensitz befindet sich in DNS House, 382 Kenton Road, Harrow, Greater London, England HA3 8DP.\n\nSollten Sie Kontakt mit uns aufnehmen müssen, Bitte kontaktieren Sie uns per E-Mail unter',
      'es':
          '(denominado \"nuestro sitio\"). Esta política es aplicable a todos los usuarios y visitantes de nuestro sitio.\n\nSu utilización de nuestro sitio significa su aceptación y cumplimiento de todas las disposiciones descritas en esta Política de uso aceptable, que complementa nuestros Términos de uso del sitio web\n \nNuestro sitio es operado por BlueDash Limited (\"Nosotros\"). Estamos registrados en Inglaterra y Gales con el número de empresa 15584865, con nuestro domicilio social ubicado en DNS House, 382 Kenton Road, Harrow, Greater London, England HA3 8DP.\n\nSi necesita ponerse en contacto con nosotros, por favor comuníquese por correo electrónico a',
      'ro':
          '(denumit „site-ul nostru”). Această politică se aplică tuturor utilizatorilor și vizitatorilor site-ului nostru.\n\nUtilizarea de către dumneavoastră a site-ului nostru înseamnă acceptarea și aderarea dumneavoastră la toate prevederile prezentate în această Politică de utilizare acceptabilă, care completează Termenii noștri de utilizare a site-ului web\n \nSite-ul nostru este operat de BlueDash Limited (\"Noi\"). Suntem înregistrați în Anglia și Țara Galilor sub numărul companiei 15584865, cu sediul social situat la DNS House, 382 Kenton Road, Harrow, Greater London, England HA3 8DP.\n\nDacă aveți nevoie să ne contactați, vă rugăm să contactați prin e-mail la',
    },
    '5vt9yjkf': {
      'en': 'contact@bluedash.co.uk',
      'de': 'contact@bluedash.co.uk',
      'es': 'contacto@bluedash.co.uk',
      'ro': 'contact@bluedash.co.uk',
    },
    '77y3cszb': {
      'en':
          '\nThis Cookie Policy elucidates the nature of cookies, their utilization, the varieties employed, the data they gather, and its application, as well as how to manage cookie preferences. For additional details on the handling, storage, and security of your personal information, please refer to our Privacy Policy.\nYou have the option to modify or retract your consent regarding the Cookie Declaration on our website at any given time. Additionally, you can access further insights into our identity, contact methods, and personal data processing in our Privacy Policy.\nYour consent pertains to the following domains: bountyfever.com',
      'de':
          'Diese Cookie-Richtlinie erläutert die Art von Cookies, ihre Verwendung, die verwendeten Sorten, die von ihnen erfassten Daten und ihre Anwendung sowie die Verwaltung der Cookie-Einstellungen. Weitere Einzelheiten zur Handhabung, Speicherung und Sicherheit Ihrer personenbezogenen Daten finden Sie in unserer Datenschutzerklärung.\nSie haben jederzeit die Möglichkeit, Ihre Einwilligung zur Cookie-Erklärung auf unserer Website zu ändern oder zu widerrufen. Darüber hinaus können Sie in unserer Datenschutzrichtlinie auf weitere Einblicke in unsere Identität, Kontaktmethoden und Verarbeitung personenbezogener Daten zugreifen.\nIhre Einwilligung gilt für die folgenden Domains: bountyfever.com',
      'es':
          'Esta Política de Cookies aclara la naturaleza de las cookies, su utilización, las variedades empleadas, los datos que recopilan y su aplicación, así como cómo gestionar las preferencias de cookies. Para obtener detalles adicionales sobre el manejo, almacenamiento y seguridad de su información personal, consulte nuestra Política de Privacidad.\nTiene la opción de modificar o retirar su consentimiento con respecto a la Declaración de Cookies en nuestro sitio web en cualquier momento. Además, puede acceder a más información sobre nuestra identidad, métodos de contacto y procesamiento de datos personales en nuestra Política de Privacidad.\nSu consentimiento se refiere a los siguientes dominios: bountyfever.com',
      'ro':
          'Această Politică privind cookie-urile elucidează natura cookie-urilor, utilizarea lor, varietățile utilizate, datele pe care le adună și aplicarea acesteia, precum și modul de gestionare a preferințelor cookie. Pentru detalii suplimentare despre manipularea, stocarea și securitatea informațiilor dvs. personale, vă rugăm să consultați Politica noastră de confidențialitate.\nAveți opțiunea de a modifica sau de a vă retrage consimțământul cu privire la Declarația privind cookie-urile de pe site-ul nostru web în orice moment. În plus, puteți accesa informații suplimentare despre identitatea noastră, metodele de contact și prelucrarea datelor cu caracter personal în Politica noastră de confidențialitate.\nConsimțământul dvs. se referă la următoarele domenii: bountyfever.com',
    },
    'uwl2a6jg': {
      'en': 'Prohibited uses',
      'de': 'Verbotene Verwendungen',
      'es': 'Usos prohibidos',
      'ro': 'Utilizări interzise',
    },
    '2z80ji4p': {
      'en':
          'You are permitted to use our site solely for lawful purposes. You must refrain from using our site:\n\n- In any manner that violates any applicable local, national, or international laws or regulations.\n- In any manner that is unlawful or fraudulent, or serves any unlawful or fraudulent intent.\n- With the intention of causing harm or attempting to harm minors in any way.\n- To send, knowingly receive, upload, download, use, or re-use any material that does not adhere to our content standards as outlined below.\n- To transmit, or solicit the transmission of, any unsolicited or unauthorized advertising, promotional material, or any other form of similar solicitation (spam).\n- To knowingly transmit any data, send or upload any material containing viruses, Trojan horses, worms, time-bombs, keystroke loggers, spyware, adware, or any other harmful programs or similar computer code designed to adversely affect the operation of any computer software or hardware.\n\nAdditionally, you agree:\n\n- Not to reproduce, duplicate, copy, or resell any part of our site in violation of the provisions of our ',
      'de':
          'Es ist Ihnen gestattet, unsere Website ausschließlich für rechtmäßige Zwecke zu nutzen. Sie dürfen unsere Website nicht nutzen:\n\n- In jeglicher Weise, die gegen geltende lokale, nationale oder internationale Gesetze oder Vorschriften verstößt.\n- In jeglicher Weise, die rechtswidrig oder betrügerisch ist oder einer rechtswidrigen oder rechtswidrigen Art dient betrügerische Absicht.\n- Mit der Absicht, Minderjährigen Schaden zuzufügen oder zu versuchen, Minderjährigen in irgendeiner Weise zu schaden.\n- Zum Senden, wissentlichen Empfangen, Hochladen, Herunterladen, Verwenden oder Wiederverwenden von Material, das nicht unseren Bestimmungen entspricht Inhaltsstandards wie unten beschrieben.\n- Um unaufgeforderte oder unbefugte Werbung, Verkaufsförderungsmaterial oder jede andere Form ähnlicher Werbung (Spam) zu übermitteln oder deren Übertragung anzufordern.\n- Um wissentlich Daten zu übermitteln, senden Sie oder Material hochzuladen, das Viren, Trojaner, Würmer, Zeitbomben, Tastenanschlag-Logger, Spyware, Adware oder andere schädliche Programme oder ähnlichen Computercode enthält, der den Betrieb von Computersoftware oder -hardware beeinträchtigen soll.\n<__FFNL__ >Darüber hinaus erklären Sie sich damit einverstanden:\n\n- Keinen Teil unserer Website unter Verletzung unserer Bestimmungen zu reproduzieren, zu duplizieren, zu kopieren oder weiterzuverkaufen',
      'es':
          'Se le permite utilizar nuestro sitio únicamente para fines legales. Debe abstenerse de utilizar nuestro sitio:\n\n- De cualquier manera que viole cualquier ley o reglamento local, nacional o internacional aplicable.\n- De cualquier manera que sea ilegal o fraudulenta, o que sirva para cualquier uso ilegal o intención fraudulenta.\n- Con la intención de causar daño o intentar dañar a menores de cualquier manera.\n- Para enviar, recibir, cargar, descargar, usar o reutilizar a sabiendas cualquier material que no se adhiera a nuestras estándares de contenido como se describe a continuación.\n- Para transmitir o solicitar la transmisión de cualquier publicidad no solicitada o no autorizada, material promocional o cualquier otra forma de solicitud similar (spam).\n- Para transmitir conscientemente cualquier dato, envíe ni cargar ningún material que contenga virus, caballos de Troya, gusanos, bombas de tiempo, registradores de pulsaciones de teclas, spyware, adware o cualquier otro programa dañino o código informático similar diseñado para afectar negativamente el funcionamiento de cualquier software o hardware informático.\n<__FFNL__ >Adicionalmente, usted acepta:\n\n- No reproducir, duplicar, copiar o revender ninguna parte de nuestro sitio en violación de las disposiciones de nuestra',
      'ro':
          'Vi se permite să utilizați site-ul nostru exclusiv în scopuri legale. Trebuie să vă abțineți de la a utiliza site-ul nostru:\n\n- În orice mod care încalcă orice lege sau reglementări locale, naționale sau internaționale aplicabile.\n- În orice mod care este ilegal sau fraudulos, sau servește oricărui intenție frauduloasă.\n- Cu intenția de a provoca prejudicii sau de a încerca să rănească minori în orice fel.\n- Pentru a trimite, primi, încărca, descărca, utiliza sau reutiliza orice material care nu aderă la dispozițiile noastre. standardele de conținut, așa cum sunt prezentate mai jos.\n- Pentru a transmite sau solicita transmiterea oricărei reclame nesolicitate sau neautorizate, materiale promoționale sau orice altă formă de solicitare similară (spam).\n- Pentru a transmite cu bună știință orice date, trimiteți sau încărcați orice material care conține viruși, cai troieni, viermi, bombe cu ceas, înregistrări de taste, spyware, adware sau orice alte programe dăunătoare sau cod de computer similar conceput pentru a afecta negativ funcționarea oricărui software sau hardware de computer.\n<__FFNL__ >În plus, sunteți de acord cu:\n\n- să nu reproduceți, duplicați, copiați sau revindeți nicio parte a site-ului nostru, încălcând prevederile noastre',
    },
    'ns2h84vr': {
      'en': ' Terms and Conditions.\n',
      'de': 'Geschäftsbedingungen.',
      'es': 'Términos y condiciones.',
      'ro': 'Termeni și condiții.',
    },
    'ob44zk4m': {
      'en':
          '- Not to access, interfere with, damage, or disrupt:\n  - Any part of our site;\n  - Any equipment or network on which our site is stored;\n  - Any software used in the provision of our site; or\n  - Any equipment, network, or software owned or used by any third party.',
      'de':
          '- Nicht auf Folgendes zuzugreifen, es zu stören, zu beschädigen oder zu stören:\n - Jeglicher Teil unserer Website;\n - Alle Geräte oder Netzwerke, auf denen unsere Website gespeichert ist;\n - Jegliche Software, die bei der Bereitstellung unserer Dienste verwendet wird Website; oder\n – Alle Geräte, Netzwerke oder Software, die Eigentum Dritter sind oder von diesen genutzt werden.',
      'es':
          '- No acceder, interferir, dañar o interrumpir:\n - Cualquier parte de nuestro sitio;\n - Cualquier equipo o red en el que esté almacenado nuestro sitio;\n - Cualquier software utilizado en la provisión de nuestro sitio; o\n: cualquier equipo, red o software que sea propiedad de un tercero o sea utilizado por él.',
      'ro':
          '- Să nu acceseze, să interfereze cu, să deterioreze sau să perturbe:\n - Orice parte a site-ului nostru;\n - Orice echipament sau rețea în care este stocat site-ul nostru;\n - Orice software utilizat în furnizarea site-ului nostru site-ul; sau\n - Orice echipament, rețea sau software deținut sau utilizat de o terță parte.',
    },
    'k96yy1sx': {
      'en':
          'You are permitted to use our site solely for lawful purposes. You must refrain from using our site:\n\n- In any manner that violates any applicable local, national, or international laws or regulations.\n- In any manner that is unlawful or fraudulent, or serves any unlawful or fraudulent intent.\n- With the intention of causing harm or attempting to harm minors in any way.\n- To send, knowingly receive, upload, download, use, or re-use any material that does not adhere to our content standards as outlined below.\n- To transmit, or solicit the transmission of, any unsolicited or unauthorized advertising, promotional material, or any other form of similar solicitation (spam).\n- To knowingly transmit any data, send or upload any material containing viruses, Trojan horses, worms, time-bombs, keystroke loggers, spyware, adware, or any other harmful programs or similar computer code designed to adversely affect the operation of any computer software or hardware.\n\nAdditionally, you agree:\n\n- Not to reproduce, duplicate, copy, or resell any part of our site in violation of the provisions of our ',
      'de':
          'Es ist Ihnen gestattet, unsere Website ausschließlich für rechtmäßige Zwecke zu nutzen. Sie dürfen unsere Website nicht nutzen:\n\n- In jeglicher Weise, die gegen geltende lokale, nationale oder internationale Gesetze oder Vorschriften verstößt.\n- In jeglicher Weise, die rechtswidrig oder betrügerisch ist oder einer rechtswidrigen oder rechtswidrigen Art dient betrügerische Absicht.\n- Mit der Absicht, Minderjährigen Schaden zuzufügen oder zu versuchen, Minderjährigen in irgendeiner Weise zu schaden.\n- Zum Senden, wissentlichen Empfangen, Hochladen, Herunterladen, Verwenden oder Wiederverwenden von Material, das nicht unseren Bestimmungen entspricht Inhaltsstandards wie unten beschrieben.\n- Um unaufgeforderte oder unbefugte Werbung, Verkaufsförderungsmaterial oder jede andere Form ähnlicher Werbung (Spam) zu übermitteln oder deren Übertragung anzufordern.\n- Um wissentlich Daten zu übermitteln, senden Sie oder Material hochzuladen, das Viren, Trojaner, Würmer, Zeitbomben, Tastenanschlag-Logger, Spyware, Adware oder andere schädliche Programme oder ähnlichen Computercode enthält, der den Betrieb von Computersoftware oder -hardware beeinträchtigen soll.\n<__FFNL__ >Darüber hinaus erklären Sie sich damit einverstanden:\n\n- Keinen Teil unserer Website unter Verletzung unserer Bestimmungen zu reproduzieren, zu duplizieren, zu kopieren oder weiterzuverkaufen',
      'es':
          'Se le permite utilizar nuestro sitio únicamente para fines legales. Debe abstenerse de utilizar nuestro sitio:\n\n- De cualquier manera que viole cualquier ley o reglamento local, nacional o internacional aplicable.\n- De cualquier manera que sea ilegal o fraudulenta, o que sirva para cualquier uso ilegal o intención fraudulenta.\n- Con la intención de causar daño o intentar dañar a menores de cualquier manera.\n- Para enviar, recibir, cargar, descargar, usar o reutilizar a sabiendas cualquier material que no se adhiera a nuestras estándares de contenido como se describe a continuación.\n- Para transmitir o solicitar la transmisión de cualquier publicidad no solicitada o no autorizada, material promocional o cualquier otra forma de solicitud similar (spam).\n- Para transmitir conscientemente cualquier dato, envíe ni cargar ningún material que contenga virus, caballos de Troya, gusanos, bombas de tiempo, registradores de pulsaciones de teclas, spyware, adware o cualquier otro programa dañino o código informático similar diseñado para afectar negativamente el funcionamiento de cualquier software o hardware informático.\n<__FFNL__ >Adicionalmente, usted acepta:\n\n- No reproducir, duplicar, copiar o revender ninguna parte de nuestro sitio en violación de las disposiciones de nuestra',
      'ro':
          'Vi se permite să utilizați site-ul nostru exclusiv în scopuri legale. Trebuie să vă abțineți de la a utiliza site-ul nostru:\n\n- În orice mod care încalcă orice lege sau reglementări locale, naționale sau internaționale aplicabile.\n- În orice mod care este ilegal sau fraudulos, sau servește oricărui intenție frauduloasă.\n- Cu intenția de a provoca prejudicii sau de a încerca să rănească minori în orice fel.\n- Pentru a trimite, primi, încărca, descărca, utiliza sau reutiliza orice material care nu aderă la dispozițiile noastre. standardele de conținut, așa cum sunt prezentate mai jos.\n- Pentru a transmite sau solicita transmiterea oricărei reclame nesolicitate sau neautorizate, materiale promoționale sau orice altă formă de solicitare similară (spam).\n- Pentru a transmite cu bună știință orice date, trimiteți sau încărcați orice material care conține viruși, cai troieni, viermi, bombe cu ceas, înregistrări de taste, spyware, adware sau orice alte programe dăunătoare sau cod de computer similar conceput pentru a afecta negativ funcționarea oricărui software sau hardware de computer.\n<__FFNL__ >În plus, sunteți de acord cu:\n\n- să nu reproduceți, duplicați, copiați sau revindeți nicio parte a site-ului nostru, încălcând prevederile noastre',
    },
    'pvkcnqwe': {
      'en': 'Interactive services',
      'de': 'Interaktive Dienste',
      'es': 'Servicios interactivos',
      'ro': 'Servicii interactive',
    },
    'ztrjzbs1': {
      'en':
          'From time to time, we may offer interactive services on our site, such as games, competitions, commenting on blog posts, or posting to our social media accounts (referred to as interactive services).\n\nWhenever we provide such interactive services, we will furnish you with clear information regarding the type of service offered, whether it is moderated, and the form of moderation employed (including whether it involves human or technical oversight).\n\nWe will make reasonable efforts to evaluate any potential risks to users (especially children) posed by third parties when they utilize any interactive service on our site. Based on these assessments, we will determine whether moderation of the relevant service is warranted (and what type of moderation is appropriate). However, please note that we are not obligated to monitor or moderate any interactive service we offer on our site, and we explicitly disclaim liability for any loss or damage resulting from a user\'s use of any interactive service in violation of our content standards, whether or not the service is moderated.\n\nMinors using any of our interactive services must obtain consent from their parent or guardian. We advise parents allowing their children to use interactive services to discuss online safety with them, as moderation is not foolproof. Minors using interactive services should be informed about potential risks.\n\nIn instances where we do moderate an interactive service, we will typically provide a means for you to contact the moderator if any concerns or difficulties arise.',
      'de':
          'Von Zeit zu Zeit bieten wir auf unserer Website möglicherweise interaktive Dienste an, wie z. B. Spiele, Wettbewerbe, das Kommentieren von Blogbeiträgen oder das Posten auf unseren Social-Media-Konten (sogenannte interaktive Dienste).\n\nWann immer wir solche bereitstellen Bei interaktiven Diensten stellen wir Ihnen klare Informationen über die Art des angebotenen Dienstes zur Verfügung, ob er moderiert wird und welche Art der Moderation eingesetzt wird (einschließlich der Frage, ob es sich um menschliche oder technische Aufsicht handelt).\n\nWir werden angemessene Anstrengungen unternehmen um mögliche Risiken für Benutzer (insbesondere Kinder) zu bewerten, die von Dritten ausgehen, wenn sie einen interaktiven Dienst auf unserer Website nutzen. Auf der Grundlage dieser Beurteilungen ermitteln wir, ob eine Moderation des jeweiligen Dienstes gerechtfertigt ist (und welche Art der Moderation angemessen ist). Bitte beachten Sie jedoch, dass wir nicht verpflichtet sind, die von uns auf unserer Website angebotenen interaktiven Dienste zu überwachen oder zu moderieren, und wir lehnen ausdrücklich die Haftung für Verluste oder Schäden ab, die sich aus der Nutzung eines interaktiven Dienstes durch einen Benutzer unter Verletzung unserer Inhaltsstandards ergeben, unabhängig davon, ob oder Der Dienst wird nicht moderiert.\n\nMinderjährige, die unsere interaktiven Dienste nutzen, müssen die Zustimmung ihrer Eltern oder Erziehungsberechtigten einholen. Wir empfehlen Eltern, ihren Kindern die Nutzung interaktiver Dienste zu gestatten, um mit ihnen über Online-Sicherheit zu diskutieren, da Moderation nicht narrensicher ist. Minderjährige, die interaktive Dienste nutzen, sollten über potenzielle Risiken informiert werden.\n\nIn Fällen, in denen wir einen interaktiven Dienst moderieren, stellen wir Ihnen in der Regel die Möglichkeit zur Verfügung, den Moderator zu kontaktieren, wenn Bedenken oder Schwierigkeiten auftreten.',
      'es':
          'De vez en cuando, podemos ofrecer servicios interactivos en nuestro sitio, como juegos, concursos, comentarios en publicaciones de blogs o publicaciones en nuestras cuentas de redes sociales (denominados servicios interactivos).\n\nSiempre que proporcionemos dichos servicios servicios interactivos, le proporcionaremos información clara sobre el tipo de servicio ofrecido, si está moderado y la forma de moderación empleada (incluso si implica supervisión humana o técnica).\n\nHaremos esfuerzos razonables para evaluar cualquier riesgo potencial para los usuarios (especialmente los niños) que plantean terceros cuando utilizan cualquier servicio interactivo en nuestro sitio. Con base en estas evaluaciones, determinaremos si se justifica la moderación del servicio relevante (y qué tipo de moderación es apropiada). Sin embargo, tenga en cuenta que no estamos obligados a monitorear o moderar ningún servicio interactivo que ofrecemos en nuestro sitio, y renunciamos explícitamente a la responsabilidad por cualquier pérdida o daño resultante del uso por parte de un usuario de cualquier servicio interactivo que viole nuestros estándares de contenido, ya sea o no el servicio está moderado.\n\nLos menores que utilicen cualquiera de nuestros servicios interactivos deben obtener el consentimiento de sus padres o tutores. Aconsejamos a los padres que permitan que sus hijos utilicen servicios interactivos que hablen con ellos sobre la seguridad en línea, ya que la moderación no es infalible. Los menores que utilizan servicios interactivos deben ser informados sobre los riesgos potenciales.\n\nEn los casos en los que moderamos un servicio interactivo, normalmente le proporcionaremos un medio para que usted se comunique con el moderador si surge alguna inquietud o dificultad.',
      'ro':
          'Din când în când, putem oferi servicii interactive pe site-ul nostru, cum ar fi jocuri, competiții, comentarii la postări de blog sau postări în conturile noastre de rețele sociale (denumite servicii interactive).\n\nOricand oferim astfel de servicii interactive, vă vom furniza informații clare cu privire la tipul de serviciu oferit, dacă este moderat și forma de moderare utilizată (inclusiv dacă implică supraveghere umană sau tehnică).\n\nVom depune eforturi rezonabile. pentru a evalua orice riscuri potențiale pentru utilizatori (în special pentru copii) prezentate de terți atunci când folosesc orice serviciu interactiv pe site-ul nostru. Pe baza acestor evaluări, vom determina dacă moderarea serviciului relevant este justificată (și ce tip de moderare este adecvat). Cu toate acestea, vă rugăm să rețineți că nu suntem obligați să monitorizăm sau să moderam niciun serviciu interactiv pe care îl oferim pe site-ul nostru și ne declinăm în mod explicit responsabilitatea pentru orice pierdere sau daune rezultate din utilizarea de către un utilizator a oricărui serviciu interactiv cu încălcarea standardelor noastre de conținut, indiferent dacă sau nu serviciul este moderat.\n\nMinorii care folosesc oricare dintre serviciile noastre interactive trebuie să obțină consimțământul părintelui sau tutorelui lor. Îi sfătuim pe părinți să le permită copiilor să folosească serviciile interactive pentru a discuta despre siguranța online cu ei, deoarece moderarea nu este fără îndoială. Minorii care utilizează servicii interactive ar trebui să fie informați cu privire la riscurile potențiale.\n\nÎn cazurile în care moderam un serviciu interactiv, de obicei vă vom oferi un mijloc de a contacta moderatorul dacă apar nelămuriri sau dificultăți.',
    },
    'ld87v66i': {
      'en': 'Content standards',
      'de': 'Inhaltsstandards',
      'es': 'Estándares de contenido',
      'ro': 'Standarde de conținut',
    },
    'osx0854c': {
      'en':
          'These content standards are applicable to all material contributed to our site (referred to as contributions) and to any associated interactive services. Users must adhere to both the spirit and the letter of the following standards, which apply to each part of any contribution as well as to its entirety.\n\nContributions must:\n- Be accurate when stating facts.\n- Reflect genuinely held opinions.\n- Conform to applicable laws in the UK and in any country from which they are posted.\n\nContributions must not:\n- Contain material that defames any individual.\n- Include material that is obscene, offensive, hateful, or inflammatory.\n- Promote sexually explicit content.\n- Advocate violence.\n- Foster discrimination based on race, sex, religion, nationality, disability, sexual orientation, or age.\n- Infringe upon the copyright, database right, or trademark of any other person.\n- Be likely to deceive any individual.\n- Violate any legal obligation owed to a third party, such as a contractual obligation or duty of confidence.\n- Promote illegal activities.\n- Pose a threat, abuse, or invasion of another\'s privacy, or cause annoyance, inconvenience, or undue anxiety.\n- Harass, upset, embarrass, alarm, or annoy any other individual.\n- Be used to impersonate any person or misrepresent one\'s identity or affiliation with any person.\n- Create the impression that they originate from us, if this is not the case.\n- Advocate, promote, or assist in any unlawful acts, such as copyright infringement or computer misuse.',
      'de':
          'Diese Inhaltsstandards gelten für sämtliches Material, das zu unserer Website beigetragen wird (im Folgenden „Beiträge“ genannt) und für alle damit verbundenen interaktiven Dienste. Benutzer müssen sich sowohl an den Geist als auch an den Buchstaben der folgenden Standards halten, die für jeden Teil eines Beitrags sowie für dessen Gesamtheit gelten.\n\nBeiträge müssen:\n- Seien Sie bei der Angabe von Fakten korrekt.< __FFNL__>- Geben Sie wirklich vertretene Meinungen wieder.\n- Halten Sie sich an die geltenden Gesetze im Vereinigten Königreich und in jedem Land, in dem sie veröffentlicht werden.\n\nBeiträge dürfen nicht:\n- Material enthalten, das eine Person diffamiert. \n- Fügen Sie Material hinzu, das obszön, beleidigend, hasserfüllt oder aufrührerisch ist.\n- Fördern Sie sexuell eindeutige Inhalte.\n- Befürworten Sie Gewalt.\n- Fördern Sie Diskriminierung aufgrund von Rasse, Geschlecht, Religion, Nationalität oder Behinderung , sexuelle Orientierung oder Alter.\n- Das Urheberrecht, das Datenbankrecht oder das Markenrecht einer anderen Person verletzen.\n- Es ist wahrscheinlich, dass jemand eine Person täuscht.\n- Eine rechtliche Verpflichtung gegenüber einem Dritten verletzen B. eine vertragliche Verpflichtung oder eine Geheimhaltungspflicht.\n- Illegale Aktivitäten fördern.\n- Eine Bedrohung, einen Missbrauch oder einen Eingriff in die Privatsphäre eines anderen darstellen oder Ärger, Unannehmlichkeiten oder unangemessene Besorgnis erregen.\n- Belästigen andere Personen verärgern, in Verlegenheit bringen, beunruhigen oder verärgern.\n- Werden verwendet, um sich als eine andere Person auszugeben oder die eigene Identität oder Zugehörigkeit zu einer anderen Person falsch darzustellen.\n- Den Eindruck erwecken, dass sie von uns stammen, wenn dies nicht der Fall ist der Fall.\n- Befürworten, fördern oder unterstützen Sie rechtswidrige Handlungen wie Urheberrechtsverletzungen oder Computermissbrauch.',
      'es':
          'Estos estándares de contenido son aplicables a todo el material aportado a nuestro sitio (denominado contribuciones) y a cualquier servicio interactivo asociado. Los usuarios deben cumplir tanto con el espíritu como con la letra de los siguientes estándares, que se aplican a cada parte de cualquier contribución así como a su totalidad.\n\nLas contribuciones deben:\n- Ser precisos al exponer los hechos.< __FFNL__>- Reflejar opiniones genuinas.\n- Cumplir con las leyes aplicables en el Reino Unido y en cualquier país desde el que se publiquen.\n\nLas contribuciones no deben:\n- Contener material que difame a cualquier individuo. \n- Incluir material que sea obsceno, ofensivo, odioso o incendiario.\n- Promover contenido sexualmente explícito.\n- Abogar por la violencia.\n- Fomentar la discriminación basada en raza, sexo, religión, nacionalidad, discapacidad , orientación sexual o edad.\n- Infringir los derechos de autor, derechos de bases de datos o marcas registradas de cualquier otra persona.\n- Ser susceptible de engañar a cualquier individuo.\n- Violar cualquier obligación legal contraída con un tercero , como una obligación contractual o un deber de confianza.\n- Promover actividades ilegales.\n- Representar una amenaza, abuso o invasión de la privacidad de otra persona, o causar molestia, inconveniente o ansiedad indebida.\n- Acosar , molestar, avergonzar, alarmar o molestar a cualquier otro individuo.\n- Ser utilizado para hacerse pasar por cualquier persona o tergiversar la identidad o afiliación con cualquier persona.\n- Crear la impresión de que se originan en nosotros, si no es así. del caso.\n- Defender, promover o ayudar en cualquier acto ilegal, como la infracción de derechos de autor o el uso indebido de la computadora.',
      'ro':
          'Aceste standarde de conținut sunt aplicabile tuturor materialelor contribuite la site-ul nostru (denumite contribuții) și oricăror servicii interactive asociate. Utilizatorii trebuie să respecte atât spiritul, cât și litera următoarelor standarde, care se aplică fiecărei părți a oricărei contribuții, precum și întregii acesteia. __FFNL__>- Reflectă opiniile cu adevărat susținute.\n- Conform legilor aplicabile din Marea Britanie și din orice țară din care sunt postate.\n\nContribuțiile nu trebuie:\n- Conțin materiale care defăimează orice persoană. \n- Includeți materiale obscene, ofensatoare, instigatoare de ură sau inflamatoare.\n- Promovați conținut sexual explicit.\n- Susțineți violența.\n- Promovați discriminarea pe criterii de rasă, sex, religie, naționalitate, dizabilități , orientare sexuală sau vârstă.\n- Încălcarea dreptului de autor, a dreptului de bază de date sau a mărcii comerciale ale oricărei alte persoane.\n- Este posibil să înșele orice persoană.\n- Încălcarea oricărei obligații legale datorate unei terțe părți. , cum ar fi o obligație contractuală sau o obligație de încredere.\n- Promovați activități ilegale.\n- Reprezentați o amenințare, un abuz sau o invazie a vieții private a altuia sau provocați enervare, neplăceri sau anxietate nejustificată.\n- Hărțuire , supără, jenează, alarmează sau enervează orice alt individ.\n- Să fie folosit pentru a uzurpa identitatea oricărei persoane sau pentru a-și denatura identitatea sau afilierea cu orice persoană.\n- Creați impresia că provin de la noi, dacă aceasta nu este cazul.\n- Avocați, promovați sau ajutați în orice acțiuni ilegale, cum ar fi încălcarea drepturilor de autor sau utilizarea abuzivă a computerului.',
    },
    'jb2ey3cj': {
      'en': 'Changes to the acceptable use policy',
      'de': 'Änderungen an der Richtlinie zur akzeptablen Nutzung',
      'es': 'Cambios a la política de uso aceptable',
      'ro': 'Modificări ale politicii de utilizare acceptabilă',
    },
    'owohdtb5': {
      'en':
          'We reserve the right to revise this acceptable use policy at any time by making amendments to this page. It is your responsibility to periodically review this page to stay informed about any changes we make, as they are legally binding upon you. Additionally, certain provisions within this acceptable use policy may be overridden by provisions or notices published elsewhere on our site.',
      'de':
          'Wir behalten uns das Recht vor, diese Richtlinie zur akzeptablen Nutzung jederzeit zu überarbeiten, indem wir Änderungen an dieser Seite vornehmen. Es liegt in Ihrer Verantwortung, diese Seite regelmäßig zu überprüfen, um über alle von uns vorgenommenen Änderungen auf dem Laufenden zu bleiben, da diese für Sie rechtsverbindlich sind. Darüber hinaus können bestimmte Bestimmungen dieser Richtlinie zur akzeptablen Nutzung durch Bestimmungen oder Hinweise, die an anderer Stelle auf unserer Website veröffentlicht werden, außer Kraft gesetzt werden.',
      'es':
          'Nos reservamos el derecho de revisar esta política de uso aceptable en cualquier momento realizando modificaciones en esta página. Es su responsabilidad revisar periódicamente esta página para mantenerse informado sobre cualquier cambio que realicemos, ya que son legalmente vinculantes para usted. Además, ciertas disposiciones dentro de esta política de uso aceptable pueden ser anuladas por disposiciones o avisos publicados en otras partes de nuestro sitio.',
      'ro':
          'Ne rezervăm dreptul de a revizui această politică de utilizare acceptabilă în orice moment, făcând modificări acestei pagini. Este responsabilitatea dumneavoastră să revizuiți periodic această pagină pentru a rămâne informat cu privire la orice modificări pe care le facem, deoarece acestea sunt obligatorii din punct de vedere legal pentru dvs. În plus, anumite prevederi din această politică de utilizare acceptabilă pot fi înlocuite de prevederi sau notificări publicate în altă parte pe site-ul nostru.',
    },
    'zt589lvb': {
      'en':
          'If you opt to adjust your preferences later during your browsing session, you can do so by clearing cookies and reloading the page. This action will prompt the consent notice to reappear, allowing you to customize your preferences or withdraw your consent entirely.\n\nMoreover, various browsers offer distinct methods to block and delete cookies utilized by websites. You can modify your browser settings to block or delete cookies. For further information on managing and deleting cookies, you can visit wikipedia.org or www.allaboutcookies.org.',
      'de':
          'Wenn Sie Ihre Einstellungen später während Ihrer Browsersitzung anpassen möchten, können Sie dies tun, indem Sie Cookies löschen und die Seite neu laden. Durch diese Aktion wird die Einwilligungserklärung erneut angezeigt, sodass Sie Ihre Einstellungen anpassen oder Ihre Einwilligung vollständig widerrufen können.\n\nDarüber hinaus bieten verschiedene Browser unterschiedliche Methoden zum Blockieren und Löschen von von Websites verwendeten Cookies. Sie können Ihre Browsereinstellungen ändern, um Cookies zu blockieren oder zu löschen. Weitere Informationen zum Verwalten und Löschen von Cookies finden Sie auf wikipedia.org oder www.allaboutcookies.org.',
      'es':
          'Si opta por ajustar sus preferencias más adelante durante su sesión de navegación, puede hacerlo borrando las cookies y recargando la página. Esta acción hará que vuelva a aparecer el aviso de consentimiento, lo que le permitirá personalizar sus preferencias o retirar su consentimiento por completo.\n\nAdemás, varios navegadores ofrecen distintos métodos para bloquear y eliminar las cookies utilizadas por los sitios web. Puede modificar la configuración de su navegador para bloquear o eliminar las cookies. Para obtener más información sobre cómo administrar y eliminar cookies, puede visitar wikipedia.org o www.allaboutcookies.org.',
      'ro':
          'Dacă alegeți să vă ajustați preferințele mai târziu în timpul sesiunii de navigare, puteți face acest lucru ștergând cookie-urile și reîncărcând pagina. Această acțiune va face ca notificarea de consimțământ să reapară, permițându-vă să vă personalizați preferințele sau să vă retrageți în totalitate consimțământul.\n\n În plus, diferite browsere oferă metode distincte de blocare și ștergere a cookie-urilor utilizate de site-uri web. Puteți modifica setările browserului pentru a bloca sau șterge cookie-urile. Pentru mai multe informații despre gestionarea și ștergerea cookie-urilor, puteți vizita wikipedia.org sau www.allaboutcookies.org.',
    },
    'ebcbrrpf': {
      'en': 'Home',
      'de': 'Heim',
      'es': 'Hogar',
      'ro': 'Acasă',
    },
  },
  // WebsiteTermsofUse
  {
    'utvwr4pw': {
      'en': 'Website Terms of Use',
      'de': 'Nutzungsbedingungen der Website',
      'es': 'Términos de uso del sitio web',
      'ro': 'Termenii de utilizare a site-ului',
    },
    'u4xm8wir': {
      'en': 'Website Terms of Use',
      'de': 'Nutzungsbedingungen der Website',
      'es': 'Términos de uso del sitio web',
      'ro': 'Termenii de utilizare a site-ului',
    },
    'jb9ru0fe': {
      'en':
          'Please  Read These Terms And Conditions Carefully Before Using Our Site',
      'de':
          'Bitte lesen Sie diese Allgemeinen Geschäftsbedingungen sorgfältig durch, bevor Sie unsere Website nutzen',
      'es':
          'Lea atentamente estos términos y condiciones antes de utilizar nuestro sitio',
      'ro':
          'Vă rugăm să citiți cu atenție acești termeni și condiții înainte de a utiliza site-ul nostru',
    },
    '6294ja2r': {
      'en':
          'These terms outline the regulations governing the use of our website.',
      'de':
          'Diese Bedingungen beschreiben die Regeln für die Nutzung unserer Website.',
      'es':
          'Estos términos describen las regulaciones que rigen el uso de nuestro sitio web.',
      'ro':
          'Acești termeni descriu reglementările care guvernează utilizarea site-ului nostru web.',
    },
    'k02rd0d6': {
      'en': 'www.bountyfever.com\n',
      'de': 'www.bountyfever.com',
      'es': 'www.bountyfever.com',
      'ro': 'www.bountyfever.com',
    },
    'tyqr88yl': {
      'en': 'contact@bluedash.co.uk',
      'de': 'contact@bluedash.co.uk',
      'es': 'contacto@bluedash.co.uk',
      'ro': 'contact@bluedash.co.uk',
    },
    'r3mdsmvn': {
      'en':
          '\nThis Cookie Policy elucidates the nature of cookies, their utilization, the varieties employed, the data they gather, and its application, as well as how to manage cookie preferences. For additional details on the handling, storage, and security of your personal information, please refer to our Privacy Policy.\nYou have the option to modify or retract your consent regarding the Cookie Declaration on our website at any given time. Additionally, you can access further insights into our identity, contact methods, and personal data processing in our Privacy Policy.\nYour consent pertains to the following domains: bountyfever.com',
      'de':
          'Diese Cookie-Richtlinie erläutert die Art von Cookies, ihre Verwendung, die verwendeten Sorten, die von ihnen erfassten Daten und ihre Anwendung sowie die Verwaltung der Cookie-Einstellungen. Weitere Einzelheiten zur Handhabung, Speicherung und Sicherheit Ihrer personenbezogenen Daten finden Sie in unserer Datenschutzerklärung.\nSie haben jederzeit die Möglichkeit, Ihre Einwilligung zur Cookie-Erklärung auf unserer Website zu ändern oder zu widerrufen. Darüber hinaus können Sie in unserer Datenschutzrichtlinie auf weitere Einblicke in unsere Identität, Kontaktmethoden und Verarbeitung personenbezogener Daten zugreifen.\nIhre Einwilligung gilt für die folgenden Domains: bountyfever.com',
      'es':
          'Esta Política de Cookies aclara la naturaleza de las cookies, su utilización, las variedades empleadas, los datos que recopilan y su aplicación, así como cómo gestionar las preferencias de cookies. Para obtener detalles adicionales sobre el manejo, almacenamiento y seguridad de su información personal, consulte nuestra Política de Privacidad.\nTiene la opción de modificar o retirar su consentimiento con respecto a la Declaración de Cookies en nuestro sitio web en cualquier momento. Además, puede acceder a más información sobre nuestra identidad, métodos de contacto y procesamiento de datos personales en nuestra Política de Privacidad.\nSu consentimiento se refiere a los siguientes dominios: bountyfever.com',
      'ro':
          'Această Politică privind cookie-urile elucidează natura cookie-urilor, utilizarea lor, varietățile utilizate, datele pe care le adună și aplicarea acesteia, precum și modul de gestionare a preferințelor cookie. Pentru detalii suplimentare despre manipularea, stocarea și securitatea informațiilor dvs. personale, vă rugăm să consultați Politica noastră de confidențialitate.\nAveți opțiunea de a modifica sau de a vă retrage consimțământul cu privire la Declarația privind cookie-urile de pe site-ul nostru web în orice moment. În plus, puteți accesa informații suplimentare despre identitatea noastră, metodele de contact și prelucrarea datelor cu caracter personal în Politica noastră de confidențialitate.\nConsimțământul dvs. se referă la următoarele domenii: bountyfever.com',
    },
    'e2t7hggs': {
      'en': 'Who we are and how to contact us',
      'de': 'Wer wir sind und wie Sie uns kontaktieren können',
      'es': 'Quiénes somos y cómo contactarnos',
      'ro': 'Cine suntem și cum să ne contactați',
    },
    'bn41io49': {
      'en':
          'Our website is managed and operated by BlueDash Limited (“We”), a registered company in England and Wales under company number 15584865. Our registered office is located at DNS House, 382 Kenton Road, Harrow, Greater London, England HA3 8DP.\n We operate as a limited company.',
      'de':
          'Unsere Website wird von BlueDash Limited („Wir“) verwaltet und betrieben, einem in England und Wales unter der Firmennummer 15584865 eingetragenen Unternehmen. Unser eingetragener Firmensitz befindet sich im DNS House, 382 Kenton Road, Harrow, Greater London, England HA3 8DP.  Wir agieren als Gesellschaft mit beschränkter Haftung.',
      'es':
          'Nuestro sitio web es administrado y operado por BlueDash Limited (“Nosotros”), una empresa registrada en Inglaterra y Gales con el número de empresa 15584865. Nuestro domicilio social se encuentra en DNS House, 382 Kenton Road, Harrow, Greater London, England HA3 8DP.  Operamos como una sociedad limitada.',
      'ro':
          'Site-ul nostru web este administrat și operat de BlueDash Limited („Noi”), o companie înregistrată în Anglia și Țara Galilor cu numărul companiei 15584865. Sediul nostru social este situat la DNS House, 382 Kenton Road, Harrow, Greater London, England HA3 8DP.  Operăm ca societate cu răspundere limitată.',
    },
    'iygug0k2': {
      'en':
          'You are permitted to use our site solely for lawful purposes. You must refrain from using our site:\n\n- In any manner that violates any applicable local, national, or international laws or regulations.\n- In any manner that is unlawful or fraudulent, or serves any unlawful or fraudulent intent.\n- With the intention of causing harm or attempting to harm minors in any way.\n- To send, knowingly receive, upload, download, use, or re-use any material that does not adhere to our content standards as outlined below.\n- To transmit, or solicit the transmission of, any unsolicited or unauthorized advertising, promotional material, or any other form of similar solicitation (spam).\n- To knowingly transmit any data, send or upload any material containing viruses, Trojan horses, worms, time-bombs, keystroke loggers, spyware, adware, or any other harmful programs or similar computer code designed to adversely affect the operation of any computer software or hardware.\n\nAdditionally, you agree:\n\n- Not to reproduce, duplicate, copy, or resell any part of our site in violation of the provisions of our ',
      'de':
          'Es ist Ihnen gestattet, unsere Website ausschließlich für rechtmäßige Zwecke zu nutzen. Sie dürfen unsere Website nicht nutzen:\n\n- In jeglicher Weise, die gegen geltende lokale, nationale oder internationale Gesetze oder Vorschriften verstößt.\n- In jeglicher Weise, die rechtswidrig oder betrügerisch ist oder einer rechtswidrigen oder rechtswidrigen Art dient betrügerische Absicht.\n- Mit der Absicht, Minderjährigen Schaden zuzufügen oder zu versuchen, Minderjährigen in irgendeiner Weise zu schaden.\n- Zum Senden, wissentlichen Empfangen, Hochladen, Herunterladen, Verwenden oder Wiederverwenden von Material, das nicht unseren Bestimmungen entspricht Inhaltsstandards wie unten beschrieben.\n- Um unaufgeforderte oder unbefugte Werbung, Verkaufsförderungsmaterial oder jede andere Form ähnlicher Werbung (Spam) zu übermitteln oder deren Übertragung anzufordern.\n- Um wissentlich Daten zu übermitteln, senden Sie oder Material hochzuladen, das Viren, Trojaner, Würmer, Zeitbomben, Tastenanschlag-Logger, Spyware, Adware oder andere schädliche Programme oder ähnlichen Computercode enthält, der den Betrieb von Computersoftware oder -hardware beeinträchtigen soll.\n<__FFNL__ >Darüber hinaus erklären Sie sich damit einverstanden:\n\n- Keinen Teil unserer Website unter Verletzung unserer Bestimmungen zu reproduzieren, zu duplizieren, zu kopieren oder weiterzuverkaufen',
      'es':
          'Se le permite utilizar nuestro sitio únicamente para fines legales. Debe abstenerse de utilizar nuestro sitio:\n\n- De cualquier manera que viole cualquier ley o reglamento local, nacional o internacional aplicable.\n- De cualquier manera que sea ilegal o fraudulenta, o que sirva para cualquier uso ilegal o intención fraudulenta.\n- Con la intención de causar daño o intentar dañar a menores de cualquier manera.\n- Para enviar, recibir, cargar, descargar, usar o reutilizar a sabiendas cualquier material que no se adhiera a nuestras estándares de contenido como se describe a continuación.\n- Para transmitir o solicitar la transmisión de cualquier publicidad no solicitada o no autorizada, material promocional o cualquier otra forma de solicitud similar (spam).\n- Para transmitir conscientemente cualquier dato, envíe ni cargar ningún material que contenga virus, caballos de Troya, gusanos, bombas de tiempo, registradores de pulsaciones de teclas, spyware, adware o cualquier otro programa dañino o código informático similar diseñado para afectar negativamente el funcionamiento de cualquier software o hardware informático.\n<__FFNL__ >Adicionalmente, usted acepta:\n\n- No reproducir, duplicar, copiar o revender ninguna parte de nuestro sitio en violación de las disposiciones de nuestra',
      'ro':
          'Vi se permite să utilizați site-ul nostru exclusiv în scopuri legale. Trebuie să vă abțineți de la a utiliza site-ul nostru:\n\n- În orice mod care încalcă orice lege sau reglementări locale, naționale sau internaționale aplicabile.\n- În orice mod care este ilegal sau fraudulos, sau servește oricărui intenție frauduloasă.\n- Cu intenția de a provoca prejudicii sau de a încerca să rănească minori în orice fel.\n- Pentru a trimite, primi, încărca, descărca, utiliza sau reutiliza orice material care nu aderă la dispozițiile noastre. standardele de conținut, așa cum sunt prezentate mai jos.\n- Pentru a transmite sau solicita transmiterea oricărei reclame nesolicitate sau neautorizate, materiale promoționale sau orice altă formă de solicitare similară (spam).\n- Pentru a transmite cu bună știință orice date, trimiteți sau încărcați orice material care conține viruși, cai troieni, viermi, bombe cu ceas, înregistrări de taste, spyware, adware sau orice alte programe dăunătoare sau cod de computer similar conceput pentru a afecta negativ funcționarea oricărui software sau hardware de computer.\n<__FFNL__ >În plus, sunteți de acord cu:\n\n- să nu reproduceți, duplicați, copiați sau revindeți nicio parte a site-ului nostru, încălcând prevederile noastre',
    },
    '8wvvspku': {
      'en': 'By using our site you accept these terms',
      'de':
          'Durch die Nutzung unserer Website akzeptieren Sie diese Bedingungen',
      'es': 'Al utilizar nuestro sitio usted acepta estos términos',
      'ro': 'Prin utilizarea site-ului nostru acceptați acești termeni',
    },
    'kd6l0ayw': {
      'en':
          'By accessing and using our website, you acknowledge that you have read, understood, and agree to abide by these terms of use.\n If you do not agree to these terms, please refrain from using our site. We advise you to retain a copy of these terms for your records.',
      'de':
          'Durch den Zugriff auf und die Nutzung unserer Website bestätigen Sie, dass Sie diese Nutzungsbedingungen gelesen und verstanden haben und sich damit einverstanden erklären, sie einzuhalten.\n Wenn Sie mit diesen Bedingungen nicht einverstanden sind, sehen Sie bitte von der Nutzung unserer Website ab. Wir empfehlen Ihnen, eine Kopie dieser Bedingungen für Ihre Unterlagen aufzubewahren.',
      'es':
          'Al acceder y utilizar nuestro sitio web, usted reconoce que ha leído, comprendido y aceptado cumplir con estos términos de uso.\n Si no está de acuerdo con estos términos, absténgase de utilizar nuestro sitio. Le recomendamos que conserve una copia de estos términos para sus registros.',
      'ro':
          'Prin accesarea și utilizarea site-ului nostru web, confirmați că ați citit, înțeles și sunteți de acord să respectați acești termeni de utilizare.\n Dacă nu sunteți de acord cu acești termeni, vă rugăm să vă abțineți de la utilizarea site-ului nostru. Vă sfătuim să păstrați o copie a acestor termeni pentru evidențele dvs.',
    },
    'eqt2h99q': {
      'en': 'These are other terms that may apply to you',
      'de':
          'Dies sind andere Bedingungen, die möglicherweise auf Sie zutreffen',
      'es': 'Estos son otros términos que pueden aplicarse a usted.',
      'ro': 'Aceștia sunt alți termeni care vi se pot aplica',
    },
    '6kquxssf': {
      'en':
          'These terms of use incorporate the following additional terms, which govern your use of our site:\n\n- Our ',
      'de':
          'Diese Nutzungsbedingungen umfassen die folgenden zusätzlichen Bedingungen, die Ihre Nutzung unserer Website regeln:\n\n- Unsere',
      'es':
          'Estos términos de uso incorporan los siguientes términos adicionales, que rigen el uso de nuestro sitio:\n\n- Nuestro',
      'ro':
          'Acești termeni de utilizare includ următorii termeni suplimentari, care guvernează utilizarea site-ului nostru:\n\n- Nostru',
    },
    '16wvj16u': {
      'en': 'Privacy Policy',
      'de': 'Datenschutzrichtlinie',
      'es': 'política de privacidad',
      'ro': 'Politica de confidențialitate',
    },
    '32vcycw0': {
      'en':
          ': This outlines how we handle the personal data we collect from you or that you provide to us. By using our site, you consent to this processing and confirm the accuracy of all data you provide.\n  \n- Our ',
      'de':
          ': Hier wird dargelegt, wie wir mit den personenbezogenen Daten umgehen, die wir von Ihnen erfassen oder die Sie uns zur Verfügung stellen. Durch die Nutzung unserer Website stimmen Sie dieser Verarbeitung zu und bestätigen die Richtigkeit aller von Ihnen angegebenen Daten.\n \n- Unser',
      'es':
          ': Esto describe cómo manejamos los datos personales que recopilamos de usted o que usted nos proporciona. Al utilizar nuestro sitio, usted acepta este procesamiento y confirma la exactitud de todos los datos que proporciona.\n \n- Nuestro',
      'ro':
          ': Aceasta prezintă modul în care gestionăm datele personale pe care le colectăm de la dumneavoastră sau pe care ni le furnizați. Prin utilizarea site-ului nostru, sunteți de acord cu această prelucrare și confirmați acuratețea tuturor datelor pe care le furnizați.\n \n- Nostru',
    },
    'ui2r5mwx': {
      'en': 'Acceptable Use Policy',
      'de': 'Richtlinien zur akzeptablen Nutzung',
      'es': 'Política de uso aceptable',
      'ro': 'Politica de utilizare acceptabilă',
    },
    'w8i7x3ua': {
      'en':
          ': This specifies the permitted and prohibited uses of our site. Your use of our site must adhere to this policy.\n\nIf you make purchases, engage in promotions, or enter competitions on our site, separate terms and conditions will apply, which you must accept and adhere to.',
      'de':
          ': Dies legt die erlaubten und verbotenen Nutzungen unserer Website fest. Ihre Nutzung unserer Website muss dieser Richtlinie entsprechen.\n\nWenn Sie auf unserer Website Einkäufe tätigen, an Werbeaktionen teilnehmen oder an Wettbewerben teilnehmen, gelten gesonderte Geschäftsbedingungen, die Sie akzeptieren und einhalten müssen.',
      'es':
          ': Aquí se especifican los usos permitidos y prohibidos de nuestro sitio. Su uso de nuestro sitio debe cumplir con esta política.\n\nSi realiza compras, participa en promociones o participa en concursos en nuestro sitio, se aplicarán términos y condiciones separados, que debe aceptar y cumplir.',
      'ro':
          ': Aceasta specifică utilizările permise și interzise ale site-ului nostru. Utilizarea site-ului nostru trebuie să respecte această politică.\n\nDacă faceți achiziții, vă implicați în promoții sau intrați în competiții pe site-ul nostru, se vor aplica termeni și condiții separate, pe care trebuie să le acceptați și să le respectați.',
    },
    'qzo5oex0': {
      'en':
          'These terms of use incorporate the following additional terms, which govern your use of our site:\n\n- Our Privacy Policy: This outlines how we handle the personal data we collect from you or that you provide to us. By using our site, you consent to this processing and confirm the accuracy of all data you provide.\n  \n- Our Acceptable Use Policy: This specifies the permitted and prohibited uses of our site. Your use of our site must adhere to this policy.\n\nIf you make purchases, engage in promotions, or enter competitions on our site, separate terms and conditions will apply, which you must accept and adhere to.',
      'de':
          'Diese Nutzungsbedingungen umfassen die folgenden zusätzlichen Bedingungen, die Ihre Nutzung unserer Website regeln:\n\n- Unsere Datenschutzrichtlinie: Hier wird dargelegt, wie wir mit den personenbezogenen Daten umgehen, die wir von Ihnen erfassen oder die Sie uns zur Verfügung stellen. Durch die Nutzung unserer Website stimmen Sie dieser Verarbeitung zu und bestätigen die Richtigkeit aller von Ihnen bereitgestellten Daten.\n \n- Unsere Richtlinien zur akzeptablen Nutzung: Diese legen die zulässigen und verbotenen Nutzungen unserer Website fest. Ihre Nutzung unserer Website muss dieser Richtlinie entsprechen.\n\nWenn Sie auf unserer Website Einkäufe tätigen, an Werbeaktionen teilnehmen oder an Wettbewerben teilnehmen, gelten gesonderte Geschäftsbedingungen, die Sie akzeptieren und einhalten müssen.',
      'es':
          'Estos términos de uso incorporan los siguientes términos adicionales, que rigen el uso de nuestro sitio:\n\n- Nuestra política de privacidad: describe cómo manejamos los datos personales que recopilamos de usted o que usted nos proporciona. Al utilizar nuestro sitio, usted acepta este procesamiento y confirma la exactitud de todos los datos que proporciona.\n \n- Nuestra Política de uso aceptable: especifica los usos permitidos y prohibidos de nuestro sitio. Su uso de nuestro sitio debe cumplir con esta política.\n\nSi realiza compras, participa en promociones o participa en concursos en nuestro sitio, se aplicarán términos y condiciones separados, que debe aceptar y cumplir.',
      'ro':
          'Acești termeni de utilizare încorporează următorii termeni suplimentari, care guvernează utilizarea de către dvs. a site-ului nostru:\n\n- Politica noastră de confidențialitate: Aceasta prezintă modul în care gestionăm datele personale pe care le colectăm de la dumneavoastră sau pe care ni le furnizați. Folosind site-ul nostru, sunteți de acord cu această prelucrare și confirmați acuratețea tuturor datelor pe care le furnizați.\n \n- Politica noastră de utilizare acceptabilă: Aceasta specifică utilizările permise și interzise ale site-ului nostru. Utilizarea site-ului nostru trebuie să respecte această politică.\n\nDacă faceți achiziții, vă implicați în promoții sau intrați în competiții pe site-ul nostru, se vor aplica termeni și condiții separate, pe care trebuie să le acceptați și să le respectați.',
    },
    'fshzptl3': {
      'en': 'We reserve the right to amend these terms at any time',
      'de':
          'Wir behalten uns das Recht vor, diese Bedingungen jederzeit zu ändern',
      'es':
          'Nos reservamos el derecho de modificar estos términos en cualquier momento.',
      'ro': 'Ne rezervăm dreptul de a modifica acești termeni în orice moment',
    },
    'bze940pt': {
      'en':
          'We reserve the right to make changes to these terms periodically. It is your responsibility to review these terms each time you access our site to ensure that you understand and agree to the current terms in effect.',
      'de':
          'Wir behalten uns das Recht vor, diese Bedingungen in regelmäßigen Abständen zu ändern. Es liegt in Ihrer Verantwortung, diese Bedingungen bei jedem Zugriff auf unsere Website zu überprüfen, um sicherzustellen, dass Sie die aktuell geltenden Bedingungen verstehen und ihnen zustimmen.',
      'es':
          'Nos reservamos el derecho de realizar cambios a estos términos periódicamente. Es su responsabilidad revisar estos términos cada vez que acceda a nuestro sitio para asegurarse de que comprende y acepta los términos vigentes.',
      'ro':
          'Ne rezervăm dreptul de a face modificări periodice la acești termeni. Este responsabilitatea dumneavoastră să revizuiți acești termeni de fiecare dată când accesați site-ul nostru pentru a vă asigura că înțelegeți și sunteți de acord cu termenii actuali în vigoare.',
    },
    '6nyj8xg6': {
      'en':
          'If you opt to adjust your preferences later during your browsing session, you can do so by clearing cookies and reloading the page. This action will prompt the consent notice to reappear, allowing you to customize your preferences or withdraw your consent entirely.\n\nMoreover, various browsers offer distinct methods to block and delete cookies utilized by websites. You can modify your browser settings to block or delete cookies. For further information on managing and deleting cookies, you can visit wikipedia.org or www.allaboutcookies.org.',
      'de':
          'Wenn Sie Ihre Einstellungen später während Ihrer Browsersitzung anpassen möchten, können Sie dies tun, indem Sie Cookies löschen und die Seite neu laden. Durch diese Aktion wird die Einwilligungserklärung erneut angezeigt, sodass Sie Ihre Einstellungen anpassen oder Ihre Einwilligung vollständig widerrufen können.\n\nDarüber hinaus bieten verschiedene Browser unterschiedliche Methoden zum Blockieren und Löschen von von Websites verwendeten Cookies. Sie können Ihre Browsereinstellungen ändern, um Cookies zu blockieren oder zu löschen. Weitere Informationen zum Verwalten und Löschen von Cookies finden Sie auf wikipedia.org oder www.allaboutcookies.org.',
      'es':
          'Si opta por ajustar sus preferencias más adelante durante su sesión de navegación, puede hacerlo borrando las cookies y recargando la página. Esta acción hará que vuelva a aparecer el aviso de consentimiento, lo que le permitirá personalizar sus preferencias o retirar su consentimiento por completo.\n\nAdemás, varios navegadores ofrecen distintos métodos para bloquear y eliminar las cookies utilizadas por los sitios web. Puede modificar la configuración de su navegador para bloquear o eliminar las cookies. Para obtener más información sobre cómo administrar y eliminar cookies, puede visitar wikipedia.org o www.allaboutcookies.org.',
      'ro':
          'Dacă alegeți să vă ajustați preferințele mai târziu în timpul sesiunii de navigare, puteți face acest lucru ștergând cookie-urile și reîncărcând pagina. Această acțiune va face ca notificarea de consimțământ să reapară, permițându-vă să vă personalizați preferințele sau să vă retrageți în totalitate consimțământul.\n\n În plus, diferite browsere oferă metode distincte de blocare și ștergere a cookie-urilor utilizate de site-uri web. Puteți modifica setările browserului pentru a bloca sau șterge cookie-urile. Pentru mai multe informații despre gestionarea și ștergerea cookie-urilor, puteți vizita wikipedia.org sau www.allaboutcookies.org.',
    },
    'w35a8uui': {
      'en': 'We reserve the right to make changes to our site',
      'de':
          'Wir behalten uns das Recht vor, Änderungen an unserer Website vorzunehmen',
      'es': 'Nos reservamos el derecho de realizar cambios en nuestro sitio.',
      'ro': 'Ne rezervăm dreptul de a face modificări site-ului nostru',
    },
    '5khckojh': {
      'en':
          'We may periodically update and modify our site to align with changes in our products, services, user requirements, and business objectives.',
      'de':
          'Wir können unsere Website regelmäßig aktualisieren und ändern, um sie an Änderungen unserer Produkte, Dienstleistungen, Benutzeranforderungen und Geschäftsziele anzupassen.',
      'es':
          'Podemos actualizar y modificar periódicamente nuestro sitio para alinearlo con los cambios en nuestros productos, servicios, requisitos de los usuarios y objetivos comerciales.',
      'ro':
          'Putem actualiza și modifica periodic site-ul nostru pentru a se alinia cu modificările produselor, serviciilor, cerințelor utilizatorilor și obiectivelor noastre de afaceri.',
    },
    'jnp1zwpy': {
      'en':
          'If you opt to adjust your preferences later during your browsing session, you can do so by clearing cookies and reloading the page. This action will prompt the consent notice to reappear, allowing you to customize your preferences or withdraw your consent entirely.\n\nMoreover, various browsers offer distinct methods to block and delete cookies utilized by websites. You can modify your browser settings to block or delete cookies. For further information on managing and deleting cookies, you can visit wikipedia.org or www.allaboutcookies.org.',
      'de':
          'Wenn Sie Ihre Einstellungen später während Ihrer Browsersitzung anpassen möchten, können Sie dies tun, indem Sie Cookies löschen und die Seite neu laden. Durch diese Aktion wird die Einwilligungserklärung erneut angezeigt, sodass Sie Ihre Einstellungen anpassen oder Ihre Einwilligung vollständig widerrufen können.\n\nDarüber hinaus bieten verschiedene Browser unterschiedliche Methoden zum Blockieren und Löschen von von Websites verwendeten Cookies. Sie können Ihre Browsereinstellungen ändern, um Cookies zu blockieren oder zu löschen. Weitere Informationen zum Verwalten und Löschen von Cookies finden Sie auf wikipedia.org oder www.allaboutcookies.org.',
      'es':
          'Si opta por ajustar sus preferencias más adelante durante su sesión de navegación, puede hacerlo borrando las cookies y recargando la página. Esta acción hará que vuelva a aparecer el aviso de consentimiento, lo que le permitirá personalizar sus preferencias o retirar su consentimiento por completo.\n\nAdemás, varios navegadores ofrecen distintos métodos para bloquear y eliminar las cookies utilizadas por los sitios web. Puede modificar la configuración de su navegador para bloquear o eliminar las cookies. Para obtener más información sobre cómo administrar y eliminar cookies, puede visitar wikipedia.org o www.allaboutcookies.org.',
      'ro':
          'Dacă alegeți să vă ajustați preferințele mai târziu în timpul sesiunii de navigare, puteți face acest lucru ștergând cookie-urile și reîncărcând pagina. Această acțiune va face ca notificarea de consimțământ să reapară, permițându-vă să vă personalizați preferințele sau să vă retrageți în totalitate consimțământul.\n\n În plus, diferite browsere oferă metode distincte de blocare și ștergere a cookie-urilor utilizate de site-uri web. Puteți modifica setările browserului pentru a bloca sau șterge cookie-urile. Pentru mai multe informații despre gestionarea și ștergerea cookie-urilor, puteți vizita wikipedia.org sau www.allaboutcookies.org.',
    },
    'qvp6kpgp': {
      'en': 'We reserve the right to suspend or withdraw our site',
      'de':
          'Wir behalten uns das Recht vor, unsere Website zu sperren oder zurückzuziehen',
      'es': 'Nos reservamos el derecho de suspender o retirar nuestro sitio.',
      'ro': 'Ne rezervăm dreptul de a suspenda sau retrage site-ul nostru',
    },
    '31nxgsok': {
      'en':
          'Our site is provided free of charge, although there may be fees associated with entering our competitions.\n\nWhile we strive to maintain uninterrupted access to our site, we cannot guarantee its availability at all times. We may suspend, withdraw, or restrict access to all or part of our site for business or operational reasons. We will make reasonable efforts to provide advance notice of any such actions.\n\nYou are responsible for ensuring that anyone accessing our site through your internet connection is aware of and complies with these terms of use and any other applicable terms and conditions.',
      'de':
          'Unsere Website wird kostenlos zur Verfügung gestellt, obwohl für die Teilnahme an unseren Wettbewerben möglicherweise Gebühren anfallen.\n\nObwohl wir uns bemühen, einen ununterbrochenen Zugriff auf unsere Website aufrechtzuerhalten, können wir deren Verfügbarkeit nicht jederzeit garantieren. Aus geschäftlichen oder betrieblichen Gründen können wir den Zugriff auf unsere Website ganz oder teilweise sperren, zurückziehen oder einschränken. Wir werden angemessene Anstrengungen unternehmen, um Sie über solche Maßnahmen im Voraus zu informieren.\n\nSie sind dafür verantwortlich, sicherzustellen, dass jeder, der über Ihre Internetverbindung auf unsere Website zugreift, diese Nutzungsbedingungen und alle anderen anwendbaren Bedingungen kennt und einhält Bedingungen.',
      'es':
          'Nuestro sitio se proporciona de forma gratuita, aunque puede haber tarifas asociadas con la participación en nuestros concursos.\n\nSi bien nos esforzamos por mantener el acceso ininterrumpido a nuestro sitio, no podemos garantizar su disponibilidad en todo momento. Podemos suspender, retirar o restringir el acceso a todo o parte de nuestro sitio por razones comerciales u operativas. Haremos todos los esfuerzos razonables para avisar con antelación de dichas acciones.\n\nUsted es responsable de garantizar que cualquier persona que acceda a nuestro sitio a través de su conexión a Internet conozca y cumpla con estos términos de uso y cualquier otro término y condiciones.',
      'ro':
          'Site-ul nostru este oferit gratuit, deși pot exista taxe asociate cu participarea la competițiile noastre.\n\nDeși ne străduim să menținem accesul neîntrerupt la site-ul nostru, nu putem garanta disponibilitatea acestuia în orice moment. Putem suspenda, retrage sau restricționa accesul la tot sau la o parte a site-ului nostru din motive de afaceri sau operaționale. Vom depune eforturi rezonabile pentru a anunța în prealabil orice astfel de acțiuni.\n\nSunteți responsabil pentru a vă asigura că oricine accesează site-ul nostru prin conexiunea dvs. la internet este conștient și respectă acești termeni de utilizare și orice alți termeni aplicabili și conditii.',
    },
    '1phy1cp2': {
      'en':
          'If you opt to adjust your preferences later during your browsing session, you can do so by clearing cookies and reloading the page. This action will prompt the consent notice to reappear, allowing you to customize your preferences or withdraw your consent entirely.\n\nMoreover, various browsers offer distinct methods to block and delete cookies utilized by websites. You can modify your browser settings to block or delete cookies. For further information on managing and deleting cookies, you can visit wikipedia.org or www.allaboutcookies.org.',
      'de':
          'Wenn Sie Ihre Einstellungen später während Ihrer Browsersitzung anpassen möchten, können Sie dies tun, indem Sie Cookies löschen und die Seite neu laden. Durch diese Aktion wird die Einwilligungserklärung erneut angezeigt, sodass Sie Ihre Einstellungen anpassen oder Ihre Einwilligung vollständig widerrufen können.\n\nDarüber hinaus bieten verschiedene Browser unterschiedliche Methoden zum Blockieren und Löschen von von Websites verwendeten Cookies. Sie können Ihre Browsereinstellungen ändern, um Cookies zu blockieren oder zu löschen. Weitere Informationen zum Verwalten und Löschen von Cookies finden Sie auf wikipedia.org oder www.allaboutcookies.org.',
      'es':
          'Si opta por ajustar sus preferencias más adelante durante su sesión de navegación, puede hacerlo borrando las cookies y recargando la página. Esta acción hará que vuelva a aparecer el aviso de consentimiento, lo que le permitirá personalizar sus preferencias o retirar su consentimiento por completo.\n\nAdemás, varios navegadores ofrecen distintos métodos para bloquear y eliminar las cookies utilizadas por los sitios web. Puede modificar la configuración de su navegador para bloquear o eliminar las cookies. Para obtener más información sobre cómo administrar y eliminar cookies, puede visitar wikipedia.org o www.allaboutcookies.org.',
      'ro':
          'Dacă alegeți să vă ajustați preferințele mai târziu în timpul sesiunii de navigare, puteți face acest lucru ștergând cookie-urile și reîncărcând pagina. Această acțiune va face ca notificarea de consimțământ să reapară, permițându-vă să vă personalizați preferințele sau să vă retrageți în totalitate consimțământul.\n\n În plus, diferite browsere oferă metode distincte de blocare și ștergere a cookie-urilor utilizate de site-uri web. Puteți modifica setările browserului pentru a bloca sau șterge cookie-urile. Pentru mai multe informații despre gestionarea și ștergerea cookie-urilor, puteți vizita wikipedia.org sau www.allaboutcookies.org.',
    },
    'rktzq82f': {
      'en': 'Who can access our site?',
      'de': 'Wer kann auf unsere Seite zugreifen?',
      'es': '¿Quién puede acceder a nuestro sitio?',
      'ro': 'Cine poate accesa site-ul nostru?',
    },
    'mglabzwq': {
      'en':
          'Our site is intended for users located in the United Kingdom, Republic of Ireland, and European Union countries.',
      'de':
          'Unsere Website richtet sich an Benutzer im Vereinigten Königreich, in der Republik Irland und in Ländern der Europäischen Union.',
      'es':
          'Nuestro sitio está destinado a usuarios ubicados en el Reino Unido, la República de Irlanda y los países de la Unión Europea.',
      'ro':
          'Site-ul nostru este destinat utilizatorilor aflați în Regatul Unit, Republica Irlanda și țările Uniunii Europene.',
    },
    '4lcb6gtd': {
      'en':
          'Our site is intended for users located in the United Kingdom, Republic of Ireland, and European Union countries. We do not claim that the content available on or through our site is suitable for use or accessible in other locations.',
      'de':
          'Unsere Website richtet sich an Benutzer im Vereinigten Königreich, in der Republik Irland und in Ländern der Europäischen Union. Wir erheben keinen Anspruch darauf, dass die auf oder über unsere Website verfügbaren Inhalte für die Verwendung an anderen Orten geeignet oder zugänglich sind.',
      'es':
          'Nuestro sitio está destinado a usuarios ubicados en el Reino Unido, la República de Irlanda y los países de la Unión Europea. No afirmamos que el contenido disponible en nuestro sitio o a través de él sea adecuado para su uso o accesible en otras ubicaciones.',
      'ro':
          'Site-ul nostru este destinat utilizatorilor aflați în Regatul Unit, Republica Irlanda și țările Uniunii Europene. Nu pretindem că conținutul disponibil pe sau prin intermediul site-ului nostru este potrivit pentru utilizare sau accesibil în alte locații.',
    },
    '1bkvnoja': {
      'en':
          'If you opt to adjust your preferences later during your browsing session, you can do so by clearing cookies and reloading the page. This action will prompt the consent notice to reappear, allowing you to customize your preferences or withdraw your consent entirely.\n\nMoreover, various browsers offer distinct methods to block and delete cookies utilized by websites. You can modify your browser settings to block or delete cookies. For further information on managing and deleting cookies, you can visit wikipedia.org or www.allaboutcookies.org.',
      'de':
          'Wenn Sie Ihre Einstellungen später während Ihrer Browsersitzung anpassen möchten, können Sie dies tun, indem Sie Cookies löschen und die Seite neu laden. Durch diese Aktion wird die Einwilligungserklärung erneut angezeigt, sodass Sie Ihre Einstellungen anpassen oder Ihre Einwilligung vollständig widerrufen können.\n\nDarüber hinaus bieten verschiedene Browser unterschiedliche Methoden zum Blockieren und Löschen von von Websites verwendeten Cookies. Sie können Ihre Browsereinstellungen ändern, um Cookies zu blockieren oder zu löschen. Weitere Informationen zum Verwalten und Löschen von Cookies finden Sie auf wikipedia.org oder www.allaboutcookies.org.',
      'es':
          'Si opta por ajustar sus preferencias más adelante durante su sesión de navegación, puede hacerlo borrando las cookies y recargando la página. Esta acción hará que vuelva a aparecer el aviso de consentimiento, lo que le permitirá personalizar sus preferencias o retirar su consentimiento por completo.\n\nAdemás, varios navegadores ofrecen distintos métodos para bloquear y eliminar las cookies utilizadas por los sitios web. Puede modificar la configuración de su navegador para bloquear o eliminar las cookies. Para obtener más información sobre cómo administrar y eliminar cookies, puede visitar wikipedia.org o www.allaboutcookies.org.',
      'ro':
          'Dacă alegeți să vă ajustați preferințele mai târziu în timpul sesiunii de navigare, puteți face acest lucru ștergând cookie-urile și reîncărcând pagina. Această acțiune va face ca notificarea de consimțământ să reapară, permițându-vă să vă personalizați preferințele sau să vă retrageți în totalitate consimțământul.\n\n În plus, diferite browsere oferă metode distincte de blocare și ștergere a cookie-urilor utilizate de site-uri web. Puteți modifica setările browserului pentru a bloca sau șterge cookie-urile. Pentru mai multe informații despre gestionarea și ștergerea cookie-urilor, puteți vizita wikipedia.org sau www.allaboutcookies.org.',
    },
    'xv0865br': {
      'en': 'You must ensure the security of your account details.',
      'de': 'Sie müssen die Sicherheit Ihrer Kontodaten gewährleisten.',
      'es': 'Debe garantizar la seguridad de los datos de su cuenta.',
      'ro': 'Trebuie să vă asigurați securitatea detaliilor contului dvs.',
    },
    'tlk51ci8': {
      'en':
          'If you receive or create a user identification code, password, or any other security information, you must keep it confidential and not share it with any third party.\n\nWe reserve the right to deactivate any user identification code or password, whether chosen by you or assigned by us, if we believe, in our reasonable judgment, that you have violated any of these terms of use.\n\nIf you believe or suspect that someone else knows your user identification code or password, please inform us promptly at contact@bluedash.co.uk.',
      'de':
          'Wenn Sie einen Benutzeridentifikationscode, ein Passwort oder andere Sicherheitsinformationen erhalten oder erstellen, müssen Sie diese vertraulich behandeln und dürfen sie nicht an Dritte weitergeben.\n\nWir behalten uns das Recht vor, Benutzeridentifikationscodes oder Passwörter zu deaktivieren , ob von Ihnen gewählt oder von uns beauftragt, wenn wir nach unserem vernünftigen Ermessen glauben, dass Sie gegen eine dieser Nutzungsbedingungen verstoßen haben.\n\nWenn Sie glauben oder vermuten, dass jemand anderes Ihren Benutzeridentifikationscode kennt oder Wenn Sie kein Passwort haben, teilen Sie uns dies bitte umgehend unter contact@bluedash.co.uk mit.',
      'es':
          'Si recibe o crea un código de identificación de usuario, contraseña o cualquier otra información de seguridad, debe mantenerlo confidencial y no compartirlo con ningún tercero.\n\nNos reservamos el derecho de desactivar cualquier código de identificación de usuario o contraseña. , ya sea elegido por usted o asignado por nosotros, si creemos, a nuestro juicio razonable, que ha violado cualquiera de estos términos de uso.\n\nSi cree o sospecha que alguien más conoce su código de identificación de usuario o contraseña, infórmenos lo antes posible a contact@bluedash.co.uk.',
      'ro':
          'Dacă primiți sau creați un cod de identificare a utilizatorului, o parolă sau orice altă informație de securitate, trebuie să le păstrați confidențiale și să nu le împărtășiți cu nicio terță parte.\n\nNe rezervăm dreptul de a dezactiva orice cod de identificare a utilizatorului sau parolă. , indiferent dacă ați ales de dvs. sau atribuit de noi, dacă credem, în opinia noastră rezonabilă, că ați încălcat oricare dintre acești termeni de utilizare.\n\nDacă credeți sau bănuiți că altcineva cunoaște codul dvs. de identificare de utilizator sau parola, vă rugăm să ne informați prompt la contact@bluedash.co.uk.',
    },
    '5558io4u': {
      'en':
          'If you opt to adjust your preferences later during your browsing session, you can do so by clearing cookies and reloading the page. This action will prompt the consent notice to reappear, allowing you to customize your preferences or withdraw your consent entirely.\n\nMoreover, various browsers offer distinct methods to block and delete cookies utilized by websites. You can modify your browser settings to block or delete cookies. For further information on managing and deleting cookies, you can visit wikipedia.org or www.allaboutcookies.org.',
      'de':
          'Wenn Sie Ihre Einstellungen später während Ihrer Browsersitzung anpassen möchten, können Sie dies tun, indem Sie Cookies löschen und die Seite neu laden. Durch diese Aktion wird die Einwilligungserklärung erneut angezeigt, sodass Sie Ihre Einstellungen anpassen oder Ihre Einwilligung vollständig widerrufen können.\n\nDarüber hinaus bieten verschiedene Browser unterschiedliche Methoden zum Blockieren und Löschen von von Websites verwendeten Cookies. Sie können Ihre Browsereinstellungen ändern, um Cookies zu blockieren oder zu löschen. Weitere Informationen zum Verwalten und Löschen von Cookies finden Sie auf wikipedia.org oder www.allaboutcookies.org.',
      'es':
          'Si opta por ajustar sus preferencias más adelante durante su sesión de navegación, puede hacerlo borrando las cookies y recargando la página. Esta acción hará que vuelva a aparecer el aviso de consentimiento, lo que le permitirá personalizar sus preferencias o retirar su consentimiento por completo.\n\nAdemás, varios navegadores ofrecen distintos métodos para bloquear y eliminar las cookies utilizadas por los sitios web. Puede modificar la configuración de su navegador para bloquear o eliminar las cookies. Para obtener más información sobre cómo administrar y eliminar cookies, puede visitar wikipedia.org o www.allaboutcookies.org.',
      'ro':
          'Dacă alegeți să vă ajustați preferințele mai târziu în timpul sesiunii de navigare, puteți face acest lucru ștergând cookie-urile și reîncărcând pagina. Această acțiune va face ca notificarea de consimțământ să reapară, permițându-vă să vă personalizați preferințele sau să vă retrageți în totalitate consimțământul.\n\n În plus, diferite browsere oferă metode distincte de blocare și ștergere a cookie-urilor utilizate de site-uri web. Puteți modifica setările browserului pentru a bloca sau șterge cookie-urile. Pentru mai multe informații despre gestionarea și ștergerea cookie-urilor, puteți vizita wikipedia.org sau www.allaboutcookies.org.',
    },
    'xk7fr111': {
      'en': 'How you can use material on our site',
      'de': 'Wie Sie Material auf unserer Website nutzen können',
      'es': 'Cómo puede utilizar el material en nuestro sitio',
      'ro': 'Cum puteți utiliza materialul de pe site-ul nostru',
    },
    'jgvttmd7': {
      'en':
          'We own or hold the license to all intellectual property rights in our site and the material published on it. These works are protected by copyright laws and treaties worldwide. All rights are reserved.\n\nYou may print one copy and download extracts of any page(s) from our site for your personal use. You may also share content posted on our site with others within your organization.\n\nHowever, you must not modify any printed or downloaded materials, and you must not use illustrations, photographs, video or audio sequences, or graphics separately from accompanying text.\n\nAcknowledgment of our status (and that of any identified contributors) as the authors of the content on our site is required.\n\nUsing any part of the content on our site for commercial purposes without obtaining a license from us or our licensors is prohibited.\n\nIf you breach these terms by printing, copying, or downloading any part of our site without authorization, your right to use our site will cease immediately. We may, at our discretion, request that you return or destroy any copies of the materials you have made.',
      'de':
          'Wir besitzen oder besitzen die Lizenz für alle geistigen Eigentumsrechte an unserer Website und dem darauf veröffentlichten Material. Diese Werke sind weltweit durch Urheberrechtsgesetze und -verträge geschützt. Alle Rechte vorbehalten.\n\nSie dürfen eine Kopie ausdrucken und Auszüge aller Seiten unserer Website für Ihren persönlichen Gebrauch herunterladen. Sie dürfen auf unserer Website veröffentlichte Inhalte auch mit anderen innerhalb Ihrer Organisation teilen.\n\nSie dürfen jedoch gedruckte oder heruntergeladene Materialien nicht verändern und Sie dürfen Illustrationen, Fotos, Video- oder Audiosequenzen oder Grafiken nicht separat verwenden aus dem Begleittext.\n\nDie Anerkennung unseres Status (und des aller identifizierten Mitwirkenden) als Autoren des Inhalts auf unserer Website ist erforderlich.\n\nDie Verwendung jeglicher Teile des Inhalts auf unserer Website für Kommerzielle Zwecke ohne Einholung einer Lizenz von uns oder unseren Lizenzgebern sind untersagt.\n\nWenn Sie gegen diese Bedingungen verstoßen, indem Sie Teile unserer Website ohne Genehmigung ausdrucken, kopieren oder herunterladen, erlischt Ihr Recht zur Nutzung unserer Website sofort. Wir können nach unserem Ermessen verlangen, dass Sie alle von Ihnen erstellten Kopien der Materialien zurückgeben oder vernichten.',
      'es':
          'Somos propietarios o poseemos la licencia de todos los derechos de propiedad intelectual de nuestro sitio y del material publicado en él. Estas obras están protegidas por leyes y tratados de derechos de autor en todo el mundo. Todos los derechos están reservados.\n\nPuede imprimir una copia y descargar extractos de cualquier página de nuestro sitio para su uso personal. También puede compartir el contenido publicado en nuestro sitio con otras personas dentro de su organización.\n\nSin embargo, no debe modificar ningún material impreso o descargado, y no debe utilizar ilustraciones, fotografías, secuencias de video o audio, ni gráficos por separado. del texto adjunto.\n\nSe requiere el reconocimiento de nuestro estado (y el de cualquier colaborador identificado) como autores del contenido de nuestro sitio.\n\nUsar cualquier parte del contenido de nuestro sitio para fines comerciales sin obtener una licencia nuestra o de nuestros licenciantes.\n\nSi incumple estos términos al imprimir, copiar o descargar cualquier parte de nuestro sitio sin autorización, su derecho a utilizar nuestro sitio cesará de inmediato. Podemos, a nuestra discreción, solicitarle que devuelva o destruya cualquier copia de los materiales que haya realizado.',
      'ro':
          'Deținem sau deținem licența pentru toate drepturile de proprietate intelectuală de pe site-ul nostru și de materialul publicat pe acesta. Aceste lucrări sunt protejate de legile și tratatele privind drepturile de autor din întreaga lume. Toate drepturile sunt rezervate.\n\nPuteți imprima o copie și descărca extrase din orice pagină(e) de pe site-ul nostru pentru uz personal. De asemenea, puteți partaja conținut postat pe site-ul nostru cu alte persoane din cadrul organizației dvs.\n\n Cu toate acestea, nu trebuie să modificați niciun material tipărit sau descărcat și nu trebuie să utilizați separat ilustrații, fotografii, secvențe video sau audio sau grafice. din textul însoțitor.\n\nEste necesară recunoașterea statutului nostru (și a oricăror colaboratori identificați) ca autori ai conținutului de pe site-ul nostru.\n\n Utilizarea oricărei părți a conținutului de pe site-ul nostru pentru în scopuri comerciale fără a obține o licență de la noi sau de la licențiatorii noștri este interzisă.\n\nDacă încălcați acești termeni prin imprimarea, copierea sau descărcarea oricărei părți a site-ului nostru fără autorizație, dreptul dumneavoastră de a utiliza site-ul nostru va înceta imediat. Putem, la discreția noastră, să vă solicităm să returnați sau să distrugeți orice copii ale materialelor pe care le-ați realizat.',
    },
    'r20f08xq': {
      'en':
          'If you opt to adjust your preferences later during your browsing session, you can do so by clearing cookies and reloading the page. This action will prompt the consent notice to reappear, allowing you to customize your preferences or withdraw your consent entirely.\n\nMoreover, various browsers offer distinct methods to block and delete cookies utilized by websites. You can modify your browser settings to block or delete cookies. For further information on managing and deleting cookies, you can visit wikipedia.org or www.allaboutcookies.org.',
      'de':
          'Wenn Sie Ihre Einstellungen später während Ihrer Browsersitzung anpassen möchten, können Sie dies tun, indem Sie Cookies löschen und die Seite neu laden. Durch diese Aktion wird die Einwilligungserklärung erneut angezeigt, sodass Sie Ihre Einstellungen anpassen oder Ihre Einwilligung vollständig widerrufen können.\n\nDarüber hinaus bieten verschiedene Browser unterschiedliche Methoden zum Blockieren und Löschen von von Websites verwendeten Cookies. Sie können Ihre Browsereinstellungen ändern, um Cookies zu blockieren oder zu löschen. Weitere Informationen zum Verwalten und Löschen von Cookies finden Sie auf wikipedia.org oder www.allaboutcookies.org.',
      'es':
          'Si opta por ajustar sus preferencias más adelante durante su sesión de navegación, puede hacerlo borrando las cookies y recargando la página. Esta acción hará que vuelva a aparecer el aviso de consentimiento, lo que le permitirá personalizar sus preferencias o retirar su consentimiento por completo.\n\nAdemás, varios navegadores ofrecen distintos métodos para bloquear y eliminar las cookies utilizadas por los sitios web. Puede modificar la configuración de su navegador para bloquear o eliminar las cookies. Para obtener más información sobre cómo administrar y eliminar cookies, puede visitar wikipedia.org o www.allaboutcookies.org.',
      'ro':
          'Dacă alegeți să vă ajustați preferințele mai târziu în timpul sesiunii de navigare, puteți face acest lucru ștergând cookie-urile și reîncărcând pagina. Această acțiune va face ca notificarea de consimțământ să reapară, permițându-vă să vă personalizați preferințele sau să vă retrageți în totalitate consimțământul.\n\n În plus, diferite browsere oferă metode distincte de blocare și ștergere a cookie-urilor utilizate de site-uri web. Puteți modifica setările browserului pentru a bloca sau șterge cookie-urile. Pentru mai multe informații despre gestionarea și ștergerea cookie-urilor, puteți vizita wikipedia.org sau www.allaboutcookies.org.',
    },
    'almoodw6': {
      'en':
          'The information provided on our site is for general informational purposes only',
      'de':
          'Die auf unserer Website bereitgestellten Informationen dienen ausschließlich allgemeinen Informationszwecken',
      'es':
          'La información proporcionada en nuestro sitio es solo para fines informativos generales.',
      'ro':
          'Informațiile furnizate pe site-ul nostru au doar scop informativ general',
    },
    'ooabov2i': {
      'en':
          'The content on our site serves as general information only. It should not be considered as advice to rely on. Prior to making any decisions or refraining from any actions based on the content provided, it is essential to seek professional or specialist advice.\n\nWhile we strive to keep the information on our site updated, we do not make any express or implied representations, warranties, or guarantees regarding the accuracy, completeness, or timeliness of the content.',
      'de':
          'Die Inhalte auf unserer Seite dienen lediglich der allgemeinen Information. Es sollte nicht als Ratschlag betrachtet werden, auf den man sich verlassen kann. Bevor Sie auf der Grundlage der bereitgestellten Inhalte Entscheidungen treffen oder Maßnahmen unterlassen, ist es unbedingt erforderlich, professionellen oder fachkundigen Rat einzuholen.\n\nObwohl wir uns bemühen, die Informationen auf unserer Website auf dem neuesten Stand zu halten, machen wir keine ausdrücklichen Angaben dazu oder stillschweigende Zusicherungen, Gewährleistungen oder Garantien hinsichtlich der Richtigkeit, Vollständigkeit oder Aktualität des Inhalts.',
      'es':
          'El contenido de nuestro sitio sirve únicamente como información general. No debe considerarse como un consejo en el que confiar. Antes de tomar cualquier decisión o abstenerse de realizar cualquier acción basada en el contenido proporcionado, es fundamental buscar asesoramiento profesional o especializado.\n\nSi bien nos esforzamos por mantener actualizada la información de nuestro sitio, no hacemos ninguna declaración expresa. o representaciones, garantías o garantías implícitas con respecto a la exactitud, integridad o actualidad del contenido.',
      'ro':
          'Conținutul de pe site-ul nostru servește doar ca informații generale. Nu ar trebui să fie considerat un sfat pe care să te bazezi. Înainte de a lua orice decizie sau de a vă abține de la orice acțiuni bazate pe conținutul furnizat, este esențial să solicitați sfaturi profesionale sau de specialitate. sau declarații implicite, garanții sau garanții cu privire la acuratețea, completitudinea sau actualitatea conținutului.',
    },
    'pajcctbg': {
      'en':
          'If you opt to adjust your preferences later during your browsing session, you can do so by clearing cookies and reloading the page. This action will prompt the consent notice to reappear, allowing you to customize your preferences or withdraw your consent entirely.\n\nMoreover, various browsers offer distinct methods to block and delete cookies utilized by websites. You can modify your browser settings to block or delete cookies. For further information on managing and deleting cookies, you can visit wikipedia.org or www.allaboutcookies.org.',
      'de':
          'Wenn Sie Ihre Einstellungen später während Ihrer Browsersitzung anpassen möchten, können Sie dies tun, indem Sie Cookies löschen und die Seite neu laden. Durch diese Aktion wird die Einwilligungserklärung erneut angezeigt, sodass Sie Ihre Einstellungen anpassen oder Ihre Einwilligung vollständig widerrufen können.\n\nDarüber hinaus bieten verschiedene Browser unterschiedliche Methoden zum Blockieren und Löschen von von Websites verwendeten Cookies. Sie können Ihre Browsereinstellungen ändern, um Cookies zu blockieren oder zu löschen. Weitere Informationen zum Verwalten und Löschen von Cookies finden Sie auf wikipedia.org oder www.allaboutcookies.org.',
      'es':
          'Si opta por ajustar sus preferencias más adelante durante su sesión de navegación, puede hacerlo borrando las cookies y recargando la página. Esta acción hará que vuelva a aparecer el aviso de consentimiento, lo que le permitirá personalizar sus preferencias o retirar su consentimiento por completo.\n\nAdemás, varios navegadores ofrecen distintos métodos para bloquear y eliminar las cookies utilizadas por los sitios web. Puede modificar la configuración de su navegador para bloquear o eliminar las cookies. Para obtener más información sobre cómo administrar y eliminar cookies, puede visitar wikipedia.org o www.allaboutcookies.org.',
      'ro':
          'Dacă alegeți să vă ajustați preferințele mai târziu în timpul sesiunii de navigare, puteți face acest lucru ștergând cookie-urile și reîncărcând pagina. Această acțiune va face ca notificarea de consimțământ să reapară, permițându-vă să vă personalizați preferințele sau să vă retrageți în totalitate consimțământul.\n\n În plus, diferite browsere oferă metode distincte de blocare și ștergere a cookie-urilor utilizate de site-uri web. Puteți modifica setările browserului pentru a bloca sau șterge cookie-urile. Pentru mai multe informații despre gestionarea și ștergerea cookie-urilor, puteți vizita wikipedia.org sau www.allaboutcookies.org.',
    },
    'zm4viifz': {
      'en': 'Linking doesn\'t imply endorsement',
      'de': 'Das Verlinken stellt keine Billigung dar',
      'es': 'Vincular no implica respaldo',
      'ro': 'Conectarea nu implică aprobarea',
    },
    'vhela7nl': {
      'en':
          'Our site may include links to third-party sites for informational purposes only. These links don\'t imply our endorsement of the linked websites or the information they contain. We have no control over their content.',
      'de':
          'Unsere Website kann nur zu Informationszwecken Links zu Websites Dritter enthalten. Diese Links bedeuten nicht, dass wir die verlinkten Websites oder die darin enthaltenen Informationen gutheißen. Wir haben keinen Einfluss auf deren Inhalt.',
      'es':
          'Nuestro sitio puede incluir enlaces a sitios de terceros con fines informativos únicamente. Estos enlaces no implican nuestro respaldo a los sitios web vinculados ni a la información que contienen. No tenemos control sobre su contenido.',
      'ro':
          'Site-ul nostru poate include link-uri către site-uri terțe doar în scop informativ. Aceste link-uri nu implică aprobarea noastră pentru site-urile web legate sau informațiile pe care le conțin. Nu avem control asupra conținutului lor.',
    },
    'l3ukw6ql': {
      'en':
          'If you opt to adjust your preferences later during your browsing session, you can do so by clearing cookies and reloading the page. This action will prompt the consent notice to reappear, allowing you to customize your preferences or withdraw your consent entirely.\n\nMoreover, various browsers offer distinct methods to block and delete cookies utilized by websites. You can modify your browser settings to block or delete cookies. For further information on managing and deleting cookies, you can visit wikipedia.org or www.allaboutcookies.org.',
      'de':
          'Wenn Sie Ihre Einstellungen später während Ihrer Browsersitzung anpassen möchten, können Sie dies tun, indem Sie Cookies löschen und die Seite neu laden. Durch diese Aktion wird die Einwilligungserklärung erneut angezeigt, sodass Sie Ihre Einstellungen anpassen oder Ihre Einwilligung vollständig widerrufen können.\n\nDarüber hinaus bieten verschiedene Browser unterschiedliche Methoden zum Blockieren und Löschen von von Websites verwendeten Cookies. Sie können Ihre Browsereinstellungen ändern, um Cookies zu blockieren oder zu löschen. Weitere Informationen zum Verwalten und Löschen von Cookies finden Sie auf wikipedia.org oder www.allaboutcookies.org.',
      'es':
          'Si opta por ajustar sus preferencias más adelante durante su sesión de navegación, puede hacerlo borrando las cookies y recargando la página. Esta acción hará que vuelva a aparecer el aviso de consentimiento, lo que le permitirá personalizar sus preferencias o retirar su consentimiento por completo.\n\nAdemás, varios navegadores ofrecen distintos métodos para bloquear y eliminar las cookies utilizadas por los sitios web. Puede modificar la configuración de su navegador para bloquear o eliminar las cookies. Para obtener más información sobre cómo administrar y eliminar cookies, puede visitar wikipedia.org o www.allaboutcookies.org.',
      'ro':
          'Dacă alegeți să vă ajustați preferințele mai târziu în timpul sesiunii de navigare, puteți face acest lucru ștergând cookie-urile și reîncărcând pagina. Această acțiune va face ca notificarea de consimțământ să reapară, permițându-vă să vă personalizați preferințele sau să vă retrageți în totalitate consimțământul.\n\n În plus, diferite browsere oferă metode distincte de blocare și ștergere a cookie-urilor utilizate de site-uri web. Puteți modifica setările browserului pentru a bloca sau șterge cookie-urile. Pentru mai multe informații despre gestionarea și ștergerea cookie-urilor, puteți vizita wikipedia.org sau www.allaboutcookies.org.',
    },
    '3d8xpnjb': {
      'en': 'We do not approve user-generated content',
      'de': 'Wir genehmigen keine benutzergenerierten Inhalte',
      'es': 'No aprobamos el contenido generado por el usuario.',
      'ro': 'Nu aprobăm conținutul generat de utilizatori',
    },
    'hgr318zm': {
      'en':
          'This website may feature content and materials uploaded by other users of the site, including posts on our social media accounts. However, such information and materials have not been verified or endorsed by us. The views expressed by other users on our site do not necessarily reflect our own views or values.\n\nIf you have any concerns regarding information and materials uploaded by other users, please contact us at contact@bluedash.co.uk',
      'de':
          'Diese Website kann Inhalte und Materialien enthalten, die von anderen Benutzern der Website hochgeladen wurden, einschließlich Beiträgen auf unseren Social-Media-Konten. Diese Informationen und Materialien wurden jedoch von uns weder überprüft noch unterstützt. Die von anderen Benutzern auf unserer Website geäußerten Ansichten spiegeln nicht unbedingt unsere eigenen Ansichten oder Werte wider.\n\nWenn Sie Bedenken hinsichtlich der von anderen Benutzern hochgeladenen Informationen und Materialien haben, kontaktieren Sie uns bitte unter contact@bluedash.co.uk',
      'es':
          'Este sitio web puede incluir contenido y materiales subidos por otros usuarios del sitio, incluidas publicaciones en nuestras cuentas de redes sociales. Sin embargo, dicha información y materiales no han sido verificados ni respaldados por nosotros. Las opiniones expresadas por otros usuarios en nuestro sitio no reflejan necesariamente nuestras propias opiniones o valores.\n\nSi tiene alguna inquietud con respecto a la información y los materiales cargados por otros usuarios, contáctenos en contact@bluedash.co.uk',
      'ro':
          'Acest site web poate prezenta conținut și materiale încărcate de alți utilizatori ai site-ului, inclusiv postări pe conturile noastre de socializare. Cu toate acestea, astfel de informații și materiale nu au fost verificate sau aprobate de noi. Opiniile exprimate de alți utilizatori pe site-ul nostru nu reflectă neapărat propriile noastre opinii sau valori.\n\nDacă aveți nelămuriri cu privire la informațiile și materialele încărcate de alți utilizatori, vă rugăm să ne contactați la contact@bluedash.co.uk',
    },
    'ew7v11ws': {
      'en':
          'If you opt to adjust your preferences later during your browsing session, you can do so by clearing cookies and reloading the page. This action will prompt the consent notice to reappear, allowing you to customize your preferences or withdraw your consent entirely.\n\nMoreover, various browsers offer distinct methods to block and delete cookies utilized by websites. You can modify your browser settings to block or delete cookies. For further information on managing and deleting cookies, you can visit wikipedia.org or www.allaboutcookies.org.',
      'de':
          'Wenn Sie Ihre Einstellungen später während Ihrer Browsersitzung anpassen möchten, können Sie dies tun, indem Sie Cookies löschen und die Seite neu laden. Durch diese Aktion wird die Einwilligungserklärung erneut angezeigt, sodass Sie Ihre Einstellungen anpassen oder Ihre Einwilligung vollständig widerrufen können.\n\nDarüber hinaus bieten verschiedene Browser unterschiedliche Methoden zum Blockieren und Löschen von von Websites verwendeten Cookies. Sie können Ihre Browsereinstellungen ändern, um Cookies zu blockieren oder zu löschen. Weitere Informationen zum Verwalten und Löschen von Cookies finden Sie auf wikipedia.org oder www.allaboutcookies.org.',
      'es':
          'Si opta por ajustar sus preferencias más adelante durante su sesión de navegación, puede hacerlo borrando las cookies y recargando la página. Esta acción hará que vuelva a aparecer el aviso de consentimiento, lo que le permitirá personalizar sus preferencias o retirar su consentimiento por completo.\n\nAdemás, varios navegadores ofrecen distintos métodos para bloquear y eliminar las cookies utilizadas por los sitios web. Puede modificar la configuración de su navegador para bloquear o eliminar las cookies. Para obtener más información sobre cómo administrar y eliminar cookies, puede visitar wikipedia.org o www.allaboutcookies.org.',
      'ro':
          'Dacă alegeți să vă ajustați preferințele mai târziu în timpul sesiunii de navigare, puteți face acest lucru ștergând cookie-urile și reîncărcând pagina. Această acțiune va face ca notificarea de consimțământ să reapară, permițându-vă să vă personalizați preferințele sau să vă retrageți în totalitate consimțământul.\n\n În plus, diferite browsere oferă metode distincte de blocare și ștergere a cookie-urilor utilizate de site-uri web. Puteți modifica setările browserului pentru a bloca sau șterge cookie-urile. Pentru mai multe informații despre gestionarea și ștergerea cookie-urilor, puteți vizita wikipedia.org sau www.allaboutcookies.org.',
    },
    'qzonxaom': {
      'en': 'Our liability for any loss or damage you experience.',
      'de':
          'Unsere Haftung für jegliche Verluste oder Schäden, die Ihnen entstehen.',
      'es':
          'Nuestra responsabilidad por cualquier pérdida o daño que experimente.',
      'ro':
          'Răspunderea noastră pentru orice pierdere sau daune pe care le experimentați.',
    },
    'btgphfed': {
      'en':
          'Our liability to you is as follows:\n\n- We do not exclude or limit in any way our liability to you where it would be unlawful to do so. This includes liability for death or personal injury caused by our negligence or the negligence of our employees, agents, or subcontractors and for fraud or fraudulent misrepresentation.\n\n- We are not liable for business losses. We only provide our site for domestic and private use. If you use our site for any commercial, business, or resale purpose, we will have no liability to you for any loss of profit, loss of business, business interruption, or loss of business opportunity.\n\n- We are not responsible for events outside our control. We will not be liable or responsible for any failure to perform, or delay in performance of, any of our obligations under these terms that is caused by events outside our reasonable control (Force Majeure Event).\n\n- We are not responsible for viruses and you must not introduce them. We do not guarantee that our site will be secure or free from bugs or viruses. You are responsible for configuring your information technology, computer programs and platform to access our site. You should use your own virus protection software.\n\n- Rules about linking to our site. You may link to our home page, provided you do so in a way that is fair and legal and does not damage our reputation or take advantage of it. You must not establish a link in such a way as to suggest any form of association, approval, or endorsement on our part where none exists. You must not establish a link to our site in any website that is not owned by you. Our site must not be framed on any other site, nor may you create a link to any part of our site other than the home page. We reserve the right to withdraw linking permission without notice.\n\n- If you breach these terms. If you breach these terms and we suffer loss or damage or incur any costs, expenses, or liability as a result of your breach, you agree to indemnify us for all such losses, costs, expenses, or liabilities.\n\n- Which laws govern this contract and where you can initiate legal proceedings. These terms are governed by English law and you can bring legal proceedings in respect of the products in the English courts. If you live in Scotland you can bring legal proceedings in respect of the products in either the Scottish or the English courts. If you live in Northern Ireland you can bring legal proceedings in respect of the products in either the Northern Irish or the English courts.',
      'de':
          'Unsere Haftung Ihnen gegenüber ist wie folgt:\n\n- Wir schließen unsere Haftung Ihnen gegenüber in keiner Weise aus oder beschränken sie, wenn dies rechtswidrig wäre. Dies umfasst die Haftung für Tod oder Körperverletzung, die durch unsere Fahrlässigkeit oder die Fahrlässigkeit unserer Mitarbeiter, Vertreter oder Subunternehmer verursacht wurden, sowie für Betrug oder betrügerische Falschdarstellung.\n\n- Wir haften nicht für Geschäftsverluste. Wir stellen unsere Seite nur für den häuslichen und privaten Gebrauch zur Verfügung. Wenn Sie unsere Website für kommerzielle, geschäftliche oder Wiederverkaufszwecke nutzen, haften wir Ihnen gegenüber nicht für entgangenen Gewinn, Geschäftsverlust, Betriebsunterbrechung oder Verlust von Geschäftsmöglichkeiten.\n\n- Das tun wir Wir sind nicht verantwortlich für Ereignisse, die außerhalb unserer Kontrolle liegen. Wir sind nicht haftbar oder verantwortlich für die Nichterfüllung oder Verzögerung bei der Erfüllung unserer Verpflichtungen aus diesen Bedingungen, die durch Ereignisse verursacht werden, die außerhalb unserer angemessenen Kontrolle liegen (Ereignis höherer Gewalt).\n\n- Das sind wir Wir sind nicht für Viren verantwortlich und dürfen diese nicht einschleusen. Wir garantieren nicht, dass unsere Website sicher oder frei von Fehlern oder Viren ist. Sie sind für die Konfiguration Ihrer Informationstechnologie, Computerprogramme und Plattform für den Zugriff auf unsere Website verantwortlich. Sie sollten Ihre eigene Virenschutzsoftware verwenden.\n\n- Regeln für die Verlinkung auf unsere Website. Sie dürfen auf unsere Homepage verlinken, sofern Sie dies auf faire und rechtmäßige Weise tun und unseren Ruf nicht schädigen oder ausnutzen. Sie dürfen einen Link nicht in einer Weise herstellen, die den Eindruck einer Verbindung, Genehmigung oder Billigung unsererseits erweckt, sofern diese nicht besteht. Sie dürfen keinen Link zu unserer Website auf einer Website einrichten, die nicht Ihr Eigentum ist. Unsere Website darf nicht in eine andere Website eingebunden werden, noch ist es Ihnen gestattet, einen Link zu einem anderen Teil unserer Website als der Startseite zu erstellen. Wir behalten uns das Recht vor, die Erlaubnis zur Verlinkung ohne Vorankündigung zu widerrufen.\n\n- Wenn Sie gegen diese Bedingungen verstoßen. Wenn Sie gegen diese Bedingungen verstoßen und uns aufgrund Ihres Verstoßes Verluste oder Schäden entstehen oder Kosten, Ausgaben oder Haftung entstehen, erklären Sie sich damit einverstanden, uns für alle derartigen Verluste, Kosten, Ausgaben oder Verbindlichkeiten zu entschädigen.\n\n - Welche Gesetze regeln diesen Vertrag und wo können Sie rechtliche Schritte einleiten. Diese Bedingungen unterliegen englischem Recht und Sie können rechtliche Schritte in Bezug auf die Produkte vor den englischen Gerichten einleiten. Wenn Sie in Schottland leben, können Sie in Bezug auf die Produkte entweder vor den schottischen oder den englischen Gerichten rechtliche Schritte einleiten. Wenn Sie in Nordirland leben, können Sie in Bezug auf die Produkte entweder vor den nordirischen oder den englischen Gerichten rechtliche Schritte einleiten.',
      'es':
          'Nuestra responsabilidad hacia usted es la siguiente:\n\n- No excluimos ni limitamos de ninguna manera nuestra responsabilidad hacia usted cuando sería ilegal hacerlo. Esto incluye responsabilidad por muerte o lesiones personales causadas por nuestra negligencia o la negligencia de nuestros empleados, agentes o subcontratistas y por fraude o tergiversación fraudulenta.\n\n- No somos responsables de las pérdidas comerciales. Sólo proporcionamos nuestro sitio para uso doméstico y privado. Si utiliza nuestro sitio para cualquier propósito comercial, comercial o de reventa, no seremos responsables ante usted por cualquier pérdida de ganancias, pérdida de negocios, interrupción del negocio o pérdida de oportunidades comerciales.\n\n- Estamos No nos hacemos responsables de eventos fuera de nuestro control. No seremos responsables de ningún incumplimiento o retraso en el cumplimiento de cualquiera de nuestras obligaciones bajo estos términos que sea causado por eventos fuera de nuestro control razonable (Evento de fuerza mayor).\n\n- Estamos no se hace responsable de los virus y no debe introducirlos. No garantizamos que nuestro sitio sea seguro o esté libre de errores o virus. Usted es responsable de configurar su tecnología de la información, sus programas informáticos y su plataforma para acceder a nuestro sitio. Debe utilizar su propio software de protección antivirus.\n\n- Reglas sobre enlaces a nuestro sitio. Puede vincular a nuestra página de inicio, siempre que lo haga de manera justa y legal y no dañe nuestra reputación ni se aproveche de ella. No debe establecer un vínculo de tal manera que sugiera cualquier forma de asociación, aprobación o respaldo de nuestra parte cuando no exista ninguno. No debe establecer un enlace a nuestro sitio en ningún sitio web que no sea de su propiedad. Nuestro sitio no debe estar enmarcado en ningún otro sitio, ni usted puede crear un enlace a ninguna parte de nuestro sitio que no sea la página de inicio. Nos reservamos el derecho de retirar el permiso de vinculación sin previo aviso.\n\n- Si incumple estos términos. Si incumple estos términos y sufrimos pérdidas o daños o incurrimos en costos, gastos o responsabilidades como resultado de su incumplimiento, usted acepta indemnizarnos por todas esas pérdidas, costos, gastos o responsabilidades.\n\n - Qué leyes rigen este contrato y dónde puede iniciar procedimientos legales. Estos términos se rigen por la ley inglesa y usted puede iniciar acciones legales con respecto a los productos en los tribunales ingleses. Si vive en Escocia, puede entablar procedimientos legales con respecto a los productos ante los tribunales escoceses o ingleses. Si vive en Irlanda del Norte, puede entablar procedimientos legales con respecto a los productos ante los tribunales de Irlanda del Norte o los ingleses.',
      'ro':
          'Răspunderea noastră față de dvs. este următoarea:\n\n- Nu excludem și nu limităm în niciun fel răspunderea noastră față de dvs. acolo unde ar fi ilegal să facem acest lucru. Aceasta include răspunderea pentru deces sau vătămare corporală cauzată de neglijența noastră sau a angajaților, agenților sau subcontractanților noștri și pentru fraudă sau declarații false frauduloase.\n\n- Nu suntem răspunzători pentru pierderile de afaceri. Oferim site-ul nostru numai pentru uz casnic și privat. Dacă utilizați site-ul nostru în orice scop comercial, de afaceri sau de revânzare, nu vom avea nicio răspundere față de dvs. pentru nicio pierdere de profit, pierdere de afaceri, întrerupere a activității sau pierderea unei oportunități de afaceri.\n\n- Suntem nu este responsabil pentru evenimentele aflate în afara controlului nostru. Nu vom fi răspunzători sau răspunzători pentru nicio neîndeplinire sau întârziere în îndeplinirea oricăreia dintre obligațiile noastre conform acestor termeni, care este cauzată de evenimente în afara controlului nostru rezonabil (Eveniment de forță majoră).\n\n- Suntem nu este responsabil pentru viruși și nu trebuie să îi introduceți. Nu garantăm că site-ul nostru va fi sigur sau lipsit de erori sau viruși. Sunteți responsabil pentru configurarea tehnologiei informației, a programelor de calculator și a platformei pentru a accesa site-ul nostru. Ar trebui să utilizați propriul software de protecție împotriva virușilor.\n\n- Reguli privind conectarea la site-ul nostru. Puteți face legătura către pagina noastră de pornire, cu condiția să faceți acest lucru într-un mod corect și legal și să nu prejudicieze reputația noastră și să nu profitați de ea. Nu trebuie să stabiliți un link în așa fel încât să sugerați vreo formă de asociere, aprobare sau aprobare din partea noastră, acolo unde nu există. Nu trebuie să stabiliți un link către site-ul nostru pe niciun site care nu este deținut de dvs. Site-ul nostru nu trebuie să fie încadrat pe niciun alt site și nici nu puteți crea un link către orice parte a site-ului nostru, în afară de pagina de pornire. Ne rezervăm dreptul de a retrage permisiunea de conectare fără notificare.\n\n- Dacă încălcați acești termeni. Dacă încălcați acești termeni și suferim pierderi sau daune sau suportăm orice costuri, cheltuieli sau răspundere ca urmare a încălcării dvs., sunteți de acord să ne despăgubiți pentru toate aceste pierderi, costuri, cheltuieli sau răspunderi.\n\n - Ce legi guvernează acest contract și unde puteți iniția proceduri judiciare. Acești termeni sunt guvernați de legea engleză și puteți introduce acțiuni în justiție cu privire la produse în instanțele engleze. Dacă locuiți în Scoția, puteți introduce acțiuni în justiție cu privire la produse în instanțele scoțiene sau engleze. Dacă locuiți în Irlanda de Nord, puteți introduce acțiuni în justiție cu privire la produse fie în instanțele din Irlanda de Nord, fie în cele engleze.',
    },
    'ltvg5ax8': {
      'en':
          'If you opt to adjust your preferences later during your browsing session, you can do so by clearing cookies and reloading the page. This action will prompt the consent notice to reappear, allowing you to customize your preferences or withdraw your consent entirely.\n\nMoreover, various browsers offer distinct methods to block and delete cookies utilized by websites. You can modify your browser settings to block or delete cookies. For further information on managing and deleting cookies, you can visit wikipedia.org or www.allaboutcookies.org.',
      'de':
          'Wenn Sie Ihre Einstellungen später während Ihrer Browsersitzung anpassen möchten, können Sie dies tun, indem Sie Cookies löschen und die Seite neu laden. Durch diese Aktion wird die Einwilligungserklärung erneut angezeigt, sodass Sie Ihre Einstellungen anpassen oder Ihre Einwilligung vollständig widerrufen können.\n\nDarüber hinaus bieten verschiedene Browser unterschiedliche Methoden zum Blockieren und Löschen von von Websites verwendeten Cookies. Sie können Ihre Browsereinstellungen ändern, um Cookies zu blockieren oder zu löschen. Weitere Informationen zum Verwalten und Löschen von Cookies finden Sie auf wikipedia.org oder www.allaboutcookies.org.',
      'es':
          'Si opta por ajustar sus preferencias más adelante durante su sesión de navegación, puede hacerlo borrando las cookies y recargando la página. Esta acción hará que vuelva a aparecer el aviso de consentimiento, lo que le permitirá personalizar sus preferencias o retirar su consentimiento por completo.\n\nAdemás, varios navegadores ofrecen distintos métodos para bloquear y eliminar las cookies utilizadas por los sitios web. Puede modificar la configuración de su navegador para bloquear o eliminar las cookies. Para obtener más información sobre cómo administrar y eliminar cookies, puede visitar wikipedia.org o www.allaboutcookies.org.',
      'ro':
          'Dacă alegeți să vă ajustați preferințele mai târziu în timpul sesiunii de navigare, puteți face acest lucru ștergând cookie-urile și reîncărcând pagina. Această acțiune va face ca notificarea de consimțământ să reapară, permițându-vă să vă personalizați preferințele sau să vă retrageți în totalitate consimțământul.\n\n În plus, diferite browsere oferă metode distincte de blocare și ștergere a cookie-urilor utilizate de site-uri web. Puteți modifica setările browserului pentru a bloca sau șterge cookie-urile. Pentru mai multe informații despre gestionarea și ștergerea cookie-urilor, puteți vizita wikipedia.org sau www.allaboutcookies.org.',
    },
    '787zzis4': {
      'en': 'When you upload content to our site:',
      'de': 'Wenn Sie Inhalte auf unsere Website hochladen:',
      'es': 'Cuando subes contenido a nuestro sitio:',
      'ro': 'Când încărcați conținut pe site-ul nostru:',
    },
    'kclzjbcw': {
      'en':
          'When utilizing any feature allowing content uploads to our site or engaging with others through our social media channels, you must adhere to the content standards outlined in our Acceptable Use Policy.\n\nYou affirm that any contribution complies with these standards and agree to indemnify us for any breach. This means you are accountable for any resulting loss or damage we may incur.\n\nUploaded content is deemed non-confidential and non-proprietary. While you retain ownership rights, you grant us a limited license to utilize, store, copy, distribute, and share it with third parties. Details of this license are specified below.\n\nWe reserve the right to reveal your identity to any third party asserting that your content violates their intellectual property rights or privacy.\n\nWe retain the authority to remove any posts on our site that, in our judgment, fail to meet our content standards.\n\nYou bear the responsibility for securing and backing up your content.',
      'de':
          'Wenn Sie eine Funktion nutzen, die das Hochladen von Inhalten auf unsere Website ermöglicht oder über unsere Social-Media-Kanäle mit anderen in Kontakt tritt, müssen Sie die in unserer Richtlinie zur akzeptablen Nutzung dargelegten Inhaltsstandards einhalten.\n\nSie bestätigen, dass jeder Beitrag diesen Standards entspricht und erklären sich damit einverstanden, uns für etwaige Verstöße schadlos zu halten. Dies bedeutet, dass Sie für alle daraus resultierenden Verluste oder Schäden verantwortlich sind, die uns entstehen können.\n\nHochgeladene Inhalte gelten als nicht vertraulich und nicht urheberrechtlich geschützt. Während Sie die Eigentumsrechte behalten, gewähren Sie uns eine begrenzte Lizenz zur Nutzung, Speicherung, Vervielfältigung, Verteilung und Weitergabe an Dritte. Einzelheiten zu dieser Lizenz sind unten aufgeführt.\n\nWir behalten uns das Recht vor, Ihre Identität gegenüber Dritten offenzulegen, die behaupten, dass Ihre Inhalte deren geistige Eigentumsrechte oder die Privatsphäre verletzen.\n\nWir behalten uns die Befugnis zur Entfernung vor Alle Beiträge auf unserer Website, die unseres Erachtens nicht unseren Inhaltsstandards entsprechen.\n\nSie tragen die Verantwortung für die Sicherung und Sicherung Ihrer Inhalte.',
      'es':
          'Al utilizar cualquier función que permita cargar contenido en nuestro sitio o interactuar con otros a través de nuestros canales de redes sociales, debe cumplir con los estándares de contenido descritos en nuestra Política de uso aceptable.\n\nAfirma que cualquier contribución cumple con estos estándares y acepta indemnizarnos por cualquier incumplimiento. Esto significa que usted es responsable de cualquier pérdida o daño resultante en el que podamos incurrir.\n\nEl contenido subido se considera no confidencial y no propietario. Si bien conserva los derechos de propiedad, nos otorga una licencia limitada para utilizarlos, almacenarlos, copiarlos, distribuirlos y compartirlos con terceros. Los detalles de esta licencia se especifican a continuación.\n\nNos reservamos el derecho de revelar su identidad a cualquier tercero que afirme que su contenido viola sus derechos de propiedad intelectual o privacidad.\n\nConservamos la autoridad para eliminar cualquier publicación en nuestro sitio que, a nuestro juicio, no cumpla con nuestros estándares de contenido.\n\nUsted es responsable de proteger y realizar copias de seguridad de su contenido.',
      'ro':
          'Când utilizați orice funcție care permite încărcarea de conținut pe site-ul nostru sau interacționați cu alții prin canalele noastre de socializare, trebuie să respectați standardele de conținut prezentate în Politica noastră de utilizare acceptabilă.\n\n Afirmați că orice contribuție respectă aceste standarde și sunteți de acord să ne despăgubiți pentru orice încălcare. Aceasta înseamnă că sunteți răspunzător pentru orice pierdere sau daune pe care le putem suferi.\n\nConținutul încărcat este considerat neconfidențial și neproprietar. În timp ce vă păstrați drepturile de proprietate, ne acordați o licență limitată de utilizare, stocare, copiere, distribuire și partajare cu terți. Detaliile acestei licențe sunt specificate mai jos.\n\nNe rezervăm dreptul de a vă dezvălui identitatea oricărei terțe părți care afirmă că conținutul dvs. încalcă drepturile de proprietate intelectuală sau confidențialitatea.\n\nNe păstrăm autoritatea de a elimina orice postări de pe site-ul nostru care, în opinia noastră, nu îndeplinesc standardele noastre de conținut.\n\nSunteți responsabilitatea pentru securizarea și salvarea conținutului dvs.',
    },
    'd47gfulv': {
      'en':
          'If you opt to adjust your preferences later during your browsing session, you can do so by clearing cookies and reloading the page. This action will prompt the consent notice to reappear, allowing you to customize your preferences or withdraw your consent entirely.\n\nMoreover, various browsers offer distinct methods to block and delete cookies utilized by websites. You can modify your browser settings to block or delete cookies. For further information on managing and deleting cookies, you can visit wikipedia.org or www.allaboutcookies.org.',
      'de':
          'Wenn Sie Ihre Einstellungen später während Ihrer Browsersitzung anpassen möchten, können Sie dies tun, indem Sie Cookies löschen und die Seite neu laden. Durch diese Aktion wird die Einwilligungserklärung erneut angezeigt, sodass Sie Ihre Einstellungen anpassen oder Ihre Einwilligung vollständig widerrufen können.\n\nDarüber hinaus bieten verschiedene Browser unterschiedliche Methoden zum Blockieren und Löschen von von Websites verwendeten Cookies. Sie können Ihre Browsereinstellungen ändern, um Cookies zu blockieren oder zu löschen. Weitere Informationen zum Verwalten und Löschen von Cookies finden Sie auf wikipedia.org oder www.allaboutcookies.org.',
      'es':
          'Si opta por ajustar sus preferencias más adelante durante su sesión de navegación, puede hacerlo borrando las cookies y recargando la página. Esta acción hará que vuelva a aparecer el aviso de consentimiento, lo que le permitirá personalizar sus preferencias o retirar su consentimiento por completo.\n\nAdemás, varios navegadores ofrecen distintos métodos para bloquear y eliminar las cookies utilizadas por los sitios web. Puede modificar la configuración de su navegador para bloquear o eliminar las cookies. Para obtener más información sobre cómo administrar y eliminar cookies, puede visitar wikipedia.org o www.allaboutcookies.org.',
      'ro':
          'Dacă alegeți să vă ajustați preferințele mai târziu în timpul sesiunii de navigare, puteți face acest lucru ștergând cookie-urile și reîncărcând pagina. Această acțiune va face ca notificarea de consimțământ să reapară, permițându-vă să vă personalizați preferințele sau să vă retrageți în totalitate consimțământul.\n\n În plus, diferite browsere oferă metode distincte de blocare și ștergere a cookie-urilor utilizate de site-uri web. Puteți modifica setările browserului pentru a bloca sau șterge cookie-urile. Pentru mai multe informații despre gestionarea și ștergerea cookie-urilor, puteți vizita wikipedia.org sau www.allaboutcookies.org.',
    },
    '6ribvnr8': {
      'en': 'The rights you grant us to utilize material you upload',
      'de':
          'Die Rechte, die Sie uns zur Nutzung des von Ihnen hochgeladenen Materials gewähren',
      'es': 'Los derechos que nos otorgas para utilizar el material que subes',
      'ro':
          'Drepturile pe care ni le acordați de a utiliza materialul pe care îl încărcați',
    },
    'pzmvh5y9': {
      'en':
          'By uploading or posting content to our site, you are granting us a perpetual, worldwide, non-exclusive, royalty-free, transferable license to use, reproduce, distribute, create derivative works of, display, and perform the user-generated content. Additionally, we may share, quote, and utilize it for promotional purposes, including on social media, to promote our site, products, and services.',
      'de':
          'Durch das Hochladen oder Veröffentlichen von Inhalten auf unserer Website gewähren Sie uns eine unbefristete, weltweite, nicht exklusive, gebührenfreie, übertragbare Lizenz zur Nutzung, Vervielfältigung, Verbreitung, Erstellung abgeleiteter Werke davon, Anzeige und Aufführung der benutzergenerierten Inhalte. Darüber hinaus können wir sie zu Werbezwecken teilen, zitieren und nutzen, auch in sozialen Medien, um für unsere Website, Produkte und Dienstleistungen zu werben.',
      'es':
          'Al cargar o publicar contenido en nuestro sitio, usted nos otorga una licencia perpetua, mundial, no exclusiva, libre de regalías y transferible para usar, reproducir, distribuir, crear trabajos derivados, mostrar y ejecutar el contenido generado por el usuario. Además, podemos compartirlo, citarlo y utilizarlo con fines promocionales, incluso en las redes sociales, para promocionar nuestro sitio, productos y servicios.',
      'ro':
          'Prin încărcarea sau postarea conținutului pe site-ul nostru, ne acordați o licență perpetuă, la nivel mondial, neexclusiv, fără drepturi de autor, transferabilă pentru a utiliza, reproduce, distribui, crea lucrări derivate, afișa și executa conținutul generat de utilizatori. În plus, îl putem distribui, cita și folosi în scopuri promoționale, inclusiv pe rețelele sociale, pentru a ne promova site-ul, produsele și serviciile.',
    },
    '9g4zjvt8': {
      'en':
          'If you opt to adjust your preferences later during your browsing session, you can do so by clearing cookies and reloading the page. This action will prompt the consent notice to reappear, allowing you to customize your preferences or withdraw your consent entirely.\n\nMoreover, various browsers offer distinct methods to block and delete cookies utilized by websites. You can modify your browser settings to block or delete cookies. For further information on managing and deleting cookies, you can visit wikipedia.org or www.allaboutcookies.org.',
      'de':
          'Wenn Sie Ihre Einstellungen später während Ihrer Browsersitzung anpassen möchten, können Sie dies tun, indem Sie Cookies löschen und die Seite neu laden. Durch diese Aktion wird die Einwilligungserklärung erneut angezeigt, sodass Sie Ihre Einstellungen anpassen oder Ihre Einwilligung vollständig widerrufen können.\n\nDarüber hinaus bieten verschiedene Browser unterschiedliche Methoden zum Blockieren und Löschen von von Websites verwendeten Cookies. Sie können Ihre Browsereinstellungen ändern, um Cookies zu blockieren oder zu löschen. Weitere Informationen zum Verwalten und Löschen von Cookies finden Sie auf wikipedia.org oder www.allaboutcookies.org.',
      'es':
          'Si opta por ajustar sus preferencias más adelante durante su sesión de navegación, puede hacerlo borrando las cookies y recargando la página. Esta acción hará que vuelva a aparecer el aviso de consentimiento, lo que le permitirá personalizar sus preferencias o retirar su consentimiento por completo.\n\nAdemás, varios navegadores ofrecen distintos métodos para bloquear y eliminar las cookies utilizadas por los sitios web. Puede modificar la configuración de su navegador para bloquear o eliminar las cookies. Para obtener más información sobre cómo administrar y eliminar cookies, puede visitar wikipedia.org o www.allaboutcookies.org.',
      'ro':
          'Dacă alegeți să vă ajustați preferințele mai târziu în timpul sesiunii de navigare, puteți face acest lucru ștergând cookie-urile și reîncărcând pagina. Această acțiune va face ca notificarea de consimțământ să reapară, permițându-vă să vă personalizați preferințele sau să vă retrageți în totalitate consimțământul.\n\n În plus, diferite browsere oferă metode distincte de blocare și ștergere a cookie-urilor utilizate de site-uri web. Puteți modifica setările browserului pentru a bloca sau șterge cookie-urile. Pentru mai multe informații despre gestionarea și ștergerea cookie-urilor, puteți vizita wikipedia.org sau www.allaboutcookies.org.',
    },
    'doeutzm0': {
      'en':
          'We do not assume responsibility for any viruses, and it is prohibited to introduce them.',
      'de':
          'Wir übernehmen keine Verantwortung für etwaige Viren und deren Einschleppung ist untersagt.',
      'es':
          'No asumimos responsabilidad por ningún virus y está prohibida su introducción.',
      'ro':
          'Nu ne asumăm responsabilitatea pentru niciun virus și este interzisă introducerea acestora.',
    },
    'ce5g8m5d': {
      'en':
          'We cannot assure that our site will always be secure or free from bugs or viruses.\n\nIt is your responsibility to set up your information technology, computer programs, and platform to access our site. You should have your own virus protection software in place.\n\nYou are prohibited from misusing our site by knowingly introducing viruses, trojans, worms, logic bombs, or any other material that is malicious or technologically harmful. You must not attempt to gain unauthorized access to our site, the server on which our site is stored, or any server, computer, or database connected to our site. You must not carry out any attack on our site, such as a denial-of-service attack or a distributed denial-of-service attack. Any violation of this provision would constitute a criminal offense under the Computer Misuse Act 1990. We will promptly report any such violation to the relevant law enforcement authorities and will cooperate with them by disclosing your identity. Your right to use our site will be terminated immediately in the event of such a breach.',
      'de':
          'Wir können nicht garantieren, dass unsere Website immer sicher oder frei von Fehlern oder Viren ist.\n\nEs liegt in Ihrer Verantwortung, Ihre Informationstechnologie, Computerprogramme und Plattform für den Zugriff auf unsere Website einzurichten. Sie sollten über Ihre eigene Virenschutzsoftware verfügen.\n\nEs ist Ihnen untersagt, unsere Website durch wissentliches Einschleusen von Viren, Trojanern, Würmern, Logikbomben oder anderen bösartigen oder technisch schädlichen Materialien zu missbrauchen. Sie dürfen nicht versuchen, sich unbefugten Zugriff auf unsere Website, den Server, auf dem unsere Website gespeichert ist, oder einen mit unserer Website verbundenen Server, Computer oder eine Datenbank zu verschaffen. Sie dürfen auf unserer Website keinen Angriff durchführen, beispielsweise einen Denial-of-Service-Angriff oder einen Distributed-Denial-of-Service-Angriff. Jeder Verstoß gegen diese Bestimmung würde eine Straftat im Sinne des Computer Misuse Act 1990 darstellen. Wir werden jeden solchen Verstoß unverzüglich den zuständigen Strafverfolgungsbehörden melden und mit ihnen zusammenarbeiten, indem wir Ihre Identität offenlegen. Im Falle eines solchen Verstoßes erlischt Ihr Recht zur Nutzung unserer Website sofort.',
      'es':
          'No podemos garantizar que nuestro sitio siempre sea seguro o esté libre de errores o virus.\n\nEs su responsabilidad configurar su tecnología de la información, sus programas informáticos y su plataforma para acceder a nuestro sitio. Debe contar con su propio software de protección antivirus.\n\nTiene prohibido hacer un mal uso de nuestro sitio al introducir intencionalmente virus, troyanos, gusanos, bombas lógicas o cualquier otro material que sea malicioso o tecnológicamente dañino. No debe intentar obtener acceso no autorizado a nuestro sitio, al servidor en el que está almacenado nuestro sitio ni a ningún servidor, computadora o base de datos conectada a nuestro sitio. No debe realizar ningún ataque a nuestro sitio, como un ataque de denegación de servicio o un ataque de denegación de servicio distribuido. Cualquier violación de esta disposición constituiría un delito penal según la Ley de uso indebido de computadoras de 1990. Informaremos de inmediato cualquier violación de este tipo a las autoridades policiales pertinentes y cooperaremos con ellas revelando su identidad. Su derecho a utilizar nuestro sitio finalizará inmediatamente en caso de tal incumplimiento.',
      'ro':
          'Nu putem asigura că site-ul nostru va fi întotdeauna sigur sau lipsit de erori sau viruși.\n\nEste responsabilitatea dvs. să vă configurați tehnologia informației, programele de calculator și platforma pentru a accesa site-ul nostru. Ar trebui să aveți propriul software de protecție împotriva virușilor.\n\nVi se interzice utilizarea greșită a site-ului nostru prin introducerea cu bună știință de viruși, troieni, viermi, bombe logice sau orice alt material rău intenționat sau dăunător din punct de vedere tehnologic. Nu trebuie să încercați să obțineți acces neautorizat la site-ul nostru, la serverul pe care este stocat site-ul nostru sau la orice server, computer sau bază de date conectată la site-ul nostru. Nu trebuie să efectuați niciun atac pe site-ul nostru, cum ar fi un atac de refuzare a serviciului sau un atac de refuzare a serviciului distribuit. Orice încălcare a acestei prevederi ar constitui o infracțiune conform Legii privind utilizarea abuzivă a computerului din 1990. Vom raporta prompt orice astfel de încălcare autorităților competente de aplicare a legii și vom coopera cu acestea prin dezvăluirea identității dumneavoastră. Dreptul dumneavoastră de a utiliza site-ul nostru va fi încetat imediat în cazul unei astfel de încălcări.',
    },
    '5o2bf70o': {
      'en':
          'If you opt to adjust your preferences later during your browsing session, you can do so by clearing cookies and reloading the page. This action will prompt the consent notice to reappear, allowing you to customize your preferences or withdraw your consent entirely.\n\nMoreover, various browsers offer distinct methods to block and delete cookies utilized by websites. You can modify your browser settings to block or delete cookies. For further information on managing and deleting cookies, you can visit wikipedia.org or www.allaboutcookies.org.',
      'de':
          'Wenn Sie Ihre Einstellungen später während Ihrer Browsersitzung anpassen möchten, können Sie dies tun, indem Sie Cookies löschen und die Seite neu laden. Durch diese Aktion wird die Einwilligungserklärung erneut angezeigt, sodass Sie Ihre Einstellungen anpassen oder Ihre Einwilligung vollständig widerrufen können.\n\nDarüber hinaus bieten verschiedene Browser unterschiedliche Methoden zum Blockieren und Löschen von von Websites verwendeten Cookies. Sie können Ihre Browsereinstellungen ändern, um Cookies zu blockieren oder zu löschen. Weitere Informationen zum Verwalten und Löschen von Cookies finden Sie auf wikipedia.org oder www.allaboutcookies.org.',
      'es':
          'Si opta por ajustar sus preferencias más adelante durante su sesión de navegación, puede hacerlo borrando las cookies y recargando la página. Esta acción hará que vuelva a aparecer el aviso de consentimiento, lo que le permitirá personalizar sus preferencias o retirar su consentimiento por completo.\n\nAdemás, varios navegadores ofrecen distintos métodos para bloquear y eliminar las cookies utilizadas por los sitios web. Puede modificar la configuración de su navegador para bloquear o eliminar las cookies. Para obtener más información sobre cómo administrar y eliminar cookies, puede visitar wikipedia.org o www.allaboutcookies.org.',
      'ro':
          'Dacă alegeți să vă ajustați preferințele mai târziu în timpul sesiunii de navigare, puteți face acest lucru ștergând cookie-urile și reîncărcând pagina. Această acțiune va face ca notificarea de consimțământ să reapară, permițându-vă să vă personalizați preferințele sau să vă retrageți în totalitate consimțământul.\n\n În plus, diferite browsere oferă metode distincte de blocare și ștergere a cookie-urilor utilizate de site-uri web. Puteți modifica setările browserului pentru a bloca sau șterge cookie-urile. Pentru mai multe informații despre gestionarea și ștergerea cookie-urilor, puteți vizita wikipedia.org sau www.allaboutcookies.org.',
    },
    '3ccrrf0e': {
      'en': 'When linking to our site',
      'de': 'Bei der Verlinkung auf unsere Seite',
      'es': 'Al vincular a nuestro sitio',
      'ro': 'Când vă conectați la site-ul nostru',
    },
    'wzplhwe9': {
      'en':
          'You are permitted to link to our home page, provided that you do so in a fair and legal manner that does not harm our reputation or exploit it.\n\nYour link must not imply any association, endorsement, or approval by us where none exists.\n\nLinks to our site should not be placed on websites that you do not own.\n\nOur site should not be framed within another site, and links should only direct to our home page, not to specific pages.\n\nWe reserve the right to revoke linking permission without prior notice.\n\nAny website linking to ours must adhere to the content standards outlined in our ',
      'de':
          'Es ist Ihnen gestattet, auf unsere Homepage zu verlinken, sofern Sie dies auf faire und rechtmäßige Weise tun, die unserem Ruf nicht schadet oder ihn ausnutzt.\n\nIhr Link darf keine Verbindung, Billigung oder Genehmigung durch uns implizieren uns, wo es keine gibt.\n\nLinks zu unserer Website sollten nicht auf Websites platziert werden, die Ihnen nicht gehören.\n\nUnsere Website sollte nicht in eine andere Website eingebunden werden und Links sollten nur auf unsere verweisen Homepage, nicht auf bestimmte Seiten.\n\nWir behalten uns das Recht vor, die Verlinkungsgenehmigung ohne vorherige Ankündigung zu widerrufen.\n\nJede Website, die auf unsere verlinkt, muss den in unserer Website dargelegten Inhaltsstandards entsprechen',
      'es':
          'Se le permite vincularse a nuestra página de inicio, siempre que lo haga de manera justa y legal que no dañe nuestra reputación ni la explote.\n\nSu vínculo no debe implicar ninguna asociación, respaldo o aprobación por parte de nosotros donde no existe ninguno.\n\nLos enlaces a nuestro sitio no deben colocarse en sitios web que no sean de su propiedad.\n\nNuestro sitio no debe estar enmarcado dentro de otro sitio, y los enlaces solo deben dirigir a nuestro página de inicio, no a páginas específicas.\n\nNos reservamos el derecho de revocar el permiso de enlace sin previo aviso.\n\nCualquier sitio web que enlace al nuestro debe cumplir con los estándares de contenido descritos en nuestra',
      'ro':
          'Vi se permite să creați un link către pagina noastră de pornire, cu condiția să faceți acest lucru într-un mod corect și legal, care să nu dăuneze reputației noastre sau să o exploateze.\n\nLegătura dvs. nu trebuie să implice nicio asociere, aprobare sau aprobare de către noi acolo unde nu există niciunul.\n\nLegăturile către site-ul nostru nu ar trebui să fie plasate pe site-uri web pe care nu le dețineți.\n\nSite-ul nostru nu trebuie să fie încadrat într-un alt site, iar linkurile ar trebui să direcționeze numai către site-ul nostru. pagina de pornire, nu către anumite pagini.\n\nNe rezervăm dreptul de a revoca permisiunea de conectare fără notificare prealabilă.\n\nOrice site web care trimite către al nostru trebuie să respecte standardele de conținut prezentate în',
    },
    'd3pvkbyy': {
      'en': 'Acceptable Use Policy.\n',
      'de': 'Richtlinien zur akzeptablen Nutzung.',
      'es': 'Política de uso aceptable.',
      'ro': 'Politica de utilizare acceptabilă.',
    },
    'rt39rbpk': {
      'en':
          'For any other linking or content use requests beyond those mentioned, please reach out to ',
      'de':
          'Für alle weiteren Anfragen zur Verlinkung oder Inhaltsnutzung, die über die genannten hinausgehen, wenden Sie sich bitte an',
      'es':
          'Para cualquier otro enlace o solicitud de uso de contenido más allá de los mencionados, comuníquese con',
      'ro':
          'Pentru orice alte solicitări de conectare sau utilizare a conținutului în afara celor menționate, vă rugăm să contactați',
    },
    'ltynio7n': {
      'en': 'contact@bluedash.co.uk.',
      'de': 'contact@bluedash.co.uk.',
      'es': 'contact@bluedash.co.uk.',
      'ro': 'contact@bluedash.co.uk.',
    },
    '9n11za0x': {
      'en':
          'If you opt to adjust your preferences later during your browsing session, you can do so by clearing cookies and reloading the page. This action will prompt the consent notice to reappear, allowing you to customize your preferences or withdraw your consent entirely.\n\nMoreover, various browsers offer distinct methods to block and delete cookies utilized by websites. You can modify your browser settings to block or delete cookies. For further information on managing and deleting cookies, you can visit wikipedia.org or www.allaboutcookies.org.',
      'de':
          'Wenn Sie Ihre Einstellungen später während Ihrer Browsersitzung anpassen möchten, können Sie dies tun, indem Sie Cookies löschen und die Seite neu laden. Durch diese Aktion wird die Einwilligungserklärung erneut angezeigt, sodass Sie Ihre Einstellungen anpassen oder Ihre Einwilligung vollständig widerrufen können.\n\nDarüber hinaus bieten verschiedene Browser unterschiedliche Methoden zum Blockieren und Löschen von von Websites verwendeten Cookies. Sie können Ihre Browsereinstellungen ändern, um Cookies zu blockieren oder zu löschen. Weitere Informationen zum Verwalten und Löschen von Cookies finden Sie auf wikipedia.org oder www.allaboutcookies.org.',
      'es':
          'Si opta por ajustar sus preferencias más adelante durante su sesión de navegación, puede hacerlo borrando las cookies y recargando la página. Esta acción hará que vuelva a aparecer el aviso de consentimiento, lo que le permitirá personalizar sus preferencias o retirar su consentimiento por completo.\n\nAdemás, varios navegadores ofrecen distintos métodos para bloquear y eliminar las cookies utilizadas por los sitios web. Puede modificar la configuración de su navegador para bloquear o eliminar las cookies. Para obtener más información sobre cómo administrar y eliminar cookies, puede visitar wikipedia.org o www.allaboutcookies.org.',
      'ro':
          'Dacă alegeți să vă ajustați preferințele mai târziu în timpul sesiunii de navigare, puteți face acest lucru ștergând cookie-urile și reîncărcând pagina. Această acțiune va face ca notificarea de consimțământ să reapară, permițându-vă să vă personalizați preferințele sau să vă retrageți în totalitate consimțământul.\n\n În plus, diferite browsere oferă metode distincte de blocare și ștergere a cookie-urilor utilizate de site-uri web. Puteți modifica setările browserului pentru a bloca sau șterge cookie-urile. Pentru mai multe informații despre gestionarea și ștergerea cookie-urilor, puteți vizita wikipedia.org sau www.allaboutcookies.org.',
    },
    'nbm9tc93': {
      'en':
          '\nWhich country\'s laws govern any disputes arising from the use of our site?',
      'de':
          'Welches Landesrecht regelt etwaige Streitigkeiten, die sich aus der Nutzung unserer Website ergeben?',
      'es':
          '¿Las leyes de qué país rigen cualquier disputa que surja del uso de nuestro sitio?',
      'ro':
          'Legile din care țară guvernează orice dispute care decurg din utilizarea site-ului nostru?',
    },
    'xuafmrvq': {
      'en':
          'These terms of use, along with their subject matter and formation, are governed by the laws of England. Both parties agree that any disputes between us shall be exclusively dealt with by the courts of England and Wales.',
      'de':
          'Diese Nutzungsbedingungen sowie ihr Inhalt und ihre Gestaltung unterliegen den Gesetzen Englands. Beide Parteien vereinbaren, dass alle Streitigkeiten zwischen uns ausschließlich von den Gerichten von England und Wales verhandelt werden.',
      'es':
          'Estos términos de uso, junto con su tema y formación, se rigen por las leyes de Inglaterra. Ambas partes acuerdan que cualquier disputa entre nosotros será tratada exclusivamente en los tribunales de Inglaterra y Gales.',
      'ro':
          'Acești termeni de utilizare, împreună cu subiectul și formarea lor, sunt guvernați de legile Angliei. Ambele părți sunt de acord că orice dispută dintre noi va fi soluționată exclusiv de instanțele din Anglia și Țara Galilor.',
    },
    'kedgq8hp': {
      'en':
          'If you opt to adjust your preferences later during your browsing session, you can do so by clearing cookies and reloading the page. This action will prompt the consent notice to reappear, allowing you to customize your preferences or withdraw your consent entirely.\n\nMoreover, various browsers offer distinct methods to block and delete cookies utilized by websites. You can modify your browser settings to block or delete cookies. For further information on managing and deleting cookies, you can visit wikipedia.org or www.allaboutcookies.org.',
      'de':
          'Wenn Sie Ihre Einstellungen später während Ihrer Browsersitzung anpassen möchten, können Sie dies tun, indem Sie Cookies löschen und die Seite neu laden. Durch diese Aktion wird die Einwilligungserklärung erneut angezeigt, sodass Sie Ihre Einstellungen anpassen oder Ihre Einwilligung vollständig widerrufen können.\n\nDarüber hinaus bieten verschiedene Browser unterschiedliche Methoden zum Blockieren und Löschen von von Websites verwendeten Cookies. Sie können Ihre Browsereinstellungen ändern, um Cookies zu blockieren oder zu löschen. Weitere Informationen zum Verwalten und Löschen von Cookies finden Sie auf wikipedia.org oder www.allaboutcookies.org.',
      'es':
          'Si opta por ajustar sus preferencias más adelante durante su sesión de navegación, puede hacerlo borrando las cookies y recargando la página. Esta acción hará que vuelva a aparecer el aviso de consentimiento, lo que le permitirá personalizar sus preferencias o retirar su consentimiento por completo.\n\nAdemás, varios navegadores ofrecen distintos métodos para bloquear y eliminar las cookies utilizadas por los sitios web. Puede modificar la configuración de su navegador para bloquear o eliminar las cookies. Para obtener más información sobre cómo administrar y eliminar cookies, puede visitar wikipedia.org o www.allaboutcookies.org.',
      'ro':
          'Dacă alegeți să vă ajustați preferințele mai târziu în timpul sesiunii de navigare, puteți face acest lucru ștergând cookie-urile și reîncărcând pagina. Această acțiune va face ca notificarea de consimțământ să reapară, permițându-vă să vă personalizați preferințele sau să vă retrageți în totalitate consimțământul.\n\n În plus, diferite browsere oferă metode distincte de blocare și ștergere a cookie-urilor utilizate de site-uri web. Puteți modifica setările browserului pentru a bloca sau șterge cookie-urile. Pentru mai multe informații despre gestionarea și ștergerea cookie-urilor, puteți vizita wikipedia.org sau www.allaboutcookies.org.',
    },
    'qsc4ykyt': {
      'en': 'Home',
      'de': 'Heim',
      'es': 'Hogar',
      'ro': 'Acasă',
    },
  },
  // AboutUs
  {
    'wc8bp9ym': {
      'en': 'About us',
      'de': 'Über uns',
      'es': 'Sobre nosotros',
      'ro': 'Despre noi',
    },
    '5pn7obtk': {
      'en': 'About us',
      'de': 'Über uns',
      'es': 'Sobre nosotros',
      'ro': 'Despre noi',
    },
    'qd1qguhb': {
      'en': 'Welcome to',
      'de': 'Willkommen zu',
      'es': 'Bienvenido a',
      'ro': 'Bun venit la',
    },
    'xxjw0dsq': {
      'en': 'Bounty Fever',
      'de': 'Kopfgeldfieber',
      'es': 'Fiebre de recompensa',
      'ro': 'Bounty Fever',
    },
    '81hlpcmd': {
      'en':
          ', your ultimate destination for exciting giveaways and amazing prizes! At Bounty Fever, we strive to provide a unique opportunity for individuals to win high-quality rewards. Whether you\'re eager to participate and win, we\'re here to make your experience unforgettable!',
      'de':
          ', Ihr ultimatives Ziel für spannende Giveaways und tolle Preise! Bei Bounty Fever sind wir bestrebt, Einzelpersonen eine einzigartige Gelegenheit zu bieten, hochwertige Belohnungen zu gewinnen. Egal, ob Sie unbedingt teilnehmen und gewinnen möchten, wir sind hier, um Ihr Erlebnis unvergesslich zu machen!',
      'es':
          ', ¡su destino final para obsequios emocionantes y premios increíbles! En Bounty Fever, nos esforzamos por brindar una oportunidad única para que las personas ganen recompensas de alta calidad. Ya sea que esté ansioso por participar y ganar, ¡estamos aquí para hacer que su experiencia sea inolvidable!',
      'ro':
          ', destinația ta finală pentru cadouri interesante și premii uimitoare! La Bounty Fever, ne străduim să oferim indivizilor o oportunitate unică de a câștiga recompense de înaltă calitate. Indiferent dacă ești dornic să participi și să câștigi, suntem aici pentru a-ți face experiența de neuitat!',
    },
    'jpy2mz9h': {
      'en':
          '\nThis Cookie Policy elucidates the nature of cookies, their utilization, the varieties employed, the data they gather, and its application, as well as how to manage cookie preferences. For additional details on the handling, storage, and security of your personal information, please refer to our Privacy Policy.\nYou have the option to modify or retract your consent regarding the Cookie Declaration on our website at any given time. Additionally, you can access further insights into our identity, contact methods, and personal data processing in our Privacy Policy.\nYour consent pertains to the following domains: bountyfever.com',
      'de':
          'Diese Cookie-Richtlinie erläutert die Art von Cookies, ihre Verwendung, die verwendeten Sorten, die von ihnen erfassten Daten und ihre Anwendung sowie die Verwaltung der Cookie-Einstellungen. Weitere Einzelheiten zur Handhabung, Speicherung und Sicherheit Ihrer personenbezogenen Daten finden Sie in unserer Datenschutzerklärung.\nSie haben jederzeit die Möglichkeit, Ihre Einwilligung zur Cookie-Erklärung auf unserer Website zu ändern oder zu widerrufen. Darüber hinaus können Sie in unserer Datenschutzrichtlinie auf weitere Einblicke in unsere Identität, Kontaktmethoden und Verarbeitung personenbezogener Daten zugreifen.\nIhre Einwilligung gilt für die folgenden Domains: bountyfever.com',
      'es':
          'Esta Política de Cookies aclara la naturaleza de las cookies, su utilización, las variedades empleadas, los datos que recopilan y su aplicación, así como cómo gestionar las preferencias de cookies. Para obtener detalles adicionales sobre el manejo, almacenamiento y seguridad de su información personal, consulte nuestra Política de Privacidad.\nTiene la opción de modificar o retirar su consentimiento con respecto a la Declaración de Cookies en nuestro sitio web en cualquier momento. Además, puede acceder a más información sobre nuestra identidad, métodos de contacto y procesamiento de datos personales en nuestra Política de Privacidad.\nSu consentimiento se refiere a los siguientes dominios: bountyfever.com',
      'ro':
          'Această Politică privind cookie-urile elucidează natura cookie-urilor, utilizarea lor, varietățile utilizate, datele pe care le adună și aplicarea acesteia, precum și modul de gestionare a preferințelor cookie. Pentru detalii suplimentare despre manipularea, stocarea și securitatea informațiilor dvs. personale, vă rugăm să consultați Politica noastră de confidențialitate.\nAveți opțiunea de a modifica sau de a vă retrage consimțământul cu privire la Declarația privind cookie-urile de pe site-ul nostru web în orice moment. În plus, puteți accesa informații suplimentare despre identitatea noastră, metodele de contact și prelucrarea datelor cu caracter personal în Politica noastră de confidențialitate.\nConsimțământul dvs. se referă la următoarele domenii: bountyfever.com',
    },
    'avmcibo3': {
      'en': 'Who We Are',
      'de': 'Wer wir sind',
      'es': 'Quienes somos',
      'ro': 'Cine suntem noi',
    },
    '7kshp176': {
      'en':
          'Bounty Fever, operated by Bluedash LTD, is a UK-based company established in March 2024. Our mission is to offer a platform for people to win luxury prizes. We collaborate with renowned brands and companies to give our customers the chance to win top-notch products and experiences.',
      'de':
          'Bounty Fever, betrieben von Bluedash LTD, ist ein im März 2024 gegründetes Unternehmen mit Sitz in Großbritannien. Unsere Mission ist es, Menschen eine Plattform zu bieten, auf der sie Luxuspreise gewinnen können. Wir arbeiten mit renommierten Marken und Unternehmen zusammen, um unseren Kunden die Chance zu geben, erstklassige Produkte und Erlebnisse zu gewinnen.',
      'es':
          'Bounty Fever, operada por Bluedash LTD, es una empresa con sede en el Reino Unido establecida en marzo de 2024. Nuestra misión es ofrecer una plataforma para que las personas ganen premios de lujo. Colaboramos con marcas y empresas de renombre para brindarles a nuestros clientes la oportunidad de ganar productos y experiencias de primer nivel.',
      'ro':
          'Bounty Fever, operată de Bluedash LTD, este o companie cu sediul în Marea Britanie înființată în martie 2024. Misiunea noastră este să oferim o platformă pentru ca oamenii să câștige premii de lux. Colaborăm cu mărci și companii renumite pentru a oferi clienților noștri șansa de a câștiga produse și experiențe de top.',
    },
    'dqgbs7jk': {
      'en':
          'You are permitted to use our site solely for lawful purposes. You must refrain from using our site:\n\n- In any manner that violates any applicable local, national, or international laws or regulations.\n- In any manner that is unlawful or fraudulent, or serves any unlawful or fraudulent intent.\n- With the intention of causing harm or attempting to harm minors in any way.\n- To send, knowingly receive, upload, download, use, or re-use any material that does not adhere to our content standards as outlined below.\n- To transmit, or solicit the transmission of, any unsolicited or unauthorized advertising, promotional material, or any other form of similar solicitation (spam).\n- To knowingly transmit any data, send or upload any material containing viruses, Trojan horses, worms, time-bombs, keystroke loggers, spyware, adware, or any other harmful programs or similar computer code designed to adversely affect the operation of any computer software or hardware.\n\nAdditionally, you agree:\n\n- Not to reproduce, duplicate, copy, or resell any part of our site in violation of the provisions of our ',
      'de':
          'Es ist Ihnen gestattet, unsere Website ausschließlich für rechtmäßige Zwecke zu nutzen. Sie dürfen unsere Website nicht nutzen:\n\n- In jeglicher Weise, die gegen geltende lokale, nationale oder internationale Gesetze oder Vorschriften verstößt.\n- In jeglicher Weise, die rechtswidrig oder betrügerisch ist oder einer rechtswidrigen oder rechtswidrigen Art dient betrügerische Absicht.\n- Mit der Absicht, Minderjährigen Schaden zuzufügen oder zu versuchen, Minderjährigen in irgendeiner Weise zu schaden.\n- Zum Senden, wissentlichen Empfangen, Hochladen, Herunterladen, Verwenden oder Wiederverwenden von Material, das nicht unseren Bestimmungen entspricht Inhaltsstandards wie unten beschrieben.\n- Um unaufgeforderte oder unbefugte Werbung, Verkaufsförderungsmaterial oder jede andere Form ähnlicher Werbung (Spam) zu übermitteln oder deren Übertragung anzufordern.\n- Um wissentlich Daten zu übermitteln, senden Sie oder Material hochzuladen, das Viren, Trojaner, Würmer, Zeitbomben, Tastenanschlag-Logger, Spyware, Adware oder andere schädliche Programme oder ähnlichen Computercode enthält, der den Betrieb von Computersoftware oder -hardware beeinträchtigen soll.\n<__FFNL__ >Darüber hinaus erklären Sie sich damit einverstanden:\n\n- Keinen Teil unserer Website unter Verletzung unserer Bestimmungen zu reproduzieren, zu duplizieren, zu kopieren oder weiterzuverkaufen',
      'es':
          'Se le permite utilizar nuestro sitio únicamente para fines legales. Debe abstenerse de utilizar nuestro sitio:\n\n- De cualquier manera que viole cualquier ley o reglamento local, nacional o internacional aplicable.\n- De cualquier manera que sea ilegal o fraudulenta, o que sirva para cualquier uso ilegal o intención fraudulenta.\n- Con la intención de causar daño o intentar dañar a menores de cualquier manera.\n- Para enviar, recibir, cargar, descargar, usar o reutilizar a sabiendas cualquier material que no se adhiera a nuestras estándares de contenido como se describe a continuación.\n- Para transmitir o solicitar la transmisión de cualquier publicidad no solicitada o no autorizada, material promocional o cualquier otra forma de solicitud similar (spam).\n- Para transmitir conscientemente cualquier dato, envíe ni cargar ningún material que contenga virus, caballos de Troya, gusanos, bombas de tiempo, registradores de pulsaciones de teclas, spyware, adware o cualquier otro programa dañino o código informático similar diseñado para afectar negativamente el funcionamiento de cualquier software o hardware informático.\n<__FFNL__ >Adicionalmente, usted acepta:\n\n- No reproducir, duplicar, copiar o revender ninguna parte de nuestro sitio en violación de las disposiciones de nuestra',
      'ro':
          'Vi se permite să utilizați site-ul nostru exclusiv în scopuri legale. Trebuie să vă abțineți de la a utiliza site-ul nostru:\n\n- În orice mod care încalcă orice lege sau reglementări locale, naționale sau internaționale aplicabile.\n- În orice mod care este ilegal sau fraudulos, sau servește oricărui intenție frauduloasă.\n- Cu intenția de a provoca prejudicii sau de a încerca să rănească minori în orice fel.\n- Pentru a trimite, primi, încărca, descărca, utiliza sau reutiliza orice material care nu aderă la dispozițiile noastre. standardele de conținut, așa cum sunt prezentate mai jos.\n- Pentru a transmite sau solicita transmiterea oricărei reclame nesolicitate sau neautorizate, materiale promoționale sau orice altă formă de solicitare similară (spam).\n- Pentru a transmite cu bună știință orice date, trimiteți sau încărcați orice material care conține viruși, cai troieni, viermi, bombe cu ceas, înregistrări de taste, spyware, adware sau orice alte programe dăunătoare sau cod de computer similar conceput pentru a afecta negativ funcționarea oricărui software sau hardware de computer.\n<__FFNL__ >În plus, sunteți de acord cu:\n\n- să nu reproduceți, duplicați, copiați sau revindeți nicio parte a site-ului nostru, încălcând prevederile noastre',
    },
    '8tvffmqi': {
      'en': 'Why Choose Bounty Fever?',
      'de': 'Warum Bounty Fever wählen?',
      'es': '¿Por qué elegir Bounty Fever?',
      'ro': 'De ce să alegeți Bounty Fever?',
    },
    'hbrsv55j': {
      'en':
          'There are countless reasons to choose Bounty Fever for your online giveaway needs.\n Here are just a few:\n',
      'de':
          'Es gibt unzählige Gründe, Bounty Fever für Ihre Online-Werbegeschenke zu wählen.\n Hier sind nur einige:',
      'es':
          'Existen innumerables razones para elegir Bounty Fever para sus necesidades de obsequios en línea.\n Estas son solo algunas:',
      'ro':
          'Există nenumărate motive pentru a alege Bounty Fever pentru nevoile tale de cadouri online.\n Iată doar câteva:',
    },
    'gwefcblr': {
      'en': 'Live Draws',
      'de': 'Live-Ziehungen',
      'es': 'Sorteos en vivo',
      'ro': 'Deciderea castigatorului live',
    },
    'schubukn': {
      'en':
          ': All our contests are conducted through live draws, streamed on our website and social media channels (TikTok, YouTube, Facebook). This ensures fairness and transparency, allowing customers to witness the selection of winners in real-time.\n',
      'de':
          ': Alle unsere Wettbewerbe werden durch Live-Ziehungen durchgeführt, die auf unserer Website und in den Social-Media-Kanälen (TikTok, YouTube, Facebook) gestreamt werden. Dies sorgt für Fairness und Transparenz und ermöglicht es den Kunden, die Auswahl der Gewinner in Echtzeit mitzuerleben.',
      'es':
          ': Todos nuestros concursos se realizan a través de sorteos en vivo, transmitidos en nuestro sitio web y canales de redes sociales (TikTok, YouTube, Facebook). Esto garantiza equidad y transparencia, permitiendo a los clientes presenciar la selección de ganadores en tiempo real.',
      'ro':
          ': Toate concursurile noastre se desfășoară prin trageri în direct, transmise pe site-ul nostru web și canalele de socializare (TikTok, YouTube, Facebook). Acest lucru asigură corectitudinea și transparența, permițând clienților să asista la selecția câștigătorilor în timp real.',
    },
    '9z360wha': {
      'en': 'High-Quality Prizes:',
      'de': 'Hochwertige Preise:',
      'es': 'Premios de alta calidad:',
      'ro': 'Premii de înaltă calitate:',
    },
    'c47ndbmv': {
      'en':
          ' We exclusively partner with top brands and companies to offer customers the opportunity to win luxury products and experiences. From gadgets and electronics to luxurious vacations and state-of-the-art technology, our recent prizes speak for themselves.\n',
      'de':
          'Wir arbeiten ausschließlich mit Top-Marken und -Unternehmen zusammen, um Kunden die Möglichkeit zu bieten, Luxusprodukte und -erlebnisse zu gewinnen. Von Gadgets und Elektronik bis hin zu luxuriösen Ferien und modernster Technologie – unsere aktuellen Preise sprechen für sich.',
      'es':
          'Nos asociamos exclusivamente con las mejores marcas y empresas para ofrecer a los clientes la oportunidad de ganar productos y experiencias de lujo. Desde aparatos y productos electrónicos hasta vacaciones de lujo y tecnología de punta, nuestros premios recientes hablan por sí solos.',
      'ro':
          'Colaboram exclusiv cu branduri și companii de top pentru a oferi clienților posibilitatea de a câștiga produse și experiențe de lux. De la gadgeturi și electronice până la vacanțe de lux și tehnologie de ultimă oră, premiile noastre recente vorbesc de la sine.',
    },
    '3627wkmf': {
      'en': 'Exceptional Customer Service',
      'de': 'Außergewöhnlicher Kundenservice',
      'es': 'Servicio al cliente excepcional',
      'ro': 'Serviciu Clienți excepțional',
    },
    'rc1pcxjr': {
      'en':
          ': Our dedicated customer service team is always available to address any questions or concerns you may have. We take pride in providing excellent customer service and strive to offer our customers the best experience possible.\n',
      'de':
          ': Unser engagiertes Kundendienstteam steht Ihnen jederzeit für Fragen oder Bedenken zur Verfügung. Wir sind stolz darauf, exzellenten Kundenservice zu bieten und sind bestrebt, unseren Kunden das bestmögliche Erlebnis zu bieten.',
      'es':
          ': Nuestro dedicado equipo de atención al cliente está siempre disponible para responder cualquier pregunta o inquietud que pueda tener. Estamos orgullosos de brindar un excelente servicio al cliente y nos esforzamos por ofrecer a nuestros clientes la mejor experiencia posible.',
      'ro':
          ': Echipa noastră dedicată de servicii pentru clienți este întotdeauna disponibilă pentru a răspunde oricăror întrebări sau nelămuriri pe care le aveți. Ne mândrim să oferim servicii excelente pentru clienți și ne străduim să oferim clienților noștri cea mai bună experiență posibilă.',
    },
    'm9694pcf': {
      'en': 'Join the Fun! ',
      'de': 'Machen Sie mit!',
      'es': '¡Únete a la diversión!',
      'ro': 'Alatura-te distractiei!',
    },
    'pax21s40': {
      'en':
          ' Participating in our contests is easy. Simply visit our website, choose the contest you\'d like to enter, answer the competition question correctly, select the number of entries, and securely pay online. We\'ll then add your name and numbers to the draw, and you can watch the live draw to see if you\'re a winner. Join us today to get started!',
      'de':
          'Die Teilnahme an unseren Wettbewerben ist ganz einfach. Besuchen Sie einfach unsere Website, wählen Sie den Wettbewerb aus, an dem Sie teilnehmen möchten, beantworten Sie die Wettbewerbsfrage richtig, wählen Sie die Anzahl der Einsendungen aus und zahlen Sie sicher online. Wir fügen dann Ihren Namen und Ihre Nummern zur Verlosung hinzu und Sie können die Live-Auslosung verfolgen, um zu sehen, ob Sie ein Gewinner sind. Begleiten Sie uns noch heute, um loszulegen!',
      'es':
          'Participar en nuestros concursos es fácil. Simplemente visite nuestro sitio web, elija el concurso en el que desea participar, responda correctamente la pregunta del concurso, seleccione el número de entradas y pague en línea de forma segura. Luego agregaremos su nombre y números al sorteo y podrá ver el sorteo en vivo para ver si es el ganador. ¡Únase a nosotros hoy para comenzar!',
      'ro':
          'Participarea la concursurile noastre este ușoară. Pur și simplu vizitați site-ul nostru, alegeți concursul în care doriți să participați, răspundeți corect la întrebarea competiției, selectați numărul de înscrieri și plătiți online în siguranță. Vom adăuga apoi numele și numerele dvs. la extragere și puteți urmări extragerea live pentru a vedea dacă sunteți câștigător. Alăturați-vă nouă astăzi pentru a începe!',
    },
    'f1kom8sl': {
      'en':
          'There are countless reasons to choose Bounty Fever for your online giveaway needs. Here are just a few:\n\nLive Draws: All our contests are conducted through live draws, streamed on our website and social media channels (TikTok, YouTube, Facebook). This ensures fairness and transparency, allowing customers to witness the selection of winners in real-time.\n\nHigh-Quality Prizes: We exclusively partner with top brands and companies to offer customers the opportunity to win luxury products and experiences. From gadgets and electronics to luxurious vacations and state-of-the-art vehicles, our recent prizes speak for themselves.\n\nExceptional Customer Service: Our dedicated customer service team is always available to address any questions or concerns you may have. We take pride in providing excellent customer service and strive to offer our customers the best experience possible.\n\nJoin the Fun! Participating in our contests is easy. Simply visit our website, choose the contest you\'d like to enter, answer the competition question correctly, select the number of entries, and securely pay online. We\'ll then add your name and numbers to the draw, and you can watch the live draw to see if you\'re a winner. Join us today to get started!',
      'de':
          'Es gibt unzählige Gründe, Bounty Fever für Ihre Online-Werbegeschenke zu wählen. Hier sind nur einige:\n\nLive-Ziehungen: Alle unsere Wettbewerbe werden durch Live-Ziehungen durchgeführt, die auf unserer Website und in den sozialen Medienkanälen (TikTok, YouTube, Facebook) gestreamt werden. Dies sorgt für Fairness und Transparenz und ermöglicht es Kunden, die Auswahl der Gewinner in Echtzeit mitzuerleben.\n\nHochwertige Preise: Wir arbeiten ausschließlich mit Top-Marken und -Unternehmen zusammen, um Kunden die Möglichkeit zu bieten, Luxusprodukte und -erlebnisse zu gewinnen. Von Gadgets und Elektronik bis hin zu luxuriösen Ferien und hochmodernen Fahrzeugen – unsere aktuellen Preise sprechen für sich.\n\nAußergewöhnlicher Kundenservice: Unser engagiertes Kundenservice-Team steht Ihnen jederzeit für Fragen und Anliegen zur Verfügung haben. Wir sind stolz darauf, exzellenten Kundenservice zu bieten und sind bestrebt, unseren Kunden das bestmögliche Erlebnis zu bieten.\n\nMachen Sie mit! Die Teilnahme an unseren Wettbewerben ist ganz einfach. Besuchen Sie einfach unsere Website, wählen Sie den Wettbewerb aus, an dem Sie teilnehmen möchten, beantworten Sie die Wettbewerbsfrage richtig, wählen Sie die Anzahl der Einsendungen aus und zahlen Sie sicher online. Wir fügen dann Ihren Namen und Ihre Nummern zur Verlosung hinzu und Sie können die Live-Auslosung verfolgen, um zu sehen, ob Sie ein Gewinner sind. Begleiten Sie uns noch heute, um loszulegen!',
      'es':
          'Existen innumerables razones para elegir Bounty Fever para sus necesidades de obsequios en línea. Estos son solo algunos:\n\nSorteos en vivo: todos nuestros concursos se llevan a cabo a través de sorteos en vivo, transmitidos en nuestro sitio web y canales de redes sociales (TikTok, YouTube, Facebook). Esto garantiza equidad y transparencia, permitiendo a los clientes ser testigos de la selección de los ganadores en tiempo real.\n\nPremios de alta calidad: nos asociamos exclusivamente con las mejores marcas y empresas para ofrecer a los clientes la oportunidad de ganar productos y experiencias de lujo. Desde aparatos y productos electrónicos hasta vacaciones de lujo y vehículos de última generación, nuestros premios recientes hablan por sí solos.\n\nServicio al cliente excepcional: nuestro dedicado equipo de servicio al cliente está siempre disponible para responder cualquier pregunta o inquietud que pueda tener. tener. Estamos orgullosos de brindar un excelente servicio al cliente y nos esforzamos por ofrecerles la mejor experiencia posible.\n\n¡Únase a la diversión! Participar en nuestros concursos es fácil. Simplemente visite nuestro sitio web, elija el concurso en el que desea participar, responda correctamente la pregunta del concurso, seleccione el número de entradas y pague en línea de forma segura. Luego agregaremos su nombre y números al sorteo y podrá ver el sorteo en vivo para ver si es el ganador. ¡Únase a nosotros hoy para comenzar!',
      'ro':
          'Există nenumărate motive pentru a alege Bounty Fever pentru nevoile tale de cadouri online. Iată doar câteva:\n\nTrageri live: Toate concursurile noastre se desfășoară prin trageri live, transmise pe site-ul nostru web și canalele de socializare (TikTok, YouTube, Facebook). Acest lucru asigură corectitudinea și transparența, permițând clienților să asista la selecția câștigătorilor în timp real.\n\nPremii de înaltă calitate: Colaboram exclusiv cu mărci și companii de top pentru a oferi clienților posibilitatea de a câștiga produse și experiențe de lux. De la gadgeturi și electronice până la vacanțe de lux și vehicule de ultimă generație, premiile noastre recente vorbesc de la sine.\n\nServicii clienți excepționali: echipa noastră dedicată de servicii pentru clienți este întotdeauna disponibilă pentru a răspunde oricăror întrebări sau nelămuriri. avea. Ne mândrim să oferim servicii excelente pentru clienți și ne străduim să oferim clienților noștri cea mai bună experiență posibilă.\n\nAlăturați-vă distracției! Participarea la concursurile noastre este ușoară. Pur și simplu vizitați site-ul nostru, alegeți concursul în care doriți să participați, răspundeți corect la întrebarea competiției, selectați numărul de înscrieri și plătiți online în siguranță. Vom adăuga apoi numele și numerele dvs. la extragere și puteți urmări extragerea live pentru a vedea dacă sunteți câștigător. Alăturați-vă nouă astăzi pentru a începe!',
    },
    'ejkmd8ge': {
      'en': 'Contact Us',
      'de': 'Kontaktiere uns',
      'es': 'Contáctenos',
      'ro': 'Contactaţi-ne',
    },
    '124g3mb1': {
      'en':
          'If you have any questions or inquiries, please don\'t hesitate to reach out to us at [contact email]. Our team is here to assist you and ensure you have an amazing experience with Bounty Fever.\n\nThank you for visiting Bounty Fever. We hope you find something exciting to win. Good luck!\n',
      'de':
          'Wenn Sie Fragen oder Anregungen haben, zögern Sie bitte nicht, uns unter [Kontakt-E-Mail] zu kontaktieren. Unser Team ist hier, um Ihnen zu helfen und sicherzustellen, dass Sie ein fantastisches Erlebnis mit Bounty Fever haben.\n\nVielen Dank für Ihren Besuch bei Bounty Fever. Wir hoffen, dass Sie etwas Spannendes finden, das Sie gewinnen können. Viel Glück!',
      'es':
          'Si tiene alguna pregunta o consulta, no dude en comunicarse con nosotros en [correo electrónico de contacto]. Nuestro equipo está aquí para ayudarlo y garantizar que tenga una experiencia increíble con Bounty Fever.\n\nGracias por visitar Bounty Fever. Esperamos que encuentre algo emocionante para ganar. ¡Buena suerte!',
      'ro':
          'Dacă aveți întrebări sau nelămuriri, vă rugăm să nu ezitați să ne contactați la [e-mail de contact]. Echipa noastră este aici pentru a vă ajuta și pentru a vă asigura că aveți o experiență uimitoare cu Bounty Fever.\n\nVă mulțumim că ați vizitat Bounty Fever. Sperăm că veți găsi ceva interesant de câștigat. Noroc!',
    },
    'imguy7e2': {
      'en': '\nAlin Matei, \nBounty Fever',
      'de': 'Alin Matei, \nBounty Fever',
      'es': 'Alin Matei, \nFiebre de recompensa',
      'ro': 'Alin Matei, \nBounty Fever',
    },
    'wy7gqh4s': {
      'en':
          'If you have any questions or inquiries, please don\'t hesitate to reach out to us at [contact email]. Our team is here to assist you and ensure you have an amazing experience with Bounty Fever.\n\nThank you for visiting Bounty Fever. We hope you find something exciting to win. Good luck!\n',
      'de':
          'Wenn Sie Fragen oder Anregungen haben, zögern Sie bitte nicht, uns unter [Kontakt-E-Mail] zu kontaktieren. Unser Team ist hier, um Ihnen zu helfen und sicherzustellen, dass Sie ein fantastisches Erlebnis mit Bounty Fever haben.\n\nVielen Dank für Ihren Besuch bei Bounty Fever. Wir hoffen, dass Sie etwas Spannendes finden, das Sie gewinnen können. Viel Glück!',
      'es':
          'Si tiene alguna pregunta o consulta, no dude en comunicarse con nosotros en [correo electrónico de contacto]. Nuestro equipo está aquí para ayudarlo y garantizar que tenga una experiencia increíble con Bounty Fever.\n\nGracias por visitar Bounty Fever. Esperamos que encuentre algo emocionante para ganar. ¡Buena suerte!',
      'ro':
          'Dacă aveți întrebări sau nelămuriri, vă rugăm să nu ezitați să ne contactați la [e-mail de contact]. Echipa noastră este aici pentru a vă ajuta și pentru a vă asigura că aveți o experiență uimitoare cu Bounty Fever.\n\nVă mulțumim că ați vizitat Bounty Fever. Sperăm că veți găsi ceva interesant de câștigat. Noroc!',
    },
    'hc92k5da': {
      'en': 'Home',
      'de': 'Heim',
      'es': 'Hogar',
      'ro': 'Acasă',
    },
  },
  // ContactUs
  {
    'ht9ki7o1': {
      'en': 'Contact Us',
      'de': 'Kontaktiere uns',
      'es': 'Contáctenos',
      'ro': 'Contactaţi-ne',
    },
    'jwin0yih': {
      'en': 'Contact Us',
      'de': 'Kontaktiere uns',
      'es': 'Contáctenos',
      'ro': 'Contactaţi-ne',
    },
    'ur51ztem': {
      'en': 'Thank you for your interest in',
      'de': 'Vielen Dank für Ihr Interesse',
      'es': 'Gracias por su interés en',
      'ro': 'Vă mulțumim pentru interesul acordat',
    },
    '9ay2b7np': {
      'en': ' Bounty Fever ',
      'de': 'Bounty Fever',
      'es': 'Bounty Fever',
      'ro': 'Bounty Fever',
    },
    'qua6x1ye': {
      'en':
          '! If you have any questions, feedback, or inquiries, please feel free to reach out to us using the contact information below. Our team is here to assist you and will respond to your message as soon as possible.',
      'de':
          '! Wenn Sie Fragen, Feedback oder Anfragen haben, können Sie sich gerne über die unten stehenden Kontaktinformationen an uns wenden. Unser Team ist für Sie da und wird so schnell wie möglich auf Ihre Nachricht antworten.',
      'es':
          '! Si tiene alguna pregunta, comentario o consulta, no dude en comunicarse con nosotros utilizando la información de contacto a continuación. Nuestro equipo está aquí para ayudarle y responderá a su mensaje lo antes posible.',
      'ro':
          '! Dacă aveți întrebări, feedback sau întrebări, vă rugăm să nu ezitați să ne contactați folosind informațiile de contact de mai jos. Echipa noastră este aici pentru a vă ajuta și vă va răspunde la mesajul dvs. cât mai curând posibil.',
    },
    '638b1fit': {
      'en':
          '\nThis Cookie Policy elucidates the nature of cookies, their utilization, the varieties employed, the data they gather, and its application, as well as how to manage cookie preferences. For additional details on the handling, storage, and security of your personal information, please refer to our Privacy Policy.\nYou have the option to modify or retract your consent regarding the Cookie Declaration on our website at any given time. Additionally, you can access further insights into our identity, contact methods, and personal data processing in our Privacy Policy.\nYour consent pertains to the following domains: bountyfever.com',
      'de':
          'Diese Cookie-Richtlinie erläutert die Art von Cookies, ihre Verwendung, die verwendeten Sorten, die von ihnen erfassten Daten und ihre Anwendung sowie die Verwaltung der Cookie-Einstellungen. Weitere Einzelheiten zur Handhabung, Speicherung und Sicherheit Ihrer personenbezogenen Daten finden Sie in unserer Datenschutzerklärung.\nSie haben jederzeit die Möglichkeit, Ihre Einwilligung zur Cookie-Erklärung auf unserer Website zu ändern oder zu widerrufen. Darüber hinaus können Sie in unserer Datenschutzrichtlinie auf weitere Einblicke in unsere Identität, Kontaktmethoden und Verarbeitung personenbezogener Daten zugreifen.\nIhre Einwilligung gilt für die folgenden Domains: bountyfever.com',
      'es':
          'Esta Política de Cookies aclara la naturaleza de las cookies, su utilización, las variedades empleadas, los datos que recopilan y su aplicación, así como cómo gestionar las preferencias de cookies. Para obtener detalles adicionales sobre el manejo, almacenamiento y seguridad de su información personal, consulte nuestra Política de Privacidad.\nTiene la opción de modificar o retirar su consentimiento con respecto a la Declaración de Cookies en nuestro sitio web en cualquier momento. Además, puede acceder a más información sobre nuestra identidad, métodos de contacto y procesamiento de datos personales en nuestra Política de Privacidad.\nSu consentimiento se refiere a los siguientes dominios: bountyfever.com',
      'ro':
          'Această Politică privind cookie-urile elucidează natura cookie-urilor, utilizarea lor, varietățile utilizate, datele pe care le adună și aplicarea acesteia, precum și modul de gestionare a preferințelor cookie. Pentru detalii suplimentare despre manipularea, stocarea și securitatea informațiilor dvs. personale, vă rugăm să consultați Politica noastră de confidențialitate.\nAveți opțiunea de a modifica sau de a vă retrage consimțământul cu privire la Declarația privind cookie-urile de pe site-ul nostru web în orice moment. În plus, puteți accesa informații suplimentare despre identitatea noastră, metodele de contact și prelucrarea datelor cu caracter personal în Politica noastră de confidențialitate.\nConsimțământul dvs. se referă la următoarele domenii: bountyfever.com',
    },
    'xcpiz5tc': {
      'en': 'General Inquiries:',
      'de': 'Allgemeine Anfragen:',
      'es': 'Consultas generales:',
      'ro': 'Anchete generale:',
    },
    '97z0hzjd': {
      'en':
          'For general inquiries or assistance, please email us at: contact@bountyfever.com',
      'de':
          'Für allgemeine Anfragen oder Unterstützung senden Sie uns bitte eine E-Mail an: contact@bountyfever.com',
      'es':
          'Para consultas generales o asistencia, envíenos un correo electrónico a: contact@bountyfever.com',
      'ro':
          'Pentru întrebări generale sau asistență, vă rugăm să ne trimiteți un e-mail la: contact@bountyfever.com',
    },
    'gsxxh5y7': {
      'en':
          'You are permitted to use our site solely for lawful purposes. You must refrain from using our site:\n\n- In any manner that violates any applicable local, national, or international laws or regulations.\n- In any manner that is unlawful or fraudulent, or serves any unlawful or fraudulent intent.\n- With the intention of causing harm or attempting to harm minors in any way.\n- To send, knowingly receive, upload, download, use, or re-use any material that does not adhere to our content standards as outlined below.\n- To transmit, or solicit the transmission of, any unsolicited or unauthorized advertising, promotional material, or any other form of similar solicitation (spam).\n- To knowingly transmit any data, send or upload any material containing viruses, Trojan horses, worms, time-bombs, keystroke loggers, spyware, adware, or any other harmful programs or similar computer code designed to adversely affect the operation of any computer software or hardware.\n\nAdditionally, you agree:\n\n- Not to reproduce, duplicate, copy, or resell any part of our site in violation of the provisions of our ',
      'de':
          'Es ist Ihnen gestattet, unsere Website ausschließlich für rechtmäßige Zwecke zu nutzen. Sie dürfen unsere Website nicht nutzen:\n\n- In jeglicher Weise, die gegen geltende lokale, nationale oder internationale Gesetze oder Vorschriften verstößt.\n- In jeglicher Weise, die rechtswidrig oder betrügerisch ist oder einer rechtswidrigen oder rechtswidrigen Art dient betrügerische Absicht.\n- Mit der Absicht, Minderjährigen Schaden zuzufügen oder zu versuchen, Minderjährigen in irgendeiner Weise zu schaden.\n- Zum Senden, wissentlichen Empfangen, Hochladen, Herunterladen, Verwenden oder Wiederverwenden von Material, das nicht unseren Bestimmungen entspricht Inhaltsstandards wie unten beschrieben.\n- Um unaufgeforderte oder unbefugte Werbung, Verkaufsförderungsmaterial oder jede andere Form ähnlicher Werbung (Spam) zu übermitteln oder deren Übertragung anzufordern.\n- Um wissentlich Daten zu übermitteln, senden Sie oder Material hochzuladen, das Viren, Trojaner, Würmer, Zeitbomben, Tastenanschlag-Logger, Spyware, Adware oder andere schädliche Programme oder ähnlichen Computercode enthält, der den Betrieb von Computersoftware oder -hardware beeinträchtigen soll.\n<__FFNL__ >Darüber hinaus erklären Sie sich damit einverstanden:\n\n- Keinen Teil unserer Website unter Verletzung unserer Bestimmungen zu reproduzieren, zu duplizieren, zu kopieren oder weiterzuverkaufen',
      'es':
          'Se le permite utilizar nuestro sitio únicamente para fines legales. Debe abstenerse de utilizar nuestro sitio:\n\n- De cualquier manera que viole cualquier ley o reglamento local, nacional o internacional aplicable.\n- De cualquier manera que sea ilegal o fraudulenta, o que sirva para cualquier uso ilegal o intención fraudulenta.\n- Con la intención de causar daño o intentar dañar a menores de cualquier manera.\n- Para enviar, recibir, cargar, descargar, usar o reutilizar a sabiendas cualquier material que no se adhiera a nuestras estándares de contenido como se describe a continuación.\n- Para transmitir o solicitar la transmisión de cualquier publicidad no solicitada o no autorizada, material promocional o cualquier otra forma de solicitud similar (spam).\n- Para transmitir conscientemente cualquier dato, envíe ni cargar ningún material que contenga virus, caballos de Troya, gusanos, bombas de tiempo, registradores de pulsaciones de teclas, spyware, adware o cualquier otro programa dañino o código informático similar diseñado para afectar negativamente el funcionamiento de cualquier software o hardware informático.\n<__FFNL__ >Adicionalmente, usted acepta:\n\n- No reproducir, duplicar, copiar o revender ninguna parte de nuestro sitio en violación de las disposiciones de nuestra',
      'ro':
          'Vi se permite să utilizați site-ul nostru exclusiv în scopuri legale. Trebuie să vă abțineți de la a utiliza site-ul nostru:\n\n- În orice mod care încalcă orice lege sau reglementări locale, naționale sau internaționale aplicabile.\n- În orice mod care este ilegal sau fraudulos, sau servește oricărui intenție frauduloasă.\n- Cu intenția de a provoca prejudicii sau de a încerca să rănească minori în orice fel.\n- Pentru a trimite, primi, încărca, descărca, utiliza sau reutiliza orice material care nu aderă la dispozițiile noastre. standardele de conținut, așa cum sunt prezentate mai jos.\n- Pentru a transmite sau solicita transmiterea oricărei reclame nesolicitate sau neautorizate, materiale promoționale sau orice altă formă de solicitare similară (spam).\n- Pentru a transmite cu bună știință orice date, trimiteți sau încărcați orice material care conține viruși, cai troieni, viermi, bombe cu ceas, înregistrări de taste, spyware, adware sau orice alte programe dăunătoare sau cod de computer similar conceput pentru a afecta negativ funcționarea oricărui software sau hardware de computer.\n<__FFNL__ >În plus, sunteți de acord cu:\n\n- să nu reproduceți, duplicați, copiați sau revindeți nicio parte a site-ului nostru, încălcând prevederile noastre',
    },
    'm9ie5auj': {
      'en': 'Customer Support:',
      'de': 'Kundendienst:',
      'es': 'Atención al cliente:',
      'ro': 'Relații Clienți:',
    },
    'aoijdpe2': {
      'en':
          'If you require customer support or have any issues with your account or orders, please contact our customer support team at:\n',
      'de':
          'Wenn Sie Kundensupport benötigen oder Probleme mit Ihrem Konto oder Ihren Bestellungen haben, wenden Sie sich bitte an unser Kundensupport-Team unter:',
      'es':
          'Si necesita atención al cliente o tiene algún problema con su cuenta o sus pedidos, comuníquese con nuestro equipo de atención al cliente en:',
      'ro':
          'Dacă aveți nevoie de asistență pentru clienți sau aveți probleme cu contul sau comenzile dvs., vă rugăm să contactați echipa noastră de asistență pentru clienți la:',
    },
    'iwrkj21b': {
      'en': 'support@bountyfever.com',
      'de': 'support@bountyfever.com',
      'es': 'soporte@bountyfever.com',
      'ro': 'support@bountyfever.com',
    },
    'f3ld4wxw': {
      'en':
          'There are countless reasons to choose Bounty Fever for your online giveaway needs. Here are just a few:\n\nLive Draws: All our contests are conducted through live draws, streamed on our website and social media channels (TikTok, YouTube, Facebook). This ensures fairness and transparency, allowing customers to witness the selection of winners in real-time.\n\nHigh-Quality Prizes: We exclusively partner with top brands and companies to offer customers the opportunity to win luxury products and experiences. From gadgets and electronics to luxurious vacations and state-of-the-art vehicles, our recent prizes speak for themselves.\n\nExceptional Customer Service: Our dedicated customer service team is always available to address any questions or concerns you may have. We take pride in providing excellent customer service and strive to offer our customers the best experience possible.\n\nJoin the Fun! Participating in our contests is easy. Simply visit our website, choose the contest you\'d like to enter, answer the competition question correctly, select the number of entries, and securely pay online. We\'ll then add your name and numbers to the draw, and you can watch the live draw to see if you\'re a winner. Join us today to get started!',
      'de':
          'Es gibt unzählige Gründe, Bounty Fever für Ihre Online-Werbegeschenke zu wählen. Hier sind nur einige:\n\nLive-Ziehungen: Alle unsere Wettbewerbe werden durch Live-Ziehungen durchgeführt, die auf unserer Website und in den sozialen Medienkanälen (TikTok, YouTube, Facebook) gestreamt werden. Dies sorgt für Fairness und Transparenz und ermöglicht es Kunden, die Auswahl der Gewinner in Echtzeit mitzuerleben.\n\nHochwertige Preise: Wir arbeiten ausschließlich mit Top-Marken und -Unternehmen zusammen, um Kunden die Möglichkeit zu bieten, Luxusprodukte und -erlebnisse zu gewinnen. Von Gadgets und Elektronik bis hin zu luxuriösen Ferien und hochmodernen Fahrzeugen – unsere aktuellen Preise sprechen für sich.\n\nAußergewöhnlicher Kundenservice: Unser engagiertes Kundenservice-Team steht Ihnen jederzeit für Fragen und Anliegen zur Verfügung haben. Wir sind stolz darauf, exzellenten Kundenservice zu bieten und sind bestrebt, unseren Kunden das bestmögliche Erlebnis zu bieten.\n\nMachen Sie mit! Die Teilnahme an unseren Wettbewerben ist ganz einfach. Besuchen Sie einfach unsere Website, wählen Sie den Wettbewerb aus, an dem Sie teilnehmen möchten, beantworten Sie die Wettbewerbsfrage richtig, wählen Sie die Anzahl der Einsendungen aus und zahlen Sie sicher online. Wir fügen dann Ihren Namen und Ihre Nummern zur Verlosung hinzu und Sie können die Live-Auslosung verfolgen, um zu sehen, ob Sie ein Gewinner sind. Begleiten Sie uns noch heute, um loszulegen!',
      'es':
          'Existen innumerables razones para elegir Bounty Fever para sus necesidades de obsequios en línea. Estos son solo algunos:\n\nSorteos en vivo: todos nuestros concursos se llevan a cabo a través de sorteos en vivo, transmitidos en nuestro sitio web y canales de redes sociales (TikTok, YouTube, Facebook). Esto garantiza equidad y transparencia, permitiendo a los clientes ser testigos de la selección de los ganadores en tiempo real.\n\nPremios de alta calidad: nos asociamos exclusivamente con las mejores marcas y empresas para ofrecer a los clientes la oportunidad de ganar productos y experiencias de lujo. Desde aparatos y productos electrónicos hasta vacaciones de lujo y vehículos de última generación, nuestros premios recientes hablan por sí solos.\n\nServicio al cliente excepcional: nuestro dedicado equipo de servicio al cliente está siempre disponible para responder cualquier pregunta o inquietud que pueda tener. tener. Estamos orgullosos de brindar un excelente servicio al cliente y nos esforzamos por ofrecerles la mejor experiencia posible.\n\n¡Únase a la diversión! Participar en nuestros concursos es fácil. Simplemente visite nuestro sitio web, elija el concurso en el que desea participar, responda correctamente la pregunta del concurso, seleccione el número de entradas y pague en línea de forma segura. Luego agregaremos su nombre y números al sorteo y podrá ver el sorteo en vivo para ver si es el ganador. ¡Únase a nosotros hoy para comenzar!',
      'ro':
          'Există nenumărate motive pentru a alege Bounty Fever pentru nevoile tale de cadouri online. Iată doar câteva:\n\nTrageri live: Toate concursurile noastre se desfășoară prin trageri live, transmise pe site-ul nostru web și canalele de socializare (TikTok, YouTube, Facebook). Acest lucru asigură corectitudinea și transparența, permițând clienților să asista la selecția câștigătorilor în timp real.\n\nPremii de înaltă calitate: Colaboram exclusiv cu mărci și companii de top pentru a oferi clienților posibilitatea de a câștiga produse și experiențe de lux. De la gadgeturi și electronice până la vacanțe de lux și vehicule de ultimă generație, premiile noastre recente vorbesc de la sine.\n\nServicii clienți excepționali: echipa noastră dedicată de servicii pentru clienți este întotdeauna disponibilă pentru a răspunde oricăror întrebări sau nelămuriri. avea. Ne mândrim să oferim servicii excelente pentru clienți și ne străduim să oferim clienților noștri cea mai bună experiență posibilă.\n\nAlăturați-vă distracției! Participarea la concursurile noastre este ușoară. Pur și simplu vizitați site-ul nostru, alegeți concursul în care doriți să participați, răspundeți corect la întrebarea competiției, selectați numărul de înscrieri și plătiți online în siguranță. Vom adăuga apoi numele și numerele dvs. la extragere și puteți urmări extragerea live pentru a vedea dacă sunteți câștigător. Alăturați-vă nouă astăzi pentru a începe!',
    },
    '6jgq9dn5': {
      'en': 'Business Partnerships:',
      'de': 'Geschäftspartnerschaften:',
      'es': 'Asociaciones comerciales:',
      'ro': 'Parteneriate de afaceri:',
    },
    'zv0e6paj': {
      'en':
          'For business inquiries, partnerships, or collaboration opportunities, please reach out to our business development team at:\n',
      'de':
          'Für Geschäftsanfragen, Partnerschaften oder Kooperationsmöglichkeiten wenden Sie sich bitte an unser Geschäftsentwicklungsteam unter:',
      'es':
          'Para consultas comerciales, asociaciones u oportunidades de colaboración, comuníquese con nuestro equipo de desarrollo comercial en:',
      'ro':
          'Pentru întrebări de afaceri, parteneriate sau oportunități de colaborare, vă rugăm să contactați echipa noastră de dezvoltare a afacerii la:',
    },
    'uhilmocq': {
      'en': 'contact@bluedash.co.uk',
      'de': 'contact@bluedash.co.uk',
      'es': 'contacto@bluedash.co.uk',
      'ro': 'contact@bluedash.co.uk',
    },
    '98qwi12s': {
      'en':
          'If you have any questions or inquiries, please don\'t hesitate to reach out to us at [contact email]. Our team is here to assist you and ensure you have an amazing experience with Bounty Fever.\n\nThank you for visiting Bounty Fever. We hope you find something exciting to win. Good luck!\n',
      'de':
          'Wenn Sie Fragen oder Anregungen haben, zögern Sie bitte nicht, uns unter [Kontakt-E-Mail] zu kontaktieren. Unser Team ist hier, um Ihnen zu helfen und sicherzustellen, dass Sie ein fantastisches Erlebnis mit Bounty Fever haben.\n\nVielen Dank für Ihren Besuch bei Bounty Fever. Wir hoffen, dass Sie etwas Spannendes finden, das Sie gewinnen können. Viel Glück!',
      'es':
          'Si tiene alguna pregunta o consulta, no dude en comunicarse con nosotros en [correo electrónico de contacto]. Nuestro equipo está aquí para ayudarlo y garantizar que tenga una experiencia increíble con Bounty Fever.\n\nGracias por visitar Bounty Fever. Esperamos que encuentre algo emocionante para ganar. ¡Buena suerte!',
      'ro':
          'Dacă aveți întrebări sau nelămuriri, vă rugăm să nu ezitați să ne contactați la [e-mail de contact]. Echipa noastră este aici pentru a vă ajuta și pentru a vă asigura că aveți o experiență uimitoare cu Bounty Fever.\n\nVă mulțumim că ați vizitat Bounty Fever. Sperăm că veți găsi ceva interesant de câștigat. Noroc!',
    },
    '2790jf85': {
      'en': 'Media & Press:',
      'de': 'Medienpresse:',
      'es': 'Medios y prensa:',
      'ro': 'Media și presă:',
    },
    'wplu4z1j': {
      'en':
          'Members of the media or press seeking information or interviews can contact our media relations team at:\n',
      'de':
          'Medienvertreter oder Pressevertreter, die Informationen oder Interviews suchen, können sich an unser Medienarbeitsteam wenden unter:',
      'es':
          'Los miembros de los medios o la prensa que busquen información o entrevistas pueden comunicarse con nuestro equipo de relaciones con los medios en:',
      'ro':
          'Membrii presei sau ai presei care caută informații sau interviuri pot contacta echipa noastră de relații cu presa la:',
    },
    'cwidn00x': {
      'en': 'media@bountyfever.com',
      'de': 'media@bountyfever.com',
      'es': 'media@bountyfever.com',
      'ro': 'media@bountyfever.com',
    },
    'mr51u2hg': {
      'en':
          'If you have any questions or inquiries, please don\'t hesitate to reach out to us at [contact email]. Our team is here to assist you and ensure you have an amazing experience with Bounty Fever.\n\nThank you for visiting Bounty Fever. We hope you find something exciting to win. Good luck!\n',
      'de':
          'Wenn Sie Fragen oder Anregungen haben, zögern Sie bitte nicht, uns unter [Kontakt-E-Mail] zu kontaktieren. Unser Team ist hier, um Ihnen zu helfen und sicherzustellen, dass Sie ein fantastisches Erlebnis mit Bounty Fever haben.\n\nVielen Dank für Ihren Besuch bei Bounty Fever. Wir hoffen, dass Sie etwas Spannendes finden, das Sie gewinnen können. Viel Glück!',
      'es':
          'Si tiene alguna pregunta o consulta, no dude en comunicarse con nosotros en [correo electrónico de contacto]. Nuestro equipo está aquí para ayudarlo y garantizar que tenga una experiencia increíble con Bounty Fever.\n\nGracias por visitar Bounty Fever. Esperamos que encuentre algo emocionante para ganar. ¡Buena suerte!',
      'ro':
          'Dacă aveți întrebări sau nelămuriri, vă rugăm să nu ezitați să ne contactați la [e-mail de contact]. Echipa noastră este aici pentru a vă ajuta și pentru a vă asigura că aveți o experiență uimitoare cu Bounty Fever.\n\nVă mulțumim că ați vizitat Bounty Fever. Sperăm că veți găsi ceva interesant de câștigat. Noroc!',
    },
    '1ot9x6s1': {
      'en': 'Feedback & Suggestions:',
      'de': 'Feedback und Vorschläge:',
      'es': 'Comentarios y sugerencias:',
      'ro': 'Feedback și sugestii:',
    },
    'klbiuch8': {
      'en':
          'We value your feedback and suggestions! Please share your thoughts with us on our ',
      'de':
          'Wir freuen uns über Ihr Feedback und Ihre Vorschläge! Bitte teilen Sie uns Ihre Gedanken auf unserer Seite mit',
      'es':
          '¡Valoramos sus comentarios y sugerencias! Por favor comparta sus pensamientos con nosotros sobre nuestro',
      'ro':
          'Apreciem feedback-ul și sugestiile dvs.! Vă rugăm să împărtășiți-vă gândurile cu noi despre nostru',
    },
    'kvtuzfyv': {
      'en': 'FeedbackPage',
      'de': 'Feedback-Seite',
      'es': 'Página de comentarios',
      'ro': 'Pagina de feedback',
    },
    'tvub92c7': {
      'en':
          'If you have any questions or inquiries, please don\'t hesitate to reach out to us at [contact email]. Our team is here to assist you and ensure you have an amazing experience with Bounty Fever.\n\nThank you for visiting Bounty Fever. We hope you find something exciting to win. Good luck!\n',
      'de':
          'Wenn Sie Fragen oder Anregungen haben, zögern Sie bitte nicht, uns unter [Kontakt-E-Mail] zu kontaktieren. Unser Team ist hier, um Ihnen zu helfen und sicherzustellen, dass Sie ein fantastisches Erlebnis mit Bounty Fever haben.\n\nVielen Dank für Ihren Besuch bei Bounty Fever. Wir hoffen, dass Sie etwas Spannendes finden, das Sie gewinnen können. Viel Glück!',
      'es':
          'Si tiene alguna pregunta o consulta, no dude en comunicarse con nosotros en [correo electrónico de contacto]. Nuestro equipo está aquí para ayudarlo y garantizar que tenga una experiencia increíble con Bounty Fever.\n\nGracias por visitar Bounty Fever. Esperamos que encuentre algo emocionante para ganar. ¡Buena suerte!',
      'ro':
          'Dacă aveți întrebări sau nelămuriri, vă rugăm să nu ezitați să ne contactați la [e-mail de contact]. Echipa noastră este aici pentru a vă ajuta și pentru a vă asigura că aveți o experiență uimitoare cu Bounty Fever.\n\nVă mulțumim că ați vizitat Bounty Fever. Sperăm că veți găsi ceva interesant de câștigat. Noroc!',
    },
    'jg1iuz3u': {
      'en': 'Social Media:',
      'de': 'Sozialen Medien:',
      'es': 'Medios de comunicación social:',
      'ro': 'Social Media:',
    },
    'taab2ni6': {
      'en':
          'Stay connected with us on social media for the latest updates, promotions, and giveaways:\n',
      'de':
          'Bleiben Sie in den sozialen Medien mit uns in Verbindung, um die neuesten Updates, Werbeaktionen und Werbegeschenke zu erhalten:',
      'es':
          'Manténgase conectado con nosotros en las redes sociales para conocer las últimas actualizaciones, promociones y obsequios:',
      'ro':
          'Rămâneți conectat cu noi pe rețelele sociale pentru cele mai recente actualizări, promoții și cadouri:',
    },
    'stte50jl': {
      'en': 'Facebook: ',
      'de': 'Facebook:',
      'es': 'Facebook:',
      'ro': 'Facebook:',
    },
    'o660c2tq': {
      'en': 'https://www.facebook.com/bountyfever\n',
      'de': 'https://www.facebook.com/bountyfever',
      'es': 'https://www.facebook.com/bountyfever',
      'ro': 'https://www.facebook.com/bountyfever',
    },
    'idi66zp9': {
      'en': 'Instagram: ',
      'de': 'Instagram:',
      'es': 'Instagram:',
      'ro': 'Instagram:',
    },
    '27tmivm6': {
      'en': 'https://www.instagram.com/bounty.fever/\n',
      'de': 'https://www.instagram.com/bounty.fever/',
      'es': 'https://www.instagram.com/bounty.fever/',
      'ro': 'https://www.instagram.com/bounty.fever/',
    },
    'n1q7p7bu': {
      'en': 'TikTok : ',
      'de': 'TikTok : ',
      'es': 'TikTok : ',
      'ro': 'TikTok : ',
    },
    'omd154cf': {
      'en': 'https://www.tiktok.com/@bountyfever.com\n',
      'de': 'https://www.tiktok.com/@bountyfever.com',
      'es': 'https://www.tiktok.com/@bountyfever.com',
      'ro': 'https://www.tiktok.com/@bountyfever.com',
    },
    '95912e8o': {
      'en': 'Twitter:',
      'de': 'Twitter:',
      'es': 'Twitter:',
      'ro': 'Twitter:',
    },
    'coapcczl': {
      'en': ' https://twitter.com/bountyfever',
      'de': 'https://twitter.com/bountyfever',
      'es': 'https://twitter.com/bountyfever',
      'ro': 'https://twitter.com/bountyfever',
    },
    's5zgk0ik': {
      'en': '\nYoutube:',
      'de': '\nYoutube:',
      'es': '\nYouTube:',
      'ro': '\nYoutube:',
    },
    'swdg7ayn': {
      'en': ' https://www.youtube.com/@bountyfever',
      'de': 'https://www.youtube.com/@bountyfever',
      'es': 'https://www.youtube.com/@bountyfever',
      'ro': 'https://www.youtube.com/@bountyfever',
    },
    'wd2hkbfp': {
      'en':
          'If you have any questions or inquiries, please don\'t hesitate to reach out to us at [contact email]. Our team is here to assist you and ensure you have an amazing experience with Bounty Fever.\n\nThank you for visiting Bounty Fever. We hope you find something exciting to win. Good luck!\n',
      'de':
          'Wenn Sie Fragen oder Anregungen haben, zögern Sie bitte nicht, uns unter [Kontakt-E-Mail] zu kontaktieren. Unser Team ist hier, um Ihnen zu helfen und sicherzustellen, dass Sie ein fantastisches Erlebnis mit Bounty Fever haben.\n\nVielen Dank für Ihren Besuch bei Bounty Fever. Wir hoffen, dass Sie etwas Spannendes finden, das Sie gewinnen können. Viel Glück!',
      'es':
          'Si tiene alguna pregunta o consulta, no dude en comunicarse con nosotros en [correo electrónico de contacto]. Nuestro equipo está aquí para ayudarlo y garantizar que tenga una experiencia increíble con Bounty Fever.\n\nGracias por visitar Bounty Fever. Esperamos que encuentre algo emocionante para ganar. ¡Buena suerte!',
      'ro':
          'Dacă aveți întrebări sau nelămuriri, vă rugăm să nu ezitați să ne contactați la [e-mail de contact]. Echipa noastră este aici pentru a vă ajuta și pentru a vă asigura că aveți o experiență uimitoare cu Bounty Fever.\n\nVă mulțumim că ați vizitat Bounty Fever. Sperăm că veți găsi ceva interesant de câștigat. Noroc!',
    },
    '9q6uaik3': {
      'en': 'FAQs:',
      'de': 'FAQs:',
      'es': 'Preguntas frecuentes:',
      'ro': 'Întrebări frecvente:',
    },
    'ctbr9tu9': {
      'en':
          'Before contacting us, you may find answers to common questions on our ',
      'de':
          'Bevor Sie uns kontaktieren, finden Sie möglicherweise Antworten auf häufig gestellte Fragen auf unserer Seite',
      'es':
          'Antes de contactarnos, puede encontrar respuestas a preguntas comunes en nuestra',
      'ro':
          'Înainte de a ne contacta, s-ar putea să găsiți răspunsuri la întrebări frecvente pe site-ul nostru',
    },
    '0qzxgdpm': {
      'en': 'FAQ ',
      'de': 'FAQ',
      'es': 'Preguntas más frecuentes',
      'ro': 'FAQ',
    },
    'ywukpn5h': {
      'en': '  page\n',
      'de': 'Seite',
      'es': 'página',
      'ro': 'pagină',
    },
    'n7z95xm1': {
      'en':
          'If you have any questions or inquiries, please don\'t hesitate to reach out to us at [contact email]. Our team is here to assist you and ensure you have an amazing experience with Bounty Fever.\n\nThank you for visiting Bounty Fever. We hope you find something exciting to win. Good luck!\n',
      'de':
          'Wenn Sie Fragen oder Anregungen haben, zögern Sie bitte nicht, uns unter [Kontakt-E-Mail] zu kontaktieren. Unser Team ist hier, um Ihnen zu helfen und sicherzustellen, dass Sie ein fantastisches Erlebnis mit Bounty Fever haben.\n\nVielen Dank für Ihren Besuch bei Bounty Fever. Wir hoffen, dass Sie etwas Spannendes finden, das Sie gewinnen können. Viel Glück!',
      'es':
          'Si tiene alguna pregunta o consulta, no dude en comunicarse con nosotros en [correo electrónico de contacto]. Nuestro equipo está aquí para ayudarlo y garantizar que tenga una experiencia increíble con Bounty Fever.\n\nGracias por visitar Bounty Fever. Esperamos que encuentre algo emocionante para ganar. ¡Buena suerte!',
      'ro':
          'Dacă aveți întrebări sau nelămuriri, vă rugăm să nu ezitați să ne contactați la [e-mail de contact]. Echipa noastră este aici pentru a vă ajuta și pentru a vă asigura că aveți o experiență uimitoare cu Bounty Fever.\n\nVă mulțumim că ați vizitat Bounty Fever. Sperăm că veți găsi ceva interesant de câștigat. Noroc!',
    },
    'x6vzyyh6': {
      'en': 'We\'re Here to Help!',
      'de': 'Wir sind hier um zu helfen!',
      'es': '¡Estamos aquí para ayudar!',
      'ro': 'Suntem aici pentru a vă ajuta!',
    },
    'pffb7t1m': {
      'en': 'At',
      'de': 'Bei',
      'es': 'En',
      'ro': 'La',
    },
    '0avqppa0': {
      'en': ' Bounty Fever, ',
      'de': 'Bounty Fever,',
      'es': 'Bounty Fever,',
      'ro': 'Bounty Fever,',
    },
    'nsfvgbhk': {
      'en':
          ' we\'re committed to providing exceptional service and support to our customers. Whatever your inquiry, we\'re here to assist you every step of the way.\n\n',
      'de':
          'Wir sind bestrebt, unseren Kunden außergewöhnlichen Service und Support zu bieten. Was auch immer Ihre Anfrage ist, wir sind hier, um Sie bei jedem Schritt zu unterstützen.',
      'es':
          'Estamos comprometidos a brindar un servicio y soporte excepcionales a nuestros clientes. Cualquiera que sea su consulta, estamos aquí para ayudarle en cada paso del camino.',
      'ro':
          'ne angajăm să oferim servicii și asistență excepționale clienților noștri. Indiferent de întrebarea dvs., suntem aici pentru a vă ajuta la fiecare pas.',
    },
    'boz5wr63': {
      'en': ' Thank you for choosing Bounty Fever!',
      'de': 'Vielen Dank, dass Sie sich für Bounty Fever entschieden haben!',
      'es': '¡Gracias por elegir Bounty Fever!',
      'ro': 'Vă mulțumim că ați ales Bounty Fever!',
    },
    'yhpopvaq': {
      'en':
          'If you have any questions or inquiries, please don\'t hesitate to reach out to us at [contact email]. Our team is here to assist you and ensure you have an amazing experience with Bounty Fever.\n\nThank you for visiting Bounty Fever. We hope you find something exciting to win. Good luck!\n',
      'de':
          'Wenn Sie Fragen oder Anregungen haben, zögern Sie bitte nicht, uns unter [Kontakt-E-Mail] zu kontaktieren. Unser Team ist hier, um Ihnen zu helfen und sicherzustellen, dass Sie ein fantastisches Erlebnis mit Bounty Fever haben.\n\nVielen Dank für Ihren Besuch bei Bounty Fever. Wir hoffen, dass Sie etwas Spannendes finden, das Sie gewinnen können. Viel Glück!',
      'es':
          'Si tiene alguna pregunta o consulta, no dude en comunicarse con nosotros en [correo electrónico de contacto]. Nuestro equipo está aquí para ayudarlo y garantizar que tenga una experiencia increíble con Bounty Fever.\n\nGracias por visitar Bounty Fever. Esperamos que encuentre algo emocionante para ganar. ¡Buena suerte!',
      'ro':
          'Dacă aveți întrebări sau nelămuriri, vă rugăm să nu ezitați să ne contactați la [e-mail de contact]. Echipa noastră este aici pentru a vă ajuta și pentru a vă asigura că aveți o experiență uimitoare cu Bounty Fever.\n\nVă mulțumim că ați vizitat Bounty Fever. Sperăm că veți găsi ceva interesant de câștigat. Noroc!',
    },
    'jb7go4is': {
      'en': 'Home',
      'de': 'Heim',
      'es': 'Hogar',
      'ro': 'Acasă',
    },
  },
  // RefundPolicy
  {
    '0q0cefcq': {
      'en': 'Refund Policy',
      'de': 'Rückgaberecht',
      'es': 'Politica de reembolso',
      'ro': 'Politica de rambursare',
    },
    'hd1c2jpv': {
      'en': 'Refund Policy',
      'de': 'Rückgaberecht',
      'es': 'Politica de reembolso',
      'ro': 'Politica de rambursare',
    },
    'f06hso2a': {
      'en':
          '\nAll entries submitted to the competition are deemed final, and refunds will not be issued under any circumstances. \n\nEntries received after the specified closing date and time will be automatically canceled and refunded.\n\n In the event of a competition cancellation by',
      'de':
          'Alle zum Wettbewerb eingereichten Beiträge gelten als endgültig und eine Rückerstattung erfolgt unter keinen Umständen. \n\nEinsendungen, die nach dem angegebenen Einsendeschlussdatum und der angegebenen Uhrzeit eingehen, werden automatisch storniert und zurückerstattet.\n\n Im Falle einer Absage des Wettbewerbs durch',
      'es':
          'Todas las inscripciones enviadas al concurso se consideran definitivas y no se emitirán reembolsos bajo ninguna circunstancia. \n\nLas inscripciones recibidas después de la fecha y hora de cierre especificadas se cancelarán y reembolsarán automáticamente.\n\n En caso de cancelación del concurso por',
      'ro':
          'Toate înscrierile depuse la concurs sunt considerate finale, iar rambursările nu vor fi emise în niciun caz. \n\nÎnscrierile primite după data și ora de închidere specificate vor fi automat anulate și rambursate.\n\n În cazul anulării unui concurs de către',
    },
    'isl27e7u': {
      'en': ' Bounty Fever ',
      'de': 'Bounty Fever',
      'es': 'Bounty Fever',
      'ro': 'Bounty Fever',
    },
    '5fophmft': {
      'en': ', refunds will be provided accordingly.',
      'de': ', Rückerstattungen werden entsprechend gewährt.',
      'es': ', los reembolsos se realizarán en consecuencia.',
      'ro': ', rambursările vor fi oferite în consecință.',
    },
    'q6rz6qu5': {
      'en':
          '\nThis Cookie Policy elucidates the nature of cookies, their utilization, the varieties employed, the data they gather, and its application, as well as how to manage cookie preferences. For additional details on the handling, storage, and security of your personal information, please refer to our Privacy Policy.\nYou have the option to modify or retract your consent regarding the Cookie Declaration on our website at any given time. Additionally, you can access further insights into our identity, contact methods, and personal data processing in our Privacy Policy.\nYour consent pertains to the following domains: bountyfever.com',
      'de':
          'Diese Cookie-Richtlinie erläutert die Art von Cookies, ihre Verwendung, die verwendeten Sorten, die von ihnen erfassten Daten und ihre Anwendung sowie die Verwaltung der Cookie-Einstellungen. Weitere Einzelheiten zur Handhabung, Speicherung und Sicherheit Ihrer personenbezogenen Daten finden Sie in unserer Datenschutzerklärung.\nSie haben jederzeit die Möglichkeit, Ihre Einwilligung zur Cookie-Erklärung auf unserer Website zu ändern oder zu widerrufen. Darüber hinaus können Sie in unserer Datenschutzrichtlinie auf weitere Einblicke in unsere Identität, Kontaktmethoden und Verarbeitung personenbezogener Daten zugreifen.\nIhre Einwilligung gilt für die folgenden Domains: bountyfever.com',
      'es':
          'Esta Política de Cookies aclara la naturaleza de las cookies, su utilización, las variedades empleadas, los datos que recopilan y su aplicación, así como cómo gestionar las preferencias de cookies. Para obtener detalles adicionales sobre el manejo, almacenamiento y seguridad de su información personal, consulte nuestra Política de Privacidad.\nTiene la opción de modificar o retirar su consentimiento con respecto a la Declaración de Cookies en nuestro sitio web en cualquier momento. Además, puede acceder a más información sobre nuestra identidad, métodos de contacto y procesamiento de datos personales en nuestra Política de Privacidad.\nSu consentimiento se refiere a los siguientes dominios: bountyfever.com',
      'ro':
          'Această Politică privind cookie-urile elucidează natura cookie-urilor, utilizarea lor, varietățile utilizate, datele pe care le adună și aplicarea acesteia, precum și modul de gestionare a preferințelor cookie. Pentru detalii suplimentare despre manipularea, stocarea și securitatea informațiilor dvs. personale, vă rugăm să consultați Politica noastră de confidențialitate.\nAveți opțiunea de a modifica sau de a vă retrage consimțământul cu privire la Declarația privind cookie-urile de pe site-ul nostru web în orice moment. În plus, puteți accesa informații suplimentare despre identitatea noastră, metodele de contact și prelucrarea datelor cu caracter personal în Politica noastră de confidențialitate.\nConsimțământul dvs. se referă la următoarele domenii: bountyfever.com',
    },
    'ja5qhjpt': {
      'en': 'Home',
      'de': 'Heim',
      'es': 'Hogar',
      'ro': 'Acasă',
    },
  },
  // feedback
  {
    'olcnwb5t': {
      'en': 'Feedback',
      'de': 'Rückmeldung',
      'es': 'Comentario',
      'ro': 'Idei de  îmbunatatire',
    },
    'ywatjnjx': {
      'en': 'Feedback',
      'de': 'Rückmeldung',
      'es': 'Comentario',
      'ro': 'Idei de  îmbunatatire',
    },
    'l4y265rr': {
      'en': '📣 We value your feedback! 📣',
      'de': '📣 Wir freuen uns über Ihr Feedback! 📣',
      'es': '📣 ¡Valoramos tus comentarios! 📣',
      'ro': '📣 Apreciem feedback-ul tău! 📣',
    },
    'wqu7yr85': {
      'en': '\nDear ',
      'de': 'Liebling',
      'es': 'Estimado',
      'ro': 'Dragă',
    },
    'hi6c4pic': {
      'en':
          ',\nYour opinion matters to us!  Whether you have suggestions, questions, or just want to share your experience, we\'re here to listen. Your feedback helps us improve and tailor our services to better meet your needs.\n\nPlease feel free to leave your comments below or send us a direct message. We\'re eager to hear from you!\nThank you for being a part of our community. ',
      'de':
          ',\nIhre Meinung ist uns wichtig! Egal, ob Sie Vorschläge oder Fragen haben oder einfach nur Ihre Erfahrungen teilen möchten, wir sind für Sie da. Ihr Feedback hilft uns, unsere Dienstleistungen zu verbessern und an Ihre Bedürfnisse anzupassen.\n\nBitte hinterlassen Sie unten Ihre Kommentare oder senden Sie uns eine direkte Nachricht. Wir freuen uns darauf, von Ihnen zu hören!\nVielen Dank, dass Sie Teil unserer Community sind.',
      'es':
          ',\n¡Tu opinión nos importa! Si tiene sugerencias, preguntas o simplemente quiere compartir su experiencia, estamos aquí para escucharlo. Sus comentarios nos ayudan a mejorar y adaptar nuestros servicios para satisfacer mejor sus necesidades.\n\nNo dude en dejar sus comentarios a continuación o enviarnos un mensaje directo. ¡Estamos ansiosos por saber de usted!\nGracias por ser parte de nuestra comunidad.',
      'ro':
          ',\nPărerea ta contează pentru noi! Indiferent dacă aveți sugestii, întrebări sau doriți doar să vă împărtășiți experiența, suntem aici să vă ascultăm. Feedbackul dvs. ne ajută să îmbunătățim și să ne adaptăm serviciile pentru a răspunde mai bine nevoilor dvs.\n\nVă rugăm să nu ezitați să lăsați comentariile dvs. mai jos sau să ne trimiteți un mesaj direct. Suntem nerăbdători să auzim de la tine!\nVă mulțumim că faci parte din comunitatea noastră.',
    },
    'bxgt7tl1': {
      'en':
          'Dear [Community Name],\n\nYour opinion matters to us! 🌟 Whether you have suggestions, questions, or just want to share your experience, we\'re here to listen. Your feedback helps us improve and tailor our services to better meet your needs.\n\nPlease feel free to leave your comments below or send us a direct message. We\'re eager to hear from you!\n\nThank you for being a part of our community. 🙏',
      'de':
          'Lieber [Community-Name],\n\nIhre Meinung ist uns wichtig! 🌟 Egal, ob Sie Vorschläge oder Fragen haben oder einfach nur Ihre Erfahrungen teilen möchten, wir sind für Sie da. Ihr Feedback hilft uns, unsere Dienstleistungen zu verbessern und an Ihre Bedürfnisse anzupassen.\n\nBitte hinterlassen Sie unten Ihre Kommentare oder senden Sie uns eine direkte Nachricht. Wir freuen uns darauf, von Ihnen zu hören!\n\nVielen Dank, dass Sie Teil unserer Community sind. 🙏',
      'es':
          'Estimado [Nombre de la comunidad],\n\n¡Tu opinión nos importa! 🌟 Si tienes sugerencias, preguntas o simplemente quieres compartir tu experiencia, estamos aquí para escucharte. Sus comentarios nos ayudan a mejorar y adaptar nuestros servicios para satisfacer mejor sus necesidades.\n\nNo dude en dejar sus comentarios a continuación o enviarnos un mensaje directo. ¡Estamos ansiosos por saber de usted!\n\nGracias por ser parte de nuestra comunidad. 🙏',
      'ro':
          'Dragă [Numele comunității],\n\nPărerea ta contează pentru noi! 🌟 Indiferent dacă aveți sugestii, întrebări sau doriți doar să vă împărtășiți experiența, suntem aici să vă ascultăm. Feedbackul dvs. ne ajută să îmbunătățim și să ne adaptăm serviciile pentru a răspunde mai bine nevoilor dvs.\n\nVă rugăm să nu ezitați să lăsați comentariile dvs. mai jos sau să ne trimiteți un mesaj direct. Suntem nerăbdători să auzim de la tine!\n\nVă mulțumim că faci parte din comunitatea noastră. 🙏',
    },
    'kfetqz0q': {
      'en': 'Your Message',
      'de': 'Ihre Nachricht',
      'es': 'Tu mensaje',
      'ro': 'Mesajul dvs',
    },
    '2nlgbocs': {
      'en': 'Write your thoughts ',
      'de': 'Schreiben Sie Ihre Gedanken auf',
      'es': 'Escribe tus pensamientos',
      'ro': 'Scrie-ți gândurile',
    },
    '7y91mnyt': {
      'en': 'Next Competition',
      'de': 'Nächster Wettbewerb',
      'es': 'Próxima Competición',
      'ro': 'Următoarea competiție',
    },
    '1ddrftq1': {
      'en': 'What to Add next as Prieze for competitions?',
      'de': 'Was ist als nächstes als Preis für Wettbewerbe hinzuzufügen?',
      'es': '¿Qué agregar a continuación como premio para las competiciones?',
      'ro': 'Ce să adăugați în continuare ca Prieze pentru competiții?',
    },
    'a5k4ozoo': {
      'en': 'Field is required',
      'de': 'Feld ist erforderlich',
      'es': 'Se requiere campo',
      'ro': 'Câmpul este obligatoriu',
    },
    'easigau8': {
      'en': 'Please choose an option from the dropdown',
      'de': 'Bitte wählen Sie eine Option aus der Dropdown-Liste aus',
      'es': 'Por favor elija una opción del menú desplegable',
      'ro': 'Vă rugăm să alegeți o opțiune din meniul drop-down',
    },
    'wy1yi9s2': {
      'en': 'Field is required',
      'de': 'Feld ist erforderlich',
      'es': 'Se requiere campo',
      'ro': 'Câmpul este obligatoriu',
    },
    '3qhcr6dz': {
      'en': 'Please choose an option from the dropdown',
      'de': 'Bitte wählen Sie eine Option aus der Dropdown-Liste aus',
      'es': 'Por favor elija una opción del menú desplegable',
      'ro': 'Vă rugăm să alegeți o opțiune din meniul drop-down',
    },
    'gs33aod6': {
      'en': 'Field is required',
      'de': 'Feld ist erforderlich',
      'es': 'Se requiere campo',
      'ro': 'Câmpul este obligatoriu',
    },
    'awnp3y5k': {
      'en': 'Please choose an option from the dropdown',
      'de': 'Bitte wählen Sie eine Option aus der Dropdown-Liste aus',
      'es': 'Por favor elija una opción del menú desplegable',
      'ro': 'Vă rugăm să alegeți o opțiune din meniul drop-down',
    },
    'ym2ogdcd': {
      'en': 'Field is required',
      'de': 'Feld ist erforderlich',
      'es': 'Se requiere campo',
      'ro': 'Câmpul este obligatoriu',
    },
    'b5slsjn6': {
      'en': 'Please choose an option from the dropdown',
      'de': 'Bitte wählen Sie eine Option aus der Dropdown-Liste aus',
      'es': 'Por favor elija una opción del menú desplegable',
      'ro': 'Vă rugăm să alegeți o opțiune din meniul derulant',
    },
    'rrt09tsa': {
      'en': 'Field is required',
      'de': 'Feld ist erforderlich',
      'es': 'Se requiere campo',
      'ro': 'Câmpul este obligatoriu',
    },
    '9zktyqzr': {
      'en': 'Please choose an option from the dropdown',
      'de': 'Bitte wählen Sie eine Option aus der Dropdown-Liste aus',
      'es': 'Por favor elija una opción del menú desplegable',
      'ro': 'Vă rugăm să alegeți o opțiune din meniul drop-down',
    },
    'gwd45hd5': {
      'en': 'Send',
      'de': 'Schicken',
      'es': 'Enviar',
      'ro': 'Trimite',
    },
    '5yyffrg9': {
      'en': 'Home',
      'de': 'Heim',
      'es': 'Hogar',
      'ro': 'Acasă',
    },
  },
  // ForgotPassword
  {
    '40os269w': {
      'en': 'Back',
      'de': 'Zurück',
      'es': 'Atrás',
      'ro': 'Înapoi',
    },
    'v2s6bdnq': {
      'en': 'Forgot Password ?',
      'de': 'Passwort vergessen',
      'es': 'Has olvidado tu contraseña',
      'ro': 'Aţi uitat parola',
    },
    '0qwvu22z': {
      'en':
          'We will send you an email with a link to reset your password, please enter the email associated with your account below.',
      'de':
          'Wir senden Ihnen eine E-Mail mit einem Link zum Zurücksetzen Ihres Passworts. Bitte geben Sie unten die mit Ihrem Konto verknüpfte E-Mail-Adresse ein.',
      'es':
          'Le enviaremos un correo electrónico con un enlace para restablecer su contraseña; ingrese el correo electrónico asociado con su cuenta a continuación.',
      'ro':
          'Vă vom trimite un e-mail cu un link pentru a vă reseta parola, vă rugăm să introduceți mai jos adresa de e-mail asociată contului dvs.',
    },
    'bxrkozgo': {
      'en': 'Your email address...',
      'de': 'Ihre E-Mail-Adresse...',
      'es': 'Su dirección de correo electrónico...',
      'ro': 'Adresa dvs. de e-mail...',
    },
    '7qx2e3qi': {
      'en': 'Enter your email...',
      'de': 'Geben sie ihre E-Mail Adresse ein...',
      'es': 'Introduce tu correo electrónico...',
      'ro': 'Introduceți adresa dvs. de email...',
    },
    '2l9kooun': {
      'en': 'Send Link',
      'de': 'Link senden',
      'es': 'Enviar enlace',
      'ro': 'Trimite linkul',
    },
    '4mo86syu': {
      'en': 'Home',
      'de': 'Heim',
      'es': 'Hogar',
      'ro': 'Acasă',
    },
  },
  // updatePassword
  {
    'u8wzao13': {
      'en': 'Update  Password',
      'de': 'Kennwort aktualisieren',
      'es': 'Actualiza contraseña',
      'ro': 'Actualizați parola',
    },
    'kmkjm8k8': {
      'en': 'New Password',
      'de': 'Neues Kennwort',
      'es': 'Nueva contraseña',
      'ro': 'Parolă Nouă',
    },
    'vjiyliz3': {
      'en': 'Enter your new password',
      'de': 'Gib dein neues Passwort ein',
      'es': 'Introduzca su nueva contraseña',
      'ro': 'Introduceți noua parolă',
    },
    '8itp058u': {
      'en': 'Update',
      'de': 'Aktualisieren',
      'es': 'Actualizar',
      'ro': 'Actualizați',
    },
    'rm5d4r8d': {
      'en': 'Home',
      'de': 'Heim',
      'es': 'Hogar',
      'ro': 'Acasă',
    },
  },
  // Success
  {
    'hz9uf590': {
      'en': 'Bounty Fever',
      'de': 'Bounty Fever',
      'es': 'Bounty Fever',
      'ro': 'Bounty Fever',
    },
    'qetyrpd5': {
      'en':
          'Congratulation, you are now part of the competitions!\n\nPlease Return to the app to confirm the Payment!',
      'de':
          'Herzlichen Glückwunsch, Sie nehmen jetzt an den Wettbewerben teil!\n\nBitte kehren Sie zur App zurück, um die Zahlung zu bestätigen!',
      'es':
          '¡Felicitaciones, ahora eres parte de las competencias!\n\n¡Regresa a la aplicación para confirmar el pago!',
      'ro':
          'Felicitări, acum faceți parte din competiții!\n\nVă rugăm să reveniți la aplicație pentru a confirma plata!',
    },
    'hhsz8ojw': {
      'en': 'More Details',
      'de': 'Mehr Details',
      'es': 'Más detalles',
      'ro': 'Mai multe detalii',
    },
    '6xxjlgrg': {
      'en':
          'Your invoice has been sent by email.\n\nTickets Number you will find them on My Tickets page.\n\nOredr details can be found on My Orders page.\n\n\nThank you for choosing to be part of our Competitions!',
      'de':
          'Ihre Rechnung wurde per E-Mail gesendet.\n\nTicketnummer finden Sie auf der Seite „Meine Tickets“.\n\nOredr-Details finden Sie auf der Seite „Meine Bestellungen“.\n\n\n Vielen Dank, dass Sie sich für die Teilnahme an unseren Wettbewerben entschieden haben!',
      'es':
          'Su factura ha sido enviada por correo electrónico.\n\nNúmero de boletos, los encontrará en la página Mis boletos.\n\nLos detalles del pedido se pueden encontrar en la página Mis pedidos.\n\n\n ¡Gracias por elegir ser parte de nuestros Concursos!',
      'ro':
          'Factura dvs. a fost trimisă prin e-mail.\n\nNumărul de bilete le veți găsi pe pagina Biletele mele.\n\nDetaliile despre comanda pot fi găsite pe pagina Comenzile mele.\n\n\n Vă mulțumim că ați ales să faceți parte din Concursurile noastre!',
    },
    'ag8oaqyg': {
      'en': 'Good Luck!',
      'de': 'Viel Glück!',
      'es': '¡Buena suerte!',
      'ro': 'Succes!',
    },
    'fbcn61f3': {
      'en':
          'For any information or support please fell free to reach out to: contact@bountyfever.com',
      'de':
          'Für weitere Informationen oder Unterstützung wenden Sie sich bitte an: contact@bountyfever.com',
      'es':
          'Para cualquier información o soporte, no dude en comunicarse con: contact@bountyfever.com',
      'ro':
          'Pentru orice informații sau asistență, nu ezitați să contactați: contact@bountyfever.com',
    },
    'oeuyzwst': {
      'en': 'Home',
      'de': 'Heim',
      'es': 'Hogar',
      'ro': 'Acasă',
    },
  },
  // header_pc
  {
    'eho9ssii': {
      'en': 'Bounty',
      'de': 'Bounty',
      'es': 'Bounty',
      'ro': 'Bounty',
    },
    '1f2weq52': {
      'en': ' Fever',
      'de': ' Fever',
      'es': ' Fever',
      'ro': ' Fever',
    },
    '7l4z7x69': {
      'en': 'Bounty Fever',
      'de': 'Bounty Fever',
      'es': 'Bounty Fever',
      'ro': 'Bounty Fever',
    },
    '2uzbxwdm': {
      'en': 'Home',
      'de': 'Heim',
      'es': 'Hogar',
      'ro': 'Acasă',
    },
    '3vrk78tl': {
      'en': 'Competitions',
      'de': 'Wettbewerbe',
      'es': 'Competiciones',
      'ro': 'Concursuri',
    },
    'p7k1dkrw': {
      'en': 'Winners',
      'de': 'Gewinner',
      'es': 'Ganadores',
      'ro': 'Câștigători',
    },
    'enkwsway': {
      'en': 'Tickets List',
      'de': 'Ticketliste',
      'es': 'Lista de entradas',
      'ro': 'Lista de bilete',
    },
    'ro0wfmpm': {
      'en': 'FAQ',
      'de': 'FAQ',
      'es': 'Preguntas más frecuentes',
      'ro': 'FAQ',
    },
    '0oa7pf01': {
      'en': 'Bounty',
      'de': 'Bounty',
      'es': 'Bounty',
      'ro': 'Bounty',
    },
    'p1ejpyit': {
      'en': ' Fever',
      'de': ' Fever',
      'es': ' Fever',
      'ro': ' Fever',
    },
    '2bjumn4b': {
      'en': 'Bounty Fever',
      'de': 'Bounty Fever',
      'es': 'Bounty Fever',
      'ro': 'Bounty Fever',
    },
  },
  // footer_pc
  {
    'ysqrxbll': {
      'en': 'Home',
      'de': 'Heim',
      'es': 'Hogar',
      'ro': 'Acasă',
    },
    'puc0la17': {
      'en': 'Winners',
      'de': 'Gewinner',
      'es': 'Ganadores',
      'ro': 'Câștigători',
    },
    'im40j10i': {
      'en': 'Tickets List',
      'de': 'Mein Konto',
      'es': 'Mi cuenta',
      'ro': 'Contul meu',
    },
    '5xwjwf4z': {
      'en': 'FAQ',
      'de': 'FAQ',
      'es': 'Preguntas más frecuentes',
      'ro': 'FAQ',
    },
    'irzgel50': {
      'en': 'Competitions',
      'de': 'Wettbewerbe',
      'es': 'Competiciones',
      'ro': 'Concursuri',
    },
    'pbtfe9pq': {
      'en': 'About us',
      'de': 'Über uns',
      'es': 'Sobre nosotros',
      'ro': 'Despre noi',
    },
    '0ecj6kix': {
      'en': 'Contact us',
      'de': 'Kontaktiere uns',
      'es': 'Contáctenos',
      'ro': 'Contactaţi-ne',
    },
    'bet9ikbw': {
      'en': 'Send feedback',
      'de': 'Feedback abschicken',
      'es': 'Enviar comentarios',
      'ro': 'Trimite feedback',
    },
    'wfhtbh0x': {
      'en': 'Privacy Policy',
      'de': 'Datenschutzrichtlinie',
      'es': 'política de privacidad',
      'ro': 'Politica de confidențialitate',
    },
    'cjk0la2x': {
      'en': 'Terms & Conditions',
      'de': 'Terms & amp; Bedingungen',
      'es': 'Términos y condiciones',
      'ro': 'termeni si conditii',
    },
    'fqegb2y9': {
      'en': 'Cookie policy',
      'de': 'Cookie-Richtlinie',
      'es': 'Política de cookies',
      'ro': 'Politica de cookie-uri',
    },
    '2ej3p0ew': {
      'en': 'Acceptable use policy',
      'de': 'Richtlinien zur akzeptablen Nutzung',
      'es': 'Política de uso aceptable',
      'ro': 'Politica de utilizare acceptabilă',
    },
    'njsx14dd': {
      'en': 'Refund Policy',
      'de': 'Rückgaberecht',
      'es': 'Politica de reembolso',
      'ro': 'Politica de rambursare',
    },
    'xjhy4l9o': {
      'en': 'BlueDash LTD',
      'de': 'BlueDash LTD',
      'es': 'BlueDash LTD',
      'ro': 'BlueDash LTD',
    },
    '5v68qc7l': {
      'en': ' Company number: 15584865',
      'de': 'Firmennummer: 15584865',
      'es': 'Número de empresa: 15584865',
      'ro': 'Număr companie: 15584865',
    },
    'rfe1rdk6': {
      'en': 'BlueDash LTD',
      'de': 'BlueDash LTD',
      'es': 'BlueDash LTD',
      'ro': 'BlueDash LTD',
    },
    'cheorah3': {
      'en': '© 2024 BountyFever.com',
      'de': '© 2024 BountyFever.com',
      'es': '© 2024 BountyFever.com',
      'ro': '© 2024 BountyFever.com',
    },
  },
  // WinnerDetails
  {
    'i5k3fpc8': {
      'en': 'Competition Name',
      'de': 'Wettbewerbsname',
      'es': 'Nombre de la competencia',
      'ro': 'Numele competiției',
    },
    '9pzqamg2': {
      'en': 'Date',
      'de': 'Datum',
      'es': 'Fecha',
      'ro': 'Data',
    },
    'gpekakcq': {
      'en': 'Congratulations to',
      'de': 'Glückwünsche an',
      'es': 'enhorabuena a',
      'ro': 'Felicitări lui',
    },
    '56tvazdi': {
      'en': 'name',
      'de': 'Name',
      'es': 'nombre',
      'ro': 'Nume',
    },
    '7hia8amt': {
      'en': 'with ticket number',
      'de': 'mit Ticketnummer',
      'es': 'con numero de billete',
      'ro': 'cu numărul biletului',
    },
    'oinvy2qm': {
      'en': 'number',
      'de': 'Nummer',
      'es': 'número',
      'ro': 'număr',
    },
    '4ivq1i43': {
      'en': 'Congratulations to',
      'de': 'Glückwünsche an',
      'es': 'enhorabuena a',
      'ro': 'Felicitări lui',
    },
    'q4uf39ec': {
      'en': 'name',
      'de': 'Name',
      'es': 'nombre',
      'ro': 'Nume',
    },
    '4cqk3p3n': {
      'en': 'with ticket number',
      'de': 'mit Ticketnummer',
      'es': 'con numero de billete',
      'ro': 'cu numărul biletului',
    },
    'pxxf1bto': {
      'en': 'number',
      'de': 'Nummer',
      'es': 'número',
      'ro': 'număr',
    },
    'eo8b4akk': {
      'en': 'Close',
      'de': 'Schließen',
      'es': 'Cerca',
      'ro': 'Închide',
    },
  },
  // postalentry
  {
    '88nu42qu': {
      'en': 'Free Postal Entry Route',
      'de': 'Kostenloser Postweg',
      'es': 'Ruta de Entrada Postal Gratuita',
      'ro': 'Rută de intrare poștală gratuită',
    },
    'rt5rbb0g': {
      'en':
          'Postal entries to this competition receive 1 ticket. You may enter the competition using the Postal Entry Route by complying with the following conditions:',
      'de':
          'Posteinsendungen zu diesem Wettbewerb erhalten 1 Ticket. Sie können über den Postweg am Wettbewerb teilnehmen, indem Sie die folgenden Bedingungen erfüllen:',
      'es':
          'Las inscripciones postales a este concurso reciben 1 entrada. Podrás participar en el concurso utilizando la Vía de Entrada Postal cumpliendo las siguientes condiciones:',
      'ro':
          'Înscrierile poștale la acest concurs primesc 1 bilet. Vă puteți înscrie în competiție utilizând Ruta de intrare poștală respectând următoarele condiții:',
    },
    'lyla2rm7': {
      'en':
          '1. Send your entry on an unenclosed postcard to the Promoter at the following address:\nKenton Road 382,  Harrow, Greater London, Middlesex, United Kingdom, HA3 8DP',
      'de':
          '1. Senden Sie Ihren Beitrag auf einer nicht beiliegenden Postkarte an den Veranstalter unter der folgenden Adresse:\nKenton Road 382, ​​Harrow, Greater London, Middlesex, Vereinigtes Königreich, HA3 8DP',
      'es':
          '1. Envíe su inscripción en una postal no adjunta al Promotor a la siguiente dirección:\nKenton Road 382, ​​Harrow, Greater London, Middlesex, United Kingdom, HA3 8DP',
      'ro':
          '1. Trimiteți-vă participarea pe o carte poștală neînchisă către Promotor la următoarea adresă:\nKenton Road 382, ​​Harrow, Greater London, Middlesex, Regatul Unit, HA3 8DP',
    },
    'jsfzpok2': {
      'en':
          '2. Hand delivered entries will not be accepted and will not be entered into the random draws.',
      'de':
          '2. Persönlich eingereichte Einsendungen werden nicht akzeptiert und nehmen nicht an der Zufallsverlosung teil.',
      'es':
          '2. No se aceptarán participaciones entregadas personalmente y no participarán en sorteos aleatorios.',
      'ro':
          '2. Înscrierile livrate manual nu vor fi acceptate și nu vor fi înscrise în tragerile aleatorii.',
    },
    'wwmlchf6': {
      'en':
          '3. Include with your entry the following information:\n- details of the Competition you wish to enter\n- your full name;\n- your date of birth;\n- your postal address;\n- a contact telephone number and email address;\n- your chosen competition;\n- your answer to any Competition Question',
      'de':
          '3. Fügen Sie Ihrer Einsendung die folgenden Informationen bei:\n- Einzelheiten des Wettbewerbs, an dem Sie teilnehmen möchten\n- Ihr vollständiger Name;\n- Ihr Geburtsdatum;\n- Ihre Postanschrift;\n - eine Kontakttelefonnummer und E-Mail-Adresse;\n- Ihr ausgewählter Wettbewerb;\n- Ihre Antwort auf alle Wettbewerbsfragen',
      'es':
          '3. Incluya con su inscripción la siguiente información:\n- detalles del Concurso en el que desea participar\n- su nombre completo;\n- su fecha de nacimiento;\n- su dirección postal;\n - un número de teléfono de contacto y una dirección de correo electrónico;\n- la competencia elegida;\n- su respuesta a cualquier pregunta de la competencia',
      'ro':
          '3. Includeți împreună cu înscrierea dumneavoastră următoarele informații:\n- detaliile Competiției la care doriți să participați\n- numele dumneavoastră complet;\n- data nașterii;\n- adresa dumneavoastră poștală;\n - un număr de telefon de contact și o adresă de e-mail;\n- competiția aleasă de dvs.;\n- răspunsul dumneavoastră la orice întrebare de concurs',
    },
    'yrvwwzm2': {
      'en': '4. Incomplete or illegible entries will be disqualified;',
      'de':
          '4. Unvollständige oder unleserliche Einsendungen werden disqualifiziert;',
      'es':
          '4. Las inscripciones incompletas o ilegibles serán descalificadas;',
      'ro': '4. Înscrierile incomplete sau ilizibile vor fi descalificate;',
    },
    'usoi70op': {
      'en':
          '5. You are allowed to submit multiple free entries for any competition, up to any entry limit set by the Promoter. However, each free entry must be submitted and mailed to the Promoter separately. ',
      'de':
          '5. Sie dürfen für jeden Wettbewerb mehrere kostenlose Teilnahmen einreichen, bis zu einem vom Veranstalter festgelegten Teilnahmelimit. Allerdings muss jeder kostenlose Eintrag separat eingereicht und an den Veranstalter gesendet werden.',
      'es':
          '5. Se le permite enviar múltiples inscripciones gratuitas para cualquier competencia, hasta cualquier límite de inscripción establecido por el Promotor. Sin embargo, cada entrada gratuita debe enviarse y enviarse por correo al Promotor por separado.',
      'ro':
          '5. Aveți voie să trimiteți mai multe înscrieri gratuite pentru orice competiție, până la orice limită de înscriere stabilită de Promotor. Cu toate acestea, fiecare înregistrare gratuită trebuie trimisă și trimisă prin poștă la Promotor separat.',
    },
    '89p6kidg': {
      'en':
          '6. Multiple entries submitted in bulk will not be accepted; instead, they will be consolidated and counted as a single entry.',
      'de':
          '6. Mehrere in großen Mengen eingereichte Einsendungen werden nicht akzeptiert. Stattdessen werden sie konsolidiert und als ein einziger Eintrag gezählt.',
      'es':
          '6. No se aceptarán inscripciones múltiples enviadas de forma masiva; en cambio, se consolidarán y contarán como una sola entrada.',
      'ro':
          '6. Înscrierile multiple trimise în bloc nu vor fi acceptate; în schimb, acestea vor fi consolidate și contabilizate ca o singură intrare.',
    },
    'e6mn5his': {
      'en':
          '7. To participate in a Standard Competition, your submission must reach the Promoter before the Closing Date and before all tickets in the Competition are assigned. Any free entries received within 72 hours of the Closing Date or when all tickets have been sold/assigned will not be considered for the current Competition. Instead, at the discretion of the Promoter, they may be included in the next Competition of similar value with available entries. Free entries received after the Closing Date or after all tickets have been sold/assigned will not be considered for the current or any future Competitions. Proof of posting does not ensure entry into the random draw and is not considered proof of receipt.',
      'de':
          '7. Um an einem Standardwettbewerb teilzunehmen, muss Ihr Beitrag vor dem Einsendeschluss und vor der Zuteilung aller Tickets für den Wettbewerb beim Veranstalter eingehen. Alle kostenlosen Eintritte, die innerhalb von 72 Stunden nach dem Einsendeschluss eingehen oder wenn alle Tickets verkauft/zugeteilt wurden, werden für den aktuellen Wettbewerb nicht berücksichtigt. Stattdessen können sie nach Ermessen des Veranstalters in den nächsten Wettbewerb von ähnlichem Wert mit verfügbaren Einträgen aufgenommen werden. Kostenlose Anmeldungen, die nach dem Einsendeschluss oder nachdem alle Tickets verkauft/zugeteilt wurden, eingehen, werden für den aktuellen oder zukünftige Wettbewerbe nicht berücksichtigt. Ein Einsendenachweis stellt keinen Anspruch auf Teilnahme an der Verlosung dar und gilt nicht als Empfangsnachweis.',
      'es':
          '7. Para participar en una Competición Estándar, su envío debe llegar al Promotor antes de la Fecha de Cierre y antes de que se asignen todas las entradas de la Competición. Cualquier entrada gratuita recibida dentro de las 72 horas posteriores a la Fecha de cierre o cuando se hayan vendido/asignado todos los boletos no se considerará para la Competencia actual. En cambio, a discreción del Promotor, podrán ser incluidos en el próximo Concurso de valor similar con inscripciones disponibles. Las inscripciones gratuitas recibidas después de la Fecha de cierre o después de que se hayan vendido/asignado todos los boletos no se considerarán para las Competiciones actuales ni futuras. El comprobante de publicación no garantiza la participación en el sorteo aleatorio y no se considera comprobante de recepción.',
      'ro':
          '7. Pentru a participa la o Competiție Standard, trimiterea dumneavoastră trebuie să ajungă la Promotor înainte de Data Închiderii și înainte ca toate biletele din Competiție să fie atribuite. Orice înscrieri gratuite primite în termen de 72 de ore de la Data Închiderii sau când toate biletele au fost vândute/alocate nu vor fi luate în considerare pentru Competiția curentă. În schimb, la discreția Promotorului, aceștia pot fi incluși în următoarea Competiție de valoare similară cu înscrieri disponibile. Înscrierile gratuite primite după Data închiderii sau după ce toate biletele au fost vândute/alocate nu vor fi luate în considerare pentru competițiile actuale sau viitoare. Dovada postării nu asigură intrarea în tragere la sorți și nu este considerată dovadă de primire.',
    },
    '7ql0mmdp': {
      'en':
          '8. The Promoter will send an email to every Entrant who has submitted a valid entry through the Postal Entry Route to verify their ticket number.',
      'de':
          '8. Der Veranstalter sendet jedem Teilnehmer, der eine gültige Teilnahme über den Postweg eingereicht hat, eine E-Mail, um seine Ticketnummer zu überprüfen.',
      'es':
          '8. El Promotor enviará un correo electrónico a cada Participante que haya enviado una inscripción válida a través de la Ruta de Entrada Postal para verificar su número de boleto.',
      'ro':
          '8. Promotorul va trimite un e-mail fiecărui Participant care a trimis o înregistrare validă prin Ruta de Intrare Poștală pentru a-și verifica numărul biletului.',
    },
    '0vzs5kuy': {
      'en':
          '9. Participants must establish an account on the Website/App for the free entry to be handled. The information provided on the postcard must match the details on the account to receive the order confirmation and ticket number. Postal entries lacking a registered account cannot be handled. Entrants are required to include an address in the associated account for entries to be processed',
      'de':
          '9. Für die Abwicklung des kostenlosen Eintritts müssen die Teilnehmer ein Konto auf der Website/App einrichten. Um die Bestellbestätigung und Ticketnummer zu erhalten, müssen die Angaben auf der Postkarte mit den Angaben auf dem Konto übereinstimmen. Posteinsendungen ohne registriertes Konto können nicht bearbeitet werden. Damit die Anmeldungen bearbeitet werden können, müssen die Teilnehmer im zugehörigen Konto eine Adresse angeben',
      'es':
          '9. Los participantes deben establecer una cuenta en el sitio web/aplicación para que se pueda gestionar la entrada gratuita. La información proporcionada en la postal debe coincidir con los datos de la cuenta para recibir la confirmación del pedido y el número de billete. No se podrán gestionar entradas postales que carezcan de cuenta registrada. Los participantes deben incluir una dirección en la cuenta asociada para que se procesen las inscripciones.',
      'ro':
          '9. Participanții trebuie să își stabilească un cont pe site-ul/aplicație pentru ca intrarea gratuită să fie gestionată. Informațiile furnizate pe cartea poștală trebuie să se potrivească cu detaliile din cont pentru a primi confirmarea comenzii și numărul biletului. Înregistrările poștale fără un cont înregistrat nu pot fi gestionate. Participanții trebuie să includă o adresă în contul asociat pentru ca intrările să fie procesate',
    },
    'mq02azey': {
      'en':
          '10. If the number of entries received hits a cap or limit before your free entry arrives, you will not be entered into the Competition or any other Competition, unless otherwise specified in paragraph 6 above.',
      'de':
          '10. Wenn die Anzahl der eingegangenen Einsendungen eine Obergrenze oder ein Limit erreicht, bevor Ihre kostenlose Einsendung eintrifft, nehmen Sie nicht am Wettbewerb oder einem anderen Wettbewerb teil, sofern in Absatz 6 oben nichts anderes angegeben ist.',
      'es':
          '10. Si el número de inscripciones recibidas alcanza un límite antes de que llegue su inscripción gratuita, no podrá participar en el Concurso ni en ningún otro Concurso, a menos que se especifique lo contrario en el párrafo 6 anterior.',
      'ro':
          '10. Dacă numărul de înscrieri primite atinge un plafon sau o limită înainte de sosirea intrării dumneavoastră gratuite, nu veți fi înscris în Competiție sau în orice altă Competiție, cu excepția cazului în care se specifică altfel în paragraful 6 de mai sus.',
    },
    '1u1fiykj': {
      'en': 'Close',
      'de': 'Schließen',
      'es': 'Cerca',
      'ro': 'Închide',
    },
  },
  // cEnterNow
  {
    '3ozfg8x6': {
      'en': 'Select number or tickets',
      'de': 'Nummer oder Tickets auswählen',
      'es': 'Selecciona número o entradas',
      'ro': 'Selectați numărul sau biletele',
    },
    '5pu47xki': {
      'en': '+10',
      'de': '10',
      'es': '10',
      'ro': '10',
    },
    'gx8c0pss': {
      'en': '+25',
      'de': '25',
      'es': '25',
      'ro': '25',
    },
    'fcrtu2za': {
      'en': 'Max',
      'de': 'Max',
      'es': 'máx.',
      'ro': 'Max',
    },
    'c2y28qro': {
      'en': 'Reset',
      'de': 'Zurücksetzen',
      'es': 'Reiniciar',
      'ro': 'Resetați',
    },
    '8g1qrwp6': {
      'en': 'Competition Question:',
      'de': 'Wettbewerbsfrage:',
      'es': 'Pregunta de competencia:',
      'ro': 'Întrebare de concurs:',
    },
    'sfsbjlsh': {
      'en': 'Which city is the capital of England?',
      'de': 'Welche Stadt ist die Hauptstadt Englands?',
      'es': '¿Qué ciudad es la capital de Inglaterra?',
      'ro': 'Care oraș este capitala Angliei?',
    },
    'jjz7nccb': {
      'en': 'Please make a selection from the options below.',
      'de': 'Bitte treffen Sie eine Auswahl aus den folgenden Optionen.',
      'es': 'Por favor haga una selección de las siguientes opciones.',
      'ro': 'Vă rugăm să faceți o selecție dintre opțiunile de mai jos.',
    },
    '9m2gcwzk': {
      'en': 'Glasgow',
      'de': 'Glasgow',
      'es': 'glasgow',
      'ro': 'Glasgow',
    },
    'ndlyw5g5': {
      'en': 'London',
      'de': 'London',
      'es': 'Londres',
      'ro': 'Londra',
    },
    'ax5wh46i': {
      'en': 'Manchester',
      'de': 'Manchester',
      'es': 'Manchester',
      'ro': 'Manchester',
    },
    'e5s72vka': {
      'en': 'Select answer',
      'de': 'Antwort auswählen',
      'es': 'Seleccionar respuesta',
      'ro': 'Selectați răspunsul',
    },
    'qwv2zu02': {
      'en': 'Ordering implies agreement to our  ',
      'de': 'Mit der Bestellung erklären Sie sich mit unseren einverstanden',
      'es': 'El pedido implica la aceptación de nuestra',
      'ro': 'Comanda presupune acordul nostru',
    },
    'j63hhvp6': {
      'en': 'terms and conditions ',
      'de': 'Geschäftsbedingungen',
      'es': 'Términos y condiciones',
      'ro': 'Termeni și condiții',
    },
    '6pe6rjub': {
      'en': 'and ',
      'de': 'Und',
      'es': 'y',
      'ro': 'și',
    },
    'o0s0q13k': {
      'en': 'privacy policy.',
      'de': 'Datenschutzrichtlinie.',
      'es': 'política de privacidad.',
      'ro': 'Politica de confidențialitate.',
    },
    'an4is7bk': {
      'en':
          'Ordering implies agreement to our terms and conditions and privacy policy',
      'de':
          'Mit der Bestellung stimmen Sie unseren Allgemeinen Geschäftsbedingungen und Datenschutzbestimmungen zu',
      'es':
          'Realizar el pedido implica la aceptación de nuestros términos y condiciones y política de privacidad.',
      'ro':
          'Comandarea implică acordul cu termenii și condițiile noastre și cu politica de confidențialitate',
    },
    'ij2sh2v9': {
      'en': 'Proceed to Payment',
      'de': 'Weiter zur Zahlung',
      'es': 'Proceder al pago',
      'ro': 'Finalizați plata',
    },
  },
  // CookiesPreferences
  {
    '7rjftcbc': {
      'en': 'Cookies Preferences',
      'de': 'Cookie-Einstellungen',
      'es': 'Preferencias de cookies',
      'ro': 'Preferințe cookie',
    },
    '3fayj0vk': {
      'en':
          'This website utilizes cookies to improve browsing experience and offer extra functionality. None of the information gathered will be used to identify or contact you. Third-party cookies are employed on this website; refer to the privacy policy for specifics. Additionally, tracking cookies are utilized; consult the privacy policy for further details. Should you prefer, you can choose the types of cookies you find acceptable.',
      'de':
          'Diese Website verwendet Cookies, um das Surferlebnis zu verbessern und zusätzliche Funktionen anzubieten. Keine der gesammelten Informationen wird dazu verwendet, Sie zu identifizieren oder zu kontaktieren. Auf dieser Website werden Cookies von Drittanbietern eingesetzt; Einzelheiten finden Sie in der Datenschutzerklärung. Darüber hinaus werden Tracking-Cookies eingesetzt; Weitere Einzelheiten finden Sie in der Datenschutzerklärung. Wenn Sie möchten, können Sie die Arten von Cookies auswählen, die Sie für akzeptabel halten.',
      'es':
          'Este sitio web utiliza cookies para mejorar la experiencia de navegación y ofrecer funciones adicionales. Ninguna información recopilada se utilizará para identificarlo o contactarlo. En este sitio web se emplean cookies de terceros; consulte la política de privacidad para obtener más detalles. Además, se utilizan cookies de seguimiento; consulte la política de privacidad para más detalles. Si lo prefiere, puede elegir los tipos de cookies que considere aceptables.',
      'ro':
          'Acest site web utilizează cookie-uri pentru a îmbunătăți experiența de navigare și pentru a oferi funcționalități suplimentare. Niciuna dintre informațiile colectate nu va fi folosită pentru a vă identifica sau contacta. Cookie-urile de la terți sunt folosite pe acest site web; consultați politica de confidențialitate pentru detalii. În plus, sunt utilizate module cookie de urmărire; consultați politica de confidențialitate pentru mai multe detalii. Dacă preferați, puteți alege tipurile de cookie-uri pe care le considerați acceptabile.',
    },
    't14zkbkw': {
      'en': 'Technical (mandatory)',
      'de': 'Technisch (obligatorisch)',
      'es': 'Técnico (obligatorio)',
      'ro': 'Tehnic (obligatoriu)',
    },
    '9qp5l40i': {
      'en': 'Third party cookies',
      'de': 'Cookies von Drittanbietern',
      'es': 'Cookies de terceros',
      'ro': 'Cookie-uri de la terți',
    },
    '99p6u4i2': {
      'en': 'Tracking cookies',
      'de': 'Tracking cookies',
      'es': 'Cookies de rastreo',
      'ro': 'Cookie-uri de urmărire',
    },
    'jjzg4zrv': {
      'en': 'Save Preferences',
      'de': 'Einstellungen speichern',
      'es': 'Guardar preferencias',
      'ro': 'Salvați preferințe',
    },
    'ewg0jiy2': {
      'en':
          'To learn more about how this website uses cookies or localStorage, please read our ',
      'de':
          'Um mehr darüber zu erfahren, wie diese Website Cookies oder LocalStorage verwendet, lesen Sie bitte unsere',
      'es':
          'Para obtener más información sobre cómo este sitio web utiliza cookies o almacenamiento local, lea nuestra',
      'ro':
          'Pentru a afla mai multe despre modul în care acest site web utilizează cookie-uri sau stocarea locală, vă rugăm să citiți',
    },
    'u9bq3ztx': {
      'en': 'Privacy Policy.',
      'de': 'Datenschutzrichtlinie.',
      'es': 'Política de privacidad.',
      'ro': 'Politica de confidențialitate.',
    },
    '7vysqyvc': {
      'en':
          'To learn more about how this website uses cookies or localStorage, please read our Privacy Policy.',
      'de':
          'Um mehr darüber zu erfahren, wie diese Website Cookies oder localStorage verwendet, lesen Sie bitte unsere Datenschutzrichtlinie.',
      'es':
          'Para obtener más información sobre cómo este sitio web utiliza cookies o almacenamiento local, lea nuestra Política de privacidad.',
      'ro':
          'Pentru a afla mai multe despre modul în care acest site web folosește module cookie sau stocare locală, vă rugăm să citiți Politica noastră de confidențialitate.',
    },
    'vlxlz9k5': {
      'en':
          'By allowing cookies you give your permission to this website to store small bits of data on your device. To learn more about cookies and localStorage, visit ',
      'de':
          'Indem Sie Cookies zulassen, erteilen Sie dieser Website Ihre Erlaubnis, kleine Datenmengen auf Ihrem Gerät zu speichern. Weitere Informationen zu Cookies und localStorage finden Sie unter',
      'es':
          'Al permitir las cookies, usted da su permiso a este sitio web para almacenar pequeños fragmentos de datos en su dispositivo. Para obtener más información sobre las cookies y el almacenamiento local, visite',
      'ro':
          'Permițând cookie-uri, acordați permisiunea acestui site web de a stoca fragmente mici de date pe dispozitivul dvs. Pentru a afla mai multe despre cookie-uri și localStorage, vizitați',
    },
    '5vuwpwhu': {
      'en': 'Information Commissioner\'s Office.',
      'de': 'Büro des Informationskommissars.',
      'es': 'Oficina del Comisionado de Información.',
      'ro': 'Biroul Comisarului pentru Informații.',
    },
    'b01ohnhp': {
      'en':
          'By allowing cookies you give your permission to this website to store small bits of data on your device. To learn more about cookies and localStorage, visit Information Commissioner\'s Office.',
      'de':
          'Indem Sie Cookies zulassen, erteilen Sie dieser Website Ihre Erlaubnis, kleine Datenmengen auf Ihrem Gerät zu speichern. Um mehr über Cookies und localStorage zu erfahren, besuchen Sie das Information Commissioner\'s Office.',
      'es':
          'Al permitir las cookies, usted da su permiso a este sitio web para almacenar pequeños fragmentos de datos en su dispositivo. Para obtener más información sobre las cookies y el almacenamiento local, visite la Oficina del Comisionado de Información.',
      'ro':
          'Permițând cookie-uri, acordați permisiunea acestui site web de a stoca fragmente mici de date pe dispozitivul dvs. Pentru a afla mai multe despre cookie-uri și localStorage, vizitați Biroul Comisarului pentru Informații.',
    },
    'tahoe7ys': {
      'en': 'Close',
      'de': 'Schließen',
      'es': 'Cerca',
      'ro': 'Închide',
    },
  },
  // WindowsSidebar
  {
    '9o53sp02': {
      'en': 'Bounty',
      'de': 'Bounty',
      'es': 'Bounty',
      'ro': 'Bounty',
    },
    'ejvl8w76': {
      'en': ' Fever',
      'de': ' Fever',
      'es': ' Fever',
      'ro': ' Fever',
    },
    'hj63fnww': {
      'en': 'Bounty Fever',
      'de': 'Bounty Fever',
      'es': 'Bounty Fever',
      'ro': 'Bounty Fever',
    },
    'nzsg01v0': {
      'en': 'Platform Navigation',
      'de': 'Plattformnavigation',
      'es': 'Navegación de plataforma',
      'ro': 'Navigare prin platformă',
    },
    '3onzo45q': {
      'en': 'My Tickets',
      'de': 'Meine Tickets',
      'es': 'Mis entradas',
      'ro': 'Biletele mele',
    },
    'a5k8u03s': {
      'en': 'My Orders',
      'de': 'Meine Bestellungen',
      'es': 'Mis ordenes',
      'ro': 'Comenzile mele',
    },
    'q5qmeogr': {
      'en': 'Settings',
      'de': 'Einstellungen',
      'es': 'Ajustes',
      'ro': 'Setări',
    },
    '2zxjhpuz': {
      'en': 'My Account',
      'de': 'Mein Konto',
      'es': 'Mi cuenta',
      'ro': 'Contul meu',
    },
    'ss8oucyc': {
      'en': 'Notifications',
      'de': 'Benachrichtigungen',
      'es': 'Notificaciones',
      'ro': 'Notificări',
    },
    'tvjrmn85': {
      'en': '12',
      'de': '12',
      'es': '12',
      'ro': '12',
    },
    '1l9ztcgt': {
      'en': 'My BF Points',
      'de': 'Meine BF-Punkte',
      'es': 'Mis puntos BF',
      'ro': 'Punctele mele BF',
    },
    'm0clt5xb': {
      'en': 'Invite a Friend',
      'de': 'Einen Freund einladen',
      'es': 'Invita a un amigo',
      'ro': 'Invita un prieten',
    },
    'w0htqjej': {
      'en': 'Log Out',
      'de': 'Ausloggen',
      'es': 'Cerrar sesión',
      'ro': 'Deconectați-vă',
    },
    '7vxyw3m1': {
      'en': 'Log In',
      'de': 'Anmeldung',
      'es': 'Acceso',
      'ro': 'Log in',
    },
  },
  // footer_mobile
  {
    'ooedf31j': {
      'en': 'Home',
      'de': 'Heim',
      'es': 'Hogar',
      'ro': 'Acasă',
    },
    'wmp0fywo': {
      'en': 'Winners',
      'de': 'Gewinner',
      'es': 'Ganadores',
      'ro': 'Câștigători',
    },
    'wedzu7g2': {
      'en': 'Tickets List',
      'de': 'Mein Konto',
      'es': 'Mi cuenta',
      'ro': 'Contul meu',
    },
    'skiq3mb1': {
      'en': 'FAQ',
      'de': 'FAQ',
      'es': 'Preguntas más frecuentes',
      'ro': 'FAQ',
    },
    'mpfojwyb': {
      'en': 'Competitions',
      'de': 'Wettbewerbe',
      'es': 'Competiciones',
      'ro': 'Concursuri',
    },
    'axaidhy6': {
      'en': 'About us',
      'de': 'Über uns',
      'es': 'Sobre nosotros',
      'ro': 'Despre noi',
    },
    'xjf2gd6r': {
      'en': 'Contact us',
      'de': 'Kontaktiere uns',
      'es': 'Contáctenos',
      'ro': 'Contactaţi-ne',
    },
    'd0he69dr': {
      'en': 'Send feedback',
      'de': 'Feedback abschicken',
      'es': 'Enviar comentarios',
      'ro': 'Trimite feedback',
    },
    'wsgcowfp': {
      'en': 'Privacy Policy',
      'de': 'Datenschutzrichtlinie',
      'es': 'política de privacidad',
      'ro': 'Politica de confidențialitate',
    },
    '8uvckl36': {
      'en': 'Terms & Conditions',
      'de': 'Terms & amp; Bedingungen',
      'es': 'Términos y condiciones',
      'ro': 'termeni si conditii',
    },
    'bv10pw5q': {
      'en': 'Cookie policy',
      'de': 'Cookie-Richtlinie',
      'es': 'Política de cookies',
      'ro': 'Politica de cookie-uri',
    },
    '9njqxnvt': {
      'en': 'Acceptable use policy',
      'de': 'Richtlinien zur akzeptablen Nutzung',
      'es': 'Política de uso aceptable',
      'ro': 'Politica de utilizare acceptabilă',
    },
    'rvldf9iu': {
      'en': 'Refund Policy',
      'de': 'Rückgaberecht',
      'es': 'Politica de reembolso',
      'ro': 'Politica de rambursare',
    },
    '4suepady': {
      'en': 'BlueDash LTD Company number: 1584865',
      'de': 'BlueDash LTD Firmennummer: 1584865',
      'es': 'BlueDash LTD Número de empresa: 1584865',
      'ro': 'BlueDash LTD Număr companie: 1584865',
    },
    'zrhug2o0': {
      'en': '© 2024 BountyFever.com',
      'de': '© 2024 BountyFever.com',
      'es': '© 2024 BountyFever.com',
      'ro': '© 2024 BountyFever.com',
    },
  },
  // congrats
  {
    '27uo1jhb': {
      'en': 'Congratulations!',
      'de': 'Glückwunsch!',
      'es': '¡Felicidades!',
      'ro': 'Felicitări!',
    },
    'nzt8dknk': {
      'en':
          'You\'re officially part of the Competition!\nWishing you the best of luck! 🍀',
      'de':
          'Sie sind offiziell Teil des Wettbewerbs!\nIch wünsche Ihnen viel Glück! 🍀',
      'es':
          '¡Eres oficialmente parte del Concurso!\n¡Te deseo la mejor de las suertes! 🍀',
      'ro': 'Faci parte oficial din Competiție!\nÎți doresc mult succes! 🍀',
    },
    'egs6a8j4': {
      'en': 'Next',
      'de': 'Nächste',
      'es': 'Próximo',
      'ro': 'Următorul',
    },
    'cha4pfme': {
      'en': 'Go to Home',
      'de': 'Zur Startseite',
      'es': 'Ir a casa',
      'ro': 'Acasă',
    },
  },
  // paymentintent
  {
    'afdv5sti': {
      'en': 'Checking Payment Status',
      'de': 'Zahlungsstatus prüfen',
      'es': 'Comprobación del estado del pago',
      'ro': 'Verificarea stării plății',
    },
    'vgd87ipj': {
      'en':
          'Great news! A new window has opened.\n\nPlease proceed to make your payment and confirm by clicking the button below.',
      'de':
          'Großartige Neuigkeiten! Ein neues Fenster hat sich geöffnet.\n\nBitte fahren Sie mit der Zahlung fort und bestätigen Sie, indem Sie auf die Schaltfläche unten klicken.',
      'es':
          '¡Una gran noticia! Se ha abierto una nueva ventana.\n\nPor favor proceda a realizar su pago y confirme haciendo clic en el botón a continuación.',
      'ro':
          'Vesti bune! S-a deschis o fereastră nouă.\n\nVă rugăm să continuați să efectuați plata și să confirmați făcând clic pe butonul de mai jos.',
    },
    '30tybhda': {
      'en': 'Cancel Payment',
      'de': 'Zahlung stornieren',
      'es': 'Cancelar el pago',
      'ro': 'Anulați plata',
    },
    'ixipt8wo': {
      'en': 'Confirm Payment',
      'de': 'Bestätige Zahlung',
      'es': 'Confirmar pago',
      'ro': 'Confirma plata',
    },
  },
  // cookiesmall
  {
    'w9uweh6v': {
      'en': 'We use cookie!',
      'de': 'Wir verwenden Cookies!',
      'es': '¡Usamos cookies!',
      'ro': 'Folosim cookie-uri!',
    },
    'u5ukiiar': {
      'en': 'Ok, that\'s fine.',
      'de': 'OK das passt.',
      'es': 'OK eso está bien.',
      'ro': 'OK, e in regula.',
    },
    'srce22sv': {
      'en': 'For more details see Cookie policy',
      'de': 'Weitere Einzelheiten finden Sie in der Cookie-Richtlinie',
      'es': 'Para más detalles ver Política de cookies',
      'ro': 'Pentru mai multe detalii vezi Politica de cookie-uri',
    },
  },
  // component
  {
    'pdz3t8u5': {
      'en': 'Ending in: ',
      'de': 'Endet in:',
      'es': 'Terminando en:',
      'ro': 'Se termina in:',
    },
  },
  // odds
  {
    '86yme51v': {
      'en': 'Great Odds',
      'de': 'Tolle Chancen',
      'es': 'Grandes probabilidades',
      'ro': 'Cote mari',
    },
    'yc8bw1yi': {
      'en': 'Limited number of tickets in each draw',
      'de': 'Begrenzte Anzahl an Losen pro Ziehung',
      'es': 'Número limitado de boletos en cada sorteo.',
      'ro': 'Număr limitat de bilete la fiecare extragere',
    },
  },
  // transparency
  {
    'lzjrhnod': {
      'en': 'Transparency',
      'de': 'Transparenz',
      'es': 'Transparencia',
      'ro': 'Transparenţă',
    },
    'q9ho4ftt': {
      'en': 'Entry counts are always visible',
      'de': 'Die Anzahl der Einträge ist immer sichtbar',
      'es': 'Los recuentos de entradas siempre son visibles',
      'ro': 'Numărul de intrări este întotdeauna vizibil',
    },
  },
  // guaranteed
  {
    'c5zlzx37': {
      'en': 'Real Winners',
      'de': 'Echte Gewinner',
      'es': 'verdaderos ganadores',
      'ro': 'Câștigători adevărați',
    },
    '8ea658c1': {
      'en': 'Guaranteed winner all the time.\nYou can be the next one!',
      'de': 'Garantierter Gewinner immer.\nSie können der Nächste sein!',
      'es': 'Ganador garantizado todo el tiempo.\n¡Tú puedes ser el próximo!',
      'ro': 'Câștigător garantat tot timpul.\nPuteți fi următorul!',
    },
  },
  // Live
  {
    'uis21riv': {
      'en': 'Live Draws',
      'de': 'Live-Ziehungen',
      'es': 'Sorteos en vivo',
      'ro': 'Trageri live',
    },
    'imljqlq5': {
      'en': 'Real-time draws are broadcast live on Facebook',
      'de': 'Echtzeit-Ziehungen werden live auf Facebook übertragen',
      'es':
          'Los sorteos en tiempo real se retransmiten en directo por Facebook',
      'ro': 'Extragerile în timp real sunt transmise în direct pe Facebook',
    },
  },
  // prize
  {
    '7qzzehor': {
      'en': 'Step 1',
      'de': 'Schritt 1',
      'es': 'Paso 1',
      'ro': 'Pasul 1',
    },
    'rvuevlsm': {
      'en': 'Choose your prize and entries.',
      'de': 'Wählen Sie Ihren Preis und Ihre Einsendungen.',
      'es': 'Elige tu premio y entradas.',
      'ro': 'Alege-ți premiul și înscrierile.',
    },
  },
  // question
  {
    'i2cczfrd': {
      'en': 'Step 2',
      'de': 'Schritt 2',
      'es': 'Paso 2',
      'ro': 'Pasul 2',
    },
    'bwc25y9a': {
      'en': 'Provide the correct response to the question',
      'de': 'Geben Sie die richtige Antwort auf die Frage',
      'es': 'Proporcionar la respuesta correcta a la pregunta.',
      'ro': 'Oferiți răspunsul corect la întrebare',
    },
  },
  // winner
  {
    'ckwq578s': {
      'en': 'Step 3',
      'de': 'Schritt 3',
      'es': 'Paso 3',
      'ro': 'Pasul 3',
    },
    '6zlcqnpw': {
      'en': 'Tune in to the Live Draw',
      'de': 'Schalten Sie bei der Live-Ziehung ein',
      'es': 'Sintoniza el sorteo en vivo',
      'ro': 'Conectați-vă la extragerea live',
    },
  },
  // celebrate
  {
    'vmcxhmi5': {
      'en': 'Step 4',
      'de': 'Schritt 4',
      'es': 'Etapa 4',
      'ro': 'Pasul 4',
    },
    'z57enkjq': {
      'en': 'Time to Celebrate! ',
      'de': 'Zeit zu feiern!',
      'es': '¡Tiempo para celebrar!',
      'ro': 'E timpul să sărbătorești!',
    },
  },
  // endedcompPC
  {
    'iszriltc': {
      'en': 'enddate',
      'de': 'Endtermin',
      'es': 'fecha final',
      'ro': 'Data de încheiere',
    },
    '2ikmv0u8': {
      'en': 'Ended',
      'de': 'Beendet',
      'es': 'Terminado',
      'ro': 'Încheiat',
    },
    'n65n906f': {
      'en': 'Winner:',
      'de': 'Gewinner:',
      'es': 'Ganador:',
      'ro': 'Câştigător:',
    },
  },
  // endcompmobile
  {
    'u31r2cm4': {
      'en': 'Ended',
      'de': 'Beendet',
      'es': 'Terminado',
      'ro': 'Încheiat',
    },
    'e3rb8nsw': {
      'en': 'Winner:',
      'de': 'Gewinner:',
      'es': 'Ganador:',
      'ro': 'Câştigător:',
    },
  },
  // winnermobile
  {
    '5myhc9fx': {
      'en': 'Winner:',
      'de': 'Gewinner:',
      'es': 'Ganador:',
      'ro': 'Câştigător:',
    },
  },
  // winnerpc
  {
    'vkcog2lt': {
      'en': 'enddate',
      'de': 'Endtermin',
      'es': 'fecha final',
      'ro': 'Data de încheiere',
    },
    '5dren5ef': {
      'en': 'Winner:',
      'de': 'Gewinner:',
      'es': 'Ganador:',
      'ro': 'Câştigător:',
    },
  },
  // freeshipping
  {
    '3so9grt6': {
      'en': 'Free Shipping',
      'de': 'Kostenloser Versand',
      'es': 'Envío gratis',
      'ro': 'Transport gratuit',
    },
    'qihc2oun': {
      'en': 'No headaches, prizes are shipped free of charge in EU and UK',
      'de':
          'Kein Problem, die Preise werden in der EU und im Vereinigten Königreich kostenlos verschickt',
      'es':
          'Sin dolores de cabeza, los premios se envían de forma gratuita en la UE y el Reino Unido',
      'ro':
          'Fără bătăi de cap, premiile sunt livrate gratuit în UE și Marea Britanie',
    },
  },
  // newproducts
  {
    'mxsob1z1': {
      'en': 'Brand New',
      'de': 'Brandneu',
      'es': 'Para estrenar',
      'ro': 'Nouă',
    },
    'ytl1f85r': {
      'en':
          'Right from the shop, directly in your hand. All our products are brand New!',
      'de':
          'Direkt aus dem Shop, direkt in Ihrer Hand. Alle unsere Produkte sind brandneu!',
      'es':
          'Directamente de la tienda, directamente en tu mano. ¡Todos nuestros productos son nuevos!',
      'ro':
          'Chiar din magazin, direct în mână. Toate produsele noastre sunt noi!',
    },
  },
  // checkout
  {
    'y6d23lhg': {
      'en': 'Your Cart',
      'de': 'Ihr Warenkorb',
      'es': 'Tu carrito',
      'ro': 'Coșul dvs',
    },
    'az89cfah': {
      'en': 'Below is the list of items in your cart.',
      'de': 'Nachfolgend finden Sie die Liste der Artikel in Ihrem Warenkorb.',
      'es': 'A continuación se muestra la lista de artículos en su carrito.',
      'ro': 'Mai jos este lista cu articolele din coșul tău.',
    },
    '8c9m1idn': {
      'en': 'Air Max',
      'de': 'Air Max',
      'es': 'aire máximo',
      'ro': 'Air Max',
    },
    'lwaasvto': {
      'en': 'Air Max',
      'de': 'Air Max',
      'es': 'aire máximo',
      'ro': 'Air Max',
    },
    '23qib4sd': {
      'en': '\$124.00',
      'de': '124,00 \$',
      'es': '\$124.00',
      'ro': '124,00 USD',
    },
    'skn6qnfn': {
      'en': 'Order Summary',
      'de': 'Bestellübersicht',
      'es': 'Resumen del pedido',
      'ro': 'Comanda Rezumat',
    },
    'd06ay62c': {
      'en': 'Below is a list of your items.',
      'de': 'Nachfolgend finden Sie eine Liste Ihrer Artikel.',
      'es': 'A continuación se muestra una lista de sus artículos.',
      'ro': 'Mai jos este o listă cu articolele dvs.',
    },
    'uo5nk7li': {
      'en': 'Competition: ',
      'de': 'Wettbewerb:',
      'es': 'Competencia:',
      'ro': 'Competiție:',
    },
    'kf7mliau': {
      'en': 'Name',
      'de': 'Name',
      'es': 'Nombre',
      'ro': 'Nume',
    },
    '50uhjkdp': {
      'en': 'Below is a list of your items.',
      'de': 'Nachfolgend finden Sie eine Liste Ihrer Artikel.',
      'es': 'A continuación se muestra una lista de sus artículos.',
      'ro': 'Mai jos este o listă cu articolele dvs.',
    },
    '7x1gok10': {
      'en': 'Tickets Number: ',
      'de': 'Ticketnummer:',
      'es': 'Número de entradas:',
      'ro': 'Numar bilete:',
    },
    'xmbg01uw': {
      'en': 'Number',
      'de': 'Nummer',
      'es': 'Número',
      'ro': 'Număr',
    },
    'yhprgalr': {
      'en': 'Below is a list of your items.',
      'de': 'Nachfolgend finden Sie eine Liste Ihrer Artikel.',
      'es': 'A continuación se muestra una lista de sus artículos.',
      'ro': 'Mai jos este o listă cu articolele dvs.',
    },
    '1yivt8wr': {
      'en': 'Price:',
      'de': 'Preis:',
      'es': 'Precio:',
      'ro': 'Preț:',
    },
    'j5vp7ds8': {
      'en': 'Price',
      'de': 'Preis',
      'es': 'Precio',
      'ro': 'Preț',
    },
    'y9mh62cl': {
      'en': 'Below is a list of your items.',
      'de': 'Nachfolgend finden Sie eine Liste Ihrer Artikel.',
      'es': 'A continuación se muestra una lista de sus artículos.',
      'ro': 'Mai jos este o listă cu articolele dvs.',
    },
    'ngb12mq3': {
      'en': 'Total',
      'de': 'Gesamt',
      'es': 'Total',
      'ro': 'Total',
    },
    '1vs37e19': {
      'en': '\$230.20',
      'de': '230,20 \$',
      'es': '\$230.20',
      'ro': '230,20 USD',
    },
    'xvppv9qh': {
      'en': 'Continue to Checkout',
      'de': 'Weiter zur Kasse',
      'es': 'Continuar a la comprobación',
      'ro': 'Continuați la Checkout',
    },
  },
  // emptywinner
  {
    'bv8zknpk': {
      'en': 'Nothing here yet!',
      'de': 'Hier ist noch nichts!',
      'es': '¡Nada aquí todavía!',
      'ro': 'Nimic aici încă!',
    },
    '6lutdp11': {
      'en':
          'Hey there, meet Bounty Fever – your newest source of joy and excitement! 🎉\n We\'re all about spreading smiles by offering YOU the chance to snag your dream prize! 🌟 \n\nWhether it\'s that fancy gadget you\'ve been eyeing or a dream getaway, we\'ve got you covered! \n\nLet\'s make winning fun and unforgettable together! \n\nJoin the excitement now and let the good times roll! \n',
      'de':
          'Hallo, hier ist Bounty Fever – Ihre neueste Quelle der Freude und Spannung! 🎉\n Es geht uns darum, ein Lächeln zu verbreiten, indem wir IHNEN die Chance bieten, Ihren Traumpreis zu ergattern! 🌟 \n\nOb es das schicke Gadget ist, das Sie schon lange im Auge haben, oder ein Traumurlaub, wir haben alles für Sie! \n\nLasst uns gemeinsam dafür sorgen, dass das Gewinnen Spaß macht und unvergesslich wird! \n\nMachen Sie jetzt mit und genießen Sie die schöne Zeit!',
      'es':
          'Hola, te presento a Bounty Fever, ¡tu nueva fuente de alegría y emoción! 🎉\n ¡Nuestro objetivo es difundir sonrisas ofreciéndote a TI la oportunidad de conseguir el premio de tus sueños! 🌟 \n\nYa sea ese elegante dispositivo que has estado mirando o la escapada de tus sueños, ¡lo tenemos cubierto! \n\n¡Hagamos que ganar sea divertido e inolvidable juntos! \n\n¡Únete a la emoción ahora y deja pasar los buenos tiempos!',
      'ro':
          'Bună, fă cunoștință cu Bounty Fever – cea mai nouă sursă de bucurie și emoție! 🎉\n Scopul nostru este să răspândim zâmbete, oferindu-vă șansa de a obține premiul visat! 🌟 \n\nFie că este vorba despre acel gadget fantezist pe care l-ai căutat sau o evadare de vis, noi te putem acoperi! \n\nSă facem ca câștigurile să fie distractive și de neuitat împreună! \n\nAlăturați-vă entuziasmului și momentelor de neuitat acum !',
    },
    'pcni1liy': {
      'en': 'You can be the next Winner!',
      'de': 'Sie können der nächste Gewinner sein!',
      'es': '¡Tú puedes ser el próximo ganador!',
      'ro': 'Poți fi următorul Câștigător!',
    },
    'bugqwv3b': {
      'en': 'See Active Competitions',
      'de': 'Siehe Aktive Wettbewerbe',
      'es': 'Ver Competiciones Activas',
      'ro': 'Vezi Competiții active',
    },
  },
  // Miscellaneous
  {
    'z0eid56w': {
      'en': '',
      'de': '',
      'es': '',
      'ro': '',
    },
    'j1djg6o9': {
      'en': '',
      'de': '',
      'es': '',
      'ro': '',
    },
    '2dijqt0q': {
      'en': '',
      'de': '',
      'es': '',
      'ro': '',
    },
    'du01zij7': {
      'en': '',
      'de': '',
      'es': '',
      'ro': '',
    },
    'rmljgg8k': {
      'en': '',
      'de': '',
      'es': '',
      'ro': '',
    },
    'qnielzu1': {
      'en': '',
      'de': '',
      'es': '',
      'ro': '',
    },
    'cllhkznx': {
      'en': '',
      'de': '',
      'es': '',
      'ro': '',
    },
    'eiy9c21a': {
      'en': '',
      'de': '',
      'es': '',
      'ro': '',
    },
    'jcd4zboz': {
      'en': '',
      'de': '',
      'es': '',
      'ro': '',
    },
    'fpr5wnld': {
      'en': '',
      'de': '',
      'es': '',
      'ro': '',
    },
    '6r8bf5ns': {
      'en': '',
      'de': '',
      'es': '',
      'ro': '',
    },
    '79lzxsco': {
      'en': '',
      'de': '',
      'es': '',
      'ro': '',
    },
    '9o5ax8vt': {
      'en': '',
      'de': '',
      'es': '',
      'ro': '',
    },
    'zvnzacco': {
      'en': '',
      'de': '',
      'es': '',
      'ro': '',
    },
    'gxj334ua': {
      'en': '',
      'de': '',
      'es': '',
      'ro': '',
    },
    'cfu2qlpl': {
      'en': '',
      'de': '',
      'es': '',
      'ro': '',
    },
    'qgbniyj6': {
      'en': '',
      'de': '',
      'es': '',
      'ro': '',
    },
    'n8uotngb': {
      'en': '',
      'de': '',
      'es': '',
      'ro': '',
    },
    '3so991wl': {
      'en': '',
      'de': '',
      'es': '',
      'ro': '',
    },
    'assr2vbx': {
      'en': '',
      'de': '',
      'es': '',
      'ro': '',
    },
    'n1l0tft5': {
      'en': '',
      'de': '',
      'es': '',
      'ro': '',
    },
    'wix9z1gq': {
      'en': '',
      'de': '',
      'es': '',
      'ro': '',
    },
    '9b1yrjpl': {
      'en': '',
      'de': '',
      'es': '',
      'ro': '',
    },
    'wcskhpmx': {
      'en': '',
      'de': '',
      'es': '',
      'ro': '',
    },
    'h36bmzu6': {
      'en': '',
      'de': '',
      'es': '',
      'ro': '',
    },
  },
].reduce((a, b) => a..addAll(b));
