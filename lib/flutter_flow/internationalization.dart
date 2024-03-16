import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['pt', 'es'];

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
    String? ptText = '',
    String? esText = '',
  }) =>
      [ptText, esText][languageIndex] ?? '';

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
  // home_patient_page
  {
    'h0vjswks': {
      'pt': 'Olá,',
      'es': 'Hola,',
    },
    'fn7j69f9': {
      'pt': 'Pesquise por terapeutas...',
      'es': 'Búsqueda de terapeutas...',
    },
    'vulo61iv': {
      'pt': 'Solicitações',
      'es': 'Peticiones',
    },
    'g8ac2992': {
      'pt': 'Agenda',
      'es': 'Cronograma',
    },
    'a1djrd9g': {
      'pt': 'cartões',
      'es': 'tarjetas',
    },
    'p9v71rsx': {
      'pt': 'Consultas marcadas',
      'es': 'Citas programadas',
    },
    '52syrwx8': {
      'pt': 'Veja todas',
      'es': 'Ver todo',
    },
    '8elniv4b': {
      'pt': 'Agende agora uma sessão',
      'es': 'Agenda una sesión ahora',
    },
    'm7yn9h5l': {
      'pt': 'Procure por profissionais',
      'es': 'busca profesionales',
    },
    'wcyctza9': {
      'pt': 'Procure pelos melhores profissionais',
      'es': 'Busca a los mejores profesionales',
    },
    '62luus3z': {
      'pt': 'Hipnose',
      'es': 'Hipnosis',
    },
    'sfbyuxqk': {
      'pt': 'Perfil',
      'es': 'Perfil',
    },
    'cugvke5q': {
      'pt': 'QTM Healthtech',
      'es': 'QTM Tecnología de la salud',
    },
    'z1ky0jou': {
      'pt': 'Perfil',
      'es': 'Perfil',
    },
    'ubmzxr6g': {
      'pt': 'Minha Conta',
      'es': 'Mi cuenta',
    },
    'dpnes1dm': {
      'pt': 'Convidar Amigos',
      'es': 'Invitar a amigos',
    },
    '87h9afd8': {
      'pt': 'Meu perfil',
      'es': 'Mi perfil',
    },
    'fbkua0oa': {
      'pt': 'Idioma',
      'es': 'Idioma',
    },
    'rb3bfknv': {
      'pt': 'Pagina QTM',
      'es': 'Página QTM',
    },
    '946fwycq': {
      'pt': 'Politicas',
      'es': 'Políticas',
    },
    'xcg1pr8j': {
      'pt': 'Termos e Condições',
      'es': 'Términos y Condiciones',
    },
    'xm95fs8s': {
      'pt': 'Sair',
      'es': 'Salir',
    },
    '2yaombzo': {
      'pt': 'Home',
      'es': 'Hogar',
    },
  },
  // initial_search
  {
    'xc1p7qp5': {
      'pt': 'Pesquise aqui...',
      'es': 'Busca aquí...',
    },
    '8k2o360h': {
      'pt': 'Histórico de pesquisa',
      'es': 'Buscar Historia',
    },
    'ohf01m4t': {
      'pt': 'Veja aqui alguns profissionais',
      'es': 'Ver algunos profesionales aquí',
    },
    'ikyncvoy': {
      'pt': 'Hipnose',
      'es': 'Hipnosis',
    },
    'kcmsif6g': {
      'pt': 'Home',
      'es': 'Hogar',
    },
  },
  // search
  {
    '7gczgee5': {
      'pt': 'Faça a sua pesquisa',
      'es': 'Haz tu investigación',
    },
    '763edj5z': {
      'pt': 'Filtros',
      'es': 'Filtros',
    },
    'qlodmp1u': {
      'pt': 'Limpar filtros',
      'es': 'Limpiar filtros',
    },
    'gu94l2bp': {
      'pt': 'Sem resultados',
      'es': 'No hay resultados',
    },
    'txjdv6xt': {
      'pt': 'Especialista em hipnoterapia',
      'es': 'Especialista en hipnoterapia',
    },
    '5bjb2tra': {
      'pt': 'Preço fixo',
      'es': 'Precio fijo',
    },
    'nhgofahn': {
      'pt': 'Filtros',
      'es': 'Filtros',
    },
    'l41btxzv': {
      'pt': 'preços',
      'es': 'precios',
    },
    'lz2lbeob': {
      'pt': 'práticas',
      'es': 'practicas',
    },
    'tmbxizm7': {
      'pt': 'Home',
      'es': 'Hogar',
    },
  },
  // requests_page
  {
    'zfenai0c': {
      'pt': 'Solicitações',
      'es': 'Peticiones',
    },
    '5uzr7lmh': {
      'pt': 'Aceitas',
      'es': 'Aceptado',
    },
    't5c7m1ta': {
      'pt': 'Pendentes',
      'es': 'Colgantes',
    },
    'p8av1hc8': {
      'pt': 'Gerenciar',
      'es': 'Administrar',
    },
    '6nucau0k': {
      'pt': 'Aceita',
      'es': 'Aceptado',
    },
    'b5r0083q': {
      'pt': 'Gerenciar',
      'es': 'Administrar',
    },
    'aigw6sc1': {
      'pt': 'Aguardando',
      'es': 'Espera',
    },
    '3howpywt': {
      'pt': 'Home',
      'es': 'Hogar',
    },
  },
  // profile_therapist
  {
    '4gc0gkq0': {
      'pt': 'Terapeuta especialista',
      'es': 'Terapeuta especialista',
    },
    'wmd5u41v': {
      'pt': 'Detalhes',
      'es': 'Detalles',
    },
    'flesfali': {
      'pt': 'Pacientes',
      'es': 'Pacientes',
    },
    'g6q0wc09': {
      'pt': 'Experiência',
      'es': 'Experiencia',
    },
    'sn8qiwk2': {
      'pt': 'Avaliação',
      'es': 'Evaluación',
    },
    'wrg21qza': {
      'pt': '2.0',
      'es': '2',
    },
    'lj01k204': {
      'pt': 'Sobre mim',
      'es': 'Sobre mi',
    },
    '6f0l2kpq': {
      'pt': 'Preço',
      'es': 'Precio',
    },
    '685z9384': {
      'pt': 'Seus Cowokings',
      'es': 'Tus vaqueros',
    },
    '9q26f8zg': {
      'pt': 'Ver',
      'es': 'Para ver',
    },
    'b29tj07r': {
      'pt': 'Nenhum coworking disponível',
      'es': 'No hay coworking disponible',
    },
    '7olc934w': {
      'pt': 'Seus horários de atendimento',
      'es': 'Tu horario de apertura',
    },
    'y50bx6o6': {
      'pt': 'Nenhum horário disponível',
      'es': 'No hay tiempo disponible',
    },
    'p565rz4u': {
      'pt': 'Sua Localização',
      'es': 'Tu ubicación',
    },
    '4rju5i3w': {
      'pt': 'Home',
      'es': 'Hogar',
    },
  },
  // terms_page
  {
    'qwrdyjv3': {
      'pt':
          'Os serviços da QTM Healthtech são fornecidos pela pessoa jurídica com a seguinte Razão Social: Juliana dos Santos Nogueira, com nome fantasia: Quantum, inscrito no CNPJ sob o nº 36.729.683/0001-60, titular da propriedade intelectual sobre software, website, aplicativos, conteúdos e demais ativos relacionados do site ou aplicativo da QTM Healthtech.',
      'es':
          'Los servicios de QTM Healthtech son prestados por la persona jurídica con la siguiente Razón Social: Juliana dos Santos Nogueira, con razón social: Quantum, registrada en el CNPJ con el nº 36.729.683/0001-60, titular de la propiedad intelectual sobre software, sitio web y aplicaciones. , contenido y otros activos relacionados del sitio web o aplicación de QTM Healthtech.',
    },
    'frj37p98': {
      'pt': '1.OBJETO',
      'es': '1. OBJETO',
    },
    'fqtjah37': {
      'pt':
          '1.1 A plataforma visa licenciar o uso de seu website, e demais ativos de propriedade intelectual, fornecendo ferramentas para auxiliar e dinamizar o dia a dia dos seus usuários.',
      'es':
          '1.1 La plataforma tiene como objetivo otorgar licencia para el uso de su sitio web y otros activos de propiedad intelectual, proporcionando herramientas para ayudar y simplificar la vida diaria de sus usuarios.',
    },
    'q6y0a3k0': {
      'pt':
          '1.2 A plataforma caracteriza-se pela prestação dos seguintes serviços: conexão entre terapeutas, pacientes, coworking e venda de produtos.',
      'es':
          '1.2 La plataforma se caracteriza por la prestación de los siguientes servicios: conexión entre terapeutas, pacientes, coworking y venta de productos.',
    },
    '2v3a73oa': {
      'pt':
          '1.3 A plataforma realiza a venda à distância por meio eletrônico e presencial dos seguintes produtos ou serviços: Praticas Integrativas e Complementares, Blends de chá e Produtos Digitais.',
      'es':
          '1.3 La plataforma realiza ventas a distancia de forma electrónica y presencial de los siguientes productos o servicios: Prácticas Integrativas y Complementarias, Mezclas de Té y Productos Digitales.',
    },
    'db3t0hgz': {
      'pt': '2. COMO RECOLHEMOS OS DADOS PESSOAIS DO USUÁRIO E DO VISITANTE?',
      'es': '2. ¿CÓMO RECOPILAMOS DATOS PERSONALES DE USUARIOS Y VISITANTES?',
    },
    'wq743jkg': {
      'pt':
          '2.1 Os dados pessoais do usuário e visitante são recolhidos pela plataforma da seguinte forma:',
      'es':
          '2.1 La plataforma recopila los datos personales de usuarios y visitantes de la siguiente manera:',
    },
    '5kj8hcuh': {
      'pt':
          '- Quando o usuário cria uma conta na plataforma QTM Healthtech:esses dados se referem a identificação básica, como e-mail, nome completo, cidade de residência, endereço, documentos e profissão. A partir deles, podemos identificar o usuário e o visitante, além de garantir uma maior segurança e bem-estar às suas necessidade. Ficam cientes os usuários e visitantes de que seu perfil na plataforma estará acessível a todos demais usuários e visitantes QTM Healthtech.',
      'es':
          '- Cuando el usuario crea una cuenta en la plataforma QTM Healthtech: estos datos se refieren a una identificación básica, como correo electrónico, nombre completo, ciudad de residencia, dirección, documentos y profesión. A partir de ellos podemos identificar al usuario y visitante, además de garantizarle una mayor seguridad y bienestar según sus necesidades. Los usuarios y visitantes son conscientes de que su perfil en la plataforma será accesible para todos los demás usuarios y visitantes de QTM Healthtech.',
    },
    'tj53jafb': {
      'pt':
          '- Quando um usuário e visitante acessa páginas do site QTM Healthtech: as informações sobre interação e acesso são coletadas pela empresa para garantir uma melhor experiência ao usuário e visitante. Estes dados podem tratar sobre as palavras-chaves utilizadas em uma busca, o compartilhamento de um documento específico, comentários, visualizações de páginas, perfis, a URL de onde o usuário e visitante provêm, o navegador que utilizam e seus IPs de acesso, dentre outras que poderão ser armazenadas e retidas.',
      'es':
          '- Cuando un usuario y visitante accede a páginas del sitio web de QTM Healthtech: la empresa recopila información sobre la interacción y el acceso para garantizar una mejor experiencia para el usuario y visitante. Estos datos pueden tratar de las palabras clave utilizadas en una búsqueda, el intercambio de un documento específico, comentarios, páginas vistas, perfiles, la URL de donde proviene el usuario y visitante, el navegador que utiliza y sus IP de acceso, entre otros que pueden ser almacenado y retenido.',
    },
    'za8ky21r': {
      'pt':
          '- Por intermédio de terceiro: a plataforma recebe dados de terceiros, como Facebook e Google, quando um usuário faz login com o seu perfil de um desses sites. A utilização desses dados é autorizada previamente pelos usuários junto ao terceiro em questão.',
      'es':
          '- A través de un tercero: la plataforma recibe datos de terceros, como Facebook y Google, cuando un usuario inicia sesión con su perfil desde uno de estos sitios. El uso de estos datos es previamente autorizado por los usuarios con el tercero en cuestión.',
    },
    '4h0sraqr': {
      'pt': 'Termos',
      'es': 'Términos',
    },
    'v1gjkghl': {
      'pt': 'Home',
      'es': 'Hogar',
    },
  },
  // payment_cards
  {
    'lfmp4byo': {
      'pt': 'Pagamento',
      'es': 'Pago',
    },
    'l54frgnf': {
      'pt': 'Cartões cadastrados',
      'es': 'Tarjetas registradas',
    },
    'n5m4ofu1': {
      'pt': 'Adicionar',
      'es': 'para agregar',
    },
    'ov7n3f4u': {
      'pt': 'Home',
      'es': 'Hogar',
    },
  },
  // confirm_schedule
  {
    'cf1odujo': {
      'pt': 'Descrição',
      'es': 'Descripción',
    },
    '5221x7ja': {
      'pt': 'Confirmar consulta',
      'es': 'Confirmar cita',
    },
    '1fxtcne3': {
      'pt': 'Tipo de tratamento',
      'es': 'Tipo de tratamiento',
    },
    'z474qnpm': {
      'pt': 'Resumo',
      'es': 'Resumen',
    },
    '92p3tmqs': {
      'pt': 'profissional',
      'es': 'profesional',
    },
    'k5gvuw8n': {
      'pt': 'Tratament0',
      'es': 'Tratamiento0',
    },
    '67xf0vwr': {
      'pt': 'coworking',
      'es': 'trabajo colaborativo',
    },
    'vgmro1dg': {
      'pt': 'horário/data',
      'es': 'hora Fecha',
    },
    'jj41j9ci': {
      'pt': 'preço',
      'es': 'precio',
    },
    'phieiqt6': {
      'pt':
          'Assim que clicar em “Continuar pagamento”, Eu confirmo que li e que reconheço todos os',
      'es':
          'Una vez que hagas clic en “Continuar pago”, confirmo que he leído y reconozco todos',
    },
    'qh81p1q0': {
      'pt': 'termos e condições',
      'es': 'términos y Condiciones',
    },
    '3zh57cd1': {
      'pt': 'Continuar pagamento',
      'es': 'Continuar pago',
    },
    'tr4vz5is': {
      'pt': 'Home',
      'es': 'Hogar',
    },
  },
  // choose_timers
  {
    '4qzh3y5j': {
      'pt': 'Horário de consulta',
      'es': 'Horario de consulta',
    },
    'fompv3wg': {
      'pt': 'Cancelar',
      'es': 'Cancelar',
    },
    'dtlbqupm': {
      'pt': 'Continuar',
      'es': 'Continuar',
    },
    '0mzhx98e': {
      'pt': 'Home',
      'es': 'Hogar',
    },
  },
  // choose_practices
  {
    'crlnlrq4': {
      'pt': 'Escolha o seu tratamento',
      'es': 'Elige tu tratamiento',
    },
    'g4c45jmf': {
      'pt': 'Home',
      'es': 'Hogar',
    },
  },
  // manager_requests
  {
    'wy42h7g9': {
      'pt': 'Solicitações',
      'es': 'Peticiones',
    },
    'djklatrs': {
      'pt': 'Home',
      'es': 'Hogar',
    },
  },
  // payment_confirm
  {
    '2yrhct3s': {
      'pt': 'Pagamento',
      'es': 'Pago',
    },
    'fxsq8oa0': {
      'pt': 'Option 1',
      'es': 'Opción 1',
    },
    '02pwv44v': {
      'pt': 'Escolha um cartão',
      'es': 'Elegir una tarjeta',
    },
    'anwzm6x2': {
      'pt': 'Search for an item...',
      'es': 'Buscar un artículo...',
    },
    'f0fqyz9g': {
      'pt': 'cvc',
      'es': 'CVC',
    },
    'fwx7sj78': {
      'pt': 'validade',
      'es': 'validez',
    },
    '73pxq2nm': {
      'pt': 'Nenhum cartão selecionado',
      'es': 'No hay tarjetas seleccionadas',
    },
    'zpcpx6i8': {
      'pt':
          'Os pagamentos são protegidos por criptografia de ponta para a segurança dos dados referente à transação',
      'es':
          'Los pagos están protegidos mediante cifrado de última generación para proteger los datos de las transacciones.',
    },
    'cts04jk2': {
      'pt':
          'Nossa política de cancelamento está explicitada nos termos de serviço',
      'es':
          'Nuestra política de cancelación está explicada en los términos de servicio.',
    },
    'v3urrfyw': {
      'pt': 'Pedido total',
      'es': 'Orden total',
    },
    '0pr1u6gr': {
      'pt': 'Confirmar consulta',
      'es': 'Confirmar cita',
    },
    'jfzy3b6v': {
      'pt': 'Home',
      'es': 'Hogar',
    },
  },
  // schedulePage
  {
    '877sg08l': {
      'pt': 'Solicitação confirmada',
      'es': 'Solicitud confirmada',
    },
    '2a8y721f': {
      'pt': 'Horário e data de consulta',
      'es': 'Hora y fecha de consulta',
    },
    'sogc7t3h': {
      'pt': 'Local de atendimento',
      'es': 'Ubicación del servicio',
    },
    'tf0xv48v': {
      'pt': 'Sem localização',
      'es': 'Sin ubicación',
    },
    'ie3mv7mo': {
      'pt': 'Solicitação realizada',
      'es': 'Solicitud realizada',
    },
    'ezzbwot9': {
      'pt': '****',
      'es': '****',
    },
    'utzqh0vp': {
      'pt': 'Terapeuta Aceitou',
      'es': 'Terapeuta aceptado',
    },
    'or42w4jf': {
      'pt': '****',
      'es': '****',
    },
    'sr2xadqw': {
      'pt': 'Terapeuta aceitou',
      'es': 'Terapeuta aceptado',
    },
    'nt7hbzdz': {
      'pt': '****',
      'es': '****',
    },
    'lpvmdm5e': {
      'pt': 'Andamento da consulta',
      'es': 'Avance de la consulta',
    },
    'ir34x6or': {
      'pt': '****',
      'es': '****',
    },
    'l6vhyzow': {
      'pt': 'Consulta finalizada',
      'es': 'Consulta completada',
    },
    '849f1xnf': {
      'pt': '****',
      'es': '****',
    },
    'biyrkdp8': {
      'pt': 'Prescrição do terapeuta',
      'es': 'prescripción del terapeuta',
    },
    'web6ru7h': {
      'pt': 'abrir',
      'es': 'Abierto',
    },
    'e36x1efa': {
      'pt': 'Pagamento',
      'es': 'Pago',
    },
    'k43iudrk': {
      'pt': 'Crédito ****4567',
      'es': 'Crédito ****4567',
    },
    '3hpzkbzq': {
      'pt': 'Status',
      'es': 'Estado',
    },
    'd9p1cy64': {
      'pt': 'Valor da consulta',
      'es': 'Valor de consulta',
    },
    '2enrjzon': {
      'pt': 'Cancelar consulta',
      'es': 'Cancelar cita',
    },
    'n8wbg32q': {
      'pt': 'Ajuda',
      'es': 'Ayuda',
    },
    'pzz755ku': {
      'pt': 'Home',
      'es': 'Hogar',
    },
  },
  // login_page
  {
    'yp1tus0g': {
      'pt': 'Seja Bem-vindo',
      'es': 'Sea bienvenido',
    },
    'xjvabnxz': {
      'pt': 'Faça seu login  para continuar',
      'es': 'Inicia sesión para continuar',
    },
    '7a6pzwk4': {
      'pt': 'Email',
      'es': 'Correo electrónico',
    },
    'khi0gkc9': {
      'pt': 'Senha',
      'es': 'Contraseña',
    },
    '3nu894sv': {
      'pt': 'Entrar',
      'es': 'Entrar',
    },
    '3mersqfx': {
      'pt': 'Esqueceu senha?',
      'es': '¿Has olvidado tu contraseña?',
    },
    '46xllrq1': {
      'pt': 'Não tem conta?',
      'es': '¿No tienes una cuenta?',
    },
    '6xbs66c9': {
      'pt': 'ou faça login com',
      'es': 'o inicia sesión con',
    },
    'aayndbx1': {
      'pt': 'Sign in with Google',
      'es': 'Inicia sesión con Google',
    },
    'kzds2a32': {
      'pt': 'Ao continuar você concorda com os  termos e',
      'es': '',
    },
    'ufcy7xgb': {
      'pt': 'Home',
      'es': 'Hogar',
    },
  },
  // schedulings_page
  {
    'hvxygrdd': {
      'pt': 'Fredson',
      'es': 'fredson',
    },
    'xuysv7ml': {
      'pt': 'Cidade',
      'es': 'Ciudad',
    },
    'n1bqeg3v': {
      'pt': 'Masculino',
      'es': 'Masculino',
    },
    'uaulpdjx': {
      'pt': 'Data:',
      'es': 'Fecha:',
    },
    'pm16i6jn': {
      'pt': '01/06/2023',
      'es': '01/06/2023',
    },
    'kcub9fti': {
      'pt': 'Tipo de Serviço:',
      'es': 'Tipo de servicio:',
    },
    'akk53djs': {
      'pt': 'Presencial',
      'es': 'En persona',
    },
    'dc21qssc': {
      'pt': 'Tipo de Técnica:',
      'es': 'Tipo de Técnica:',
    },
    'x5cajozj': {
      'pt': 'Hipnose',
      'es': 'Hipnosis',
    },
    '6c4rw4k5': {
      'pt': 'Horário de atendimento:',
      'es': 'Horario de atención:',
    },
    'w6f16shi': {
      'pt': 'Hipnose',
      'es': 'Hipnosis',
    },
    'df36pr2r': {
      'pt': 'Coworking:',
      'es': 'Trabajo colaborativo:',
    },
    '2s35cq56': {
      'pt': 'Nenhum',
      'es': 'Ninguno',
    },
    'ms86710l': {
      'pt': 'VOCÊ GANHA',
      'es': 'TÚ GANAS',
    },
    '9rujcimz': {
      'pt': 'R\$200',
      'es': '200 reales',
    },
    'e3cdesre': {
      'pt': 'Recusar',
      'es': 'Rechazar',
    },
    'w3hx271s': {
      'pt': 'Aceitar',
      'es': 'Aceptar',
    },
    'cub9o9tm': {
      'pt': 'Solicitações',
      'es': 'Peticiones',
    },
    'a0luhc45': {
      'pt': 'Home',
      'es': 'Hogar',
    },
  },
  // home_theraphist_page
  {
    'j0zdgn9d': {
      'pt': 'Solicitações',
      'es': 'Peticiones',
    },
    'ut7u7c33': {
      'pt': 'Pacientes',
      'es': 'Pacientes',
    },
    'ab7g2jw7': {
      'pt': 'Minhas práticas',
      'es': 'Mis practicas',
    },
    'qdv5ftcv': {
      'pt': 'Agenda',
      'es': 'Cronograma',
    },
    'xvea05sq': {
      'pt': 'Faturamento',
      'es': 'Facturación',
    },
    '70pz56pi': {
      'pt': 'Coworkings',
      'es': 'Coworkings',
    },
    '6w4mzdgj': {
      'pt': 'Veja os seu principais interesses',
      'es': 'Ver tus principales intereses',
    },
    'wfng7rv5': {
      'pt': 'Ver',
      'es': 'Para ver',
    },
    '17qrornm': {
      'pt': 'QTM Healthtech',
      'es': 'QTM Tecnología de la salud',
    },
    '6zdie0jv': {
      'pt': 'Perfil',
      'es': 'Perfil',
    },
    'bmqzzzag': {
      'pt': 'Minha Conta',
      'es': 'Mi cuenta',
    },
    'oxsyj2x6': {
      'pt': 'Convidar Amigos',
      'es': 'Invitar a amigos',
    },
    'te82n20w': {
      'pt': 'Meu perfil',
      'es': 'Mi perfil',
    },
    'ntpkpi2h': {
      'pt': 'Idioma',
      'es': 'Idioma',
    },
    '2hte71fc': {
      'pt': 'Pagina QTM',
      'es': 'Página QTM',
    },
    'a1bsaxvs': {
      'pt': 'Politicas',
      'es': 'Políticas',
    },
    'nkuwr61o': {
      'pt': 'Termos e Condições',
      'es': 'Términos y Condiciones',
    },
    'souil05c': {
      'pt': 'Sair',
      'es': 'Salir',
    },
    'tzqbrw7r': {
      'pt': 'Home',
      'es': 'Hogar',
    },
  },
  // load_auth_page
  {
    'ggy1uxvb': {
      'pt': 'Estamos preparando tudo para você...',
      'es': 'Estamos preparando todo para ti...',
    },
    '01j7ut8s': {
      'pt': 'Home',
      'es': 'Hogar',
    },
  },
  // schedules_theraphist_page
  {
    'safa23o1': {
      'pt': 'Data:',
      'es': 'Fecha:',
    },
    'n9e7wjii': {
      'pt': 'Tipo de Serviço:',
      'es': 'Tipo de servicio:',
    },
    'z7fvo8bg': {
      'pt': 'Tipo de Técnica:',
      'es': 'Tipo de Técnica:',
    },
    '0v7hi8cs': {
      'pt': 'Horário de atendimento:',
      'es': 'Horario de atención:',
    },
    '5ljyetcd': {
      'pt': 'VOCÊ GANHA',
      'es': 'TÚ GANAS',
    },
    'sstn8cb1': {
      'pt': 'Recusar',
      'es': 'Rechazar',
    },
    'giehh3i5': {
      'pt': 'Aceitar',
      'es': 'Aceptar',
    },
    'syd8y5qd': {
      'pt': 'Solicitações',
      'es': 'Peticiones',
    },
    'j372e2b7': {
      'pt': 'Home',
      'es': 'Hogar',
    },
  },
  // patients_page_theraphist
  {
    'x5sz2zc2': {
      'pt': 'status',
      'es': 'estado',
    },
    'j30ft508': {
      'pt': 'Pacientes',
      'es': 'Pacientes',
    },
    'rlo9y3wy': {
      'pt': 'Home',
      'es': 'Hogar',
    },
  },
  // signup_register_user_page
  {
    'njue9kg5': {
      'pt': 'Vamos iniciar?',
      'es': '¿Empecemos?',
    },
    'tsuzd6l6': {
      'pt': 'Insira seus dados de usuário',
      'es': 'Introduce tus datos de usuario',
    },
    'orwi5isk': {
      'pt': 'Username',
      'es': 'Nombre de usuario',
    },
    'uvvtva9w': {
      'pt': 'Email',
      'es': 'Correo electrónico',
    },
    'x4r4mssr': {
      'pt': 'Senha',
      'es': 'Contraseña',
    },
    'k17krudq': {
      'pt': 'Confirmar senha',
      'es': 'confirmar seña',
    },
    'f370rdf3': {
      'pt': 'Confirmar senha',
      'es': 'confirmar seña',
    },
    'u12889ej': {
      'pt': 'A senha digitada é diferente do campo anterior',
      'es': 'La contraseña ingresada es diferente al campo anterior',
    },
    'uhwx3zjg': {
      'pt': 'Campo username obrigatório',
      'es': 'Campo de nombre de usuario obligatorio',
    },
    'ki2gj19l': {
      'pt': 'Please choose an option from the dropdown',
      'es': 'Por favor elija una opción del menú desplegable',
    },
    'tsg63cj4': {
      'pt': 'Campo de email obrigatório',
      'es': 'Campo de correo electrónico obligatorio',
    },
    'e2kfq72q': {
      'pt': 'Please choose an option from the dropdown',
      'es': 'Por favor elija una opción del menú desplegable',
    },
    'wjqkh4l9': {
      'pt': 'Campo de senha obrigatório',
      'es': 'Campo de contraseña obligatorio',
    },
    '0qv3inkx': {
      'pt': 'A senha deve conter 8 caracteres',
      'es': 'La contraseña debe contener 8 caracteres',
    },
    'zickxjfg': {
      'pt': 'A senha de conter 8 caracteres',
      'es': 'La contraseña debe contener 8 caracteres.',
    },
    'ck7mnzmg': {
      'pt': 'A senha deve conter ao menos um número ou caractere especial',
      'es':
          'La contraseña debe contener al menos un número o carácter especial',
    },
    'd9a5asqi': {
      'pt': 'Please choose an option from the dropdown',
      'es': 'Por favor elija una opción del menú desplegable',
    },
    'idyhgr57': {
      'pt': 'Campo de confirmar  senha obrigatório',
      'es': 'Campo de confirmación de contraseña obligatorio',
    },
    'n8rw46fu': {
      'pt': 'Please choose an option from the dropdown',
      'es': 'Por favor elija una opción del menú desplegable',
    },
    '33ldxha9': {
      'pt': 'Continuar',
      'es': 'Continuar',
    },
    'lvdoec0g': {
      'pt': 'Home',
      'es': 'Hogar',
    },
  },
  // type_user_page
  {
    '7w5hjcl7': {
      'pt': 'Quem você é?',
      'es': '¿Quién eres?',
    },
    'qq091ig0': {
      'pt': 'Terapeuta',
      'es': 'Terapeuta',
    },
    'u7elkki4': {
      'pt': 'Paciente',
      'es': 'Paciente',
    },
    'ccw5sgvb': {
      'pt': 'Home',
      'es': 'Hogar',
    },
  },
  // register_theraphist_page
  {
    'olrz3qmm': {
      'pt': 'Está quase Lá!',
      'es': '¡Ya casi está allí!',
    },
    '2s10qwmr': {
      'pt': 'Insira seus dados cadastrais',
      'es': 'Introduce tus datos de registro',
    },
    'wk0ep4gt': {
      'pt': 'CPF',
      'es': 'CPF',
    },
    'qh7kpzti': {
      'pt': 'Buscar Meu Endereço',
      'es': 'Encuentra mi dirección',
    },
    'f906z9rg': {
      'pt': 'Complemento',
      'es': 'Complementar',
    },
    '544qa2am': {
      'pt': 'Field is required',
      'es': 'Se requiere campo',
    },
    'mzxaazlj': {
      'pt': 'Please choose an option from the dropdown',
      'es': 'Por favor elija una opción del menú desplegable',
    },
    '4irr3cy9': {
      'pt': 'Campo obrigatório',
      'es': 'Campo obligatorio',
    },
    'idj9ib1y': {
      'pt': 'Please choose an option from the dropdown',
      'es': 'Por favor elija una opción del menú desplegable',
    },
    'rrowdz2b': {
      'pt': 'Continuar',
      'es': 'Continuar',
    },
    '46ax3ymq': {
      'pt': 'Home',
      'es': 'Hogar',
    },
  },
  // profile_update_user_page
  {
    '3ms9iqgw': {
      'pt': 'Nome',
      'es': 'Nombre',
    },
    '99lvx1hy': {
      'pt': 'Sobrenome',
      'es': 'Apellido',
    },
    'sfr4boj6': {
      'pt': 'Homem cisgênero',
      'es': 'hombre cisgénero',
    },
    'ja7zude2': {
      'pt': 'Mulher cisgênero',
      'es': 'mujer cisgénero',
    },
    'bbaxh6u5': {
      'pt': 'Não binário',
      'es': 'no binario',
    },
    'zzpzebzl': {
      'pt': 'Homem trans',
      'es': 'hombre trans',
    },
    'q92s7vf2': {
      'pt': 'Mulher trans',
      'es': 'mujer trans',
    },
    'r92zkgip': {
      'pt': 'Gênero',
      'es': 'Género',
    },
    '8s5u3dnd': {
      'pt': 'Search for an item...',
      'es': 'Buscar un artículo...',
    },
    'vhw0fvvq': {
      'pt': 'Bio do terapeuta',
      'es': 'Biografía del terapeuta',
    },
    'mvzhlz5z': {
      'pt': '1 Ano',
      'es': '1 año',
    },
    '26ghlxhb': {
      'pt': '2 Anos',
      'es': '2 años',
    },
    '4lhuffvu': {
      'pt': '3 Anos',
      'es': '3 años',
    },
    'nsy6lftk': {
      'pt': '+4 anos',
      'es': '+4 años',
    },
    '4rtu7b6t': {
      'pt': 'Tempo de  experiência',
      'es': 'experiencia del tiempo',
    },
    '38hz3lxk': {
      'pt': 'Search for an item...',
      'es': 'Buscar un artículo...',
    },
    'hwvn1yto': {
      'pt': 'Whastsapp profissional',
      'es': 'whatsapp profesional',
    },
    'jn8wuec4': {
      'pt': '(ddd) 99999-9999',
      'es': '(dd) 99999-9999',
    },
    '14lf6oa2': {
      'pt': 'Campo Obirgatório',
      'es': 'Campo obligatorio',
    },
    'ujck3421': {
      'pt': 'Please choose an option from the dropdown',
      'es': 'Por favor elija una opción del menú desplegable',
    },
    'g47nfjrv': {
      'pt': 'Campo Obirgatório',
      'es': 'Campo obligatorio',
    },
    'fpm7l8yc': {
      'pt': 'Please choose an option from the dropdown',
      'es': 'Por favor elija una opción del menú desplegable',
    },
    '0cbrhla6': {
      'pt': 'Campo Obirgatório',
      'es': 'Campo obligatorio',
    },
    '737lyfip': {
      'pt': 'Please choose an option from the dropdown',
      'es': 'Por favor elija una opción del menú desplegable',
    },
    '83cx2flt': {
      'pt': 'Continuar',
      'es': 'Continuar',
    },
    '5r0ainpx': {
      'pt': 'Perfil ',
      'es': 'Perfil',
    },
    'ojy3b3l7': {
      'pt': 'Home',
      'es': 'Hogar',
    },
  },
  // add_timer_theraphist_page
  {
    'dokepjk3': {
      'pt': 'Segunda',
      'es': 'Segundo',
    },
    'kdtk9uxd': {
      'pt': 'Terça',
      'es': 'Tercero',
    },
    'ubr6216k': {
      'pt': 'Quarta',
      'es': 'Cuatro',
    },
    '7nv5ux2g': {
      'pt': 'Quinta',
      'es': 'Quinto',
    },
    'ryoy0y8l': {
      'pt': 'Sexta',
      'es': 'Viernes',
    },
    'e3fz2rii': {
      'pt': 'Sábado',
      'es': 'Sábado',
    },
    'kfh1sp3i': {
      'pt': 'Domingo',
      'es': 'Domingo',
    },
    'sv3zxrpx': {
      'pt': 'Valor por Sessão',
      'es': 'Precio por sesión',
    },
    'c2k0pmha': {
      'pt': '50 min',
      'es': '50 minutos',
    },
    'u6apq7y7': {
      'pt': '50 min',
      'es': '50 minutos',
    },
    'fbki6oes': {
      'pt': 'Tempo da sessão',
      'es': 'Tiempo de sesión',
    },
    'snrfub63': {
      'pt': 'Search for an item...',
      'es': 'Buscar un artículo...',
    },
    'j293iee4': {
      'pt': 'Finalizar',
      'es': 'Finalizar',
    },
    'imgevf99': {
      'pt': 'Adicionar Horários de Atendimento',
      'es': 'Agregar horario de apertura',
    },
    '85m6jiah': {
      'pt': 'Home',
      'es': 'Hogar',
    },
  },
  // add_pratical_theraphist_page
  {
    'jy63lqh8': {
      'pt': 'Nome da prática',
      'es': 'Nombre de la práctica',
    },
    '36hj57ii': {
      'pt': 'Option 1',
      'es': 'Opción 1',
    },
    't682qenv': {
      'pt': 'Especialidade',
      'es': 'Especialidad',
    },
    'w5u2ts49': {
      'pt': 'Search for an item...',
      'es': 'Buscar un artículo...',
    },
    'p952gb9d': {
      'pt': 'Coworking',
      'es': 'Trabajo colaborativo',
    },
    'x0cafbz9': {
      'pt': 'Domiciliar',
      'es': 'Hogar',
    },
    'pck0ayju': {
      'pt': 'Tipo de atendimento',
      'es': 'Tipo de servicio',
    },
    'n8rfch0t': {
      'pt': 'Search for an item...',
      'es': 'Buscar un artículo...',
    },
    '8bkn5azx': {
      'pt': 'Eu tenho certificado desta prática integrativa',
      'es': 'Tengo certificación de esta práctica integrativa.',
    },
    'vqpo9gzq': {
      'pt': 'Certificado de especilidade',
      'es': 'certificado de especialidad',
    },
    'h740lkqh': {
      'pt': 'Data de Conclusão',
      'es': 'Fecha de finalizacion',
    },
    'y9wus6qj': {
      'pt': 'Anexar Certificado',
      'es': 'Adjuntar certificado',
    },
    'fborw7wr': {
      'pt': 'Continuar',
      'es': 'Continuar',
    },
    '45gf82gl': {
      'pt': 'Adicionar prática integrativa',
      'es': 'Añadir práctica integradora',
    },
    '7jtaj3s2': {
      'pt': 'Home',
      'es': 'Hogar',
    },
  },
  // add_place_theraphist_page
  {
    'lo103iee': {
      'pt': 'Nome do Coworking',
      'es': 'Nombre del coworking',
    },
    'di9um6sr': {
      'pt': 'Buscar Endereço do Coworking',
      'es': 'Buscar dirección de coworking',
    },
    'zybhvmqt': {
      'pt': 'Endereço do coworking',
      'es': 'dirección de coworking',
    },
    'nnjzii1p': {
      'pt': 'Complemento',
      'es': 'Complementar',
    },
    'p5nd5y9u': {
      'pt': 'Adicionar imagens do Coworking ',
      'es': 'Añadir imágenes de coworking',
    },
    'aqtrbhez': {
      'pt': 'Carregar uma imagem',
      'es': 'Subir una imagen',
    },
    'hvju2l5t': {
      'pt': 'Carregar uma imagem',
      'es': 'Subir una imagen',
    },
    '34fzo3sm': {
      'pt': 'Carregar uma imagem',
      'es': 'Subir una imagen',
    },
    'h5nzoyiq': {
      'pt': 'Continuar',
      'es': 'Continuar',
    },
    '4z4jp1ys': {
      'pt': 'Adicionar Coworking de Atendimento',
      'es': 'Añadir servicio de coworking',
    },
    'rwbdwb9x': {
      'pt': 'Home',
      'es': 'Hogar',
    },
  },
  // loading_page_user
  {
    'wzaynowo': {
      'pt': 'Estamos preparando tudo para você...',
      'es': 'Estamos preparando todo para ti...',
    },
    '2zwajwxr': {
      'pt': 'Vamos lá!',
      'es': '¡Vamos allá!',
    },
    'xd4w8u6x': {
      'pt': 'Home',
      'es': 'Hogar',
    },
  },
  // profile_patient_page
  {
    'usuy3jzx': {
      'pt': 'Nome',
      'es': 'Nombre',
    },
    'sdo1xvkk': {
      'pt': 'Sobrenome',
      'es': 'Apellido',
    },
    'g7rys9yr': {
      'pt': 'Homem cisgênero',
      'es': 'hombre cisgénero',
    },
    'gn2e6b1n': {
      'pt': 'Mulher cisgênero',
      'es': 'mujer cisgénero',
    },
    'zm83apis': {
      'pt': 'Não binário',
      'es': 'no binario',
    },
    'tukni66s': {
      'pt': 'Homem transgênero',
      'es': 'hombre transgénero',
    },
    'jcnt9080': {
      'pt': 'Mulher trangênero',
      'es': 'Mujer transgénero',
    },
    'fsd5u8aq': {
      'pt': 'Gênero',
      'es': 'Género',
    },
    'bbzt916z': {
      'pt': 'Search for an item...',
      'es': 'Buscar un artículo...',
    },
    '5mefiwut': {
      'pt': 'Bio',
      'es': 'Biografía',
    },
    'lxr1yg4f': {
      'pt': 'Campo Obirgatório',
      'es': 'Campo obligatorio',
    },
    'txuh7ljd': {
      'pt': 'Please choose an option from the dropdown',
      'es': 'Por favor elija una opción del menú desplegable',
    },
    '7204lj8r': {
      'pt': 'Campo Obirgatório',
      'es': 'Campo obligatorio',
    },
    'owgh0uan': {
      'pt': 'Please choose an option from the dropdown',
      'es': 'Por favor elija una opción del menú desplegable',
    },
    'cobqtnn1': {
      'pt': 'Campo Obirgatório',
      'es': 'Campo obligatorio',
    },
    '50r7wdbm': {
      'pt': 'Please choose an option from the dropdown',
      'es': 'Por favor elija una opción del menú desplegable',
    },
    'tlqp2i1t': {
      'pt': 'Continuar',
      'es': 'Continuar',
    },
    'goijddmq': {
      'pt': 'Perfil ',
      'es': 'Perfil',
    },
    'zwug4cdi': {
      'pt': 'Home',
      'es': 'Hogar',
    },
  },
  // notification_theraphist_page
  {
    '9c9joxpl': {
      'pt': 'Notificações',
      'es': 'Notificaciones',
    },
    'jupxxyft': {
      'pt': 'QTM Healthtech',
      'es': 'QTM Tecnología de la salud',
    },
    '08a9fef0': {
      'pt': 'Perfil',
      'es': 'Perfil',
    },
    'qlzf4dsv': {
      'pt': 'Minha Conta',
      'es': 'Mi cuenta',
    },
    'ji5t950w': {
      'pt': 'Convidar Amigos',
      'es': 'Invitar a amigos',
    },
    'hy1ydbfh': {
      'pt': 'Meu perfil',
      'es': 'Mi perfil',
    },
    'egx0a22k': {
      'pt': 'Idioma',
      'es': 'Idioma',
    },
    '4uigv318': {
      'pt': 'Pagina QTM',
      'es': 'Página QTM',
    },
    'nd0kiumi': {
      'pt': 'Politicas',
      'es': 'Políticas',
    },
    'hmlr4ok8': {
      'pt': 'Termos e Condições',
      'es': 'Términos y Condiciones',
    },
    'df8ip35m': {
      'pt': 'Sair',
      'es': 'Salir',
    },
    'i5tm9lrs': {
      'pt': 'Home',
      'es': 'Hogar',
    },
  },
  // praticals_theraphist_page
  {
    '9ntga1fl': {
      'pt': 'Horários de Atendimento',
      'es': 'Horas de servicio',
    },
    'mw51uvj3': {
      'pt': 'Criar Práticas',
      'es': 'Crear prácticas',
    },
    'dqu9d3jd': {
      'pt': 'Minhas Práticas',
      'es': 'Mis practicas',
    },
    '3pjcyy3j': {
      'pt': 'Home',
      'es': 'Hogar',
    },
  },
  // add_praticals_page
  {
    'yt71g3i9': {
      'pt': 'Nome da prática',
      'es': 'Nombre de la práctica',
    },
    'kd0d57j1': {
      'pt': 'Coworking',
      'es': 'Trabajo colaborativo',
    },
    'xk16rgnt': {
      'pt': 'Domiciliar',
      'es': 'Hogar',
    },
    '0k2ctfu6': {
      'pt': 'Tipo de serviço',
      'es': 'tipo de servicio',
    },
    'ruf3jlpe': {
      'pt': 'Search for an item...',
      'es': 'Buscar un artículo...',
    },
    'g28gmtya': {
      'pt': 'Option 1',
      'es': 'Opción 1',
    },
    'yz22tlze': {
      'pt': 'Especialidade',
      'es': 'Especialidad',
    },
    'l1fr6xp6': {
      'pt': 'Search for an item...',
      'es': 'Buscar un artículo...',
    },
    '7jceknok': {
      'pt': 'Eu tenho certificado desta prática integrativa',
      'es': 'Tengo certificación de esta práctica integrativa.',
    },
    '87nao9f1': {
      'pt': 'Certificado de especilidade',
      'es': 'certificado de especialidad',
    },
    'ym90fsed': {
      'pt': 'Data de Conclusão',
      'es': 'Fecha de finalizacion',
    },
    '1rbpp66c': {
      'pt': 'Anexar Certificado',
      'es': 'Adjuntar certificado',
    },
    'y8ob991i': {
      'pt': 'Finalizar',
      'es': 'Finalizar',
    },
    'ojorr4f9': {
      'pt': 'Adicionar Prática',
      'es': 'Agregar práctica',
    },
    'ebarripn': {
      'pt': 'Home',
      'es': 'Hogar',
    },
  },
  // add_timers_page
  {
    'qgl6ti48': {
      'pt': 'Segunda',
      'es': 'Segundo',
    },
    '1zf39clt': {
      'pt': 'Terça',
      'es': 'Tercero',
    },
    'shu0je7c': {
      'pt': 'Quarta',
      'es': 'Cuatro',
    },
    'i68ewny4': {
      'pt': 'Quinta',
      'es': 'Quinto',
    },
    'npf2cvw2': {
      'pt': 'Sexta',
      'es': 'Viernes',
    },
    'te8vxfjz': {
      'pt': 'Sábado',
      'es': 'Sábado',
    },
    'hqusqbr0': {
      'pt': 'Domingo',
      'es': 'Domingo',
    },
    'g5t32vse': {
      'pt': 'Valor por Sessão',
      'es': 'Precio por sesión',
    },
    'wlfs0f1p': {
      'pt': '50 min',
      'es': '50 minutos',
    },
    'a9ro49u3': {
      'pt': '50 min',
      'es': '50 minutos',
    },
    'i30awoo9': {
      'pt': 'Tempo da sessão',
      'es': 'Tiempo de sesión',
    },
    'sosex5re': {
      'pt': 'Search for an item...',
      'es': 'Buscar un artículo...',
    },
    'x6xcy52c': {
      'pt': 'Finalizar',
      'es': 'Finalizar',
    },
    '3flmu2to': {
      'pt': 'Adicionar Horários',
      'es': 'Agregar horarios',
    },
    '98nzdhj5': {
      'pt': 'Home',
      'es': 'Hogar',
    },
  },
  // calendar_theraphist_page
  {
    '23ie4hjz': {
      'pt': 'Agenda',
      'es': 'Cronograma',
    },
    '0mtk176x': {
      'pt': 'Home',
      'es': 'Hogar',
    },
  },
  // register_patient_page
  {
    'm0zwn479': {
      'pt': 'Está quase Lá!',
      'es': '¡Ya casi está allí!',
    },
    'xriakbtr': {
      'pt': 'Insira seus dados cadastrais',
      'es': 'Introduce tus datos de registro',
    },
    'lk6418gf': {
      'pt': 'CPF',
      'es': 'CPF',
    },
    '3znn8wbc': {
      'pt': 'Buscar Meu Endereço',
      'es': 'Encuentra mi dirección',
    },
    '2tso40c5': {
      'pt': 'Complemento',
      'es': 'Complementar',
    },
    'ir5723j4': {
      'pt': 'Campo Obrigatório',
      'es': 'campo obligatorio',
    },
    '9ejbgfnp': {
      'pt': 'Please choose an option from the dropdown',
      'es': 'Por favor elija una opción del menú desplegable',
    },
    '5f17uk3i': {
      'pt': 'Campo obrigatório',
      'es': 'Campo obligatorio',
    },
    'cptocwkh': {
      'pt': 'Please choose an option from the dropdown',
      'es': 'Por favor elija una opción del menú desplegable',
    },
    'vhrprl71': {
      'pt': 'Finalizar',
      'es': 'Finalizar',
    },
    '7xxmlwlz': {
      'pt': 'Home',
      'es': 'Hogar',
    },
  },
  // terms_inital_page
  {
    '640a1h64': {
      'pt':
          'Os serviços da QTM Healthtech são fornecidos pela pessoa jurídica com a seguinte Razão Social: Juliana dos Santos Nogueira, com nome fantasia: Quantum, inscrito no CNPJ sob o nº 36.729.683/0001-60, titular da propriedade intelectual sobre software, website, aplicativos, conteúdos e demais ativos relacionados do site ou aplicativo da QTM Healthtech.',
      'es':
          'Los servicios de QTM Healthtech son prestados por la persona jurídica con la siguiente Razón Social: Juliana dos Santos Nogueira, con razón social: Quantum, registrada en el CNPJ con el nº 36.729.683/0001-60, titular de la propiedad intelectual sobre software, sitio web y aplicaciones. , contenido y otros activos relacionados del sitio web o aplicación de QTM Healthtech.',
    },
    '2whzvsf4': {
      'pt': '1.OBJETO',
      'es': '1. OBJETO',
    },
    '0d4f0t78': {
      'pt':
          '1.1 A plataforma visa licenciar o uso de seu website, e demais ativos de propriedade intelectual, fornecendo ferramentas para auxiliar e dinamizar o dia a dia dos seus usuários.',
      'es':
          '1.1 La plataforma tiene como objetivo otorgar licencia para el uso de su sitio web y otros activos de propiedad intelectual, proporcionando herramientas para ayudar y simplificar la vida diaria de sus usuarios.',
    },
    'ck6rfojg': {
      'pt':
          '1.2 A plataforma caracteriza-se pela prestação dos seguintes serviços: conexão entre terapeutas, pacientes, coworking e venda de produtos.',
      'es':
          '1.2 La plataforma se caracteriza por la prestación de los siguientes servicios: conexión entre terapeutas, pacientes, coworking y venta de productos.',
    },
    'bw8ucqmj': {
      'pt':
          '1.3 A plataforma realiza a venda à distância por meio eletrônico e presencial dos seguintes produtos ou serviços: Praticas Integrativas e Complementares, Blends de chá e Produtos Digitais.',
      'es':
          '1.3 La plataforma realiza ventas a distancia de forma electrónica y presencial de los siguientes productos o servicios: Prácticas Integrativas y Complementarias, Mezclas de Té y Productos Digitales.',
    },
    '92u5jzsh': {
      'pt': '2. DA ACEITAÇÃO',
      'es': '2. ACEPTACIÓN',
    },
    'tdv4d3tc': {
      'pt':
          '2.1 A plataforma realiza a venda à distância por meio eletrônico e presencial dos seguintes produtos ou serviços: Praticas Integrativas e Complementares, Blends de chá e Produtos Digitais.\n2.2 Ao utilizar a plataforma o usuário aceita integralmente as presentes normas e compromete-se a observá-las, sob o risco de aplicação das penalidade cabíveis.\n2.3 A aceitação do presente instrumento é imprescindível para o acesso e para a utilização de quaisquer serviços fornecidos pela empresa. Caso não concorde com as disposições deste instrumento, o usuário não deve utilizá-los.',
      'es':
          '2.1 La plataforma comercializa de forma remota, electrónica y presencial, los siguientes productos o servicios: Prácticas Integrativas y Complementarias, Mezclas de Té y Productos Digitales.\n2.2 Al utilizar la plataforma, el usuario acepta plenamente estas reglas y se compromete a observarlas, bajo el riesgo de aplicación de sanciones aplicables.\n2.3 La aceptación de este instrumento es esencial para el acceso y uso de cualquier servicio proporcionado por la empresa. Si no está de acuerdo con las disposiciones de este instrumento, el usuario no deberá utilizarlas.',
    },
    '9to3m7wu': {
      'pt': '3 DO ACESSO DOS USUÁRIOS',
      'es': '3 ACCESO DE USUARIOS',
    },
    'awcu7g2a': {
      'pt':
          '3.1 Serão utilizadas todas as soluções técnicas à disposição do responsável pela plataforma para permitir o acesso ao serviço 24 (vinte e quatro) horas por dia, 7 (sete) dias por semana. No entanto, a navegação na plataforma ou em alguma de suas páginas poderá ser interrompida, limitada ou suspensa para atualizações, modificações ou qualquer ação necessária ao seu bom funcionamento.',
      'es':
          '3.1 Se utilizarán todas las soluciones técnicas a disposición de los responsables de la plataforma para permitir el acceso al servicio las 24 (veinticuatro) horas del día, los 7 (siete) días de la semana. Sin embargo, la navegación en la plataforma o cualquiera de sus páginas podrá ser interrumpida, limitada o suspendida por actualizaciones, modificaciones o cualquier acción necesaria para su correcto funcionamiento.',
    },
    'vn02rcx8': {
      'pt': '4 DO CADASTRO',
      'es': '4 DEL REGISTRO',
    },
    '7a4vihgs': {
      'pt':
          '4.1 O acesso às funcionalidades da plataforma exigirá a realização de um cadastro prévio e, a depender dos serviços ou produtos escolhidos, o pagamento de determinado valor.\n4.2 Ao se cadastrar o usuário deverá informar dados completos, recentes e válidos, sendo de sua exclusiva responsabilidade manter referidos dados atualizados, bem como o usuário se compromete com a veracidade dos dados fornecidos.\n4.3 O usuário se compromete a não informar seus dados cadastrais e/ou de acesso à plataforma a terceiros, responsabilizando-se integralmente pelo uso que deles seja feito.\n4.4 Menores de 18 anos e aqueles que não possuírem plena capacidade civil deverão obter previamente o consentimento expresso de seus responsáveis legais para utilização da plataforma e dos serviços ou produtos, sendo de responsabilidade exclusiva dos mesmos o eventual acesso por menores de idade e por aqueles que não possuem plena capacidade civil sem a prévia autorização.\n4.5 Mediante a realização do cadastro o usuário declara e garante expressamente ser plenamente capaz, podendo exercer e usufruir livremente dos serviços e produtos.\n4.6 O usuário deverá fornecer um endereço de e-mail válido, através do qual o site realizará comunicações necessárias.\n4.7 Após a confirmação do cadastro, o usuário possuirá um login e uma senha pessoal, a qual assegura ao usuário o acesso individual à mesma. Desta forma, compete ao usuário exclusivamente a manutenção de referida senha de maneira confidencial e segura, evitando o acesso indevido às informações pessoais.\n4.8 Toda e qualquer atividade realizada com o uso da senha será de responsabilidade do usuário, que deverá informar prontamente a plataforma em caso de uso indevido da respectiva senha.\n4.9 Não será permitido ceder, vender, alugar ou transferir, de qualquer forma, a conta, que é pessoal e intransferível.\n4.10 Caberá ao usuário assegurar que o seu equipamento seja compatível com as características técnicas que viabilize a utilização da plataforma e dos serviços ou produtos.\n4.11 O usuário poderá, a qualquer tempo, requerer o cancelamento de seu cadastro junto ao site ou aplicativo QTM Healthtech. O seu descadastramento será realizado o mais rapidamente possível, desde que não sejam verificados débitos em aberto.\n4.12 O usuário, ao aceitar os Termos e Política de Privacidade, autoriza expressamente a plataforma a coletar, usar, armazenar, tratar, ceder ou utilizar as informações derivadas do uso do site e quaisquer plataformas, incluindo todas as informações preenchidas pelo usuário no momento em que realizar ou atualizar seu cadastro, além de outras expressamente descritas na Política de Privacidade que deverá ser autorizada pelo usuário.',
      'es':
          '4.1 El acceso a las funcionalidades de la plataforma requerirá el registro previo y, dependiendo de los servicios o productos elegidos, el pago de una determinada cantidad.\n4.2 Al registrarse, el usuario deberá proporcionar datos completos, recientes y válidos, siendo de su responsabilidad exclusiva de mantener dichos datos actualizados, comprometiéndose el usuario a garantizar la veracidad de los datos facilitados.\n4.3 El usuario se compromete a no revelar a terceros sus datos de registro y/o acceso a la plataforma, asumiendo la plena responsabilidad del uso que se haga de los mismos.\n4.4 Los menores de 18 años y aquellos que no tengan plena capacidad civil deberán obtener previamente el consentimiento expreso de sus tutores legales para utilizar la plataforma y los servicios o productos, siendo de su exclusiva responsabilidad cualquier eventual el acceso de menores de edad y de quienes no tengan plena capacidad civil sin autorización previa.\n4.5 Al registrarse, el usuario declara y garantiza expresamente que está en plena capacidad y puede libremente ejercer y disfrutar de los servicios y productos.<__FFNL__ >4.6 El El usuario deberá proporcionar una dirección de correo electrónico válida, a través de la cual el sitio realizará las comunicaciones necesarias.\n4.7 Luego de confirmar el registro, el usuario dispondrá de un login y una contraseña personal, que le garantiza el acceso individual al mismo. Por lo tanto, el usuario es el exclusivo responsable de mantener dicha contraseña de forma confidencial y segura, evitando el acceso indebido a información personal.\n4.8 Todas y cada una de las actividades que se realicen utilizando la contraseña serán responsabilidad del usuario, quien deberá informar oportunamente la plataforma en caso de mal uso de la respectiva contraseña.\n4.9 No se permitirá ceder, vender, alquilar o transferir, de cualquier forma, la cuenta, la cual es personal e intransferible.\n4.10 Corresponderá al usuario asegurarse de que su equipo sea compatible con las características técnicas que permitan el uso de la plataforma y los servicios o productos.\n4.11 El usuario podrá, en cualquier momento, solicitar la cancelación de su registro en el QTM Healthtech sitio web o aplicación. Su baja se realizará a la mayor brevedad posible, siempre y cuando no existan deudas pendientes.\n4.12 El usuario, al aceptar los Términos y Política de Privacidad, autoriza expresamente a la plataforma a recopilar, utilizar, almacenar, procesar, transferir o utilizar información derivada del uso del sitio web y cualesquiera plataformas, incluyendo toda la información completada por el usuario al registrarse o actualizar su registro, además de otras expresamente descritas en la Política de Privacidad, las cuales deberán ser autorizadas por el usuario.',
    },
    'v4ily5vq': {
      'pt': '5 DOS SERVIÇOS OU PRODUTOS',
      'es': '5 DE LOS SERVICIOS O PRODUCTOS',
    },
    'y88ymtxk': {
      'pt':
          '5.1 A plataforma poderá disponibilizar para o usuário um conjunto específico de funcionalidades e ferramentas para otimizar o uso ou venda dos serviços e produtos.\n5.2 Na plataforma os serviços ou produtos oferecidos estão descritos e apresentados com o maior grau de exatidão, contendo informações sobre suas características, qualidades, quantidades, composição, preço, garantia, prazos de validade e origem, entre outros dados, bem como sobre os riscos que apresentam à saúde e segurança do usuário.\n5.3 Antes de finalizar a compra sobre determinado produto ou serviço, o usuário deverá se informar sobre as suas especificações e sobre a sua destinação.\n5.4 A entrega de serviços ou produtos adquiridos na plataforma será informada no momento da finalização da compra.',
      'es':
          '5.1 La plataforma puede poner a disposición del usuario un conjunto específico de funcionalidades y herramientas para optimizar el uso o venta de servicios y productos.\n5.2 En la plataforma, los servicios o productos ofrecidos se describen y presentan con el mayor grado de precisión. , conteniendo información sobre sus características, calidades, cantidades, composición, precio, garantía, fechas de caducidad y origen, entre otros datos, así como sobre los riesgos que suponen para la salud y seguridad del usuario.\n5.3 Antes de finalizar el compra de un producto o servicio específico, el usuario deberá informarse sobre sus especificaciones y su destino.\n5.4 La entrega de los servicios o productos adquiridos en la plataforma será informada al momento de finalizar la compra.',
    },
    'z9zx4kko': {
      'pt': '6  DOS PREÇOS',
      'es': '6 PRECIOS',
    },
    'sb0nfw4o': {
      'pt':
          '6.1 A plataforma se reserva no direito de reajustar unilateralmente, a qualquer tempo, os valores dos serviços ou produtos sem consulta ou anuência prévia do usuário.\n6.2 Os valores aplicadas são aqueles que estão em vigor no momento do pedido.\n6.3 Os preços são indicados em reais e não incluem as taxas de entrega, as quais são especificadas à parte e são informadas ao usuário antes da finalização do pedido.\n6.4 Na contratação de determinado serviço ou produto, a plataforma poderá solicitar as informações financeiras do usuário, como CPF, endereço de cobrança e dados de cartões. Ao inserir referidos dados o usuário concorda que sejam cobrados, de acordo com a forma de pagamento que venha a ser escolhida, os preços então vigentes e informados quando da contratação. Referidos dados financeiros poderão ser armazenadas para facilitar acessos e contratações futuras.',
      'es':
          '6.1 La plataforma se reserva el derecho de reajustar unilateralmente, en cualquier momento, los precios de los servicios o productos sin previa consulta o consentimiento del usuario.\n6.2 Los valores aplicados son los vigentes en el momento del pedido.< __FFNL__> 6.3 Los precios se indican en reales y no incluyen los gastos de envío, que se especifican por separado y se informan al usuario antes de completar el pedido.\n6.4 Al contratar un determinado servicio o producto, la plataforma puede solicitar información financiera del usuario , como CPF, dirección de facturación y detalles de la tarjeta. Al introducir dichos datos, el usuario acepta que se le cobren, según el método de pago elegido, los precios entonces vigentes y informados en el momento de la contratación. Dichos datos financieros podrán ser almacenados para facilitar el acceso y futuras contrataciones.',
    },
    'f5f4wein': {
      'pt': '7 DO CANCELAMENTO',
      'es': '7 CANCELACIÓN',
    },
    '3u0vt9ng': {
      'pt':
          '7.1 O usuário poderá cancelar a contratação dos serviços de acordo com os termos que forem definidos no momento de sua contratação. Ainda, o usuário também poderá cancelar os serviços em até 7 (sete) dias após a contratação, mediante contato com com o SAC presente no site ou aplicativo QTM Healthtech, de acordo com o  Código de Defesa do Consumidor (Lei no. 8.078/90).\n7.2 O serviço poderá ser cancelado por:\na) parte do usuário: nessas condições os serviços somente cessarão quando concluído o ciclo vigente ao tempo do cancelamento;\nb) violação dos Termos de Uso: os serviços serão cessados imediatamente.',
      'es':
          '7.1 El usuario podrá cancelar la contratación de servicios de acuerdo con los términos definidos en el momento de la contratación. Además, el usuario también podrá cancelar los servicios dentro de los 7 (siete) días posteriores a la contratación, contactando al SAC presente en el sitio web o aplicación de QTM Healthtech, de conformidad con el Código de Protección al Consumidor (Ley nº 8.078/90).\n 7.2 El servicio podrá ser cancelado por:\na) el usuario: bajo estas condiciones los servicios sólo cesarán cuando se haya completado el ciclo vigente al momento de la cancelación;\nb) violación de los Términos de Uso: los servicios cesarán inmediatamente.',
    },
    'jik2xxuq': {
      'pt': '8 DA TROCA OU DEVOLUÇÃO',
      'es': '8 CAMBIO O DEVOLUCIÓN',
    },
    'pagy8bfs': {
      'pt':
          '8.1 A política de troca e devoluções da plataforma é regida conforme o  Código de Defesa do Consumidor (Lei nº 8.078/90).\n8.2 A troca e/ou devolução do produto poderá ocorrer por:\na) direito de arrependimento;\nb) vício do produto.\n8.3 Em caso de arrependimento, o usuário poderá devolver o produto em até 7 (sete) dias após o seu recebimento, mediante contato com o site ou aplicativo QTM Healthtech, de acordo com o  Código de Defesa do Consumidor (Lei nº 8.078/90).\n8.4 Em caso de vício do produto, deverá ser verificado vícios de qualidade ou quantidade que tornem o produto impróprios ou inadequados ao consumo a que se destinam ou que lhes diminuam o valor. Ainda, poderão ser trocados ou devolvidos os produtos ou serviços que apresentam disparidade com as indicações constantes na plataforma no momento da compra ou na embalagem, respeitando as variações decorrentes de sua natureza\n8.5 O usuário deverá entrar em contato com o site ou aplicativo QTM Healthtech tão logo constate o vício. Se, no prazo máximo de 30 (trinta) dias, não for possível resolver o vício ou, independentemente deste prazo, a substituição das partes viciadas puder comprometer a qualidade ou características do produto ou serviço, diminuir-lhe o valor ou se tratar de produto ou serviço essencial, o usuário poderá optar pela substituição do produto por outro da mesma espécie ou pela reexecução do serviço, pela devolução das quantias pagas ou pelo abatimento proporcional do preço.',
      'es':
          '8.1 A política de troca e devoluções da plataforma é regida conforme o  Código de Defesa do Consumidor (Lei nº 8.078/90).\n8.2 A troca e/ou devolução do produto poderá ocorrer por:\na) direito de arrependimento ;\nb) vício do produto.\n8.3 Em caso de arrependimento, o usuário poderá devolver o produto em até 7 (sete) dias após o seu recebimento, mediante contato com o site ou aplicativo QTM Healthtech, de acordo com o  Código de Defesa do Consumidor (Lei nº 8.078/90).\n8.4 Em caso de vício do produto, deverá ser verificado vícios de qualidade ou quantidade que tornem o produto impróprios ou inadequados ao consumo a que se destinam ou que lhes diminuam el valor. Además, los productos o servicios que difieran de las indicaciones contenidas en la plataforma en el momento de la compra o en el embalaje podrán ser cambiados o devueltos, respetando las variaciones que resulten de su naturaleza.\n8.5 El usuario deberá contactar con el sitio web o aplicación QTM Healthtech como tan pronto como se detecta la adicción. Si en un plazo máximo de 30 (treinta) días no es posible solucionar el defecto o, independientemente de este plazo, la sustitución de las piezas defectuosas pudiera comprometer la calidad o características del producto o servicio, reducir su valor o Sea un producto o servicio esencial, el usuario podrá optar por la sustitución del producto por otro del mismo tipo o por volver a realizar el servicio, por la devolución de las cantidades abonadas o por una reducción proporcional del precio.',
    },
    '2iydhy7j': {
      'pt': '9 DO SUPORTE',
      'es': '9 DEL APOYO',
    },
    'wenff4uc': {
      'pt':
          '9.1 Em caso de qualquer dúvida, sugestão ou problema com a utilização da plataforma, o usuário poderá entrar em contato com o suporte, através do email suporte@qtmhealthtech.com.br ou telefone (98) 98331-8460.\n9.2 Estes serviços de atendimento ao usuário estarão disponíveis nos seguintes dias e horários:\n \n-Segunda a Sexta: 8 horas às 12 horas – 14 horas às 18 horas\n \n-Sábado e domingo: 8 às 12',
      'es':
          '9.1 En caso de dudas, sugerencias o problemas al utilizar la plataforma, el usuario podrá contactar a soporte a través del correo electrónico support@qtmhealthtech.com.br o al teléfono (98) 98331-8460.\n9.2 Estos servicios de soporte al Usuario estarán disponibles en la siguientes días y horarios:\n \n-Lunes a Viernes: 8 am a 12 pm – 2 pm a 6 pm\n \n-Sábado y Domingo: 8 am a 12 pm',
    },
    '5g156680': {
      'pt': '10 DAS RESPONSABILIDADES',
      'es': '10 RESPONSABILIDADES',
    },
    '5xaw8ep8': {
      'pt':
          '10.1 É de Responsabilidade do Usuário:\na) defeitos ou vícios técnicos originados no próprio sistema do usuário;\nb) a correta utilização da plataforma, dos serviços ou produtos oferecidos, prezando pela boa convivência, pelo respeito e cordialidade entre os usuários;\nc) pelo cumprimento e respeito ao conjunto de regras disposto nesse Termo de Condições Geral de Uso, na respectiva Política de Privacidade e na legislação Nacional e Internacional;\nd) pela proteção aos dados de acesso à sua conta/perfil (login e senha).\n10.2 É de Responsabilidade da Plataforma QTM Healthtech:\na) indicar as características do serviço ou produto;\nb) os defeitos e vícios encontrados no serviço ou produto oferecido desde que lhe tenha dado causa;\nc) as informações que foram por ele divulgadas, sendo que os comentários ou informações divulgadas por usuários são de inteira responsabilidade dos próprios usuários;\nd) oos conteúdos ou atividades ilícitas praticadas através da sua plataforma\n10.1 A plataforma não se responsabiliza por links externos contidos em seu sistema que possam redirecionar o usuário à ambiente externo a sua rede.\n10.2 Não poderão ser incluídos links externos ou páginas que sirvam para fins comerciais ou publicitários sem autorização ou quaisquer informações ilícitas, violentas, polêmicas, pornográficas, xenofóbicas, discriminatórias ou ofensivas.',
      'es':
          '10.1 Es responsabilidad del Usuario:\na) los defectos o defectos técnicos originados en el propio sistema del usuario;\nb) el correcto uso de la plataforma, servicios o productos ofrecidos, valorando la buena convivencia, el respeto y la cordialidad entre los usuarios; \nc) para el cumplimiento y respeto del conjunto de normas establecidas en las presentes Condiciones Generales de Uso, en la respectiva Política de Privacidad y en la legislación Nacional e Internacional;\nd) para la protección de los datos de acceso a su cuenta /profile (usuario y contraseña).\n10.2 Es responsabilidad de la Plataforma QTM Healthtech:\na) indicar las características del servicio o producto;\nb) los defectos y defectos encontrados en el servicio o producto ofrecido desde que le dio origen;\nc) la información que fue divulgada por él, y los comentarios o información divulgada por los usuarios son responsabilidad exclusiva de los propios usuarios;\nd) el contenido o las actividades ilegales realizadas a través de su plataforma\n10.1 La plataforma no se hace responsable de los enlaces externos contenidos en su sistema que puedan redirigir al usuario a un entorno fuera de su red.\n10.2 No se pueden incluir enlaces externos o páginas que sirvan para fines comerciales o publicitarios sin autorización o cualquier información ilícita, violenta, controvertida, pornográfica, xenófoba, discriminatoria u ofensiva.',
    },
    'fjxf05w2': {
      'pt': '11 DOS DIRITOS AUTORAIS',
      'es': '11 DERECHOS DE AUTOR',
    },
    '5e0l4rmy': {
      'pt':
          '11.1 O presente Termo de Uso concede aos usuários uma licença não exclusiva, não transferível e não sublicenciável, para acessar e fazer uso da plataforma e dos serviços e produtos por ela disponibilizados.\n11.2 A estrutura do site ou aplicativo, as marcas, logotipos, nomes comerciais, layouts, gráficos e design de interface, imagens, ilustrações, fotografias, apresentações, vídeos, conteúdos escritos e de som e áudio, programas de computador, banco de dados, arquivos de transmissão e quaisquer outras informações e direitos de propriedade intelectual da razão social QTM Healthtech LTDA, observados os termos da  Lei da Propriedade Industrial (Lei nº 9.279/96),  Lei de Direitos Autorais (Lei nº 9.610/98) e  Lei do Software (Lei nº 9.609/98), estão devidamente reservados.\n11.3 Este Termos de Uso não cede ou transfere ao usuário qualquer direito, de modo que o acesso não gera qualquer direito de propriedade intelectual ao usuário, exceto pela licença limitada ora concedida.\n11.4 O uso da plataforma pelo usuário é pessoal, individual e intransferível, sendo vedado qualquer uso não autorizado, comercial ou não-comercial. Tais usos consistirão em violação dos direitos de propriedade intelectual da razão social QTM Healthtech LTDA, puníveis nos termos da legislação aplicável.\n',
      'es':
          '11.1 Estos Términos de uso otorgan a los usuarios una licencia no exclusiva, intransferible y no sublicenciable para acceder y hacer uso de la plataforma y los servicios y productos puestos a disposición por ella.\n11.2 La estructura del sitio web o la aplicación, las marcas, logotipos, nombres comerciales, diseños, gráficos y diseño de interfaz, imágenes, ilustraciones, fotografías, presentaciones, videos, contenido escrito y de sonido y audio, programas de computadora, bases de datos, archivos de transmisión y cualquier otra información y derechos de propiedad intelectual de la razón social QTM Healthtech LTDA, en cumplimiento de los términos de la Ley de Propiedad Industrial (Ley nº 9.279/96), Ley de Derecho de Autor (Ley nº 9.610/98) y Ley de Software (Ley nº 9.609/98), quedan debidamente reservados.<__FFNL__ >11.3 Estos Términos de Uso no asignan ni transfieren ningún derecho al usuario, por lo que el acceso no genera ningún derecho de propiedad intelectual para el usuario, excepto la licencia limitada aquí otorgada.\n11.4 El uso de la plataforma por parte del usuario Es personal, individual e intransferible, quedando prohibido cualquier uso no autorizado, comercial o no comercial. Dichos usos constituirán una violación de los derechos de propiedad intelectual de la razón social QTM Healthtech LTDA, sancionable según la legislación aplicable.',
    },
    'j927lp75': {
      'pt': '12 DAS SANSÕES',
      'es': '12 DE SANSIONES',
    },
    '46kpl4fs': {
      'pt':
          '\n12.1 Sem prejuízo das demais medidas legais cabíveis, a razão QTM Healthtech LTDA poderá, a qualquer momento, advertir, suspender ou cancelar a conta do usuário:\na)que violar qualquer dispositivo do presente Termo;\nb) que descumprir os seus deveres de usuário.\nc) que tiver qualquer comportamento fraudulento, doloso ou que ofenda a terceiros.',
      'es':
          '12.1 Sin perjuicio de otras medidas legales aplicables, QTM Healthtech LTDA podrá, en cualquier momento, advertir, suspender o cancelar la cuenta del usuario:\na) quien viole cualquier disposición de este Término;\nb) quien incumpla sus deberes como usuario.\nc) que realice cualquier conducta fraudulenta, maliciosa o que ofenda a terceros.',
    },
    'b7irb3ph': {
      'pt': '13 DAS RECISÕES',
      'es': '13 DE LAS TERMINACIONES',
    },
    'ay1mw1wf': {
      'pt':
          '13.1 A não observância das obrigações pactuadas neste Termo de Uso ou da legislação aplicável poderá, sem prévio aviso, ensejar a imediata rescisão unilateral por parte da razão social QTM Healthtech LTDA e o bloqueio de todos os serviços prestados ao usuário.',
      'es':
          '13.1 El incumplimiento de las obligaciones pactadas en estos Términos de Uso o la legislación aplicable podrá, sin previo aviso, dar lugar a la terminación unilateral inmediata por parte de la razón social QTM Healthtech LTDA y al bloqueo de todos los servicios prestados al usuario.',
    },
    'wsh4pktr': {
      'pt': '14 DA ALTERAÇÕES',
      'es': '14 DE LOS CAMBIOS',
    },
    'd8cqcw41': {
      'pt':
          '14.1 Os itens descritos no presente instrumento poderão sofrer alterações, unilateralmente e a qualquer tempo, por parte da QTM Healthtech, para adequar ou modificar os serviços, bem como para atender novas exigências legais. As alterações serão veiculadas pelo site da QTM Healthtech e o usuário poderá optar por aceitar o novo conteúdo ou por cancelar o uso dos serviços, caso seja assinante de algum serviço.',
      'es':
          '14.1 Los puntos descritos en este instrumento podrán ser modificados, unilateralmente y en cualquier momento, por QTM Healthtech, para adaptar o modificar los servicios, así como para atender nuevos requisitos legales. Los cambios serán publicados en el sitio web de QTM Healthtech y el usuario podrá optar por aceptar el nuevo contenido o cancelar el uso de los servicios, si es suscriptor de algún servicio.',
    },
    'uuu2idu2': {
      'pt': '15 DA POLITICAS DE PRIVACIDADE',
      'es': '15 POLÍTICAS DE PRIVACIDAD',
    },
    '3kqyvyei': {
      'pt':
          '15.1 Além do presente Termo, o usuário deverá consentir com as disposições contidas na respectiva Política de Privacidade a ser apresentada a todos os interessados dentro da interface da plataforma.',
      'es':
          '15.1 Además de estos Términos, el usuario debe dar su consentimiento a las disposiciones contenidas en la respectiva Política de Privacidad que se presentarán a todas las partes interesadas dentro de la interfaz de la plataforma.',
    },
    '1ag3e37q': {
      'pt': '16  DO FORO',
      'es': '16 DEL FORO',
    },
    'fxnl5oc4': {
      'pt':
          '16.1 Para a solução de controvérsias decorrentes do presente instrumento será aplicado integralmente o Direito brasileiro.\n16.2 Os eventuais litígios deverão ser apresentados no foro da comarca em que se encontra a sede da empresa.',
      'es':
          '16.1 Para la resolución de disputas que surjan de este instrumento, se aplicará plenamente la ley brasileña.\n16.2 Cualquier disputa deberá ser presentada en el tribunal del distrito en el que se encuentra la sede de la empresa.',
    },
    'k0xmvlcd': {
      'pt': 'Eu aceito so termos e condições gerais de uso ',
      'es': 'Acepto los términos y condiciones generales de uso.',
    },
    'iiqon57i': {
      'pt': 'Continuar',
      'es': 'Continuar',
    },
    'wq78ty8s': {
      'pt': 'Termos',
      'es': 'Términos',
    },
    '7x4js53n': {
      'pt': 'Home',
      'es': 'Hogar',
    },
  },
  // politics_inital_privacy_page
  {
    'jq4isirm': {
      'pt': 'Politica de Privacidade',
      'es': 'Política de privacidad',
    },
    'pxro3ic5': {
      'pt': '1. INFORMAÇÕES GERAIS',
      'es': '1. INFORMACIÓN GENERAL',
    },
    'gyyxl4lc': {
      'pt':
          '1.1 A presente Política de Privacidade contém informações sobre coleta, uso, armazenamento, tratamento e proteção dos dados pessoais dos usuários e visitantes do site e aplicativo da QTM Healthtech, com a finalidade de demonstrar absoluta transparência quanto ao assunto e esclarecer a todos interessados sobre os tipos de dados que são coletados, os motivos da coleta e a forma como os usuários podem gerenciar ou excluir as suas informações pessoais.\n1.2 Esta Política de Privacidade aplica-se a todos os usuários e visitantes do site QTM Healthtech e integra os Termos e Condições Gerais de Uso do Site QTM Healthtech, devidamente inscrita no CNPJ sob o nº 36.729.683/0001-60, Razão Social, QTM Healthtech LTDA, situado na rua c, quadra 10, N° 06, Planalto Anil II, CEP: 65050-860.\n1.3 O presente documento foi elaborado em conformidade com a Lei Geral de Proteção de Dados Pessoais (Lei 13.709/18), o Marco Civil da Internet (Lei 12.965/14) (e o Regulamento da UE n. 2016/6790). Ainda, o documento poderá ser atualizado em decorrência de eventual atualização normativa, razão pela qual se convida o usuário a consultar periodicamente esta seção.',
      'es':
          '1.1 Esta Política de Privacidad contiene información sobre la recopilación, uso, almacenamiento, procesamiento y protección de datos personales de los usuarios y visitantes del sitio web y aplicación de QTM Healthtech, con el propósito de demostrar absoluta transparencia sobre el tema y aclarar a todos los interesados ​​sobre la tipos de datos que se recopilan, los motivos de la recopilación y la forma en que los usuarios pueden administrar o eliminar su información personal.\n1.2 Esta Política de Privacidad se aplica a todos los usuarios y visitantes del sitio web de QTM Healthtech e integra los Términos y Condiciones Generales de Uso del Sitio Web QTM Healthtech, debidamente registrado ante el CNPJ con el nº 36.729.683/0001-60, Razón Social, QTM Healthtech LTDA, con domicilio en Rua c, quadra 10, N° 06, Planalto Anil II, CEP : 65050- 860.\n1.3 Este documento fue elaborado de conformidad con la Ley General de Protección de Datos Personales (Ley 13.709/18), el Marco Civil da Internet (Ley 12.965/14) (y el Reglamento UE n. 2016/6790 ). Además, el documento puede sufrir actualizaciones como consecuencia de posibles actualizaciones normativas, por lo que se invita al usuario a consultar periódicamente este apartado.',
    },
    '6jkbfd6r': {
      'pt': '2. COMO RECOLHEMOS OS DADOS PESSOAIS DO USUÁRIO E DO VISITANTE?',
      'es': '2. ¿CÓMO RECOPILAMOS DATOS PERSONALES DE USUARIOS Y VISITANTES?',
    },
    'ygzu8iny': {
      'pt':
          '2.1 Os dados pessoais do usuário e visitante são recolhidos pela plataforma da seguinte forma:\n• Quando o usuário cria uma conta na plataforma QTM Healthtech:esses dados se referem a identificação básica, como e-mail, nome completo, cidade de residência, endereço, documentos e profissão. A partir deles, podemos identificar o usuário e o visitante, além de garantir uma maior segurança e bem-estar às suas necessidade. Ficam cientes os usuários e visitantes de que seu perfil na plataforma estará acessível a todos demais usuários e visitantes QTM Healthtech.\n• Quando um usuário e visitante acessa páginas do site QTM Healthtech: as informações sobre interação e acesso são coletadas pela empresa para garantir uma melhor experiência ao usuário e visitante. Estes dados podem tratar sobre as palavras-chaves utilizadas em uma busca, o compartilhamento de um documento específico, comentários, visualizações de páginas, perfis, a URL de onde o usuário e visitante provêm, o navegador que utilizam e seus IPs de acesso, dentre outras que poderão ser armazenadas e retidas.\n• Por intermédio de terceiro: a plataforma recebe dados de terceiros, como Facebook e Google, quando um usuário faz login com o seu perfil de um desses sites. A utilização desses dados é autorizada previamente pelos usuários junto ao terceiro em questão.',
      'es':
          '2.1 Los datos personales del usuario y visitante son recopilados por la plataforma de la siguiente manera:\n• Cuando el usuario crea una cuenta en la plataforma QTM Healthtech: estos datos se refieren a una identificación básica, como correo electrónico, nombre completo, ciudad de residencia, dirección , documentos y profesión. A partir de ellos podemos identificar al usuario y visitante, además de garantizarle una mayor seguridad y bienestar según sus necesidades. Los usuarios y visitantes son conscientes de que su perfil en la plataforma será accesible para todos los demás usuarios y visitantes de QTM Healthtech.\n• Cuando un usuario y visitante accede a páginas en el sitio web de QTM Healthtech: la empresa recopila información de interacción y acceso para garantizar una mejor experiencia de usuario y visitante. Estos datos pueden tratar de las palabras clave utilizadas en una búsqueda, el intercambio de un documento específico, comentarios, páginas vistas, perfiles, la URL de donde proviene el usuario y visitante, el navegador que utiliza y sus IP de acceso, entre otros que puedan ser almacenados y retenidos.\n• A través de un tercero: la plataforma recibe datos de terceros, como Facebook y Google, cuando un usuario inicia sesión con su perfil desde uno de estos sitios. El uso de estos datos es previamente autorizado por los usuarios con el tercero en cuestión.',
    },
    'vvoiclf4': {
      'pt': '3  QUAIS DADOS PESSOAIS RECOLHEMOS SOBRE O USUÁRIO E VISITANTE?',
      'es': '3 ¿QUÉ DATOS PERSONALES RECOGEMOS DEL USUARIO Y VISITANTE?',
    },
    'jh5xwit5': {
      'pt':
          '3.1 Os dados pessoais do usuário e visitante recolhidos são os seguintes:\n• Dados para a criação da conta/perfil na plataforma QTM Healthtech: e-mail, nome completo, cidade de residência e profissão.\n• Dados para otimização da navegação: acesso a páginas, palavras-chave utilizadas na busca, recomendações, comentários, interação com outros perfis e usuários, perfis seguidos, endereço de IP.\n• Dados para concretizar transações: dados referentes ao pagamento e transações, tais como, número do cartão de crédito e outras informações sobre o cartão, além dos pagamentos efetuados.\n• • Newsletter: o e-mail cadastrado pelo visitante que optar por se inscrever na Newsletter será coletado e armazenado até que o usuário solicite o descadastro.\n• Dados sensíveis: a plataforma poderá coletar os seguintes dados sensíveis do usuário - origem étnica ou racial, opinião política, convicção religiosa, dados genéticos, dados relativos à saúde, orientação sexual.\n• Dados relacionados a contratos: diante da formalização do contrato de compra e venda ou de prestação de serviços entre a plataforma e o usuário e visitante poderão ser coletados e armazenados dados relativos a execução contratual, inclusive as comunicações realizada entre a empresa e o usuário.',
      'es':
          '3.1 Los datos personales del usuario y visitante recopilados son los siguientes:\n• Datos para la creación de la cuenta/perfil en la plataforma QTM Healthtech: correo electrónico, nombre completo, ciudad de residencia y profesión.\n• Datos para la optimización de la navegación : acceso a páginas, palabras clave utilizadas en la búsqueda, recomendaciones, comentarios, interacción con otros perfiles y usuarios, perfiles seguidos, dirección IP.\n• Datos para completar transacciones: datos relacionados con pagos y transacciones, como por ejemplo, número de tarjeta de crédito y otra información sobre la tarjeta, además de los pagos realizados.\n• • Newsletter: el correo electrónico registrado por el visitante que opta por suscribirse al Newsletter será recogido y almacenado hasta que el usuario solicite su baja.\n• Datos sensibles : la plataforma podrá recopilar del usuario los siguientes datos sensibles: origen étnico o racial, opinión política, convicciones religiosas, datos genéticos, datos relativos a la salud, orientación sexual.\n• Datos relacionados con contratos: Al formalizar la compra y contrato de venta o prestación de servicios entre la plataforma y el usuario y visitante, se podrán recoger y almacenar datos relativos a la ejecución contractual, incluidas las comunicaciones realizadas entre la empresa y el usuario.',
    },
    'emh9gj8b': {
      'pt':
          '4 PARA QUE FINALIDADES UTILIZAMOS OS DADOS PESSOAIS DO USUÁRIO E VISITANTE?',
      'es':
          '4 ¿CON QUÉ FINALIDADES UTILIZAMOS LOS DATOS PERSONALES DE USUARIOS Y VISITANTES?',
    },
    '2o1lo382': {
      'pt':
          '4.1 Os dados pessoais do usuário e do visitante coletados e armazenados pela plataforma QTM Healthtech tem por finalidade:\n• • Bem-estar do usuário e visitante: aprimorar o produto e/ou serviço oferecido, facilitar, agilizar e cumprir os compromissos estabelecidos entre o usuário e a empresa, melhorar a experiência dos usuários e fornecer funcionalidades específicas a depender das características básicas do usuário.\n• Melhorias da plataforma: compreender como o usuário utiliza os serviços da plataforma, para ajudar no desenvolvimento de negócios e técnicas.\n• Anúncios: apresentar anúncios personalizados para o usuário com base nos dados fornecidos.\n• Comercial: os dados são usados para personalizar o conteúdo oferecido e gerar subsídio à plataforma para a melhora da qualidade no funcionamento dos serviços.\n• Previsão do perfil do usuário: tratamento automatizados de dados pessoais para avaliar o uso na plataforma.\n• Dados de cadastro: para permitir o acesso do usuário a determinados conteúdos da plataforma, exclusivo para usuários cadastrados.\n• Dados de contrato: conferir às partes segurança jurídica e facilitar a conclusão do negócio.\n4.2 O tratamento de dados pessoais para finalidades não previstas nesta Política de Privacidade somente ocorrerá mediante comunicação prévia ao usuário, de modo que os direitos e obrigações aqui previstos permanecem aplicáveis.',
      'es':
          '4.1 Los datos personales de los usuarios y visitantes recopilados y almacenados por la plataforma QTM Healthtech tienen como finalidad:\n• • Bienestar del usuario y visitante: mejorar el producto y/o servicio ofrecido, facilitar, agilizar y cumplir los compromisos establecidos entre los usuario y la empresa, mejorar la experiencia del usuario y proporcionar funcionalidades específicas dependiendo de las características básicas del usuario.\n• Mejoras en la plataforma: comprender cómo el usuario utiliza los servicios de la plataforma, para ayudar con el desarrollo comercial y técnico.\n• Anuncios: presentar anuncios personalizados al usuario en base a los datos proporcionados.\n• Comercial: los datos se utilizan para personalizar el contenido ofrecido y generar soporte a la plataforma para mejorar la calidad de los servicios.< __FFNL__>• Predicción del perfil del usuario: automatizada procesamiento de datos personales para evaluar el uso en la plataforma.\n• Datos de registro: para permitir el acceso de los usuarios a determinados contenidos de la plataforma, exclusivos para usuarios registrados.\n• Datos del contrato: proporcionan seguridad jurídica a las partes y facilitan la conclusión del negocio.\n4.2 El tratamiento de datos personales para finalidades no previstas en esta Política de Privacidad sólo se producirá previa comunicación al usuario, por lo que los derechos y obligaciones aquí establecidos siguen siendo aplicables.',
    },
    'urmknl8y': {
      'pt': '5 - POR QUANTO TEMPO OS DADOS PESSOAIS FICAM ARMAZENADOS?',
      'es': '5 - ¿CUÁNTO TIEMPO SE ALMACENAN LOS DATOS PERSONALES?',
    },
    'gz4f2mqx': {
      'pt':
          '5.1 Os dados pessoais do usuário e visitante são armazenados pela plataforma durante o período necessário para a prestação do serviço ou o cumprimento das finalidades previstas no presente documento, conforme o disposto no inciso I do artigo 15 da Lei 13.709/18.\n5.2 Os dados podem ser removidos ou anonimizados a pedido do usuário, excetuando os casos em que a lei oferecer outro tratamento.\n5.3 Ainda, os dados pessoais dos usuários apenas podem ser conservados após o término de seu tratamento nas seguintes hipóteses previstas no artigo 16 da referida lei:\nI - cumprimento de obrigação legal ou regulatória pelo controlador;\nII - estudo por órgão de pesquisa, garantida, sempre que possível, a anonimização dos dados pessoais;\nIII - transferência a terceiro, desde que respeitados os requisitos de tratamento de dados dispostos nesta Lei;\nIV - uso exclusivo do controlador, vedado seu acesso por terceiro, e desde que anonimizados os dados.',
      'es':
          '5.1 Los datos personales del usuario y visitante son almacenados por la plataforma durante el período necesario para prestar el servicio o cumplir con las finalidades previstas en este documento, de conformidad con lo dispuesto en el inciso I del artículo 15 de la Ley 13.709/18.\n 5.2 Los datos pueden eliminarse o anonimizarse a petición del usuario, excepto en los casos en que la ley ofrezca otro tratamiento.\n5.3 Además, los datos personales de los usuarios sólo pueden conservarse una vez finalizado su tratamiento en los siguientes casos previstos en la artículo 16 de la citada ley:\nI - cumplimiento de una obligación legal o reglamentaria por parte del responsable del tratamiento;\nII - estudio por un organismo de investigación, garantizando, siempre que sea posible, la anonimización de los datos personales;\nIII - transferencia a un tercero, siempre que se respeten las exigencias de tratamiento de datos previstas en esta Ley;\nIV - uso exclusivo del responsable, prohibido el acceso a terceros y siempre que los datos sean anonimizados.',
    },
    'rmliuyzh': {
      'pt': '6  SEGURANÇA DOS DADOS PESSOAIS ARMAZENADOS',
      'es': '6 SEGURIDAD DE LOS DATOS PERSONALES ALMACENADOS',
    },
    'pblkj2uv': {
      'pt':
          '6.1 A plataforma se compromete a aplicar as medidas técnicas e organizativas aptas a proteger os dados pessoais de acessos não autorizados e de situações de destruição, perda, alteração, comunicação ou difusão de tais dados.\n6.2 Os dados relativas a cartões de crédito são criptografados usando a tecnologia \"secure socket layer\" (SSL) que garante a transmissão de dados de forma segura e confidencial, de modo que a transmissão dos dados entre o servidor e o usuário ocorre de maneira cifrada e encriptada.\n6.3 A plataforma se exime de responsabilidade por culpa exclusiva de terceiro, como em caso de ataque de hackers ou crackers, ou culpa exclusiva do usuário, como no caso em que ele mesmo transfere seus dados a terceiros. O site se compromete a comunicar o usuário em caso de alguma violação de segurança dos seus dados pessoais.\n6.4 Os dados pessoais armazenados são tratados com confidencialidade, dentro dos limites legais. No entanto, podemos divulgar suas informações pessoais caso sejamos obrigados pela lei para fazê-lo ou se você violar nossos Termos de Serviço.',
      'es':
          '6.1 La plataforma se compromete a aplicar medidas técnicas y organizativas capaces de proteger los datos personales contra accesos no autorizados y situaciones de destrucción, pérdida, alteración, comunicación o difusión de dichos datos.\n6.2 Los datos relativos a tarjetas de crédito se cifran utilizando \"secure socketlayer\" \"(SSL), que garantiza la transmisión de datos segura y confidencial, de modo que la transmisión de datos entre el servidor y el usuario se produce de forma cifrada y encriptada.\n6.3 A La plataforma queda exenta de responsabilidad por culpa exclusiva de un tercero tercero, como en el caso de un ataque de hacker o cracker, o por culpa exclusiva del usuario, como en el caso en que él mismo transfiere sus datos a terceros. El sitio web se compromete a notificar al usuario en caso de cualquier violación de la seguridad de sus datos personales.\n6.4 Los datos personales almacenados se tratan de forma confidencial, dentro de los límites legales. Sin embargo, podemos divulgar su información personal si la ley nos exige hacerlo o si usted viola nuestros Términos de servicio.',
    },
    '7h2lio5q': {
      'pt': '7 COMPARTILHAMENTO DOS DADOS',
      'es': '7 COMPARTIR DATOS',
    },
    'lxh0dzej': {
      'pt':
          '7.1 O compartilhamento de dados do usuário ocorre apenas com os dados referentes a publicações realizadas pelo próprio usuário, tais ações são compartilhadas publicamente com os outros usuários.\n7.2 Os dados do perfil do usuário são compartilhados publicamente em sistemas de busca e dentro da plataforma, sendo permitido ao usuário modificar tal configuração para que seu perfil não apareça nos resultados de busca de tais ferramentas.',
      'es':
          '7.1 Los datos del usuario solo se comparten con los datos relacionados con las publicaciones realizadas por el usuario, dichas acciones se comparten públicamente con otros usuarios.\n7.2 Los datos del perfil del usuario se comparten públicamente en los sistemas de búsqueda y dentro de la plataforma, pudiendo el usuario modificarlos esta configuración para que su perfil no aparezca en los resultados de búsqueda de dichas herramientas.',
    },
    'phnegm9y': {
      'pt': '8 OS DADOS PESSOAIS ARMAZENADOS SERÃO TRANSFERIDOS A TERCEIROS?',
      'es': '8 ¿SE TRANSFERIRÁN LOS DATOS PERSONALES ALMACENADOS A TERCEROS?',
    },
    'ejgfkz2t': {
      'pt':
          '8.1 Ao utilizar os serviços e fornecer as informações pessoais na plataforma, o usuário está consentindo com a presente Política de Privacidade.\n8.2 O usuário, ao cadastrar-se, manifesta conhecer e pode exercitar seus direitos de cancelar seu cadastro, acessar e atualizar seus dados pessoais e garante a veracidade das informações por ele disponibilizadas.\n8.3 O usuário tem direito de retirar o seu consentimento a qualquer tempo, para tanto deve entrar em contato através do e-mail contato@qtmhealthtech.com.br',
      'es':
          '8.1 Al utilizar los servicios y proporcionar información personal en la plataforma, el usuario acepta esta Política de Privacidad.\n8.2 El usuario, al registrarse, reconoce que conoce y puede ejercer sus derechos de cancelación o su registro, acceder y actualizar sus datos personales y garantizar la veracidad de la información proporcionada.\n8.3 El usuario tiene derecho a retirar su consentimiento en cualquier momento, para ello deberá contactar con nosotros a través del correo electrónico contato@qtmhealthtech.com .br',
    },
    'u6ps6kd1': {
      'pt': '9 ALTERAÇÕES PARA ESSA POLÍTICA DE PRIVACIDADE',
      'es': '9 CAMBIOS A ESTA POLÍTICA DE PRIVACIDAD',
    },
    'gkg26dzt': {
      'pt':
          '9.1 Reservamos o direito de modificar essa Política de Privacidade a qualquer momento, então, é recomendável que o usuário e visitante revise-a com frequência a solicitação de possíveis alterações, a aceitando ou não.\n9.2 As alterações e esclarecimentos vão surtir efeito imediatamente após sua publicação na plataforma. Quando realizadas alterações os usuários serão notificados. Ao utilizar o serviço ou fornecer informações pessoais após eventuais modificações, o usuário e visitante demonstra sua concordância com as novas normas.\n9.3 Diante da fusão ou venda da plataforma à outra empresa os dados dos usuários podem ser transferidas para os novos proprietários para que a permanência dos serviços oferecidos.',
      'es':
          '9.1 Nos reservamos el derecho de modificar esta Política de Privacidad en cualquier momento, por lo que se recomienda que el usuario y visitante la revise frecuentemente para solicitar posibles cambios, ya sea aceptándolos o no.\n9.2 Los cambios y aclaraciones entrarán en vigor inmediatamente después de su publicación en la plataforma. Cuando se realicen cambios, se notificará a los usuarios. Al utilizar el servicio o proporcionar información personal después de cualquier modificación, el usuario y visitante demuestra su acuerdo con las nuevas reglas.\n9.3 En caso de fusión o venta de la plataforma a otra empresa, los datos del usuario pueden transferirse al nuevos propietarios para la permanencia de los servicios ofrecidos.',
    },
    'ya3efg54': {
      'pt': '10 JURISDIÇÃO PARA RESOLUÇÃO DE CONFLITOS',
      'es': '10 JURISDICCIÓN PARA LA RESOLUCIÓN DE CONTROVERSIAS',
    },
    'blnve2bq': {
      'pt':
          '10.1 Para a solução de controvérsias decorrentes do presente instrumento será aplicado integralmente o Direito brasileiro.\n10.2 Os eventuais litígios deverão ser apresentados no foro da comarca em que se encontra a sede da empresa.',
      'es':
          '10.1 Para la resolución de disputas que surjan de este instrumento, se aplicará plenamente la ley brasileña.\n10.2 Cualquier disputa deberá ser presentada en el tribunal del distrito donde se encuentra la sede de la empresa.',
    },
    'f5gr4d25': {
      'pt': 'Eu aceito as Politicas de privacidade',
      'es': 'Acepto las Políticas de Privacidad',
    },
    'b8eqmv5b': {
      'pt': 'Continuar',
      'es': 'Continuar',
    },
    'fvpa5ekf': {
      'pt': 'Home',
      'es': 'Hogar',
    },
  },
  // politic_general_use_page
  {
    'nukg3r3u': {
      'pt': 'Politica geral de uso \nresponsável',
      'es': 'Política general de \nuso responsable',
    },
    '39g9o7oe': {
      'pt':
          'A QTM Healthtech disponibiliza um espaço e recursos para quem deseja criar, divulgar ou comercializar um Produto, Serviço e Coworking de forma simples e prática. Para atingir esse objetivo, a adotamos alguns valores e princípios, que devem ser observados por todos seus Usuários: o respeito ao próximo, aos Usuários e às leis locais é um deles, assim como a proteção à liberdade de expressão e a neutralidade e isonomia das redes de Internet. Por isso, é reservado o direito de não aceitar ou remover Produtos que violem essas diretrizes, conforme esta Política de Uso Responsável da Plataforma, integrando os Termos e Usos. \nVocê deve ler esta Política de forma atenta e cuidadosa, pois ela tem informações importantes sobre os formatos e os conteúdos dos Produtos que podem ser cadastrados na Plataforma. A violação desta Política pode resultar na aplicação de medidas pela QTM Healthtech, inclusive a suspensão do acesso do Usuário à sua conta ou o bloqueio definitivo do Usuário na Plataforma, com o consequente encerramento da licença de uso previamente concedida, além de outras medidas, conforme detalhado nos Termos.\n Esta Política pode ser modificada, substituída ou removida a qualquer momento, sem aviso prévio. Se você não concordar com uma nova versão desta Política, você deve cessar o uso da sua conta na QTM Healhtech. Esta Política e suas respectivas atualizações prevalecem sobre quaisquer propostas, contratos, entendimentos anteriores e acordos, verbais ou escritos, que possam existir entre você e a QTM Healthtech.',
      'es':
          'QTM Healthtech proporciona un espacio y recursos para cualquier persona que quiera crear, promocionar o vender un Producto, Servicio y Coworking de una forma sencilla y práctica. Para lograr este objetivo, hemos adoptado algunos valores y principios, que deben ser observados por todos sus Usuarios: el respeto a los demás, a los Usuarios y a las leyes locales es uno de ellos, así como la protección de la libertad de expresión y la neutralidad y igualdad de las redes de Internet. Por lo tanto, se reserva el derecho de no aceptar o eliminar Productos que violen estos lineamientos, de acuerdo con esta Política de Uso Responsable de la Plataforma, integrando los Términos y Usos. \nDebes leer atenta y atentamente esta Política, ya que contiene información importante sobre los formatos y contenidos de los Productos que se pueden registrar en la Plataforma. La violación de esta Política podrá dar lugar a la aplicación de medidas por parte de QTM Healthtech, incluyendo la suspensión del acceso del Usuario a su cuenta o el bloqueo definitivo del Usuario en la Plataforma, con la consiguiente terminación de la licencia de uso previamente otorgada, además a otras medidas, según se detalla en los Términos.\n Esta Política puede modificarse, reemplazarse o eliminarse en cualquier momento sin previo aviso. Si no está de acuerdo con una nueva versión de esta Política, debe dejar de usar su cuenta QTM Healthtech. Esta Política y sus respectivas actualizaciones prevalecen sobre cualquier propuesta, contrato, entendimiento y acuerdo previo, oral o escrito, que pueda existir entre usted y QTM Healthtech.',
    },
    '99f74nl9': {
      'pt': 'VISÃO GERAL',
      'es': 'VISIÓN GENERAL',
    },
    '021krvlb': {
      'pt':
          'A. Esta Política tem por objetivo fixar diretrizes sobre o uso responsável da Plataforma, incluindo exemplos de formatos ou conteúdos que não podem ser cadastrados, divulgados ou comercializados mediante a Plataforma.\nB. Esta Política representa um conjunto de escolhas da QTM Healthtech destinadas a proporcionar uma plataforma especialmente planejada para que todos possam crescer juntos. Dedicamos muito tempo refletindo sobre os conteúdos que podem ser divulgados na Plataforma, avaliando tendências à medida que certos assuntos evoluem. Por isso, esta Política é um documento vivo, que pode ser atualizado a qualquer tempo.\nC. A lista de exemplos relacionados abaixo não é exaustiva. Ela serve para orientar nossos times de verificação no momento de avaliar a ocorrência de possíveis violações a esta Política, bem como para esclarecer à comunidade de Usuários alguns dos principais formatos ou conteúdos que não devem compor a Plataforma.\nD. A QTM Healthtech pode buscar o auxílio de colaboradores externos nos seus processos de tomada de decisão a respeito das ocorrências relativas a possíveis violações desta Política. A decisão final sobre a aceitação do cadastro, a remoção ou manutenção de um Produto na Plataforma, ou a adoção de qualquer outra medida, será sempre da QTM Healthtech, a quem compete avaliar as ocorrências mediante a aplicação dos Termos e desta Política.',
      'es':
          'A. Esta Política tiene como objetivo establecer pautas sobre el uso responsable de la Plataforma, incluidos ejemplos de formatos o contenidos que no pueden registrarse, divulgarse o venderse a través de la Plataforma.\nB. Esta Política representa un conjunto de opciones de QTM Healthtech diseñadas para proporcionar una plataforma especialmente diseñada para que todos crezcan juntos. Dedicamos mucho tiempo a reflexionar sobre el contenido que se puede publicar en la Plataforma, evaluando tendencias a medida que evolucionan ciertos temas. Por lo tanto, esta Política es un documento vivo, que puede actualizarse en cualquier momento.\nC. La lista de ejemplos que figuran a continuación no es exhaustiva. Sirve para guiar a nuestros equipos de verificación a la hora de evaluar la ocurrencia de posibles violaciones a esta Política, así como para aclarar a la comunidad de Usuarios algunos de los principales formatos o contenidos que no deben formar parte de la Plataforma.\nD. QTM Healthtech podrá buscar asistencia de colaboradores externos en sus procesos de toma de decisiones respecto de sucesos relacionados con posibles violaciones de esta Política. La decisión final sobre aceptar el registro, eliminar o mantener un Producto en la Plataforma, o adoptar cualquier otra medida, siempre será tomada por QTM Healthtech, quien es responsable de evaluar lo ocurrido mediante la aplicación de los Términos y esta Política.',
    },
    '2odvnx9l': {
      'pt': '1. PRODUTOS QUE VIOLEM A LEGISLAÇÃO APLICÁVEL',
      'es': '1. PRODUCTOS QUE VIOLA LA LEGISLACIÓN APLICABLE',
    },
    'rvji2kjn': {
      'pt':
          ' Você não pode usar a Plataforma para, divulgar ou comercializar qualquer Produto que viole ou possa violar a legislação aplicável em vigor. São exemplos desses Produtos e Serviços, sem prejuízo de outros:\n1.1. Produtos e Serviços cuja comercialização ou divulgação seja expressamente proibida por lei.\n1.2. Produtos e Serviços que violem a intimidade, a honra, a privacidade, a imagem, o nome ou qualquer outro direito da personalidade de terceiros.\n1.3. Produtos e Serviços que violem a proteção de dados pessoais ou direitos de terceiros sobre seus dados pessoais, como listas de endereços ou bancos de dados pessoais desprovidos de base legal válida.\n1.4. Produtos e Serviços que violem direitos de propriedade intelectual de terceiros. Assim, por exemplo, você não pode criar, divulgar ou comercializar na Plataforma qualquer Produto com conteúdo que viole direitos autorais de terceiros, como direitos sobre músicas, textos, imagens, vídeos ou software.Também não pode criar, divulgar ou comercializar na Plataforma Produtos que contenham programas acadêmicos ou programas desenvolvidos para alguma entidade educacional. Você não pode criar, divulgar ou comercializar na Plataforma qualquer Produto ou Serviço que viole marcas, patentes, modelos, desenhos industriais ou segredos industriais. Ainda, você não pode criar, divulgar ou comercializar na Plataforma qualquer Produto ou Serviço que contenha software para OEM, NFR, cópias ou arquivos de backup.\n1.5. Produtos e Serviços com conteúdo ministrado por quem não preenche as condições exigidas por lei para exercer a profissão ou a atividade econômica com que o Produto se relaciona.\n1.6. Produtos e Serviços que divulguem, sem comprovação, serem autorizados ou reconhecidos por órgãos designados por lei para tanto.',
      'es':
          'No podrá utilizar la Plataforma para publicitar o vender ningún Producto que infrinja o pueda infringir la legislación aplicable vigente. Ejemplos de estos Productos y Servicios, sin perjuicio de otros, son:\n1.1. Productos y Servicios cuya comercialización o difusión esté expresamente prohibida por la ley.\n1.2. Productos y Servicios que atenten contra la intimidad, el honor, la privacidad, la imagen, el nombre o cualquier otro derecho personal de terceros.\n1.3. Productos y Servicios que violen la protección de datos personales o derechos de terceros sobre sus datos personales, como listas de direcciones o bases de datos personales que carezcan de base jurídica válida.\n1.4. Productos y Servicios que violen los derechos de propiedad intelectual de terceros. Así, por ejemplo, no puedes crear, publicar o vender en la Plataforma ningún Producto con contenido que viole derechos de autor de terceros, como derechos de música, textos, imágenes, vídeos o software. Tampoco puedes crear, publicar o vender Productos en la Plataforma que contengan programas académicos o programas desarrollados para una entidad educativa. No podrá crear, divulgar o vender en la Plataforma ningún Producto o Servicio que viole marcas, patentes, modelos, diseños industriales o secretos industriales. Además, no podrá crear, divulgar ni vender en la Plataforma ningún Producto o Servicio que contenga software para OEM, NFR, copias o archivos de respaldo.\n1.5. Productos y Servicios con contenido proporcionado por quienes no cumplen con las condiciones exigidas por la ley para ejercer la profesión o actividad económica a la que se refiere el Producto.\n1.6. Productos y Servicios que revelen, sin prueba, que están autorizados o reconocidos por organismos designados por la ley para tal fin.',
    },
    'pknrxrvw': {
      'pt':
          '2. PRODUTOS QUE INCENTIVEM A PRÁTICA DE VIOLÊNCIA, DE DISCRIMINAÇÃO, DE CRIMES OU DE ATIVIDADES PROIBIDAS',
      'es':
          '2. PRODUCTOS QUE FOMENTEN LA PRÁCTICA DE VIOLENCIA, DISCRIMINACIÓN, DELITOS O ACTIVIDADES PROHIBIDAS',
    },
    '539zxzke': {
      'pt':
          'Você não pode usar a Plataforma para divulgar ou comercializar qualquer Produto ou Serviço que, direta ou indiretamente, implique ou possa implicar, incite ou possa incitar a prática de violência, de discriminação, de atividades proibidas ou de crimes. São exemplos desses Produtos, sem prejuízo de outros:\n2.1. Produtos ou Serviços cujo conteúdo promova a violência, a ameaça, a intolerância ou a intimidação contra uma pessoa ou um grupo de pessoas.\n2.2. Produtos ou Serviços cujo conteúdo apresente ataque direto a uma pessoa ou grupo de pessoas com base em características como raça, gênero, orientação sexual, identidade de gênero, religião, naturalidade, condição mental, condição médica ou condição física.\n2.3. Produtos ou Serviços cujo conteúdo promova discurso com a intenção de desumanizar, degradar, intimidar ou reforçar estereótipos negativos ou prejudiciais com base em características como raça, gênero, orientação sexual, identidade de gênero, religião, naturalidade, condição mental, condição médica ou condição física. Você também não pode criar, divulgar ou comercializar na Plataforma qualquer Produto cujo conteúdo direcione a alguém declarações ou tratamentos com essas mesmas intenções.\n2.4. Produtos ou Serviços cujo conteúdo, no todo ou em parte, seja capaz de configurar a prática de crime ou contravenção.\n2.5. Produtos ou Serviços cujas características indiquem ou se relacionem a potencial prática de fraude, de lavagem de dinheiro, de financiamento do terrorismo ou de atividades ilegais.\n2.6. Produtos ou Serviços que façam alusão ou promovam o uso de armas de fogo, narcóticos, tóxicos ou qualquer tipo de drogas ilegais, bem como de qualquer substância ilícita ou cujo consumo dependa por lei de prescrição médica ou autorização de qualquer órgão competente.\n2.7. Produtos ou Serviços que prometam sucesso em loterias ou jogos de azar, bem como em qualquer atividade ou prática que dependa de fatores relacionados preponderantemente à sorte para seu sucesso.\n2.8. Produtos ou Serviços que promovam o assédio sexual, a pedofilia, a prostituição ou qualquer outro tipo de exploração sexual, como a prática ou incitação à pornografia de vingança.',
      'es':
          'No podrá utilizar la Plataforma para publicitar o vender ningún Producto o Servicio que, directa o indirectamente, implique o pueda implicar, incite o pueda incitar a la práctica de violencia, discriminación, actividades prohibidas o delitos. Ejemplos de estos Productos, sin perjuicio de otros, son:\n2.1. Productos o Servicios cuyo contenido promueva la violencia, amenazas, intolerancia o intimidación contra una persona o grupo de personas.\n2.2. Productos o Servicios cuyo contenido presente un ataque directo a una persona o grupo de personas en función de características como raza, género, orientación sexual, identidad de género, religión, nacionalidad, condición mental, condición médica o condición física.\n2.3. Productos o Servicios cuyo contenido promueva discursos destinados a deshumanizar, degradar, intimidar o reforzar estereotipos negativos o dañinos basados ​​en características como raza, género, orientación sexual, identidad de género, religión, origen nacional, condición mental, condición médica o condición física. . Tampoco podrá crear, revelar o vender en la Plataforma ningún Producto cuyo contenido dirija declaraciones o tratamientos a cualquier persona con estas mismas intenciones.\n2.4. Productos o Servicios cuyo contenido, total o parcialmente, sea capaz de constituir la comisión de un delito o falta.\n2.5. Productos o Servicios cuyas características indiquen o se relacionen con la práctica potencial de fraude, lavado de dinero, financiamiento del terrorismo o actividades ilegales.\n2.6. Productos o Servicios que aludan o promuevan el uso de armas de fuego, narcóticos, estupefacientes o cualquier tipo de drogas ilegales, así como cualquier sustancia ilícita o cuyo consumo dependa por ley de prescripción médica o autorización de cualquier organismo competente.\n 2.7. Productos o Servicios que prometan éxito en loterías o juegos de azar, así como en cualquier actividad o práctica que dependa de factores relacionados predominantemente con la suerte para su éxito.\n2.8. Productos o Servicios que promuevan el acoso sexual, la pedofilia, la prostitución o cualquier otro tipo de explotación sexual, como la práctica o incitación a la pornografía de venganza.',
    },
    'ag19ey5u': {
      'pt': '3. PRODUTOS RELACIONADOS A ATIVIDADES FRAUDULENTAS OU ANTIÉTICAS',
      'es':
          '3. PRODUCTOS RELACIONADOS CON ACTIVIDADES FRAUDULENTAS O POCO ÉTICAS',
    },
    'ann9r02e': {
      'pt':
          'Você não pode usar a Plataforma para divulgar ou comercializar qualquer Produto ou Serviço cujo conteúdo envolva atividades fraudulentas ou antiéticas. São exemplos desses Produtos, sem prejuízo de outros:\n3.1. Produtos ou Serviços que induzam, ensinem ou de qualquer forma incentivem outros Usuários a violar os Termos ou as Políticas da QTM Healhtech.\n3.2. Produtos ou Serviços  cujo conteúdo incite, indique ou de qualquer maneira promova qualquer comportamento ilegal.\n3.3. Produtos ou Serviços que deixem de prestar informações necessárias e adequadas a seu respeito.\n3.4. Produtos ou Serviços cujo conteúdo seja intencionalmente enganoso, capaz de gerar danos a seus Usuários ou a terceiros.\n3.5. Produtos ou Serviços cujo conteúdo apresente informações sabidamente falsas como se fossem verdadeiras. Por exemplo, você não pode divulgar ou comercializar na Plataforma qualquer Produto cujo conteúdo divulgue notícias, inclusive artigos de mídia, relatando fatos como se fossem verdadeiros, ou sugerindo que podem ser verdadeiros, se houver evidências inequívocas de que são falsos. A QTM Healhtech pode remover da Plataforma qualquer Produto ou Serviço que ela verificar com conteúdo dessa natureza, qualquer que tenha sido a finalidade do emprego do conteúdo falso. A QTM Healthtech aplicará as medidas cabíveis com especial rigor se verificar que o uso de informações falsas tem por objetivo interferir ou influenciar indevidamente em uma eleição.\n3.6. Produtos que promovam esquemas de pirâmide ou similares, cujo funcionamento dependa prioritariamente do aporte de recursos financeiros por novos participantes para remunerar participantes anteriores.',
      'es':
          'No puede utilizar la Plataforma para anunciar o comercializar ningún Producto o Servicio cuyo contenido implique actividades fraudulentas o poco éticas. Ejemplos de estos Productos, sin perjuicio de otros, son:\n3.1. Productos o Servicios que induzcan, enseñen o de cualquier manera alienten a otros Usuarios a violar los Términos o Políticas de QTM Healhtech.\n3.2. Productos o Servicios cuyo contenido incite, indique o de cualquier forma promueva cualquier comportamiento ilegal.\n3.3. Productos o Servicios que no proporcionan información necesaria y adecuada sobre usted.\n3.4. Productos o Servicios cuyo contenido sea intencionadamente engañoso, capaz de causar daño a sus Usuarios o a terceros.\n3.5. Productos o Servicios cuyo contenido presente información deliberadamente falsa como si fuera cierta. Por ejemplo, no podrá anunciar ni vender en la Plataforma ningún Producto cuyo contenido difunda noticias, incluidos artículos de medios, informe de hechos como si fueran ciertos o sugiera que pueden ser ciertos, si existe evidencia inequívoca de que son falsos. QTM Healhtech podrá eliminar de la Plataforma cualquier Producto o Servicio que encuentre con contenido de esta naturaleza, cualquiera que sea la finalidad del uso del contenido falso. QTM Healthtech aplicará las medidas adecuadas con especial rigor si determina que el uso de información falsa tiene como objetivo interferir o influir indebidamente en una elección.\n3.6. Productos que promuevan esquemas piramidales o similares, cuyo funcionamiento depende principalmente del aporte de recursos financieros por parte de nuevos participantes para remunerar a los participantes anteriores.',
    },
    'p0whulr5': {
      'pt': 'Eu aceito as Politicas gerais de uso Responsável',
      'es': 'Acepto las Políticas generales de Uso Responsable',
    },
    'aa7a7lnn': {
      'pt': 'Continuar',
      'es': 'Continuar',
    },
    'nx8ob5rz': {
      'pt': 'Home',
      'es': 'Hogar',
    },
  },
  // coworking_theraphist_page
  {
    'uyktghwt': {
      'pt': 'Acupuntura',
      'es': 'Acupuntura',
    },
    '8rcua6mb': {
      'pt': 'Atendimento com o Walkyr Marinho',
      'es': 'Servicio con Walkyr Marinho',
    },
    '90pqqh9h': {
      'pt': '16 até 17pm',
      'es': '4pm a 5pm',
    },
    'rhdmu9xc': {
      'pt': 'Criar Coworking',
      'es': 'Crear coworking',
    },
    'k5192x25': {
      'pt': 'Home',
      'es': 'Hogar',
    },
  },
  // statusCancel
  {
    '7vooqd4r': {
      'pt': 'Processando reembolso...',
      'es': 'Procesando reembolso...',
    },
    'blp427ok': {
      'pt': 'Home',
      'es': 'Hogar',
    },
  },
  // choose_coworkings
  {
    'fbt8bd00': {
      'pt': 'Local de atendimento',
      'es': 'Ubicación del servicio',
    },
    'z36qmbpg': {
      'pt': 'Veja mais',
      'es': 'vea mas',
    },
    'fx1n3urm': {
      'pt': 'Home',
      'es': 'Hogar',
    },
  },
  // notification_patient_page
  {
    'kdldddmm': {
      'pt': 'Notificações',
      'es': 'Notificaciones',
    },
    'qf5k9tye': {
      'pt': 'QTM Healthtech',
      'es': 'QTM Tecnología de la salud',
    },
    'yxcsre43': {
      'pt': 'Perfil',
      'es': 'Perfil',
    },
    '2s5emrfk': {
      'pt': 'Minha Conta',
      'es': 'Mi cuenta',
    },
    'ogda4npf': {
      'pt': 'Convidar Amigos',
      'es': 'Invitar a amigos',
    },
    '6r4w2rxk': {
      'pt': 'Meu perfil',
      'es': 'Mi perfil',
    },
    '20a8hicp': {
      'pt': 'Idioma',
      'es': 'Idioma',
    },
    'ph9ldqdo': {
      'pt': 'Pagina QTM',
      'es': 'Página QTM',
    },
    's57m7r59': {
      'pt': 'Politicas',
      'es': 'Políticas',
    },
    'kpnb5ums': {
      'pt': 'Termos e Condições',
      'es': 'Términos y Condiciones',
    },
    '6foym5be': {
      'pt': 'Sair',
      'es': 'Salir',
    },
    'twq8sgbc': {
      'pt': 'Home',
      'es': 'Hogar',
    },
  },
  // errorApi
  {
    '009b3knr': {
      'pt': 'Home',
      'es': 'Hogar',
    },
  },
  // history_requests_patients_page
  {
    'bbq997ht': {
      'pt': 'Histórico',
      'es': 'Histórico',
    },
    'dps1nnmz': {
      'pt': 'Todos',
      'es': 'Todo',
    },
    'zg0gcjo4': {
      'pt': 'Cancelados',
      'es': 'Cancelado',
    },
    'ewlzxdz8': {
      'pt': 'Concluídos',
      'es': 'Terminado',
    },
    '9v8ezel6': {
      'pt': 'Status',
      'es': 'Estado',
    },
    '2njm92nk': {
      'pt': 'Ver mais',
      'es': 'Ver más',
    },
    'u45hfui9': {
      'pt': 'QTM Healthtech',
      'es': 'QTM Tecnología de la salud',
    },
    'pa7szoos': {
      'pt': 'Perfil',
      'es': 'Perfil',
    },
    'oterjj38': {
      'pt': 'Minha Conta',
      'es': 'Mi cuenta',
    },
    'qzadpdbx': {
      'pt': 'Convidar Amigos',
      'es': 'Invitar a amigos',
    },
    '6nswtuas': {
      'pt': 'Meu perfil',
      'es': 'Mi perfil',
    },
    'fxbye0p7': {
      'pt': 'Idioma',
      'es': 'Idioma',
    },
    '55rl33yd': {
      'pt': 'Pagina QTM',
      'es': 'Página QTM',
    },
    '634possd': {
      'pt': 'Politicas',
      'es': 'Políticas',
    },
    'gvb6qknr': {
      'pt': 'Termos e Condições',
      'es': 'Términos y Condiciones',
    },
    'bev39ks1': {
      'pt': 'Sair',
      'es': 'Salir',
    },
    'et2t2ox7': {
      'pt': 'Home',
      'es': 'Hogar',
    },
  },
  // invoincing_theraphist_page
  {
    'a5z5yxox': {
      'pt': 'Total de atendimentos realizados',
      'es': 'Número total de servicios realizados',
    },
    'kqlguwo7': {
      'pt': 'A concluir',
      'es': 'Para finalizar',
    },
    '834tscl5': {
      'pt': 'Finalizados',
      'es': 'Finalizado',
    },
    'd1eunopn': {
      'pt': 'Active Users',
      'es': 'Usuarios activos',
    },
    '05nclt2f': {
      'pt': 'A small summary of your users base',
      'es': 'Un pequeño resumen de su base de usuarios',
    },
    'wk30uegp': {
      'pt': 'Total User Count',
      'es': 'Recuento total de usuarios',
    },
    '8trjqbrg': {
      'pt': 'An overview of all your users on your platform.',
      'es': 'Una descripción general de todos sus usuarios en su plataforma.',
    },
    'f57l0dea': {
      'pt': '56.4k',
      'es': '56,4k',
    },
    '6ha3hf77': {
      'pt': 'Total de Ganho ',
      'es': 'Ganancia total',
    },
    'gsymgc1m': {
      'pt': 'Active Users',
      'es': 'Usuarios activos',
    },
    '3x0zb3gv': {
      'pt': 'A small summary of your users base',
      'es': 'Un pequeño resumen de su base de usuarios',
    },
    'apatbwip': {
      'pt': 'Total User Count',
      'es': 'Recuento total de usuarios',
    },
    'dulpb4is': {
      'pt': 'An overview of all your users on your platform.',
      'es': 'Una descripción general de todos sus usuarios en su plataforma.',
    },
    'wdpp4m7m': {
      'pt': '56.4k',
      'es': '56,4k',
    },
    '212tu3t0': {
      'pt': 'Ultimas práticas realizadas',
      'es': 'Últimas prácticas realizadas',
    },
    'zdykdxop': {
      'pt': 'Faturamento',
      'es': 'Facturación',
    },
    '1r7uzcm6': {
      'pt': 'Home',
      'es': 'Hogar',
    },
  },
  // interest_page
  {
    '8qhuceeo': {
      'pt': 'Home',
      'es': 'Hogar',
    },
  },
  // history_requests_theraphist_page
  {
    'lx8rkfh5': {
      'pt': 'Histórico',
      'es': 'Histórico',
    },
    '0i1doz6c': {
      'pt': 'Todos',
      'es': 'Todo',
    },
    'tmfynl8s': {
      'pt': 'Cancelados',
      'es': 'Cancelado',
    },
    'necm7cf8': {
      'pt': 'Concluídos',
      'es': 'Terminado',
    },
    '061v7qlh': {
      'pt': 'Segunda, 24 de Out.',
      'es': 'Lunes 24 de octubre.',
    },
    'tya6xo92': {
      'pt': 'Status',
      'es': 'Estado',
    },
    '8xfxosob': {
      'pt': 'Ver mais',
      'es': 'Ver más',
    },
    'fqhptszg': {
      'pt': 'QTM Healthtech',
      'es': 'QTM Tecnología de la salud',
    },
    'd07z5957': {
      'pt': 'Perfil',
      'es': 'Perfil',
    },
    'vun37n0a': {
      'pt': 'Minha Conta',
      'es': 'Mi cuenta',
    },
    '1xp7k9g6': {
      'pt': 'Convidar Amigos',
      'es': 'Invitar a amigos',
    },
    '1xltzcjg': {
      'pt': 'Meu perfil',
      'es': 'Mi perfil',
    },
    'k0w1njw3': {
      'pt': 'Idioma',
      'es': 'Idioma',
    },
    '1gsyzbny': {
      'pt': 'Pagina QTM',
      'es': 'Página QTM',
    },
    '7tgk92dt': {
      'pt': 'Politicas',
      'es': 'Políticas',
    },
    'ddier68c': {
      'pt': 'Termos e Condições',
      'es': 'Términos y Condiciones',
    },
    'dldl0mi1': {
      'pt': 'Sair',
      'es': 'Salir',
    },
    'c0jxvrsd': {
      'pt': 'Home',
      'es': 'Hogar',
    },
  },
  // politics_drawer_page
  {
    'y4xjn7t3': {
      'pt':
          'A QTM Healthtech disponibiliza um espaço e recursos para quem deseja criar, divulgar ou comercializar um Produto, Serviço e Coworking de forma simples e prática. Para atingir esse objetivo, a adotamos alguns valores e princípios, que devem ser observados por todos seus Usuários: o respeito ao próximo, aos Usuários e às leis locais é um deles, assim como a proteção à liberdade de expressão e a neutralidade e isonomia das redes de Internet. Por isso, é reservado o direito de não aceitar ou remover Produtos que violem essas diretrizes, conforme esta Política de Uso Responsável da Plataforma, integrando os Termos e Usos. \nVocê deve ler esta Política de forma atenta e cuidadosa, pois ela tem informações importantes sobre os formatos e os conteúdos dos Produtos que podem ser cadastrados na Plataforma. A violação desta Política pode resultar na aplicação de medidas pela QTM Healthtech, inclusive a suspensão do acesso do Usuário à sua conta ou o bloqueio definitivo do Usuário na Plataforma, com o consequente encerramento da licença de uso previamente concedida, além de outras medidas, conforme detalhado nos Termos.\n Esta Política pode ser modificada, substituída ou removida a qualquer momento, sem aviso prévio. Se você não concordar com uma nova versão desta Política, você deve cessar o uso da sua conta na QTM Healhtech. Esta Política e suas respectivas atualizações prevalecem sobre quaisquer propostas, contratos, entendimentos anteriores e acordos, verbais ou escritos, que possam existir entre você e a QTM Healthtech.',
      'es':
          'QTM Healthtech proporciona un espacio y recursos para cualquier persona que quiera crear, promocionar o vender un Producto, Servicio y Coworking de una forma sencilla y práctica. Para lograr este objetivo, hemos adoptado algunos valores y principios, que deben ser observados por todos sus Usuarios: el respeto a los demás, a los Usuarios y a las leyes locales es uno de ellos, así como la protección de la libertad de expresión y la neutralidad y igualdad de las redes de Internet. Por lo tanto, se reserva el derecho de no aceptar o eliminar Productos que violen estos lineamientos, de acuerdo con esta Política de Uso Responsable de la Plataforma, integrando los Términos y Usos. \nDebes leer atenta y atentamente esta Política, ya que contiene información importante sobre los formatos y contenidos de los Productos que se pueden registrar en la Plataforma. La violación de esta Política podrá dar lugar a la aplicación de medidas por parte de QTM Healthtech, incluyendo la suspensión del acceso del Usuario a su cuenta o el bloqueo definitivo del Usuario en la Plataforma, con la consiguiente terminación de la licencia de uso previamente otorgada, además a otras medidas, según se detalla en los Términos.\n Esta Política puede modificarse, reemplazarse o eliminarse en cualquier momento sin previo aviso. Si no está de acuerdo con una nueva versión de esta Política, debe dejar de usar su cuenta QTM Healthtech. Esta Política y sus respectivas actualizaciones prevalecen sobre cualquier propuesta, contrato, entendimiento y acuerdo previo, oral o escrito, que pueda existir entre usted y QTM Healthtech.',
    },
    'wlcy2fpy': {
      'pt': 'VISÃO GERAL',
      'es': 'VISIÓN GENERAL',
    },
    'u1bw8zep': {
      'pt':
          'A. Esta Política tem por objetivo fixar diretrizes sobre o uso responsável da Plataforma, incluindo exemplos de formatos ou conteúdos que não podem ser cadastrados, divulgados ou comercializados mediante a Plataforma.\nB. Esta Política representa um conjunto de escolhas da QTM Healthtech destinadas a proporcionar uma plataforma especialmente planejada para que todos possam crescer juntos. Dedicamos muito tempo refletindo sobre os conteúdos que podem ser divulgados na Plataforma, avaliando tendências à medida que certos assuntos evoluem. Por isso, esta Política é um documento vivo, que pode ser atualizado a qualquer tempo.\nC. A lista de exemplos relacionados abaixo não é exaustiva. Ela serve para orientar nossos times de verificação no momento de avaliar a ocorrência de possíveis violações a esta Política, bem como para esclarecer à comunidade de Usuários alguns dos principais formatos ou conteúdos que não devem compor a Plataforma.\nD. A QTM Healthtech pode buscar o auxílio de colaboradores externos nos seus processos de tomada de decisão a respeito das ocorrências relativas a possíveis violações desta Política. A decisão final sobre a aceitação do cadastro, a remoção ou manutenção de um Produto na Plataforma, ou a adoção de qualquer outra medida, será sempre da QTM Healthtech, a quem compete avaliar as ocorrências mediante a aplicação dos Termos e desta Política.',
      'es':
          'A. Esta Política tiene como objetivo establecer pautas sobre el uso responsable de la Plataforma, incluidos ejemplos de formatos o contenidos que no pueden registrarse, divulgarse o venderse a través de la Plataforma.\nB. Esta Política representa un conjunto de opciones de QTM Healthtech diseñadas para proporcionar una plataforma especialmente diseñada para que todos crezcan juntos. Dedicamos mucho tiempo a reflexionar sobre el contenido que se puede publicar en la Plataforma, evaluando tendencias a medida que evolucionan ciertos temas. Por lo tanto, esta Política es un documento vivo, que puede actualizarse en cualquier momento.\nC. La lista de ejemplos que figuran a continuación no es exhaustiva. Sirve para guiar a nuestros equipos de verificación a la hora de evaluar la ocurrencia de posibles violaciones a esta Política, así como para aclarar a la comunidad de Usuarios algunos de los principales formatos o contenidos que no deben formar parte de la Plataforma.\nD. QTM Healthtech podrá buscar asistencia de colaboradores externos en sus procesos de toma de decisiones respecto de sucesos relacionados con posibles violaciones de esta Política. La decisión final sobre aceptar el registro, eliminar o mantener un Producto en la Plataforma, o adoptar cualquier otra medida, siempre será tomada por QTM Healthtech, quien es responsable de evaluar lo ocurrido mediante la aplicación de los Términos y esta Política.',
    },
    'uwpog8ex': {
      'pt': '1. PRODUTOS QUE VIOLEM A LEGISLAÇÃO APLICÁVEL',
      'es': '1. PRODUCTOS QUE VIOLA LA LEGISLACIÓN APLICABLE',
    },
    'zty706zw': {
      'pt':
          ' Você não pode usar a Plataforma para, divulgar ou comercializar qualquer Produto que viole ou possa violar a legislação aplicável em vigor. São exemplos desses Produtos e Serviços, sem prejuízo de outros:\n1.1. Produtos e Serviços cuja comercialização ou divulgação seja expressamente proibida por lei.\n1.2. Produtos e Serviços que violem a intimidade, a honra, a privacidade, a imagem, o nome ou qualquer outro direito da personalidade de terceiros.\n1.3. Produtos e Serviços que violem a proteção de dados pessoais ou direitos de terceiros sobre seus dados pessoais, como listas de endereços ou bancos de dados pessoais desprovidos de base legal válida.\n1.4. Produtos e Serviços que violem direitos de propriedade intelectual de terceiros. Assim, por exemplo, você não pode criar, divulgar ou comercializar na Plataforma qualquer Produto com conteúdo que viole direitos autorais de terceiros, como direitos sobre músicas, textos, imagens, vídeos ou software.Também não pode criar, divulgar ou comercializar na Plataforma Produtos que contenham programas acadêmicos ou programas desenvolvidos para alguma entidade educacional. Você não pode criar, divulgar ou comercializar na Plataforma qualquer Produto ou Serviço que viole marcas, patentes, modelos, desenhos industriais ou segredos industriais. Ainda, você não pode criar, divulgar ou comercializar na Plataforma qualquer Produto ou Serviço que contenha software para OEM, NFR, cópias ou arquivos de backup.\n1.5. Produtos e Serviços com conteúdo ministrado por quem não preenche as condições exigidas por lei para exercer a profissão ou a atividade econômica com que o Produto se relaciona.\n1.6. Produtos e Serviços que divulguem, sem comprovação, serem autorizados ou reconhecidos por órgãos designados por lei para tanto.',
      'es':
          'No podrá utilizar la Plataforma para publicitar o vender ningún Producto que infrinja o pueda infringir la legislación aplicable vigente. Ejemplos de estos Productos y Servicios, sin perjuicio de otros, son:\n1.1. Productos y Servicios cuya comercialización o difusión esté expresamente prohibida por la ley.\n1.2. Productos y Servicios que atenten contra la intimidad, el honor, la privacidad, la imagen, el nombre o cualquier otro derecho personal de terceros.\n1.3. Productos y Servicios que violen la protección de datos personales o derechos de terceros sobre sus datos personales, como listas de direcciones o bases de datos personales que carezcan de base jurídica válida.\n1.4. Productos y Servicios que violen los derechos de propiedad intelectual de terceros. Así, por ejemplo, no puedes crear, publicar o vender en la Plataforma ningún Producto con contenido que viole derechos de autor de terceros, como derechos de música, textos, imágenes, vídeos o software. Tampoco puedes crear, publicar o vender Productos en la Plataforma que contengan programas académicos o programas desarrollados para una entidad educativa. No podrá crear, divulgar o vender en la Plataforma ningún Producto o Servicio que viole marcas, patentes, modelos, diseños industriales o secretos industriales. Además, no podrá crear, divulgar ni vender en la Plataforma ningún Producto o Servicio que contenga software para OEM, NFR, copias o archivos de respaldo.\n1.5. Productos y Servicios con contenido proporcionado por quienes no cumplen con las condiciones exigidas por la ley para ejercer la profesión o actividad económica a la que se refiere el Producto.\n1.6. Productos y Servicios que revelen, sin prueba, que están autorizados o reconocidos por organismos designados por la ley para tal fin.',
    },
    'eh7pg4l9': {
      'pt':
          '2. PRODUTOS QUE INCENTIVEM A PRÁTICA DE VIOLÊNCIA, DE DISCRIMINAÇÃO, DE CRIMES OU DE ATIVIDADES PROIBIDAS',
      'es':
          '2. PRODUCTOS QUE FOMENTEN LA PRÁCTICA DE VIOLENCIA, DISCRIMINACIÓN, DELITOS O ACTIVIDADES PROHIBIDAS',
    },
    'dg3fjeza': {
      'pt':
          'Você não pode usar a Plataforma para divulgar ou comercializar qualquer Produto ou Serviço que, direta ou indiretamente, implique ou possa implicar, incite ou possa incitar a prática de violência, de discriminação, de atividades proibidas ou de crimes. São exemplos desses Produtos, sem prejuízo de outros:\n2.1. Produtos ou Serviços cujo conteúdo promova a violência, a ameaça, a intolerância ou a intimidação contra uma pessoa ou um grupo de pessoas.\n2.2. Produtos ou Serviços cujo conteúdo apresente ataque direto a uma pessoa ou grupo de pessoas com base em características como raça, gênero, orientação sexual, identidade de gênero, religião, naturalidade, condição mental, condição médica ou condição física.\n2.3. Produtos ou Serviços cujo conteúdo promova discurso com a intenção de desumanizar, degradar, intimidar ou reforçar estereótipos negativos ou prejudiciais com base em características como raça, gênero, orientação sexual, identidade de gênero, religião, naturalidade, condição mental, condição médica ou condição física. Você também não pode criar, divulgar ou comercializar na Plataforma qualquer Produto cujo conteúdo direcione a alguém declarações ou tratamentos com essas mesmas intenções.\n2.4. Produtos ou Serviços cujo conteúdo, no todo ou em parte, seja capaz de configurar a prática de crime ou contravenção.\n2.5. Produtos ou Serviços cujas características indiquem ou se relacionem a potencial prática de fraude, de lavagem de dinheiro, de financiamento do terrorismo ou de atividades ilegais.\n2.6. Produtos ou Serviços que façam alusão ou promovam o uso de armas de fogo, narcóticos, tóxicos ou qualquer tipo de drogas ilegais, bem como de qualquer substância ilícita ou cujo consumo dependa por lei de prescrição médica ou autorização de qualquer órgão competente.\n2.7. Produtos ou Serviços que prometam sucesso em loterias ou jogos de azar, bem como em qualquer atividade ou prática que dependa de fatores relacionados preponderantemente à sorte para seu sucesso.\n2.8. Produtos ou Serviços que promovam o assédio sexual, a pedofilia, a prostituição ou qualquer outro tipo de exploração sexual, como a prática ou incitação à pornografia de vingança.',
      'es':
          'No podrá utilizar la Plataforma para publicitar o vender ningún Producto o Servicio que, directa o indirectamente, implique o pueda implicar, incite o pueda incitar a la práctica de violencia, discriminación, actividades prohibidas o delitos. Ejemplos de estos Productos, sin perjuicio de otros, son:\n2.1. Productos o Servicios cuyo contenido promueva la violencia, amenazas, intolerancia o intimidación contra una persona o grupo de personas.\n2.2. Productos o Servicios cuyo contenido presente un ataque directo a una persona o grupo de personas en función de características como raza, género, orientación sexual, identidad de género, religión, nacionalidad, condición mental, condición médica o condición física.\n2.3. Productos o Servicios cuyo contenido promueva discursos destinados a deshumanizar, degradar, intimidar o reforzar estereotipos negativos o dañinos basados ​​en características como raza, género, orientación sexual, identidad de género, religión, origen nacional, condición mental, condición médica o condición física. . Tampoco podrá crear, revelar o vender en la Plataforma ningún Producto cuyo contenido dirija declaraciones o tratamientos a cualquier persona con estas mismas intenciones.\n2.4. Productos o Servicios cuyo contenido, total o parcialmente, sea capaz de constituir la comisión de un delito o falta.\n2.5. Productos o Servicios cuyas características indiquen o se relacionen con la práctica potencial de fraude, lavado de dinero, financiamiento del terrorismo o actividades ilegales.\n2.6. Productos o Servicios que aludan o promuevan el uso de armas de fuego, narcóticos, estupefacientes o cualquier tipo de drogas ilegales, así como cualquier sustancia ilícita o cuyo consumo dependa por ley de prescripción médica o autorización de cualquier organismo competente.\n 2.7. Productos o Servicios que prometan éxito en loterías o juegos de azar, así como en cualquier actividad o práctica que dependa de factores relacionados predominantemente con la suerte para su éxito.\n2.8. Productos o Servicios que promuevan el acoso sexual, la pedofilia, la prostitución o cualquier otro tipo de explotación sexual, como la práctica o incitación a la pornografía de venganza.',
    },
    'xgki6x6e': {
      'pt': '3. PRODUTOS RELACIONADOS A ATIVIDADES FRAUDULENTAS OU ANTIÉTICAS',
      'es':
          '3. PRODUCTOS RELACIONADOS CON ACTIVIDADES FRAUDULENTAS O POCO ÉTICAS',
    },
    'm44rc4ml': {
      'pt':
          'Você não pode usar a Plataforma para divulgar ou comercializar qualquer Produto ou Serviço cujo conteúdo envolva atividades fraudulentas ou antiéticas. São exemplos desses Produtos, sem prejuízo de outros:\n3.1. Produtos ou Serviços que induzam, ensinem ou de qualquer forma incentivem outros Usuários a violar os Termos ou as Políticas da QTM Healhtech.\n3.2. Produtos ou Serviços  cujo conteúdo incite, indique ou de qualquer maneira promova qualquer comportamento ilegal.\n3.3. Produtos ou Serviços que deixem de prestar informações necessárias e adequadas a seu respeito.\n3.4. Produtos ou Serviços cujo conteúdo seja intencionalmente enganoso, capaz de gerar danos a seus Usuários ou a terceiros.\n3.5. Produtos ou Serviços cujo conteúdo apresente informações sabidamente falsas como se fossem verdadeiras. Por exemplo, você não pode divulgar ou comercializar na Plataforma qualquer Produto cujo conteúdo divulgue notícias, inclusive artigos de mídia, relatando fatos como se fossem verdadeiros, ou sugerindo que podem ser verdadeiros, se houver evidências inequívocas de que são falsos. A QTM Healhtech pode remover da Plataforma qualquer Produto ou Serviço que ela verificar com conteúdo dessa natureza, qualquer que tenha sido a finalidade do emprego do conteúdo falso. A QTM Healthtech aplicará as medidas cabíveis com especial rigor se verificar que o uso de informações falsas tem por objetivo interferir ou influenciar indevidamente em uma eleição.\n3.6. Produtos que promovam esquemas de pirâmide ou similares, cujo funcionamento dependa prioritariamente do aporte de recursos financeiros por novos participantes para remunerar participantes anteriores.',
      'es':
          'No puede utilizar la Plataforma para anunciar o comercializar ningún Producto o Servicio cuyo contenido implique actividades fraudulentas o poco éticas. Ejemplos de estos Productos, sin perjuicio de otros, son:\n3.1. Productos o Servicios que induzcan, enseñen o de cualquier manera alienten a otros Usuarios a violar los Términos o Políticas de QTM Healhtech.\n3.2. Productos o Servicios cuyo contenido incite, indique o de cualquier forma promueva cualquier comportamiento ilegal.\n3.3. Productos o Servicios que no proporcionan información necesaria y adecuada sobre usted.\n3.4. Productos o Servicios cuyo contenido sea intencionadamente engañoso, capaz de causar daño a sus Usuarios o a terceros.\n3.5. Productos o Servicios cuyo contenido presente información deliberadamente falsa como si fuera cierta. Por ejemplo, no podrá anunciar ni vender en la Plataforma ningún Producto cuyo contenido difunda noticias, incluidos artículos de medios, informe de hechos como si fueran ciertos o sugiera que pueden ser ciertos, si existe evidencia inequívoca de que son falsos. QTM Healhtech podrá eliminar de la Plataforma cualquier Producto o Servicio que encuentre con contenido de esta naturaleza, cualquiera que sea la finalidad del uso del contenido falso. QTM Healthtech aplicará las medidas adecuadas con especial rigor si determina que el uso de información falsa tiene como objetivo interferir o influir indebidamente en una elección.\n3.6. Productos que promuevan esquemas piramidales o similares, cuyo funcionamiento depende principalmente del aporte de recursos financieros por parte de nuevos participantes para remunerar a los participantes anteriores.',
    },
    'oiy07jo2': {
      'pt': 'Politica geral de uso \nresponsável',
      'es': 'Política general de \nuso responsable',
    },
    'x9f3r9by': {
      'pt': 'Home',
      'es': 'Hogar',
    },
  },
  // terms_drawer_page
  {
    'elyamk21': {
      'pt':
          'Os serviços da QTM Healthtech são fornecidos pela pessoa jurídica com a seguinte Razão Social: Juliana dos Santos Nogueira, com nome fantasia: Quantum, inscrito no CNPJ sob o nº 36.729.683/0001-60, titular da propriedade intelectual sobre software, website, aplicativos, conteúdos e demais ativos relacionados do site ou aplicativo da QTM Healthtech.',
      'es':
          'Los servicios de QTM Healthtech son prestados por la persona jurídica con la siguiente Razón Social: Juliana dos Santos Nogueira, con razón social: Quantum, registrada en el CNPJ con el nº 36.729.683/0001-60, titular de la propiedad intelectual sobre software, sitio web y aplicaciones. , contenido y otros activos relacionados del sitio web o aplicación de QTM Healthtech.',
    },
    '69d5ax4s': {
      'pt': '1.OBJETO',
      'es': '1. OBJETO',
    },
    'b9u58r3f': {
      'pt':
          '1.1 A plataforma visa licenciar o uso de seu website, e demais ativos de propriedade intelectual, fornecendo ferramentas para auxiliar e dinamizar o dia a dia dos seus usuários.',
      'es':
          '1.1 La plataforma tiene como objetivo otorgar licencia para el uso de su sitio web y otros activos de propiedad intelectual, proporcionando herramientas para ayudar y simplificar la vida diaria de sus usuarios.',
    },
    'cdig4eig': {
      'pt':
          '1.2 A plataforma caracteriza-se pela prestação dos seguintes serviços: conexão entre terapeutas, pacientes, coworking e venda de produtos.',
      'es':
          '1.2 La plataforma se caracteriza por la prestación de los siguientes servicios: conexión entre terapeutas, pacientes, coworking y venta de productos.',
    },
    'u5lqwxjx': {
      'pt':
          '1.3 A plataforma realiza a venda à distância por meio eletrônico e presencial dos seguintes produtos ou serviços: Praticas Integrativas e Complementares, Blends de chá e Produtos Digitais.',
      'es':
          '1.3 La plataforma realiza ventas a distancia de forma electrónica y presencial de los siguientes productos o servicios: Prácticas Integrativas y Complementarias, Mezclas de Té y Productos Digitales.',
    },
    'fkpu2y8g': {
      'pt': '2. DA ACEITAÇÃO',
      'es': '2. ACEPTACIÓN',
    },
    'daixun3w': {
      'pt':
          '2.1 A plataforma realiza a venda à distância por meio eletrônico e presencial dos seguintes produtos ou serviços: Praticas Integrativas e Complementares, Blends de chá e Produtos Digitais.\n2.2 Ao utilizar a plataforma o usuário aceita integralmente as presentes normas e compromete-se a observá-las, sob o risco de aplicação das penalidade cabíveis.\n2.3 A aceitação do presente instrumento é imprescindível para o acesso e para a utilização de quaisquer serviços fornecidos pela empresa. Caso não concorde com as disposições deste instrumento, o usuário não deve utilizá-los.',
      'es':
          '2.1 La plataforma realiza ventas a distancia, electrónica y presencial, de los siguientes productos o servicios: Prácticas Integrativas y Complementarias, Mezclas de Té y Productos Digitales.\n2.2 Al utilizar la plataforma, el usuario acepta plenamente estas reglas y se compromete a observar ellos, a riesgo de aplicar las sanciones aplicables.\n2.3 La aceptación de este instrumento es esencial para el acceso y uso de cualquier servicio proporcionado por la empresa. Si no está de acuerdo con las disposiciones de este instrumento, el usuario no deberá utilizarlas.',
    },
    '5i957km2': {
      'pt': '3 DO ACESSO DOS USUÁRIOS',
      'es': '3 ACCESO DE USUARIOS',
    },
    '23y6s5h6': {
      'pt':
          '3.1 Serão utilizadas todas as soluções técnicas à disposição do responsável pela plataforma para permitir o acesso ao serviço 24 (vinte e quatro) horas por dia, 7 (sete) dias por semana. No entanto, a navegação na plataforma ou em alguma de suas páginas poderá ser interrompida, limitada ou suspensa para atualizações, modificações ou qualquer ação necessária ao seu bom funcionamento.',
      'es':
          '3.1 Se utilizarán todas las soluciones técnicas a disposición de los responsables de la plataforma para permitir el acceso al servicio las 24 (veinticuatro) horas del día, los 7 (siete) días de la semana. Sin embargo, la navegación en la plataforma o cualquiera de sus páginas podrá ser interrumpida, limitada o suspendida por actualizaciones, modificaciones o cualquier acción necesaria para su correcto funcionamiento.',
    },
    '8t50dwkm': {
      'pt': '4 DO CADASTRO',
      'es': '4 DEL REGISTRO',
    },
    '1agjr8n9': {
      'pt':
          '4.1 O acesso às funcionalidades da plataforma exigirá a realização de um cadastro prévio e, a depender dos serviços ou produtos escolhidos, o pagamento de determinado valor.\n4.2 Ao se cadastrar o usuário deverá informar dados completos, recentes e válidos, sendo de sua exclusiva responsabilidade manter referidos dados atualizados, bem como o usuário se compromete com a veracidade dos dados fornecidos.\n4.3 O usuário se compromete a não informar seus dados cadastrais e/ou de acesso à plataforma a terceiros, responsabilizando-se integralmente pelo uso que deles seja feito.\n4.4 Menores de 18 anos e aqueles que não possuírem plena capacidade civil deverão obter previamente o consentimento expresso de seus responsáveis legais para utilização da plataforma e dos serviços ou produtos, sendo de responsabilidade exclusiva dos mesmos o eventual acesso por menores de idade e por aqueles que não possuem plena capacidade civil sem a prévia autorização.\n4.5 Mediante a realização do cadastro o usuário declara e garante expressamente ser plenamente capaz, podendo exercer e usufruir livremente dos serviços e produtos.\n4.6 O usuário deverá fornecer um endereço de e-mail válido, através do qual o site realizará comunicações necessárias.\n4.7 Após a confirmação do cadastro, o usuário possuirá um login e uma senha pessoal, a qual assegura ao usuário o acesso individual à mesma. Desta forma, compete ao usuário exclusivamente a manutenção de referida senha de maneira confidencial e segura, evitando o acesso indevido às informações pessoais.\n4.8 Toda e qualquer atividade realizada com o uso da senha será de responsabilidade do usuário, que deverá informar prontamente a plataforma em caso de uso indevido da respectiva senha.\n4.9 Não será permitido ceder, vender, alugar ou transferir, de qualquer forma, a conta, que é pessoal e intransferível.\n4.10 Caberá ao usuário assegurar que o seu equipamento seja compatível com as características técnicas que viabilize a utilização da plataforma e dos serviços ou produtos.\n4.11 O usuário poderá, a qualquer tempo, requerer o cancelamento de seu cadastro junto ao site ou aplicativo QTM Healthtech. O seu descadastramento será realizado o mais rapidamente possível, desde que não sejam verificados débitos em aberto.\n4.12 O usuário, ao aceitar os Termos e Política de Privacidade, autoriza expressamente a plataforma a coletar, usar, armazenar, tratar, ceder ou utilizar as informações derivadas do uso do site e quaisquer plataformas, incluindo todas as informações preenchidas pelo usuário no momento em que realizar ou atualizar seu cadastro, além de outras expressamente descritas na Política de Privacidade que deverá ser autorizada pelo usuário.',
      'es':
          '4.1 El acceso a las funcionalidades de la plataforma requerirá el registro previo y, dependiendo de los servicios o productos elegidos, el pago de una determinada cantidad.\n4.2 Al registrarse, el usuario deberá proporcionar datos completos, recientes y válidos, siendo de su responsabilidad exclusiva de mantener dichos datos actualizados, comprometiéndose el usuario a garantizar la veracidad de los datos facilitados.\n4.3 El usuario se compromete a no revelar a terceros sus datos de registro y/o acceso a la plataforma, asumiendo la plena responsabilidad del uso que se haga de los mismos.\n4.4 Los menores de 18 años y aquellos que no tengan plena capacidad civil deberán obtener previamente el consentimiento expreso de sus tutores legales para utilizar la plataforma y los servicios o productos, siendo de su exclusiva responsabilidad cualquier eventual el acceso de menores de edad y de aquellos que no tengan plena capacidad civil sin autorización previa.\n4.5 Al registrarse, el usuario declara y garantiza expresamente que está en plena capacidad y puede libremente ejercer y disfrutar de los servicios y productos.<__FFNL__ >4.6 El El usuario deberá proporcionar una dirección de correo electrónico válida, a través de la cual el sitio realizará las comunicaciones necesarias.\n4.7 Luego de confirmar el registro, el usuario dispondrá de un login y una contraseña personal, que le garantiza el acceso individual al mismo. Por lo tanto, el usuario es el exclusivo responsable de mantener dicha contraseña de forma confidencial y segura, evitando el acceso indebido a información personal.\n4.8 Todas y cada una de las actividades que se realicen utilizando la contraseña serán responsabilidad del usuario, quien deberá informar oportunamente la plataforma en caso de mal uso de la respectiva contraseña.\n4.9 No se permitirá ceder, vender, alquilar o transferir, de cualquier forma, la cuenta, la cual es personal e intransferible.\n4.10 Corresponderá al usuario asegurarse de que su equipo sea compatible con las características técnicas que permitan el uso de la plataforma y de los servicios o productos.\n4.11 El usuario podrá, en cualquier momento, solicitar la cancelación de su registro en el QTM Healthtech sitio web o aplicación. Su baja se realizará a la mayor brevedad posible, siempre y cuando no existan deudas pendientes.\n4.12 El usuario, al aceptar los Términos y Política de Privacidad, autoriza expresamente a la plataforma a recopilar, utilizar, almacenar, procesar, transferir o utilizar información derivada del uso del sitio web y cualesquiera plataformas, incluyendo toda la información completada por el usuario al registrarse o actualizar su registro, además de otras expresamente descritas en la Política de Privacidad, las cuales deberán ser autorizadas por el usuario.',
    },
    'whg2qifc': {
      'pt': '5 DOS SERVIÇOS OU PRODUTOS',
      'es': '5 DE LOS SERVICIOS O PRODUCTOS',
    },
    'kppu0bzc': {
      'pt':
          '5.1 A plataforma poderá disponibilizar para o usuário um conjunto específico de funcionalidades e ferramentas para otimizar o uso ou venda dos serviços e produtos.\n5.2 Na plataforma os serviços ou produtos oferecidos estão descritos e apresentados com o maior grau de exatidão, contendo informações sobre suas características, qualidades, quantidades, composição, preço, garantia, prazos de validade e origem, entre outros dados, bem como sobre os riscos que apresentam à saúde e segurança do usuário.\n5.3 Antes de finalizar a compra sobre determinado produto ou serviço, o usuário deverá se informar sobre as suas especificações e sobre a sua destinação.\n5.4 A entrega de serviços ou produtos adquiridos na plataforma será informada no momento da finalização da compra.',
      'es':
          '5.1 La plataforma puede poner a disposición del usuario un conjunto específico de funcionalidades y herramientas para optimizar el uso o venta de servicios y productos.\n5.2 En la plataforma, los servicios o productos ofrecidos se describen y presentan con el mayor grado de precisión. , conteniendo información sobre sus características, calidades, cantidades, composición, precio, garantía, fechas de caducidad y origen, entre otros datos, así como sobre los riesgos que suponen para la salud y seguridad del usuario.\n5.3 Antes de finalizar el compra de un producto o servicio específico, el usuario deberá informarse sobre sus especificaciones y su destino.\n5.4 La entrega de los servicios o productos adquiridos en la plataforma será informada al momento de finalizar la compra.',
    },
    'mm918l28': {
      'pt': '6  DOS PREÇOS',
      'es': '6 PRECIOS',
    },
    'lnaeaomr': {
      'pt':
          '6.1 A plataforma se reserva no direito de reajustar unilateralmente, a qualquer tempo, os valores dos serviços ou produtos sem consulta ou anuência prévia do usuário.\n6.2 Os valores aplicadas são aqueles que estão em vigor no momento do pedido.\n6.3 Os preços são indicados em reais e não incluem as taxas de entrega, as quais são especificadas à parte e são informadas ao usuário antes da finalização do pedido.\n6.4 Na contratação de determinado serviço ou produto, a plataforma poderá solicitar as informações financeiras do usuário, como CPF, endereço de cobrança e dados de cartões. Ao inserir referidos dados o usuário concorda que sejam cobrados, de acordo com a forma de pagamento que venha a ser escolhida, os preços então vigentes e informados quando da contratação. Referidos dados financeiros poderão ser armazenadas para facilitar acessos e contratações futuras.',
      'es':
          '6.1 La plataforma se reserva el derecho de reajustar unilateralmente, en cualquier momento, los precios de los servicios o productos sin previa consulta o consentimiento del usuario.\n6.2 Los valores aplicados son los vigentes en el momento del pedido.< __FFNL__> 6.3 Los precios se indican en reales y no incluyen los gastos de envío, que se especifican por separado y se informan al usuario antes de completar el pedido.\n6.4 Al contratar un determinado servicio o producto, la plataforma puede solicitar información financiera del usuario , como CPF, dirección de facturación y detalles de la tarjeta. Al introducir dichos datos, el usuario acepta que se le cobren, según el método de pago elegido, los precios entonces vigentes y informados en el momento de la contratación. Dichos datos financieros podrán ser almacenados para facilitar el acceso y futuras contrataciones.',
    },
    'co3wnfrm': {
      'pt': '7 DO CANCELAMENTO',
      'es': '7 CANCELACIÓN',
    },
    'fg5axyfe': {
      'pt':
          '7.1 O usuário poderá cancelar a contratação dos serviços de acordo com os termos que forem definidos no momento de sua contratação. Ainda, o usuário também poderá cancelar os serviços em até 7 (sete) dias após a contratação, mediante contato com com o SAC presente no site ou aplicativo QTM Healthtech, de acordo com o  Código de Defesa do Consumidor (Lei no. 8.078/90).\n7.2 O serviço poderá ser cancelado por:\na) parte do usuário: nessas condições os serviços somente cessarão quando concluído o ciclo vigente ao tempo do cancelamento;\nb) violação dos Termos de Uso: os serviços serão cessados imediatamente.',
      'es':
          '7.1 El usuario podrá cancelar la contratación de servicios de acuerdo con los términos definidos en el momento de la contratación. Además, el usuario también podrá cancelar los servicios dentro de los 7 (siete) días posteriores a la contratación, contactando al SAC presente en el sitio web o en la aplicación de QTM Healthtech, de conformidad con el Código de Protección al Consumidor (Ley nº 8.078/90).\n 7.2 El servicio podrá ser cancelado por:\na) el usuario: bajo estas condiciones los servicios sólo cesarán cuando se haya completado el ciclo vigente al momento de la cancelación;\nb) violación de los Términos de Uso: los servicios cesarán inmediatamente.',
    },
    '35pzc8vk': {
      'pt': '8 DA TROCA OU DEVOLUÇÃO',
      'es': '8 CAMBIO O DEVOLUCIÓN',
    },
    'zqjh21ll': {
      'pt':
          '8.1 A política de troca e devoluções da plataforma é regida conforme o  Código de Defesa do Consumidor (Lei nº 8.078/90).\n8.2 A troca e/ou devolução do produto poderá ocorrer por:\na) direito de arrependimento;\nb) vício do produto.\n8.3 Em caso de arrependimento, o usuário poderá devolver o produto em até 7 (sete) dias após o seu recebimento, mediante contato com o site ou aplicativo QTM Healthtech, de acordo com o  Código de Defesa do Consumidor (Lei nº 8.078/90).\n8.4 Em caso de vício do produto, deverá ser verificado vícios de qualidade ou quantidade que tornem o produto impróprios ou inadequados ao consumo a que se destinam ou que lhes diminuam o valor. Ainda, poderão ser trocados ou devolvidos os produtos ou serviços que apresentam disparidade com as indicações constantes na plataforma no momento da compra ou na embalagem, respeitando as variações decorrentes de sua natureza\n8.5 O usuário deverá entrar em contato com o site ou aplicativo QTM Healthtech tão logo constate o vício. Se, no prazo máximo de 30 (trinta) dias, não for possível resolver o vício ou, independentemente deste prazo, a substituição das partes viciadas puder comprometer a qualidade ou características do produto ou serviço, diminuir-lhe o valor ou se tratar de produto ou serviço essencial, o usuário poderá optar pela substituição do produto por outro da mesma espécie ou pela reexecução do serviço, pela devolução das quantias pagas ou pelo abatimento proporcional do preço.',
      'es':
          '8.1 A política de troca e devoluções da plataforma é regida conforme o  Código de Defesa do Consumidor (Lei nº 8.078/90).\n8.2 A troca e/ou devolução do produto poderá ocorrer por:\na) direito de arrependimento ;\nb) vício do produto.\n8.3 Em caso de arrependimento, o usuário poderá devolver o produto em até 7 (sete) dias após o seu recebimento, mediante contato com o site ou aplicativo QTM Healthtech, de acordo com o  Código de Defesa do Consumidor (Lei nº 8.078/90).\n8.4 Em caso de vício do produto, deverá ser verificado vícios de qualidade ou quantidade que tornem o produto impróprios ou inadequados ao consumo a que se destinam ou que lhes diminuam el valor. Además, los productos o servicios que difieran de las indicaciones contenidas en la plataforma en el momento de la compra o en el embalaje podrán ser cambiados o devueltos, respetando las variaciones que resulten de su naturaleza.\n8.5 El usuario deberá contactar con el sitio web o aplicación QTM Healthtech como tan pronto como se detecta la adicción. Si en un plazo máximo de 30 (treinta) días no es posible solucionar el defecto o, independientemente de este plazo, la sustitución de las piezas defectuosas pudiera comprometer la calidad o características del producto o servicio, reducir su valor o Sea un producto o servicio esencial, el usuario podrá optar por la sustitución del producto por otro del mismo tipo o por volver a realizar el servicio, por la devolución de las cantidades abonadas o por una reducción proporcional del precio.',
    },
    'v1nu12e2': {
      'pt': '9 DO SUPORTE',
      'es': '9 DEL APOYO',
    },
    'pnert04z': {
      'pt':
          '9.1 Em caso de qualquer dúvida, sugestão ou problema com a utilização da plataforma, o usuário poderá entrar em contato com o suporte, através do email suporte@qtmhealthtech.com.br ou telefone (98) 98331-8460.\n9.2 Estes serviços de atendimento ao usuário estarão disponíveis nos seguintes dias e horários:\n \n-Segunda a Sexta: 8 horas às 12 horas – 14 horas às 18 horas\n \n-Sábado e domingo: 8 às 12',
      'es':
          '9.1 En caso de dudas, sugerencias o problemas al utilizar la plataforma, el usuario podrá contactar a soporte a través del correo electrónico support@qtmhealthtech.com.br o al teléfono (98) 98331-8460.\n9.2 Estos servicios de soporte al Usuario estarán disponibles en la siguientes días y horarios:\n \n-Lunes a Viernes: 8 am a 12 pm – 2 pm a 6 pm\n \n-Sábado y Domingo: 8 am a 12 pm',
    },
    'd5wtusq6': {
      'pt': '10 DAS RESPONSABILIDADES',
      'es': '10 RESPONSABILIDADES',
    },
    'evf1mckm': {
      'pt':
          '10.1 É de Responsabilidade do Usuário:\na) defeitos ou vícios técnicos originados no próprio sistema do usuário;\nb) a correta utilização da plataforma, dos serviços ou produtos oferecidos, prezando pela boa convivência, pelo respeito e cordialidade entre os usuários;\nc) pelo cumprimento e respeito ao conjunto de regras disposto nesse Termo de Condições Geral de Uso, na respectiva Política de Privacidade e na legislação Nacional e Internacional;\nd) pela proteção aos dados de acesso à sua conta/perfil (login e senha).\n10.2 É de Responsabilidade da Plataforma QTM Healthtech:\na) indicar as características do serviço ou produto;\nb) os defeitos e vícios encontrados no serviço ou produto oferecido desde que lhe tenha dado causa;\nc) as informações que foram por ele divulgadas, sendo que os comentários ou informações divulgadas por usuários são de inteira responsabilidade dos próprios usuários;\nd) oos conteúdos ou atividades ilícitas praticadas através da sua plataforma\n10.1 A plataforma não se responsabiliza por links externos contidos em seu sistema que possam redirecionar o usuário à ambiente externo a sua rede.\n10.2 Não poderão ser incluídos links externos ou páginas que sirvam para fins comerciais ou publicitários sem autorização ou quaisquer informações ilícitas, violentas, polêmicas, pornográficas, xenofóbicas, discriminatórias ou ofensivas.',
      'es':
          '10.1 Es responsabilidad del Usuario:\na) los defectos o defectos técnicos originados en el propio sistema del usuario;\nb) el correcto uso de la plataforma, servicios o productos ofrecidos, valorando la buena convivencia, el respeto y la cordialidad entre los usuarios; \nc) para el cumplimiento y respeto del conjunto de normas establecidas en las presentes Condiciones Generales de Uso, en la respectiva Política de Privacidad y en la legislación Nacional e Internacional;\nd) para la protección de los datos de acceso a su cuenta /profile (usuario y contraseña).\n10.2 Es responsabilidad de la Plataforma QTM Healthtech:\na) indicar las características del servicio o producto;\nb) los defectos y defectos encontrados en el servicio o producto ofrecido desde que le dio origen;\nc) la información que fue divulgada por él, y los comentarios o información divulgada por los usuarios son responsabilidad exclusiva de los propios usuarios;\nd) el contenido o las actividades ilegales realizadas a través de su plataforma\n10.1 La plataforma no se hace responsable de los enlaces externos contenidos en su sistema que puedan redirigir al usuario a un entorno fuera de su red.\n10.2 No se pueden incluir enlaces externos o páginas que sirvan para fines comerciales o publicitarios sin autorización o cualquier información ilícita, violenta, controvertida, pornográfica, xenófoba, discriminatoria u ofensiva.',
    },
    'ffaib5v6': {
      'pt': '11 DOS DIRITOS AUTORAIS',
      'es': '11 DERECHOS DE AUTOR',
    },
    'ct321jz6': {
      'pt':
          '11.1 O presente Termo de Uso concede aos usuários uma licença não exclusiva, não transferível e não sublicenciável, para acessar e fazer uso da plataforma e dos serviços e produtos por ela disponibilizados.\n11.2 A estrutura do site ou aplicativo, as marcas, logotipos, nomes comerciais, layouts, gráficos e design de interface, imagens, ilustrações, fotografias, apresentações, vídeos, conteúdos escritos e de som e áudio, programas de computador, banco de dados, arquivos de transmissão e quaisquer outras informações e direitos de propriedade intelectual da razão social QTM Healthtech LTDA, observados os termos da  Lei da Propriedade Industrial (Lei nº 9.279/96),  Lei de Direitos Autorais (Lei nº 9.610/98) e  Lei do Software (Lei nº 9.609/98), estão devidamente reservados.\n11.3 Este Termos de Uso não cede ou transfere ao usuário qualquer direito, de modo que o acesso não gera qualquer direito de propriedade intelectual ao usuário, exceto pela licença limitada ora concedida.\n11.4 O uso da plataforma pelo usuário é pessoal, individual e intransferível, sendo vedado qualquer uso não autorizado, comercial ou não-comercial. Tais usos consistirão em violação dos direitos de propriedade intelectual da razão social QTM Healthtech LTDA, puníveis nos termos da legislação aplicável.\n',
      'es':
          '11.1 Estos Términos de uso otorgan a los usuarios una licencia no exclusiva, intransferible y no sublicenciable para acceder y hacer uso de la plataforma y los servicios y productos puestos a disposición por ella.\n11.2 La estructura del sitio web o la aplicación, las marcas, logotipos, nombres comerciales, diseños, gráficos y diseño de interfaz, imágenes, ilustraciones, fotografías, presentaciones, videos, contenido escrito y de sonido y audio, programas de computadora, bases de datos, archivos de transmisión y cualquier otra información y derechos de propiedad intelectual de la razón social QTM Healthtech LTDA, en cumplimiento de los términos de la Ley de Propiedad Industrial (Ley nº 9.279/96), Ley de Derecho de Autor (Ley nº 9.610/98) y Ley de Software (Ley nº 9.609/98), quedan debidamente reservados.<__FFNL__ >11.3 Estos Términos de Uso no asignan ni transfieren ningún derecho al usuario, por lo que el acceso no genera ningún derecho de propiedad intelectual para el usuario, excepto la licencia limitada aquí otorgada.\n11.4 El uso de la plataforma por parte del usuario Es personal, individual e intransferible, quedando prohibido cualquier uso no autorizado, comercial o no. Dichos usos constituirán una violación de los derechos de propiedad intelectual de la razón social QTM Healthtech LTDA, sancionable según la legislación aplicable.',
    },
    'lu2kc8bh': {
      'pt': '12 DAS SANSÕES',
      'es': '12 DE SANSIONES',
    },
    'zesd5l0y': {
      'pt':
          '\n12.1 Sem prejuízo das demais medidas legais cabíveis, a razão QTM Healthtech LTDA poderá, a qualquer momento, advertir, suspender ou cancelar a conta do usuário:\na)que violar qualquer dispositivo do presente Termo;\nb) que descumprir os seus deveres de usuário.\nc) que tiver qualquer comportamento fraudulento, doloso ou que ofenda a terceiros.',
      'es':
          '12.1 Sin perjuicio de otras medidas legales aplicables, QTM Healthtech LTDA podrá, en cualquier momento, advertir, suspender o cancelar la cuenta del usuario:\na) quien viole cualquier disposición de este Término;\nb) quien incumpla sus deberes como usuario.\nc) que realice cualquier conducta fraudulenta, maliciosa o que ofenda a terceros.',
    },
    'kv8cngqv': {
      'pt': '13 DAS RECISÕES',
      'es': '13 DE LAS TERMINACIONES',
    },
    '6cvu01e7': {
      'pt':
          '13.1 A não observância das obrigações pactuadas neste Termo de Uso ou da legislação aplicável poderá, sem prévio aviso, ensejar a imediata rescisão unilateral por parte da razão social QTM Healthtech LTDA e o bloqueio de todos os serviços prestados ao usuário.',
      'es':
          '13.1 El incumplimiento de las obligaciones pactadas en estos Términos de Uso o la legislación aplicable podrá, sin previo aviso, dar lugar a la terminación unilateral inmediata por parte de la razón social QTM Healthtech LTDA y al bloqueo de todos los servicios prestados al usuario.',
    },
    'br63zn0z': {
      'pt': '14 DA ALTERAÇÕES',
      'es': '14 DE LOS CAMBIOS',
    },
    '2h8j2oux': {
      'pt':
          '14.1 Os itens descritos no presente instrumento poderão sofrer alterações, unilateralmente e a qualquer tempo, por parte da QTM Healthtech, para adequar ou modificar os serviços, bem como para atender novas exigências legais. As alterações serão veiculadas pelo site da QTM Healthtech e o usuário poderá optar por aceitar o novo conteúdo ou por cancelar o uso dos serviços, caso seja assinante de algum serviço.',
      'es':
          '14.1 Los puntos descritos en este instrumento podrán ser modificados, unilateralmente y en cualquier momento, por QTM Healthtech, para adaptar o modificar los servicios, así como para atender nuevos requisitos legales. Los cambios serán publicados en el sitio web de QTM Healthtech y el usuario podrá optar por aceptar el nuevo contenido o cancelar el uso de los servicios, si es suscriptor de algún servicio.',
    },
    '043azux1': {
      'pt': '15 DA POLITICAS DE PRIVACIDADE',
      'es': '15 POLÍTICAS DE PRIVACIDAD',
    },
    '6wu7yrs5': {
      'pt':
          '15.1 Além do presente Termo, o usuário deverá consentir com as disposições contidas na respectiva Política de Privacidade a ser apresentada a todos os interessados dentro da interface da plataforma.',
      'es':
          '15.1 Además de estos Términos, el usuario debe dar su consentimiento a las disposiciones contenidas en la respectiva Política de Privacidad que se presentarán a todas las partes interesadas dentro de la interfaz de la plataforma.',
    },
    'ywgti4fa': {
      'pt': '16  DO FORO',
      'es': '16 DEL FORO',
    },
    'p96pa91y': {
      'pt':
          '16.1 Para a solução de controvérsias decorrentes do presente instrumento será aplicado integralmente o Direito brasileiro.\n16.2 Os eventuais litígios deverão ser apresentados no foro da comarca em que se encontra a sede da empresa.',
      'es':
          '16.1 Para la resolución de disputas que surjan de este instrumento, se aplicará plenamente la ley brasileña.\n16.2 Cualquier disputa deberá ser presentada en el tribunal del distrito donde se encuentra la sede de la empresa.',
    },
    '3l91jahv': {
      'pt': 'Termos e condições',
      'es': 'Términos y Condiciones',
    },
    'aym95w5v': {
      'pt': 'Home',
      'es': 'Hogar',
    },
  },
  // managerRequestHistory
  {
    '74b4seqc': {
      'pt': 'Horário e data de consulta',
      'es': 'Hora y fecha de consulta',
    },
    '0mivri7n': {
      'pt': 'Local de atendimento',
      'es': 'Ubicación del servicio',
    },
    'uv8kja3s': {
      'pt': 'Sem localização',
      'es': 'Sin ubicación',
    },
    '7o3l31ii': {
      'pt': 'Status',
      'es': 'Estado',
    },
    'vpsd5n9u': {
      'pt': 'Remarcar consulta',
      'es': 'Re-agenda de citas',
    },
    '23wd3wyd': {
      'pt': 'Home',
      'es': 'Hogar',
    },
  },
  // redirect_finished_page
  {
    'k2o74xu8': {
      'pt': 'Estamos  preparando tudo para você...',
      'es': 'Estamos preparando todo para ti...',
    },
    'o5wa2t0o': {
      'pt': 'Home',
      'es': 'Hogar',
    },
  },
  // profile_theraphist_page
  {
    '8a1zumfy': {
      'pt': 'Nome',
      'es': 'Nombre',
    },
    'y14tb754': {
      'pt': 'Sobrenome',
      'es': 'Apellido',
    },
    '4q2g9t72': {
      'pt': 'Homem cisgênero',
      'es': 'hombre cisgénero',
    },
    'aq1dkom8': {
      'pt': 'Mulher cisgênero',
      'es': 'mujer cisgénero',
    },
    'my6qysvk': {
      'pt': 'Não binário',
      'es': 'no binario',
    },
    'tr8wplk8': {
      'pt': 'Homem trans',
      'es': 'hombre trans',
    },
    'eukcbile': {
      'pt': 'Mulher trans',
      'es': 'mujer trans',
    },
    'ep44gc1v': {
      'pt': 'Gênero',
      'es': 'Género',
    },
    '40k1zdah': {
      'pt': 'Search for an item...',
      'es': 'Buscar un artículo...',
    },
    'umx0ied0': {
      'pt': 'Bio',
      'es': 'Biografía',
    },
    '5mvqx4vt': {
      'pt': '1 Ano',
      'es': '1 año',
    },
    'z8wl4che': {
      'pt': '2 Anos',
      'es': '2 años',
    },
    '1ix3yo74': {
      'pt': '3 Anos',
      'es': '3 años',
    },
    'a369qnt2': {
      'pt': '+4 anos',
      'es': '+4 años',
    },
    '326tais9': {
      'pt': 'Tempo de  experiência',
      'es': 'experiencia del tiempo',
    },
    'xozx3z0t': {
      'pt': 'Search for an item...',
      'es': 'Buscar un artículo...',
    },
    'syf3r2er': {
      'pt': 'Campo Obirgatório',
      'es': 'Campo obligatorio',
    },
    'qkttl4wu': {
      'pt': 'Please choose an option from the dropdown',
      'es': 'Por favor elija una opción del menú desplegable',
    },
    'vufh32kt': {
      'pt': 'Campo Obirgatório',
      'es': 'Campo obligatorio',
    },
    'bhbr7irp': {
      'pt': 'Please choose an option from the dropdown',
      'es': 'Por favor elija una opción del menú desplegable',
    },
    '85ivzk41': {
      'pt': 'Campo Obirgatório',
      'es': 'Campo obligatorio',
    },
    '171ur012': {
      'pt': 'Please choose an option from the dropdown',
      'es': 'Por favor elija una opción del menú desplegable',
    },
    'ozb90syw': {
      'pt': 'Continuar',
      'es': 'Continuar',
    },
    '4wa3lpa0': {
      'pt': 'Perfil ',
      'es': 'Perfil',
    },
    '7nnk2yvj': {
      'pt': 'Home',
      'es': 'Hogar',
    },
  },
  // redirect_continue_page
  {
    '838kj87w': {
      'pt': 'Estamos  preparando tudo para você...',
      'es': 'Estamos preparando todo para ti...',
    },
    'h4c8v6a1': {
      'pt': 'Home',
      'es': 'Hogar',
    },
  },
  // screenSupport
  {
    '34hc24gw': {
      'pt': 'Precisa de ajuda ?',
      'es': 'Necesita ayuda ?',
    },
    '1c6zk6vv': {
      'pt': 'Fale conosco',
      'es': 'Hable con nosotros',
    },
    '74fsl1g1': {
      'pt': 'Entre em contato e diga no que a QTM healthtech pode ajudar.',
      'es':
          'Póngase en contacto y háganos saber cómo QTM Healthtech puede ayudar.',
    },
    '8lhdzdnp': {
      'pt': 'Consultas',
      'es': 'Consultas',
    },
    'movk9fsl': {
      'pt': 'Entre em contato e nos diga o problema com a consulta',
      'es': 'Ponte en contacto y cuéntanos el problema de la consulta',
    },
    '7gyehhia': {
      'pt': 'Fale com nossa equipe',
      'es': 'Habla con nuestro equipo',
    },
    'fei8cz2y': {
      'pt': 'Ajuda e suporte',
      'es': 'Ayuda y apoyo',
    },
    '3y08353j': {
      'pt': 'Entre em contato e nos diga como podemos ajudar',
      'es': 'Ponte en contacto y cuéntanos cómo podemos ayudarte',
    },
    'v2msr5ib': {
      'pt': 'Obtenha suporte',
      'es': 'Obtener apoyo',
    },
    'sbrgbrta': {
      'pt': 'Home',
      'es': 'Hogar',
    },
  },
  // supportForm
  {
    'n7ygovzy': {
      'pt': 'Ajuda e suporte',
      'es': 'Ayuda y apoyo',
    },
    'tstqr8sp': {
      'pt': 'Ajude a encaminhar a solicitação',
      'es': 'Ayuda a reenviar la solicitud',
    },
    'kiphmsna': {
      'pt': 'Entre em contato e diga no que a QTM healthtech pode ajudar.',
      'es':
          'Póngase en contacto y háganos saber cómo QTM Healthtech puede ayudar.',
    },
    'lah2d07q': {
      'pt': 'Fale sobre você',
      'es': 'Hable sobre usted',
    },
    '2aauw4d9': {
      'pt': 'Só precisamos de alguns dados',
      'es': 'Solo necesitamos algunos datos',
    },
    'c5h7vcxg': {
      'pt': 'E-mail comercial',
      'es': 'Email de negocios',
    },
    'r0qiba6d': {
      'pt': 'Telefone de contato',
      'es': 'Teléfono de contacto',
    },
    'hfmdjwua': {
      'pt': 'Descreva o problema',
      'es': 'Describe el problema',
    },
    'eg31poa7': {
      'pt': 'Descreva o problema no campo abaixo',
      'es': 'Describe el problema en el campo siguiente.',
    },
    'pmkngzfj': {
      'pt': 'Digite aqui',
      'es': 'Digite aquí',
    },
    '0f8crkse': {
      'pt': 'Enviar',
      'es': 'Mandar',
    },
    'v8oornqy': {
      'pt': 'Home',
      'es': 'Hogar',
    },
  },
  // supportConsultas
  {
    'nowv4kto': {
      'pt': 'Consulta',
      'es': 'Consulta',
    },
    'kg80f9ic': {
      'pt': 'Selecione a consulta',
      'es': 'Seleccionar consulta',
    },
    '9k9gz8dg': {
      'pt': 'Selecione a consulta que está lhe causando problemas',
      'es': 'Seleccione la consulta que le está causando problemas',
    },
    '68z775cq': {
      'pt': 'Hello World',
      'es': 'Hola Mundo',
    },
    '2wozyecf': {
      'pt': 'Hello World',
      'es': 'Hola Mundo',
    },
    'u70pacqr': {
      'pt': 'Hello World',
      'es': 'Hola Mundo',
    },
    'a8cbdpml': {
      'pt': 'Home',
      'es': 'Hogar',
    },
  },
  // supportRequestFinished
  {
    '8nr4mxqs': {
      'pt': 'Consulta',
      'es': 'Consulta',
    },
    'wruuv2et': {
      'pt': 'Selecione a consulta',
      'es': 'Seleccionar consulta',
    },
    'dmus3ulf': {
      'pt': 'Selecione a consulta que está lhe causando problemas',
      'es': 'Seleccione la consulta que le está causando problemas',
    },
    'fu0qbefm': {
      'pt': 'Hello World',
      'es': 'Hola Mundo',
    },
    'k8syrcmf': {
      'pt': 'Enviar',
      'es': 'Mandar',
    },
    '4cpbdhez': {
      'pt': 'Home',
      'es': 'Hogar',
    },
  },
  // home_page_admin
  {
    '9r3rljvq': {
      'pt': 'Terapeutas',
      'es': 'Terapeutas',
    },
    'yj8hs5rr': {
      'pt': 'Pacientes',
      'es': 'Pacientes',
    },
    'wqhx0uj1': {
      'pt': 'Coworkings',
      'es': 'Coworkings',
    },
    'ak0f6du8': {
      'pt': 'Veja os seu principais interesses',
      'es': 'Ver tus principales intereses',
    },
    '3uxw9hyg': {
      'pt': 'Yoga',
      'es': 'Yoga',
    },
    's2kbuewo': {
      'pt':
          'Conheça uma das melhores práticas integrativas realizadas no mundo',
      'es':
          'Descubre una de las mejores prácticas integradoras realizadas en el mundo',
    },
    '8qnc45we': {
      'pt': 'Ver',
      'es': 'Para ver',
    },
    'uh58mmj9': {
      'pt': 'Home',
      'es': 'Hogar',
    },
  },
  // registred_theraphist_page
  {
    'got6x09f': {
      'pt': 'status',
      'es': 'estado',
    },
    'f9ja24er': {
      'pt': 'Ativo',
      'es': 'Activo',
    },
    'qpyvqb8h': {
      'pt': 'Terapeutas Registrados',
      'es': 'Terapeutas registrados',
    },
    'pntt2t76': {
      'pt': 'Home',
      'es': 'Hogar',
    },
  },
  // registred_patients_page
  {
    '20rpljz9': {
      'pt': 'status',
      'es': 'estado',
    },
    '2lgbe6uu': {
      'pt': 'Ativo',
      'es': 'Activo',
    },
    'f5vffp5w': {
      'pt': 'Pacientes Registrados',
      'es': 'Pacientes registrados',
    },
    'zw002x41': {
      'pt': 'Home',
      'es': 'Hogar',
    },
  },
  // users_page
  {
    'tdx7emkg': {
      'pt': 'Perfil do paciente',
      'es': 'Perfil del paciente',
    },
    'rwqllq0r': {
      'pt': 'Home',
      'es': 'Hogar',
    },
  },
  // profile_patient
  {
    'xkpwb3kf': {
      'pt': 'Perfil',
      'es': 'Perfil',
    },
    'bnvdgo3h': {
      'pt': 'Quando entrou',
      'es': 'cuando entraste',
    },
    'cicahtvd': {
      'pt': 'Há 1 ano atrás',
      'es': 'hace 1 año',
    },
    'ppqoqg16': {
      'pt': 'Alterar dados',
      'es': 'Cambiar datos',
    },
    'efytq2v1': {
      'pt': 'Meus dados',
      'es': 'Mis datos',
    },
    'aswm6dvi': {
      'pt': 'Cidade',
      'es': 'Ciudad',
    },
    '0yq04fxa': {
      'pt': 'Usuário',
      'es': 'Usuario',
    },
    '1bnle2ic': {
      'pt': 'Gênero',
      'es': 'Género',
    },
    'nyc6d10o': {
      'pt': 'Estado',
      'es': 'estado',
    },
    '1ehie318': {
      'pt': 'Bio',
      'es': 'Biografía',
    },
    'b32z9lvq': {
      'pt': 'Minha localização',
      'es': 'Mi ubicacion',
    },
    'ei88qoor': {
      'pt': 'Alterar',
      'es': 'alterar',
    },
    'hs1bk9q2': {
      'pt': 'Email e senha',
      'es': 'Correo electrónico y contraseña',
    },
    'ewo87anl': {
      'pt': 'Alterar a senha',
      'es': 'Cambiar la contraseña',
    },
    'nkiyv1p1': {
      'pt': 'Alterar o email',
      'es': 'Cambiar e-mail',
    },
    '8f7etm5v': {
      'pt': 'Home',
      'es': 'Hogar',
    },
  },
  // edit_profile
  {
    'sn466tl4': {
      'pt': 'Editar perfil',
      'es': 'Editar perfil',
    },
    '5wx7eesd': {
      'pt': 'Nome de usuário',
      'es': 'Nombre de usuario',
    },
    '19wfdx5q': {
      'pt': 'Gênero',
      'es': 'Género',
    },
    'flclpupf': {
      'pt': 'Local',
      'es': 'Local',
    },
    'fei389gq': {
      'pt': 'Telefone',
      'es': 'Teléfono',
    },
    '4bgn9el6': {
      'pt': 'Bio',
      'es': 'Biografía',
    },
    'i8q6fl72': {
      'pt': 'Alterar Perfil',
      'es': 'Cambiar el perfil',
    },
    'c0q381il': {
      'pt': 'Home',
      'es': 'Hogar',
    },
  },
  // modal_filters
  {
    'ygbn0wyf': {
      'pt': 'Filtros',
      'es': 'Filtros',
    },
    'neyf84np': {
      'pt': 'preços',
      'es': 'precios',
    },
    'q8sw3sth': {
      'pt': 'práticas',
      'es': 'practicas',
    },
  },
  // card_request
  {
    'mql70947': {
      'pt': 'Dr. Adani Robson',
      'es': 'Dr. Adani Robson',
    },
    'fjb6g7lr': {
      'pt': 'Terapeuta especialista',
      'es': 'Terapeuta especialista',
    },
    '754gvefc': {
      'pt': 'Cancelar',
      'es': 'Cancelar',
    },
    'fpnbvsij': {
      'pt': 'Aguardando',
      'es': 'Espera',
    },
  },
  // accoumt_modal
  {
    'wnwelpmx': {
      'pt': 'Alterar dado de conta',
      'es': 'Cambiar detalles de cuenta',
    },
    't7hu4b9o': {
      'pt': 'Nova Senha',
      'es': 'Nueva contraseña',
    },
    'iea8q50v': {
      'pt': 'Nova senha',
      'es': 'Nueva contraseña',
    },
    'imq09r6l': {
      'pt': 'Salvar',
      'es': 'Ahorrar',
    },
  },
  // avaliation_modal
  {
    'dqccjmzm': {
      'pt': 'Avaliar Aplicativo QTM',
      'es': 'Evaluar la aplicación QTM',
    },
    'wxql1t87': {
      'pt': 'Dê até cinco estrelas para esse APP',
      'es': 'Da hasta cinco estrellas por esta APP',
    },
    'mna8x8dl': {
      'pt': 'Avaliar',
      'es': 'para evaluar',
    },
  },
  // shared_modal
  {
    '0ggzh8sg': {
      'pt': 'Compartilhe já para os seus amigos',
      'es': 'Comparte ahora con tus amigos',
    },
    'wftli9su': {
      'pt': 'Indique amigos e ganhe premios  descontos em nossos produtos QTM.',
      'es':
          'Recomiende amigos y reciba premios y descuentos en nuestros productos QTM.',
    },
    'seoyzqmx': {
      'pt': 'Compartilhar',
      'es': 'Para compartir',
    },
  },
  // therapist_card_home_page
  {
    'thrykwpb': {
      'pt': 'Dr. Sirino',
      'es': 'Dr. Sirino',
    },
    '72e8bgh2': {
      'pt': 'Hipnose',
      'es': 'Hipnosis',
    },
    '9g112seo': {
      'pt': 'Perfil',
      'es': 'Perfil',
    },
  },
  // modal_add_card
  {
    'cmlgec5m': {
      'pt': 'Adicionar cartão',
      'es': 'Agregar tarjeta',
    },
    'urw36pnp': {
      'pt': 'Número do cartão',
      'es': 'numero de tarjeta',
    },
    'xivo9rev': {
      'pt': 'Data de expiração',
      'es': 'Fecha de expiración',
    },
    '1v7o9pcc': {
      'pt': 'CVC\\CVV',
      'es': 'CVC\\CVV',
    },
    '0d6etvnp': {
      'pt': 'Nome do  titular',
      'es': 'Nombre del titular de la tarjeta',
    },
    'hz1zjutt': {
      'pt': 'Adicionar cartão',
      'es': 'Agregar tarjeta',
    },
  },
  // confirm_delete_history
  {
    '4o65m4yi': {
      'pt': 'Deseja deletar o histórico?',
      'es': '¿Quieres borrar el historial?',
    },
    'pevq49qd': {
      'pt': 'Cancelar',
      'es': 'Cancelar',
    },
    '05r5t7co': {
      'pt': 'Deletar',
      'es': 'Borrar',
    },
  },
  // modal_success_request
  {
    'm3mb15cr': {
      'pt': 'Sua solicitação está ',
      'es': 'Tu solicitud es',
    },
    '1xfrku7g': {
      'pt': 'está confirmada!',
      'es': '¡se confirma!',
    },
    'amcjwz69': {
      'pt': 'Tela inicial',
      'es': 'Pantalla de inicio',
    },
    'quseim8r': {
      'pt': 'Acompanhar',
      'es': 'Para acompañar',
    },
  },
  // load_request
  {
    'fymnb50g': {
      'pt': 'voltar',
      'es': 'volver',
    },
  },
  // confirm_payment
  {
    'eylfblld': {
      'pt': 'Confirmar pagamento',
      'es': 'Confirmar pago',
    },
    '7prpgxx1': {
      'pt': 'Aromaterapia',
      'es': 'aromaterapia',
    },
    'vsua0vky': {
      'pt': 'Tratamento',
      'es': 'Tratamiento',
    },
    'nx75s9li': {
      'pt':
          'Os pagamentos são protegidos por criptografia de ponta para a segurança dos dados referente à transação',
      'es':
          'Los pagos están protegidos mediante cifrado de última generación para proteger los datos de las transacciones.',
    },
    'a5mkzhj2': {
      'pt': 'Total',
      'es': 'Total',
    },
    'h2mioc3s': {
      'pt': '180,00 BRL',
      'es': '180,00 reales',
    },
    'pmk5lriz': {
      'pt': 'Cancelar',
      'es': 'Cancelar',
    },
    'l9skjhry': {
      'pt': 'Confirmar',
      'es': 'Confirmar',
    },
  },
  // payment_method_not_choosed
  {
    'c4dx29xw': {
      'pt': 'Nenhum cartão selecionado',
      'es': 'No hay tarjetas seleccionadas',
    },
    '32ypgtyi': {
      'pt': 'voltar',
      'es': 'volver',
    },
  },
  // modalReject
  {
    'qur4gaje': {
      'pt': 'Tem certeza que deseja',
      'es': 'Estas seguro que quieres',
    },
    'v4c6v01j': {
      'pt': 'recusar esta solicitação?!',
      'es': '¿Rechazar esta solicitud?',
    },
    '5v1vevy3': {
      'pt': 'Cancelar',
      'es': 'Cancelar',
    },
    'ujvc3ftm': {
      'pt': 'Recusar',
      'es': 'Rechazar',
    },
  },
  // acceptModal
  {
    'p8c63sou': {
      'pt': 'Sua solicitação está ',
      'es': 'Tu solicitud es',
    },
    'u3pj6quv': {
      'pt': 'está confirmada!',
      'es': '¡se confirma!',
    },
    'kb6yelbl': {
      'pt': 'Acompanhar',
      'es': 'Para acompañar',
    },
  },
  // alertReject
  {
    '4h5btsr9': {
      'pt': 'Solicitação Recusada',
      'es': 'Solicitud rechazada',
    },
    '7uju74dc': {
      'pt': 'Entendido',
      'es': 'Comprendido',
    },
  },
  // cancelModal
  {
    'fmlq1g9b': {
      'pt': 'Deseja cancelar o atendimento?',
      'es': '¿Quieres cancelar el servicio?',
    },
    'y1wu1gg3': {
      'pt': 'Não',
      'es': 'No',
    },
    '2pkxhltg': {
      'pt': 'Sim',
      'es': 'Sí',
    },
  },
  // modal_session
  {
    '75cao57z': {
      'pt': 'Sua sessão foi encerrada!\nFaça seu login Novamente!',
      'es': '¡Tu sesión ha finalizado!\n¡Inicia sesión nuevamente!',
    },
    'f13de2ig': {
      'pt': 'Vamos lá',
      'es': 'Vamos allá',
    },
  },
  // aceppt_modal_theraphist
  {
    'oy6x7po3': {
      'pt': 'Sua solicitação está ',
      'es': 'Tu solicitud es',
    },
    'n0gxuoih': {
      'pt': 'está confirmada!',
      'es': '¡se confirma!',
    },
    '5hyi8fhy': {
      'pt': 'Acompanhar',
      'es': 'Para acompañar',
    },
  },
  // alert_reject_theraphist
  {
    'wr6v7wsx': {
      'pt': 'Solicitação Recusada',
      'es': 'Solicitud rechazada',
    },
    'jv6yqf32': {
      'pt': 'Entendido',
      'es': 'Comprendido',
    },
  },
  // cancel_modal_theraphist
  {
    'vi4nqlpl': {
      'pt': 'Deseja cancelar o atendimento?',
      'es': '¿Quieres cancelar el servicio?',
    },
    'g4d5fqiq': {
      'pt': 'Não',
      'es': 'No',
    },
    'qcabqlc7': {
      'pt': 'Sim',
      'es': 'Sí',
    },
  },
  // reject_modal_theraphist
  {
    'pt0k86si': {
      'pt': 'Tem certeza que deseja',
      'es': 'Estas seguro que quieres',
    },
    '1or7boai': {
      'pt': 'recusar esta solicitação?!',
      'es': '¿Rechazar esta solicitud?',
    },
    'd1kvia5u': {
      'pt': 'Cancelar',
      'es': 'Cancelar',
    },
    'tk0nvp15': {
      'pt': 'Recusar',
      'es': 'Rechazar',
    },
  },
  // turorial_theraphist_01_page
  {
    'fb5nx7y2': {
      'pt': 'Adicione a sua principal pratica integrativa',
      'es': 'Añade tu práctica integrativa principal',
    },
    'jr2jllcn': {
      'pt': 'Ok',
      'es': 'DE ACUERDO',
    },
  },
  // turorial_theraphist_02_page
  {
    'rxznu6f6': {
      'pt': 'Em seguida vamos concluir o cadastro do seu perfil',
      'es': 'A continuación, completaremos el registro de su perfil.',
    },
    'jem454gy': {
      'pt': 'Entendido',
      'es': 'Comprendido',
    },
  },
  // alert_register_user_theraphist_modal
  {
    'lf8qe0cf': {
      'pt': 'Cadastro do seu perfil finalizado com sucesso!',
      'es': '¡El registro de su perfil se completó exitosamente!',
    },
    '2npwwhhx': {
      'pt': 'Continuar',
      'es': 'Continuar',
    },
  },
  // alert_register_user_patient_modal
  {
    'n8oleovk': {
      'pt': 'Cadastro do seu perfil finalizado com sucesso!',
      'es': '¡El registro de su perfil se completó exitosamente!',
    },
    'lvwitj2r': {
      'pt': 'Continuar',
      'es': 'Continuar',
    },
  },
  // turorial_theraphist_03_page
  {
    '7vt6ubvi': {
      'pt': 'Agora Adicione os horários de atendimento',
      'es': 'Ahora Añadir horario de apertura',
    },
    'h4ua57xi': {
      'pt': 'Entendido',
      'es': 'Comprendido',
    },
  },
  // turorial_theraphist_04_page
  {
    'c9v2n301': {
      'pt': 'Primeiro ative o dia que irá realizar atendimento!',
      'es': '¡Primero activa el día en el que realizarás el servicio!',
    },
    '3k1uekd9': {
      'pt': 'Entendido',
      'es': 'Comprendido',
    },
  },
  // turorial_theraphist_05_page
  {
    '8sosvehm': {
      'pt': 'Agora clique na seta e adicione seus horários!',
      'es': '¡Ahora haz clic en la flecha y agrega tus tiempos!',
    },
    't82htf52': {
      'pt': 'Entendido',
      'es': 'Comprendido',
    },
  },
  // turorial_theraphist_06_page
  {
    'e5ynyud3': {
      'pt': 'Bem vindo ao espaço da QTM',
      'es': 'Bienvenido al espacio QTM',
    },
    '60aj7hao': {
      'pt': 'Entendido',
      'es': 'Comprendido',
    },
  },
  // turorial_theraphist_07_page
  {
    'c908uwex': {
      'pt':
          'Agora você pode agendar atendimentos com seus paciente tranquilamente!',
      'es': '¡Ahora puedes programar citas con tus pacientes con facilidad!',
    },
    'kwciwcfj': {
      'pt': 'OK',
      'es': 'DE ACUERDO',
    },
  },
  // turorial_theraphist_08_page
  {
    '7u3undqh': {
      'pt':
          'Veja as nossas principais recomendações e atualizações sobre saúde e bem estar!',
      'es':
          '¡Mira nuestras principales recomendaciones y actualizaciones sobre salud y bienestar!',
    },
    'fbfm0wcb': {
      'pt': 'OK',
      'es': 'DE ACUERDO',
    },
  },
  // turorial_theraphist_06_intro_page
  {
    'd2lz8mmg': {
      'pt': 'Ative o dia de trabalho ao lado!',
      'es': '¡Activa el día laboral siguiente!',
    },
    'ccgxk03a': {
      'pt': 'Entendido',
      'es': 'Comprendido',
    },
  },
  // cancel_schedule_modal
  {
    'drgswm9n': {
      'pt': 'Deseja cancelar o atendimento?',
      'es': '¿Quieres cancelar el servicio?',
    },
    '0xx7n0ev': {
      'pt': 'Não',
      'es': 'No',
    },
    'yuv5hmay': {
      'pt': 'Sim',
      'es': 'Sí',
    },
  },
  // information_modal
  {
    '370t1b5i': {
      'pt': 'Atendimento Finalizado',
      'es': 'Servicio completado',
    },
    'r9tabvoe': {
      'pt': 'com sucesso!',
      'es': '¡con éxito!',
    },
    'td9boqv8': {
      'pt': 'Continuar',
      'es': 'Continuar',
    },
  },
  // prescription_modal
  {
    'q6xlv8eg': {
      'pt': 'Prescrição terapeuta',
      'es': 'Prescripción del terapeuta',
    },
    'gdwlge4u': {
      'pt': 'Paciente Ausente',
      'es': 'Paciente Ausente',
    },
    'wnewzw7j': {
      'pt': 'Prescrição Terapeûtica',
      'es': 'Prescripción Terapéutica',
    },
    '2ot4gkke': {
      'pt': 'Field is required',
      'es': 'Se requiere campo',
    },
    'e57utg3i': {
      'pt': 'Please choose an option from the dropdown',
      'es': 'Por favor elija una opción del menú desplegable',
    },
    'nm4077qv': {
      'pt': 'Retorno ',
      'es': 'Devolver',
    },
    'azn33tsk': {
      'pt': 'Finalizar',
      'es': 'Finalizar',
    },
  },
  // refused_modal
  {
    '61z0acod': {
      'pt': 'Atendimento cancelado',
      'es': 'Servicio cancelado',
    },
    'ehf106ny': {
      'pt': 'com sucesso!',
      'es': '¡con éxito!',
    },
    '4eenyxee': {
      'pt': 'Continuar',
      'es': 'Continuar',
    },
  },
  // alert_timer_modal
  {
    '8o3j460c': {
      'pt': 'Horarios adicionados com sucesso!',
      'es': '¡Horarios agregados exitosamente!',
    },
    '3kfrpy9m': {
      'pt': 'Entendido',
      'es': 'Comprendido',
    },
  },
  // alert_service_modal
  {
    'cko67ene': {
      'pt': 'Prática integrativa adicionada com sucesso! ',
      'es': '¡Práctica integrativa agregada con éxito!',
    },
    '2zgi8lan': {
      'pt': 'Continuar',
      'es': 'Continuar',
    },
  },
  // alert_delete_modal
  {
    'a3b2u4t7': {
      'pt': 'Deseja deletar essa prática\n integrativa?',
      'es': '¿Quieres eliminar esta práctica integrativa\n?',
    },
    '8sgjerz2': {
      'pt': 'Não',
      'es': 'No',
    },
    'ikvlos98': {
      'pt': 'Sim',
      'es': 'Sí',
    },
  },
  // alert_warn_delete_modal
  {
    'y3gckv0h': {
      'pt': 'Prática integrativa deletada com sucesso! ',
      'es': '¡Práctica integrativa eliminada con éxito!',
    },
    'gzj73wns': {
      'pt': 'Continuar',
      'es': 'Continuar',
    },
  },
  // event_modal
  {
    '4kexvt5a': {
      'pt': 'Criar um novo evento',
      'es': 'Crear un nuevo evento',
    },
    'w51r43uh': {
      'pt': 'Titulo do Evento',
      'es': 'Título del evento',
    },
    'kin1pvzi': {
      'pt': 'Informaçoes adicionais',
      'es': 'Informaciones adicionales',
    },
    'g8fqdsg5': {
      'pt': 'Consulta',
      'es': 'Consulta',
    },
    'df3c4fug': {
      'pt': 'Ação de rua',
      'es': 'Acción callejera',
    },
    'ilfu870h': {
      'pt': 'Event me insituição',
      'es': 'Evento mi institución',
    },
    '8xsadqhy': {
      'pt': 'Tipo de evento',
      'es': 'tipo de evento',
    },
    'btu3efci': {
      'pt': 'Search for an item...',
      'es': 'Buscar un artículo...',
    },
    'giwd3w1q': {
      'pt': 'Criar',
      'es': 'Crear',
    },
  },
  // alert_event_create_modal
  {
    'd2hu3cpc': {
      'pt': 'Evento criado com ',
      'es': 'Evento creado con',
    },
    'io7kfv3s': {
      'pt': 'sucesso',
      'es': 'éxito',
    },
    'j2a8zv3j': {
      'pt': 'Continuar',
      'es': 'Continuar',
    },
  },
  // turorial_usert_termst_page
  {
    'hie9dsm7': {
      'pt': 'Leia e aceite os termos e condições  da aplicação!',
      'es': '¡Lea y acepte los términos y condiciones de la solicitud!',
    },
    '7mr34nbn': {
      'pt': 'Ok',
      'es': 'DE ACUERDO',
    },
  },
  // turorial_theraphist_07_place_page
  {
    'bry1rat5': {
      'pt':
          'Adicione seu ambient de trabalho para realizar a sua prática integrativa!',
      'es':
          '¡Suma tu ambiente de trabajo para realizar tu práctica integrativa!',
    },
    'oihnblsl': {
      'pt': 'Entendido',
      'es': 'Comprendido',
    },
  },
  // modalSuccessCancel
  {
    '7ol5hybq': {
      'pt': 'Cancelamento concluído',
      'es': 'Cancelación completada',
    },
    'aj93yx15': {
      'pt': 'consulta cancelada',
      'es': 'cita cancelada',
    },
    'rtkquj3h': {
      'pt': 'Tela inicial',
      'es': 'Pantalla de inicio',
    },
  },
  // modalMoreInfo
  {
    '1w7x06u2': {
      'pt': 'Consulta confirmada pelo terapeuta',
      'es': 'Consulta confirmada por el terapeuta.',
    },
    'z4hjz6zw': {
      'pt': 'Taxa de reembolso',
      'es': 'Tasa de reembolso',
    },
    'vg9blb0h': {
      'pt':
          'Em caso de cancelamento após a confirmação da consulta, será efetuado um reembolso de 60% do valor total. Deste montante, 30% serão repassados ao terapeuta e 10% serão retidos pela plataforma, conforme os termos de serviço do aplicativo.',
      'es':
          'En caso de cancelación después de la confirmación de la cita, se realizará una devolución del 60% del importe total. De esta cantidad, el 30% se repercutirá al terapeuta y el 10% lo retendrá la plataforma, de acuerdo con las condiciones de servicio de la aplicación.',
    },
    'rhl1eped': {
      'pt': 'Dúvidas',
      'es': 'Dudas',
    },
    'annuxt3v': {
      'pt': 'Em caso de dúvidas ou lacunas, consulte os termos de serviço.',
      'es':
          'Si tienes alguna duda o laguna, consulta los términos de servicio.',
    },
    'qxfu3khw': {
      'pt': 'Prosseguir com o cancelamento',
      'es': 'Continuar con la cancelación',
    },
    'ixq2o1m2': {
      'pt': 'Voltar',
      'es': 'para volver',
    },
  },
  // coworkig_create_modal
  {
    'torez6go': {
      'pt': 'Criar um coworking',
      'es': 'Crea un espacio de coworking',
    },
    '6cq94di5': {
      'pt': 'Nome do coworking',
      'es': 'Nombre del coworking',
    },
    'z4xv984m': {
      'pt': 'Informaçoes adicionais',
      'es': 'Informaciones adicionales',
    },
    'fh12c8ar': {
      'pt': 'Privativo',
      'es': 'Privado',
    },
    'vxcreuw2': {
      'pt': 'Compartilhado',
      'es': 'Compartido',
    },
    'fne2xy1i': {
      'pt': 'Tipo de cowoking',
      'es': 'tipo de cocina',
    },
    '82eu962q': {
      'pt': 'Search for an item...',
      'es': 'Buscar un artículo...',
    },
    'n5hik2d8': {
      'pt': ' Endereço do Coworking',
      'es': 'dirección de coworking',
    },
    'cdb33jq6': {
      'pt': 'Adicionar imagens do Coworking ',
      'es': 'Añadir imágenes de coworking',
    },
    'iaifikob': {
      'pt': 'Carregar uma imagem',
      'es': 'Subir una imagen',
    },
    'ivd32fyg': {
      'pt': 'Carregar uma imagem',
      'es': 'Subir una imagen',
    },
    'urdvas4o': {
      'pt': 'Carregar uma imagem',
      'es': 'Subir una imagen',
    },
    's285hqyv': {
      'pt': 'Criar',
      'es': 'Crear',
    },
  },
  // alert_create_coworking_modal
  {
    'nrpiovxo': {
      'pt': 'Seu coworking foi criado com sucesso!',
      'es': '¡Tu espacio de coworking ha sido creado con éxito!',
    },
    'edwn9lb2': {
      'pt': 'Continuar',
      'es': 'Continuar',
    },
  },
  // actions_modal
  {
    '0y7lx0dz': {
      'pt': 'O que deseja fazer?',
      'es': '¿Qué es lo que quieres hacer?',
    },
    'lvvtwqnd': {
      'pt': 'Deletar Coworking',
      'es': 'Eliminar coworking',
    },
    'r51y8oz7': {
      'pt': 'Editar Coworking',
      'es': 'Editar coworking',
    },
  },
  // coworkig_update_modal
  {
    '637rkdol': {
      'pt': 'Criar um coworking',
      'es': 'Crea un espacio de coworking',
    },
    'cu5rwrbw': {
      'pt': 'Nome do coworking',
      'es': 'Nombre del coworking',
    },
    '5y8wxhbj': {
      'pt': 'Informaçoes adicionais',
      'es': 'Informaciones adicionales',
    },
    'age92fgh': {
      'pt': 'Privativo',
      'es': 'Privado',
    },
    'scmbrtza': {
      'pt': 'Compartilhado',
      'es': 'Compartido',
    },
    'ouimffp8': {
      'pt': 'Tipo de cowoking',
      'es': 'tipo de cocina',
    },
    'a2yxyk1c': {
      'pt': 'Search for an item...',
      'es': 'Buscar un artículo...',
    },
    '2sdabhvc': {
      'pt': 'Alterar Endereço do Coworking',
      'es': 'Cambiar dirección de coworking',
    },
    '2gpr52zc': {
      'pt': 'Adicionar imagens do Coworking ',
      'es': 'Añadir imágenes de coworking',
    },
    'kaheurrp': {
      'pt': 'Editar a  imagem',
      'es': 'Editar la imagen',
    },
    'eeh0mlxr': {
      'pt': 'Editar a  imagem',
      'es': 'Editar la imagen',
    },
    '054f6m56': {
      'pt': 'Editar a  imagem',
      'es': 'Editar la imagen',
    },
    'c0tkt2xx': {
      'pt': 'Alterar',
      'es': 'alterar',
    },
  },
  // alert_update_coworking_modal
  {
    'wy4mfifz': {
      'pt': 'Seu coworking foi alterado com sucesso!',
      'es': '¡Tu coworking ha sido cambiado con éxito!',
    },
    'gygwxyin': {
      'pt': 'Continuar',
      'es': 'Continuar',
    },
  },
  // alert_delete_coworking_modal
  {
    'mr1bepxc': {
      'pt': 'Seu  coworking foi deletado  com sucesso!',
      'es': '¡Tu espacio de coworking se ha eliminado correctamente!',
    },
    'svl6ewid': {
      'pt': 'Continuar',
      'es': 'Continuar',
    },
  },
  // modalFailed
  {
    'bm0nl94m': {
      'pt': 'Cancelamento não concluído',
      'es': 'Cancelación no completada',
    },
    '7cmh6y2u': {
      'pt': 'Erro no cancelamento',
      'es': 'Error de cancelación',
    },
    'ytwdc28e': {
      'pt': 'Tela inicial',
      'es': 'Pantalla de inicio',
    },
  },
  // cancelSchedule
  {
    'xnucb4it': {
      'pt': 'Cancelar consulta',
      'es': 'Cancelar cita',
    },
    'vi54bp5y': {
      'pt': '1. Consequências',
      'es': '1. Consecuencias',
    },
    '1z82vwr4': {
      'pt':
          'O cancelamento resultará na interrupção imediata do acesso ao nosso serviço e às suas funcionalidades. Todos os dados associados à sua conta podem ser perdidos após o cancelamento.',
      'es':
          'La cancelación resultará en la interrupción inmediata del acceso a nuestro servicio y sus características. Todos los datos asociados con su cuenta pueden perderse tras la cancelación.',
    },
    '1bscqapx': {
      'pt': '2. Taxa',
      'es': '2. Tarifa',
    },
    '3nw5pl97': {
      'pt':
          'Note que será aplicada uma taxa de cancelamento equivalente a 10% sobre o valor da atual consulta. ',
      'es':
          'Tenga en cuenta que se aplicará un cargo de cancelación equivalente al 10% del valor de la consulta actual.',
    },
    'zl033rhm': {
      'pt': 'Confirmar cancelamento',
      'es': 'Confirmar cancelación',
    },
    'sd06gzhn': {
      'pt': 'Voltar',
      'es': 'para volver',
    },
  },
  // erro_moda_refund_theraphist
  {
    'xljwbaqm': {
      'pt':
          'Houve um erro ao recusar o atendimento! Tente novamente mais tarde!',
      'es':
          '¡Hubo un error al rechazar el servicio! ¡Inténtalo de nuevo más tarde!',
    },
    'pmckfbbg': {
      'pt': 'Entendido',
      'es': 'Comprendido',
    },
  },
  // erro_refused_modal
  {
    'iv68669v': {
      'pt':
          'Houve um erro ao cancelar o atendimento! Tente novamente mais tarde!',
      'es':
          '¡Hubo un error al cancelar el servicio! ¡Inténtalo de nuevo más tarde!',
    },
    'wwetvf7s': {
      'pt': 'Entendido',
      'es': 'Comprendido',
    },
  },
  // erro_modal_accept_theraphist
  {
    '9887whhx': {
      'pt':
          'Houve um erro ao confirmar seu atendimento! Tente novamente mais tarde!',
      'es':
          '¡Hubo un error al confirmar tu servicio! ¡Inténtalo de nuevo más tarde!',
    },
    'jra1k7c7': {
      'pt': 'Entendido',
      'es': 'Comprendido',
    },
  },
  // erro_finalized_modal
  {
    'dkkwl9zv': {
      'pt':
          'Houve um erro ao finalizar  o atendimento! Tente novamente mais tarde!',
      'es':
          '¡Hubo un error al completar el servicio! ¡Inténtalo de nuevo más tarde!',
    },
    '61qqmml1': {
      'pt': 'Entendido',
      'es': 'Comprendido',
    },
  },
  // data_bank_modal
  {
    '765uty04': {
      'pt': 'Criar dados bancários',
      'es': 'Crear datos bancarios',
    },
    'r7fpgpdb': {
      'pt': 'Para finalizar o seu cadastro vamos criar os seus dadoa bancários',
      'es': 'Para completar tu registro, crearemos tus datos bancarios',
    },
    'ut16l74f': {
      'pt': 'Digite seu email',
      'es': 'Escribe tu correo electrónico',
    },
    '5o2nu3hp': {
      'pt': 'Seu nome',
      'es': 'Su nombre',
    },
    'wdw8x502': {
      'pt': 'Field is required',
      'es': 'Se requiere campo',
    },
    'xq33jqne': {
      'pt': 'Please choose an option from the dropdown',
      'es': 'Por favor elija una opción del menú desplegable',
    },
    'ai4r6zh0': {
      'pt': 'Finalizar',
      'es': 'Finalizar',
    },
  },
  // confirmDeleteCard
  {
    'lehariv4': {
      'pt': 'Deseja deletar este cartão?',
      'es': '¿Quieres eliminar esta tarjeta?',
    },
    '0zeuuxzu': {
      'pt': 'Cancelar',
      'es': 'Cancelar',
    },
    'ocdcb2ia': {
      'pt': 'Deletar',
      'es': 'Borrar',
    },
  },
  // alert_redirect_modal
  {
    'awyeqzqk': {
      'pt': 'Você precisa concluir o cadastro da conta para continuar!',
      'es': '¡Debes completar el registro de la cuenta para continuar!',
    },
    'tyl5ugvh': {
      'pt': 'Concluir ',
      'es': 'Concluir',
    },
  },
  // alert_erro_register_modal
  {
    '2y21fsx4': {
      'pt':
          'Ops! Tivemos um problema para processar seu cadastro, porfavor tente novamente mais tarde!',
      'es':
          '¡Ups! Tuvimos un problema al procesar su registro, ¡inténtelo nuevamente más tarde!',
    },
    'ix0fodc0': {
      'pt': 'Sair',
      'es': 'Salir',
    },
  },
  // coworkig_create_regiter_modal
  {
    'avpqtgi5': {
      'pt': 'Criar um coworking',
      'es': 'Crea un espacio de coworking',
    },
    '8idainjz': {
      'pt': 'Nome do coworking',
      'es': 'Nombre del coworking',
    },
    '1d4jn5a0': {
      'pt': 'Informaçoes adicionais',
      'es': 'Informaciones adicionales',
    },
    'mj6pi2z3': {
      'pt': 'Privativo',
      'es': 'Privado',
    },
    'wdqcxusm': {
      'pt': 'Compartilhado',
      'es': 'Compartido',
    },
    '6g9xf8ok': {
      'pt': 'Tipo de cowoking',
      'es': 'tipo de cocina',
    },
    'cg63l3k7': {
      'pt': 'Search for an item...',
      'es': 'Buscar un artículo...',
    },
    'x1t1s0tq': {
      'pt': 'Buscar Endereço do Coworking',
      'es': 'Buscar dirección de coworking',
    },
    'hgqj59zj': {
      'pt': 'Adicionar imagens do Coworking ',
      'es': 'Añadir imágenes de coworking',
    },
    'uqwysfex': {
      'pt': 'Carregar uma imagem',
      'es': 'Subir una imagen',
    },
    'jjfs3x77': {
      'pt': 'Carregar uma imagem',
      'es': 'Subir una imagen',
    },
    'ifz1x89e': {
      'pt': 'Carregar uma imagem',
      'es': 'Subir una imagen',
    },
    'ajbou9hp': {
      'pt': 'Criar',
      'es': 'Crear',
    },
  },
  // alert_create_coworking_register_modal
  {
    'qpt3d9dv': {
      'pt': 'Seu coworking foi criado com sucesso!',
      'es': '¡Tu espacio de coworking ha sido creado con éxito!',
    },
    'h14c7yzy': {
      'pt': 'Continuar',
      'es': 'Continuar',
    },
  },
  // actions_event_modal
  {
    'ra1xbac2': {
      'pt': 'Deletar evento?',
      'es': '¿Eliminar evento?',
    },
    'uswmlalj': {
      'pt': 'Cancelar',
      'es': 'Cancelar',
    },
    'dz6q8102': {
      'pt': 'Sim',
      'es': 'Sí',
    },
  },
  // alert_event_delete_modal
  {
    'oj1jfj4f': {
      'pt': 'Evento deletado com ',
      'es': 'Evento eliminado con',
    },
    'v1n74mb3': {
      'pt': 'sucesso',
      'es': 'éxito',
    },
    '7qw76vbf': {
      'pt': 'Continuar',
      'es': 'Continuar',
    },
  },
  // actions_users_modal
  {
    'i79kxwq1': {
      'pt': 'Deletar usuário?',
      'es': '¿Borrar usuario?',
    },
    'bbb4akfq': {
      'pt': 'Cancelar',
      'es': 'Cancelar',
    },
    'psnq4274': {
      'pt': 'Deletar ',
      'es': 'Borrar',
    },
  },
  // modal_languge
  {
    '42fh5j31': {
      'pt': 'Selecione um idioma',
      'es': 'Selecciona un idioma',
    },
    '51hhxfrr': {
      'pt': 'Continuar',
      'es': 'Continuar',
    },
  },
  // Miscellaneous
  {
    'tyrfq7ew': {
      'pt': '',
      'es': '',
    },
    'jc5ejz39': {
      'pt': '',
      'es': '',
    },
    'dncvgii1': {
      'pt': '',
      'es': '',
    },
    'ui8turdu': {
      'pt': '',
      'es': '',
    },
    'apgg01of': {
      'pt': '',
      'es': '',
    },
    '6m3uxmk3': {
      'pt': '',
      'es': '',
    },
    'e9u1v67s': {
      'pt': '',
      'es': '',
    },
    'xs3vrbnn': {
      'pt': '',
      'es': '',
    },
    'dlfa01ww': {
      'pt': '',
      'es': '',
    },
    'z8kuo388': {
      'pt': '',
      'es': '',
    },
    'dvmvb0tu': {
      'pt': '',
      'es': '',
    },
    'zmgbohf2': {
      'pt': '',
      'es': '',
    },
    'iaubx6ml': {
      'pt': '',
      'es': '',
    },
    '2zhhvh14': {
      'pt': '',
      'es': '',
    },
    'qslflf1n': {
      'pt': '',
      'es': '',
    },
    'z3yiv2i4': {
      'pt': 'Enviando o seu arquivo',
      'es': 'Subiendo tu archivo',
    },
    'bevqzq9n': {
      'pt': 'Arquivo carregado com sucesso',
      'es': 'El archivo ha subido correctamente',
    },
    '2d0ifk5b': {
      'pt': 'Falha no envio do arquivo',
      'es': 'Error al enviar el archivo',
    },
    'auzltnat': {
      'pt': '',
      'es': '',
    },
    'i1zf0b9w': {
      'pt': '',
      'es': '',
    },
    'r4h9xw3o': {
      'pt': '',
      'es': '',
    },
    'q3g6x3me': {
      'pt': '',
      'es': '',
    },
    'ncgebj2o': {
      'pt': '',
      'es': '',
    },
    '8pygtfy1': {
      'pt': '',
      'es': '',
    },
    'a20hxncq': {
      'pt': '',
      'es': '',
    },
    'jawmk62i': {
      'pt': '',
      'es': '',
    },
    '8u4z3w3g': {
      'pt': '',
      'es': '',
    },
    'zwc218h2': {
      'pt': '',
      'es': '',
    },
  },
].reduce((a, b) => a..addAll(b));
