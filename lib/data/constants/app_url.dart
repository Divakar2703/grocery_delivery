class AppUrl{

  //{"user_id":"Delivery100","type":"Assign Orders"}
  // static var baseUrl ="https://deliveryboy.56testing.club/" ;
  static var baseUrl ="https://delivery.gotejaga.com/" ;

  //Grocery Api
  static var phoneNumberUrl ="${baseUrl}Phone-login";
  static var sendOtpUrl="${baseUrl}sendotp";
  static var verifyOtpUrl="${baseUrl}Verifyotp";
  static var registerUrl="${baseUrl}register";
  static var updatedLocationUrl="${baseUrl}Update_location";
  static var onlineOfflineUrl="${baseUrl}delivery_online_offline";
  static var indextPageCountUrl="${baseUrl}indextpage-count";
  static var orderListUrl= "${baseUrl}orderlist";
  static var profileUpdateUrl= "${baseUrl}profiledata_update";


  //9668289927
  static var profileImageUpdateUrl= "${baseUrl}profileimage_update";
  static var profileGetUrl= "${baseUrl}profile_data";
  static var acceptOrder= "${baseUrl}accept_order";
  static var rejectOrder= "${baseUrl}reject_order";
  static var cancelOrder= "${baseUrl}cancel_order";
  static var returnOrder= "${baseUrl}retrun_order";
  static var returnOrderCheckOtp= "${baseUrl}check_otp_for_retrun";
  static var deliveredOrderGetOtp= "${baseUrl}delivered_order";
  static var checkdeliveredOtp= "${baseUrl}check_otp_for_deliveroredr";
  static var codSummaryListUrl= "${baseUrl}delivery_cod_summary";
  static var walletSummaryListUrl= "${baseUrl}delivery_wallet_summary";
  static var notificationListUrl= "${baseUrl}deliveryboy_notification";
  static var clearAllNotificationUrl= "${baseUrl}clearall_notification";

  //food Api
  static var orderListFoodUrl= "${baseUrl}foodorderlist";
  static var acceptFoodOrder= "${baseUrl}foodaccept_order";
  static var rejectFoodOrder= "${baseUrl}foodreject_order";
  static var cancelFoodOrder= "${baseUrl}foodcancel_order";
  static var returnFoodOrder= "${baseUrl}foodretrun_order";
  static var returnOrderFoodCheckOtp= "${baseUrl}foodcheck_otp_for_retrun";
  static var deliveredOrderFoodGetOtp= "${baseUrl}fooddelivered_order";
  static var checkDeliveredFoodOtp= "${baseUrl}foodcheck_otp_for_deliveroredr";
  static var codFoodSummaryListUrl= "${baseUrl}fooddelivery_cod_summary";
  static var walletFoodSummaryListUrl= "${baseUrl}fooddelivery_wallet_summary";

  //payment gateway
  static var getPayTypeUrl= "${baseUrl}Api/Api_deliveryboy/get_payType";
  static var submitOrderCollUrl= "${baseUrl}Api/Api_deliveryboy/get_ordCollection";


}