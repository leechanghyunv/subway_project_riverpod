// Package imports:
import 'package:gsheets/gsheets.dart';

class GoogleSheetsData {
  static const _credentials = r'''
{
  "type": "service_account",
  "project_id": "subwayproject230523",
  "private_key_id": "47afb1541c075bfa83efb343a8a382e66c564f80",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQC7OVdcEeGr+upt\nQST4s3TfUKGggnRx11e7JNl6Uu8U0wpOwvYCLvTQPk6OMouiWEIsf/MXnnfWlfUH\nJ97QxV0HN0cODMJwhj+9iZhhiU+bhLE0cgOr3gekA/RjF458OuNIU9nvYY83D3R1\nMqApgeKrYHdxo5horch/Ww79pmbr2nf8wevVJhcsvgQHDIUx8jCasGRjYql1M08e\nl20Dn0m7WtxE9NIl2c2EdeMNs8ECeFUe804BEsS19zlcRUYZb1/0fF/BBjFHmRSE\nsODy5aZ0hFmc3RfuZqHyy61OFRwX5ZnTtsv7HKs9CQf1/rbEg7h3Nqo4HNtGPFOz\n7LnQcnfrAgMBAAECggEABexL0I8wQy9Do1k1ljih2z7DHj+CTOex0Csw8NHBho3L\n/FnmoS24c64aRh1glYOSnwhyjwNlvyrXVEv1R0g3J+Hzztn7J3GCgA3jqDzz1nOy\n4iSJQTKxAzCs1psJgvH0psvK+pZs4CJjs3bP4lWdmiu0cP/qnm/WW/vBfvzOB2q/\n8zm3dFXCOQYccGiMfvce/dbtBJJWlpT/RpvQS2ZJLPhXbZDFOtRmq6X0+jfe/YCb\nawvhr49nKzIGM6JCcmonf+jmPkiD5zwC981NisqwyyX/qwg+cKSw8a+4vs95XFT8\nsgspAZw5gY9TIikwPc1Ea6A7006DtUdfe3pDkoN8wQKBgQD9jQVeda2aLRu/JLdw\n/QRfThs1o6is31Wa2GR2efwk84lWxJm40EBZRFq619I5L8OG2T0drGU7odFw7U0d\nv6VytFHNGJhoipBRQyIVHL/5Qq/gE7u+TnQSnnG6Rc3PHimYPZF75F3uhiJRZ82Z\n/c4AjW5u05AZEtiD2UPVAsfFmQKBgQC9CE6+A8lVzWFjhgR2jQ2tyPiYgOrSKW0I\nSMfsl6Q5naaA/ExEMAbpoCwzjF8oqW8Nsp5kQhrXnaGTtjKCUfoXeGuqTQw3uueQ\nkq/itVtlrsTQ/d0tEKluxLYr2KxczdFIANgNz/d6pFwsaXCHFl6E7qPqnbeE+9u7\nvx2Ru9aUIwKBgDncsNj5qgCBQs/AJUzXsOO/A16eVqP846BOub5/4BberPzsKNiQ\nTd8RRlNVZVg/mjNv6A6ZhRCywQUwYmTjk3I1zGUts7pHxN+GnoSK5xSPL2vHlRS8\n+qg1GGcV/v3BOGTRyB2p4/XHDpXdRoJZ9WUS4ZzRExVlw5tzPZOi6swhAoGAAqmK\nSlzNShsRYxBxIaZM6gSpk6RFKl6Q/Yvg3PEpy/HvdWOYQ2GVx1aNKNCySmVQfhXk\n6y6PKDg9HVJ0ladH6Wq1wXlCUcqdFkkqlvvM5Lq4ZOUeZ1MTv86fbjCoBMqVRvlU\nEaW7K4wDDFET16M2A5NE1boQ6puNdbB0XygRFpcCgYAAiF4vg5ZlR+thDpaFChUS\nqHwG7pY8XGq64r2Ve5YzvpS1rX5OF6b+6L2Fij07mAn8bJ6VZf6+WbjyXkAg6H0E\nKoh5SSIPlkCgWJKNxGj25Q2+ZPcYXZqgvWPeVfBTRfkco4xpwzFBJnscIyfy7uYQ\nYMp+AGreoiqMzB59uDFFgg==\n-----END PRIVATE KEY-----\n",
  "client_email": "subway-project-230523@subwayproject230523.iam.gserviceaccount.com",
  "client_id": "111779289118817748275",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/subway-project-230523%40subwayproject230523.iam.gserviceaccount.com",
  "universe_domain": "googleapis.com"
}
''';

  static const _spreadsheetId = '18w_0V7VAoi7A09Q2nepo2Szz4LC4xjbgtasjwirYlzA';
  static final _gsheets = GSheets(_credentials);
  static Worksheet? _userSheet;
  static Worksheet? _infoSheet;

  static Future init() async {
    try{
      final ss = await _gsheets.spreadsheet(_spreadsheetId);
      _userSheet = await _getWorkSheet(ss, title: 'worksheets1');
      // _infoSheet = await _getWorkSheet(ss, title: 'subwayinfo');
      print(_infoSheet?.values.rowByKey(0));
    }catch(e){
      print('Init Error: $e');
    }

  }

  static Future<Worksheet> _getWorkSheet(
      Spreadsheet ss,
      {required String title,}) async {
    try{
      return await ss.addWorksheet(title);
    } catch(e){
      return ss.worksheetByTitle(title)!;
    }
  }

  static Future insert(List<Map<String, dynamic>> rowList) async {
    if(_userSheet == null) return;

    _userSheet!.values.map.appendRows(rowList);
  }

  static Future<int> rowcount () async {
    if(_userSheet == null) return 0;
    final lastrow = await _userSheet!.values.lastRow();
    return lastrow == null
        ? 0
        : int.tryParse(lastrow.first) ?? 0;
  }

  static Future<Object?> getname (String name) async {
    if(_userSheet == null) return '';
    final names = await _userSheet!.values.allRows();
    return names;
  }

  static Future<Object?> viewRow () async {
    if(_userSheet == null) return '';
    final names = await _userSheet!.values.row(3);
    print(names);
    return names;
  }

}
