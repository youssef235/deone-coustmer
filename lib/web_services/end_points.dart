const baseUrl = "https://t8nat.cloud/api";

class EndPoints {

  static const login = "/login?type=customer";
  static const register = "/register";
  static const otpLogin = "/authorize-phone-login";
  static const otpRegister = "/authorize-phone-register";
  static const user = "/me";
  static const allServices = "/services";
  static const getDistricts = "/get-districts";
  static const slides = "/slides-show";
  static const requestService = "/projects";
  static const getUserNotification = "/user-notifications";

  static const updateUser = "/update-customer-info";
  static const rateProvider = "/create-review";
  static getReviews({required int id}) => "/get-provider-reviews/$id";
  static proposals({required int id}) => "/active-proposals/$id";
  static projects({required String status}) => "/customer-projects?rows=20&status=$status";
  static getProposal({required int id}) => "/single-proposal/$id";

  static updateProject({required int id}) => "/projects/$id";

  static refuseProposals({required int id}) => "/proposal/refuse/$id";
  static cancelProposals({required int id}) => "/proposal/cancel/$id";
  static acceptProposals({required int id}) => "/proposal/accept/$id";
  static getInvoice() => "/get-invoice";
  static createPayment({required int invoiceId}) => "/create-payment/$invoiceId";
  static getInvoicePdf({required int invoiceId}) =>
      "/get-invoice-pdf/$invoiceId";
  static const paymentsApprove = "/payments";
  static const moyasar_payment = "/create-review";
  static const settings = "/get-settings";
}
