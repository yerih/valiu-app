

class CardHome {
  static String getImagePath(int index) {
    switch(index % 4) {
      case 0: return 'assets/images/card_home0.png';
      case 1: return 'assets/images/card_home1.png';
      case 2: return 'assets/images/card_home2.png';
      case 3: return 'assets/images/card_home3.png';
      default: return 'assets/images/default.jpg';
    }
  }



}




