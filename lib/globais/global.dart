library my_prj.globals;

bool isLoggedIn = false;
bool isDeviceConn = false;

String nameUser = '';
String IdNofication = '';

String urlBases = 'http://177.67.209.160:21465';
// String urlBases = 'localhost:7002';
String patchToken = '/rest/api/oauth2/v1/token';
String patchAtendimento = '/rest/APILiberacao/todos';
String urlnotif = '/rest/APISaveConfiguration/adicionar';
//String urlnotif = urlBases + '/webhook';
