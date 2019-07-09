const baseUrl = "https://db.ygoprodeck.com/";

class API {
  String getUrlCardInfo() {
    var urlCardInfo = '${baseUrl}api/v5/cardinfo.php?num=10';
    return urlCardInfo;
  }
}
