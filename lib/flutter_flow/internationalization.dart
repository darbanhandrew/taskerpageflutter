import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'de'];

  String get languageCode => locale.toString();
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? deText = '',
  }) =>
      [enText, deText][languageIndex] ?? '';
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) =>
      FFLocalizations.languages().contains(locale.toString());

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
  // Login
  {
    'xi25okkn': {
      'en': 'Welcome Back,',
      'de': 'Willkommen zurück,',
    },
    '86xd2rvp': {
      'en': 'Email Address',
      'de': 'E-Mail-Addresse',
    },
    'iyht8zkf': {
      'en': 'Enter your email here...',
      'de': 'Gib deine E-Mail hier ein...',
    },
    'lz10vs6e': {
      'en': 'Password',
      'de': 'Passwort',
    },
    'yjkqdg2t': {
      'en': 'Enter your password here...',
      'de': 'Geben Sie hier Ihr Passwort ein...',
    },
    'g8uzy5ca': {
      'en': 'Forgot Password?',
      'de': 'Passwort vergessen?',
    },
    '1alit13i': {
      'en': 'Login',
      'de': 'Anmeldung',
    },
    'edybbcds': {
      'en': 'Log in with Google',
      'de': 'Melden Sie sich mit Google an',
    },
    'd527s7xh': {
      'en': 'Create Account',
      'de': 'Konto anlegen',
    },
    'eflidfiz': {
      'en': 'Home',
      'de': 'Heim',
    },
  },
  // SignUp
  {
    'co7ic61o': {
      'en': 'Get Started',
      'de': 'Loslegen',
    },
    'smfmgnet': {
      'en': 'Email Address',
      'de': 'E-Mail-Addresse',
    },
    'ke4uhgva': {
      'en': 'Enter your email here...',
      'de': 'Gib deine E-Mail hier ein...',
    },
    '5jh8pr95': {
      'en': 'Password',
      'de': 'Passwort',
    },
    'lj3mnlw0': {
      'en': 'Enter your password here...',
      'de': 'Geben Sie hier Ihr Passwort ein...',
    },
    'yt8ccuzp': {
      'en': 'Create Account',
      'de': 'Konto anlegen',
    },
    '5nhiz008': {
      'en': 'Sign in with Google',
      'de': 'Anmeldung mit Google',
    },
    'gpqoj6gg': {
      'en': 'Log In',
      'de': 'Einloggen',
    },
    'jck20xve': {
      'en': 'Home',
      'de': 'Heim',
    },
  },
  // CreatePost
  {
    'm4o93ylm': {
      'en': 'Enter task details here...',
      'de': 'Aufgabendetails hier eingeben...',
    },
    'ioushtzf': {
      'en': 'Task Category',
      'de': 'Aufgabenkategorie',
    },
    '14ty4l7b': {
      'en': 'Tag Location',
      'de': 'Ort markieren',
    },
    'g6y1xr0d': {
      'en': 'Create Task',
      'de': 'Aufgabe erstellen',
    },
    'u9rnkcb2': {
      'en': 'Create Task',
      'de': 'Aufgabe erstellen',
    },
  },
  // OnBoarding
  {
    'jkf71q9h': {
      'en': 'Welcome ',
      'de': 'Herzlich willkommen',
    },
    'akufq03c': {
      'en': 'What do you want to do?',
      'de': 'Was möchten Sie tun?',
    },
    '492ysepd': {
      'en': 'Post a task',
      'de': 'Poste eine Aufgabe',
    },
    'ks0whi98': {
      'en': 'Post a task and find the best taskers to do them',
      'de':
          'Veröffentlichen Sie eine Aufgabe und finden Sie die besten Tasker, um sie zu erledigen',
    },
    'rb6sy1ym': {
      'en': 'Become a tasker',
      'de': 'Werde Taskler',
    },
    'djcuot29': {
      'en':
          'Get busy doing work and connecting to people rather than waiting for that call.',
      'de':
          'Beschäftigen Sie sich mit Ihrer Arbeit und verbinden Sie sich mit Menschen, anstatt auf diesen Anruf zu warten.',
    },
    '6o6ws5rg': {
      'en': 'Let us know you more!',
      'de': 'Lass uns mehr wissen!',
    },
    'a04q6rmv': {
      'en': 'Display Name',
      'de': 'Anzeigename',
    },
    'l320es32': {
      'en': 'What is your name?',
      'de': 'Wie heißen Sie?',
    },
    'fwwmoq37': {
      'en': 'Tasker',
      'de': 'Tasker',
    },
    'wgpxzges': {
      'en': 'Poster',
      'de': 'Poster',
    },
    'x3341268': {
      'en': 'Continue',
      'de': 'Fortsetzen',
    },
  },
  // ForgotPassword
  {
    '7xqs1nwo': {
      'en':
          'We will send you an email with a link to reset your password, please enter the email associated with your account below.',
      'de':
          'Wir senden Ihnen eine E-Mail mit einem Link zum Zurücksetzen Ihres Passworts. Bitte geben Sie unten die mit Ihrem Konto verknüpfte E-Mail-Adresse ein.',
    },
    '5kexlvjg': {
      'en': 'Your email address...',
      'de': 'Deine Emailadresse...',
    },
    'oq67w7sb': {
      'en': 'Enter your email...',
      'de': 'Geben sie ihre E-Mail Adresse ein...',
    },
    'cma9jga4': {
      'en': 'Send Link',
      'de': 'Link senden',
    },
    'iec0mz1z': {
      'en': 'Forgot Password',
      'de': 'Passwort vergessen',
    },
    'kw02xmz5': {
      'en': 'Home',
      'de': 'Heim',
    },
  },
  // Verify
  {
    '3uix2q72': {
      'en': 'Type in your phone number below to add to your profile.',
      'de':
          'Geben Sie unten Ihre Telefonnummer ein, um sie Ihrem Profil hinzuzufügen.',
    },
    'ryqc9ao3': {
      'en': 'Your Phone Number',
      'de': 'Deine Telefonnummer',
    },
    'pklygw30': {
      'en': 'Please enter a valid number...',
      'de': 'Bitte geben Sie eine gültige Nummer ein...',
    },
    '9avl2vfd': {
      'en': 'Send code ',
      'de': 'Code senden',
    },
    '3pdx4gvf': {
      'en': 'Skip',
      'de': 'Überspringen',
    },
    '7jlyd1wb': {
      'en': 'Verify Phonenumber',
      'de': 'Überprüfen Sie die Telefonnummer',
    },
    'evendmqo': {
      'en': 'Home',
      'de': 'Heim',
    },
  },
  // code
  {
    'fn6bpos6': {
      'en': 'Confirm your Code',
      'de': 'Bestätigen Sie Ihren Code',
    },
    'a76u03cx': {
      'en': 'Not your number? Change',
      'de': 'Nicht deine Nummer? Veränderung',
    },
    'h5dx9m75': {
      'en': 'Confirm & Continue',
      'de': 'Bestätigung & weiter',
    },
    'r6a5m4zi': {
      'en': 'Verify Code',
      'de': 'Code überprüfen',
    },
    'fakgeam1': {
      'en': 'Home',
      'de': 'Heim',
    },
  },
  // ChatList
  {
    'uwyiigof': {
      'en': 'All Chats',
      'de': 'Alle Chats',
    },
  },
  // Filters
  {
    'sqw5lzhf': {
      'en':
          'Category                                                              >                                                      ',
      'de': 'Kategorie >',
    },
    'j9a28mlf': {
      'en':
          'Location                                                               >                                  ',
      'de': 'Ort >',
    },
    'a6k9f8nl': {
      'en':
          'Options                                                                 >                                  ',
      'de': 'Optionen >',
    },
    'yoav2n98': {
      'en':
          'Tasker type                                                         >                                  ',
      'de': 'Taskertyp >',
    },
    'p02z48ch': {
      'en': 'Clear Filters',
      'de': 'Filter löschen',
    },
    'gicl1jvd': {
      'en': 'Filters',
      'de': 'Filter',
    },
    'pyn3zh16': {
      'en': 'Home',
      'de': 'Heim',
    },
  },
  // Inviteusers
  {
    'ytpoioe5': {
      'en': 'Start Chat',
      'de': 'Chat beginnen',
    },
    'uaabnkjm': {
      'en': 'Choose to chat',
      'de': 'Wählen Sie den Chat',
    },
    'fbzd6v2o': {
      'en': 'Home',
      'de': 'Heim',
    },
  },
  // PosterPosts
  {
    'sfg6u14i': {
      'en': '+ Add new post',
      'de': '+ Neuen Beitrag hinzufügen',
    },
    'ohz7tkk8': {
      'en': 'Select from your previous tasks',
      'de': 'Wählen Sie aus Ihren vorherigen Aufgaben aus',
    },
    'mo1fcpf6': {
      'en': 'Backpacking',
      'de': 'Rucksackreisen',
    },
    'yn0xa0o2': {
      'en': 'Stylist',
      'de': 'Stylist',
    },
    'risfztgg': {
      'en': 'Dj',
      'de': 'DJ',
    },
    '4k163k8r': {
      'en': 'Trainer',
      'de': 'Trainer',
    },
    '7jvyuluj': {
      'en': 'Skincare',
      'de': 'Hautpflege',
    },
    'ikd0urya': {
      'en': 'Shopping',
      'de': 'Das Einkaufen',
    },
    'hwzrjnkn': {
      'en': 'Home',
      'de': 'Heim',
    },
  },
  // PosterChat
  {
    'yrtwz8r8': {
      'en': 'Set an appointment',
      'de': 'Vereinbaren Sie einen Termin',
    },
  },
  // TaskList
  {
    '5ur38lqi': {
      'en': 'Taskers',
      'de': 'Tasker',
    },
    'uleccdna': {
      'en': 'Search for Taskers here...',
      'de': 'Suchen Sie hier nach Taskern...',
    },
    '5h4fmliz': {
      'en': 'Tasks Categories',
      'de': 'Aufgabenkategorien',
    },
    'gb9m4g4a': {
      'en': 'Filters',
      'de': 'Filter',
    },
    '4798r77l': {
      'en': 'Gardening',
      'de': 'Gartenarbeit',
    },
    '66rynb6w': {
      'en': 'Babysitting',
      'de': 'Babysitten',
    },
    'iqokrhfj': {
      'en': 'Music',
      'de': 'Musik',
    },
    'u0m2kstq': {
      'en': 'Cycling',
      'de': 'Radfahren',
    },
    'l30p6jr5': {
      'en': 'Running',
      'de': 'Betrieb',
    },
    '3pyvnyvz': {
      'en': 'Upcoming Taskers',
      'de': 'Kommende Tasker',
    },
    'e8y0lcll': {
      'en': 'Tasker Name',
      'de': 'Tasker-Name',
    },
    '7ya3pl9p': {
      'en': 'Level | Skills | \nLocation',
      'de': 'Ebene | Fähigkeiten |\nOrt',
    },
    'frsnegpc': {
      'en': 'Details',
      'de': 'Einzelheiten',
    },
    'ifev0ubk': {
      'en': 'Tasker Name',
      'de': 'Tasker-Name',
    },
    'b8ti74uq': {
      'en': 'Level | Skills | \nLocation',
      'de': 'Ebene | Fähigkeiten |\nOrt',
    },
    '8orkqil1': {
      'en': 'Details',
      'de': 'Einzelheiten',
    },
    'ki9uz8ii': {
      'en': 'Tasker Name',
      'de': 'Tasker-Name',
    },
    'lm76smzn': {
      'en': 'Level | Skills | \nLocation',
      'de': 'Ebene | Fähigkeiten |\nOrt',
    },
    'psh9utkz': {
      'en': 'Details',
      'de': 'Einzelheiten',
    },
  },
  // Appointment
  {
    'r4p2ikfs': {
      'en': 'For which one of your posts you want to set an appointment?',
      'de': 'Für welche Ihrer Stellen möchten Sie einen Termin vereinbaren?',
    },
    'pnmlojgg': {
      'en': 'Select from my posts                                      >',
      'de': 'Aus meinen Beiträgen auswählen >',
    },
    '9pci3rwr': {
      'en': 'Select date',
      'de': 'Datum auswählen',
    },
    'jvkrusd0': {
      'en': 'Send Request ',
      'de': 'Anfrage senden',
    },
    'buafyilo': {
      'en': 'Set an appointment ',
      'de': 'Vereinbaren Sie einen Termin',
    },
    'd29za1zc': {
      'en': 'Home',
      'de': 'Heim',
    },
  },
  // Tasks
  {
    'rfo2e9ow': {
      'en': '',
      'de': '',
    },
    'nxr1jr6d': {
      'en': 'Search tasks here',
      'de': 'Suchen Sie hier nach Aufgaben',
    },
    '5nk9orvl': {
      'en': 'Explore new tasks',
      'de': 'Entdecken Sie neue Aufgaben',
    },
    '7r48kyv3': {
      'en': 'Top tasks',
      'de': 'Top-Aufgaben',
    },
    '0ydypa1g': {
      'en': '30 locations near by',
      'de': '30 Standorte in Ihrer Nähe',
    },
    '1d5e53f3': {
      'en': 'Clean my pool',
      'de': 'Reinigen Sie mein Becken',
    },
    '56ktjws6': {
      'en': '4.7',
      'de': '4.7',
    },
    '9e3kcbxc': {
      'en': 'Send request',
      'de': 'Anfrage senden',
    },
    'z749zu1d': {
      'en': 'Biker needed',
      'de': 'Biker benötigt',
    },
    'd96g37in': {
      'en': '4.7',
      'de': '4.7',
    },
    'nv0jk8sv': {
      'en': 'Send request',
      'de': 'Anfrage senden',
    },
    'imbdhmjh': {
      'en': 'Other',
      'de': 'Sonstiges',
    },
    '6wvwft7u': {
      'en': 'More tasks to catch',
      'de': 'Mehr Aufgaben zu fangen',
    },
    'xk7dqosh': {
      'en': 'Teaching history',
      'de': 'Geschichte unterrichten',
    },
    'isv0v8l6': {
      'en': '4.7',
      'de': '4.7',
    },
    'wrsnipft': {
      'en': 'Send request',
      'de': 'Anfrage senden',
    },
    'lkymasqd': {
      'en': 'Reconstruction',
      'de': 'Wiederaufbau',
    },
    'orqzooqh': {
      'en': '4.7',
      'de': '4.7',
    },
    'sy4uvb31': {
      'en': 'Send request',
      'de': 'Anfrage senden',
    },
  },
  // MyPosts
  {
    'xu88e53j': {
      'en': '+ Add new task',
      'de': '+ Neue Aufgabe hinzufügen',
    },
    'hppr31c8': {
      'en': 'Select from your previous tasks',
      'de': 'Wählen Sie aus Ihren vorherigen Aufgaben aus',
    },
    'bl6ajs8z': {
      'en': 'BackPacking',
      'de': 'Rucksackreisen',
    },
    'e29zsra4': {
      'en': 'Stylist',
      'de': 'Stylist',
    },
    'kefexr69': {
      'en': 'DJ',
      'de': 'DJ',
    },
    '69ke30bh': {
      'en': 'Shopping',
      'de': 'Das Einkaufen',
    },
    'rpvk2jc4': {
      'en': 'Skincare',
      'de': 'Hautpflege',
    },
    'rp88uelx': {
      'en': 'Trainer',
      'de': 'Trainer',
    },
    'mv519rn2': {
      'en': 'Home',
      'de': 'Heim',
    },
  },
  // Dashboard
  {
    'ao4b7soe': {
      'en': 'Edit Profile',
      'de': 'Profil bearbeiten',
    },
    'jyo8mmcn': {
      'en': 'Change Password',
      'de': 'Passwort ändern',
    },
    '8gevfkzg': {
      'en': 'Notification Settings',
      'de': 'Benachrichtigungseinstellungen',
    },
    'r1lc7pah': {
      'en': 'Terms of Services',
      'de': 'Nutzungsbedingungen',
    },
    'nmk6zzl6': {
      'en': 'Log Out',
      'de': 'Ausloggen',
    },
  },
  // underConstruction
  {
    'cykxed8e': {
      'en': 'Verify Code to See App',
      'de': 'Überprüfen Sie den Code, um die App anzuzeigen',
    },
    '7z6nq22y': {
      'en': 'Home',
      'de': 'Heim',
    },
  },
  // Miscellaneous
  {
    'i0vkfdmz': {
      'en': '',
      'de': '',
    },
    'l7b6ldz6': {
      'en': '',
      'de': '',
    },
    'aabo550u': {
      'en': '',
      'de': '',
    },
    'hfkjrm1h': {
      'en': '',
      'de': '',
    },
    'tzftiyvc': {
      'en': '',
      'de': '',
    },
    'vwydj2gx': {
      'en': '',
      'de': '',
    },
    'h2l1s65g': {
      'en': '',
      'de': '',
    },
    '7arjvnxn': {
      'en': '',
      'de': '',
    },
    '6zikho64': {
      'en': '',
      'de': '',
    },
    '1yyteamn': {
      'en': '',
      'de': '',
    },
    'mrst1wbr': {
      'en': '',
      'de': '',
    },
    'fmpedbt5': {
      'en': '',
      'de': '',
    },
    'ot1k4x7w': {
      'en': '',
      'de': '',
    },
    'sq9e1twb': {
      'en': '',
      'de': '',
    },
    'gn1wq89s': {
      'en': '',
      'de': '',
    },
    'pvtaf95m': {
      'en': '',
      'de': '',
    },
    'itayankv': {
      'en': '',
      'de': '',
    },
    'kq46ovt5': {
      'en': '',
      'de': '',
    },
    'rlw2guug': {
      'en': '',
      'de': '',
    },
    'dlwewvuw': {
      'en': '',
      'de': '',
    },
    'xgw6rep3': {
      'en': '',
      'de': '',
    },
    'yn4py9zx': {
      'en': '',
      'de': '',
    },
  },
].reduce((a, b) => a..addAll(b));
