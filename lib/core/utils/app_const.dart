class APIconst {
  static String baseUrl = 'https://malak.areej.aait-d.com/api';
  static const verify = 'client/auth/verify';
  static const passwordVerify = 'client/password/verify';

  static const resend = 'client/auth/send';
  static const forgetPassword = 'client/password/forget';
  static const login = 'client/auth/login';
  static const register = 'client/auth/register';
  static const loginGuest = 'client/auth/login-as-guest';
  static const resetPassword = 'client/password/reset';
  static const logout = 'client/logout';
  static const wallet = 'client/wallet';
  static const walletPayment = 'payment/wallet';
  static const walletCharge = 'payment/wallet/charge';
  static const loyaltyTransactions = 'client/loyalty/transactions';
  static const rateOrder = 'client/ratings/orders';
  static String walletDetails(String walletId) => 'client/wallet/$walletId';
  static const mosques = 'general/mosques';
  static const countries = 'general/countries';
  static const cities = 'general/cities';

  static const notificationsList = 'general/notifications';
  static const products = 'general/catalog/products';
  static const subCategories = 'general/catalog/sub-categories';
  static const searchHistories = 'general/search-histories';
  static const favorites = 'general/favorites';
  static const toggleFavorite = 'general/favorites/toggle';
  static const messages = 'client/messages';

  static const profile = 'client/profile';
  static const profileSendOtp = 'client/profile/send/otp';
  static const profileUpdateAuth = 'client/profile/update/auth';
  static const profileUpdatePassword = 'client/profile/update-password';
  static const profileNotificationSwitch = 'client/profile/notification/switch';
  static const profileLanguageSwitch = 'client/profile/language/switch';
  static const contactUs = 'general/pages/contact';
  static const profileDeleteAccount = 'client/profile/delete/account';
  static const appPages = 'general/pages/page';
  static const generalAttachment = 'general/attachment';

  static const stores = 'general/stores';

  static const home = 'general/home';

  static const methodsMyfatoorah = 'payment/methods/myfatoorah';

  static String membershipCancel(String membershipId) => 'client/memberships/$membershipId/leave';

  static const updateChecker = 'api/v1/app-update/by-domain-type';
  static const membershipsJoin = 'client/memberships/join';
  static const couponScan = 'client/coupon/scan';
  static const cartAdd = 'general/cart/add';
  static const cartQuantity = 'general/cart/quantity';
  static const cart = 'client/cart';
  static const cartItems = 'client/cart/items';
  static String cartItem(String id) => 'client/cart/items/$id';
  static const cartMosque = 'general/cart/mosque';
  static const checkout = 'client/orders/checkout';
  static const orders = 'client/orders';
  static const requests = 'client/service-requests';
  static const categories = 'general/categories';
  static const districts = 'general/districts';
  static const addresses = 'client/addresses';
  static const serviceRequests = 'client/service-requests';

  static const clearSearchHistories = 'general/search-histories/clear';

  static const services = 'general/services';
  static String address(String id) => 'client/addresses/$id';
  static String addressDefault(String id) => 'client/addresses/$id/default';

  static String getServiceForm(String serviceId) => 'general/services/$serviceId/form-fields';

  // static String couponScan;
}
