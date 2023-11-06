import 'dart:ui';

class Constant  {
  static const baseURL="https://tender-chandrasekhar.38-100-170-33.plesk.page/";
  static const user="User/";
  static const group="Group/";

  static  String getMessages (int adID,int userID,int otherUserID) {
    return  "https://keen-clarke.38-100-170-33.plesk.page/AdMessage/GetAdMessagesDetailsByAdId?adId=${adID}&userId=${userID}&otherUserId=${otherUserID}";

  }

  static const loginBeforKey = 'isLoginBefor';
  static const userSFKey = 'user';

}



class appDesign {

  static const colorPrimary=Color(0xff030F2E);
  static const colorPrimaryDark=Color(0xff0A4D68);
  static const colorPrimaryLight=Color(0xfff6f6f6);
  static const colorAccent=Color(0xff088395);
  static const colorUnhighlighted=Color(0xff818796);
  static const backGround=Color(0xffffffff);
  static const greyBackground=Color(0xffF5F5F5);

}




class UserData{
  static String language= 'ar';
  static String userNumber = "";
  static String  userName = "";
  static String deviceToken="";
  static int  userId = 0;
  static int  userType = 0;


}
