class AppUrl {

// base url
  //static const String baseurl = 'https://hplusmedcare.et.r.appspot.com';
  static const String baseurl = 'https://hplusmedcaretest-server.onrender.com';


// login
  static const String login = '$baseurl/hserver/auth/login';

// login
  static const String signup = '$baseurl/hserver/auth/register';

// userinfo
  static const String userinfo = '$baseurl/hserver/auth/current';

// all medicines
  static const String medicineurl = '$baseurl/hserver/medicine';

// cart url
  static const String carturl = '$baseurl/hserver/cart';

//init cart url
  static const String initcarturl = '$baseurl/hserver/cart/initcart';

// address url
  static const String addressurl = '$baseurl/hserver/user/address';

//init address url
  static const String initaddressurl = '$baseurl/hserver/user/initaddress'; 
    
// order url
  static const String orderurl = '$baseurl/hserver/order';

//init order
  static const String initorderurl = '$baseurl/hserver/order/initOrder';

}