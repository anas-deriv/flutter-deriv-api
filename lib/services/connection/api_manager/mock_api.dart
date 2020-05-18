import 'dart:async';
import 'dart:convert';
import 'package:meta/meta.dart';

import 'package:flutter_deriv_api/api/models/enums.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.helper.dart';
import 'package:flutter_deriv_api/basic_api/request.dart';
import 'package:flutter_deriv_api/basic_api/response.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/exceptions/api_manager_exception.dart';
import 'package:flutter_deriv_api/services/connection/call_manager/base_call_manager.dart';

import 'mock_data/account/authorize_response.dart';
import 'mock_data/account/balance_response.dart';
import 'mock_data/account/copy_trading_list_response.dart';
import 'mock_data/account/copy_trading_statistics_response.dart';
import 'mock_data/account/get_account_status_response.dart';
import 'mock_data/account/get_limits_response.dart';
import 'mock_data/account/get_settings_response.dart';
import 'mock_data/account/portfolio_response.dart';
import 'mock_data/account/set_account_currency_response.dart';
import 'mock_data/account/set_settings_response.dart';
import 'mock_data/app/app_delete_response.dart';
import 'mock_data/app/app_details_response.dart';
import 'mock_data/app/app_list_response.dart';
import 'mock_data/app/app_markup_details_response.dart';
import 'mock_data/app/app_register_response.dart';
import 'mock_data/app/app_update_response.dart';
import 'mock_data/app/new_account_real_response.dart';
import 'mock_data/app/new_account_virtual_response.dart';
import 'mock_data/app/oauth_apps_response.dart';
import 'mock_data/app/revoke_oauth_app_response.dart';
import 'mock_data/cashier/cashier_information_response.dart';
import 'mock_data/common/active_symbols_response.dart';
import 'mock_data/common/exchange_rates_response.dart';
import 'mock_data/common/forget_all_response.dart';
import 'mock_data/common/forget_response.dart';
import 'mock_data/common/ping_response.dart';
import 'mock_data/common/server_time_response.dart';
import 'mock_data/common/tick_response.dart';
import 'mock_data/common/trading_durations_response.dart';
import 'mock_data/common/trading_times_response.dart';
import 'mock_data/contract/buy_contract_response.dart';
import 'mock_data/contract/cancel_response.dart';
import 'mock_data/contract/contract_for_response.dart';
import 'mock_data/contract/contract_update_history_response.dart';
import 'mock_data/contract/contract_update_response.dart';
import 'mock_data/contract/proposal_open_contract_response.dart';
import 'mock_data/contract/proposal_response.dart';
import 'mock_data/contract/sell_response.dart';
import 'mock_data/contract/transaction_response.dart';
import 'mock_data/mt5/mt5_deposit_response.dart';
import 'mock_data/mt5/mt5_login_list_response.dart';
import 'mock_data/mt5/mt5_new_account_response.dart';
import 'mock_data/mt5/mt5_password_change_response.dart';
import 'mock_data/mt5/mt5_password_check_response.dart';
import 'mock_data/mt5/mt5_password_reset_response.dart';
import 'mock_data/mt5/mt5_settings_response.dart';
import 'mock_data/mt5/mt5_withdrawal_response.dart';
import 'mock_data/p2p/p2p_advert_create_response.dart';
import 'mock_data/p2p/p2p_advert_info_response.dart';
import 'mock_data/p2p/p2p_advert_list_response.dart';
import 'mock_data/p2p/p2p_advert_update_response.dart';
import 'mock_data/p2p/p2p_advertiser_adverts_response.dart';
import 'mock_data/p2p/p2p_advertiser_create_response.dart';
import 'mock_data/p2p/p2p_advertiser_info_response.dart';
import 'mock_data/p2p/p2p_advertiser_update_response.dart';
import 'mock_data/p2p/p2p_chat_create_response.dart';
import 'mock_data/user/get_financial_assessment_response.dart';
import 'mock_data/user/set_financial_assessment_response.dart';
import 'mock_data/user/tnc_approval_response.dart';
import 'mock_data/user/verify_email_response.dart';

/// Handle mock API calls
class MockAPI implements BaseAPI {
  static const int _responseDelayMilliseconds = 50;

  @override
  Future<Response> call({
    @required Request request,
  }) =>
      _getFutureResponse(request);

  @override
  Stream<Response> subscribe({
    @required Request request,
    RequestCompareFunction comparePredicate,
  }) =>
      _getStreamResponse(request);

  @override
  Future<ForgetResponse> unsubscribe({
    @required String subscriptionId,
    bool shouldForced = false,
  }) async =>
      const ForgetResponse(forget: 1);

  @override
  Future<ForgetAllResponse> unsubscribeAll({
    @required ForgetStreamType method,
    bool shouldForced = false,
  }) async =>
      null;

  @override
  void addToChannel({Map<String, dynamic> request}) {}

  @override
  Future<void> close() async => true;

  Future<Response> _getFutureResponse(Request request) async =>
      Future<Response>.delayed(
        const Duration(milliseconds: _responseDelayMilliseconds),
        () => getResponseByMsgType(
          jsonDecode(_getResponse(request.msgType)),
        ),
      );

  Stream<Response> _getStreamResponse(Request request) =>
      Stream<Response>.periodic(
        const Duration(milliseconds: _responseDelayMilliseconds),
        (int computationCount) => getResponseByMsgType(
          jsonDecode(_getResponse(request.msgType)),
        ),
      );

  String _getResponse(String method) {
    switch (method) {
      case 'active_symbols':
        return activeSymbolsResponse;
      // case 'api_token':
      case 'app_delete':
        return appDeleteResponse;
      case 'app_get':
        return appDetailsResponse;
      case 'app_list':
        return appListResponse;
      case 'app_markup_details':
        return appMarkupDetailsResponse;
      case 'app_register':
        return appRegisterResponse;
      case 'app_update':
        return appUpdateResponse;
      // case 'asset_index':
      case 'authorize':
        return authorizeResponse;
      case 'balance':
        return balanceResponse;
      // case 'buy_contract_for_multiple_accounts':
      case 'buy':
        return buyContractResponse;
      case 'cancel':
        return cancelResponse;
      case 'cashier':
        return cashierInformationResponse;
      case 'contract_update_history':
        return contractUpdateHistoryResponse;
      case 'contract_update':
        return contractUpdateResponse;
      case 'contracts_for':
        return contractForResponse;
      // case 'copy_start':
      // case 'copy_stop':
      case 'copytrading_list':
        return copyTradingListResponse;
      case 'copytrading_statistics':
        return copyTradingStatisticsResponse;
      // case 'document_upload':
      case 'exchange_rates':
        return exchangeRatesResponse;
      case 'forget_all':
        return forgetAllResponse;
      case 'forget':
        return forgetResponse;
      case 'get_account_status':
        return getAccountStatusResponse;
      case 'get_financial_assessment':
        return getFinancialAssessmentResponse;
      case 'get_limits':
        return getLimitsResponse;
      // case 'get_self_exclusion':
      case 'get_settings':
        return getSettingsResponse;
      // case 'landing_company_details':
      // case 'landing_company':
      // case 'login_history':
      // case 'logout':
      case 'mt5_deposit':
        return mt5DepositResponse;
      case 'mt5_get_settings':
        return mt5SettingsResponse;
      case 'mt5_login_list':
        return mt5LoginListResponse;
      case 'mt5_new_account':
        return mt5NewAccountResponse;
      case 'mt5_password_change':
        return mt5PasswordChangeResponse;
      case 'mt5_password_check':
        return mt5PasswordCheckResponse;
      case 'mt5_password_reset':
        return mt5PasswordResetResponse;
      case 'mt5_withdrawal':
        return mt5WithdrawalResponse;
      case 'new_account_maltainvest':
      case 'new_account_real':
        return newAccountRealResponse;
      case 'new_account_virtual':
        return newAccountVirtualResponse;
      case 'oauth_apps':
        return oauthAppsResponse;
      case 'p2p_advert_create':
        return p2pAdvertCreateResponse;
      case 'p2p_advert_info':
        return p2pAdvertInfoResponse;
      case 'p2p_advert_list':
        return p2pAdvertListResponse;
      case 'p2p_advert_update':
        return p2pAdvertUpdateResponse;
      case 'p2p_advertiser_adverts':
        return p2pAdvertiserAdvertsResponse;
      case 'p2p_advertiser_create':
        return p2pAdvertiserCreateResponse;
      case 'p2p_advertiser_info':
        return p2pAdvertiserInfoResponse;
      case 'p2p_advertiser_update':
        return p2pAdvertiserUpdateResponse;
      case 'p2p_chat_create':
        return p2pChatCreateResponse;
      // case 'p2p_order_cancel':
      // case 'p2p_order_confirm':
      // case 'p2p_order_create':
      // case 'p2p_order_info':
      // case 'p2p_order_list':
      // case 'paymentagent_list':
      // case 'paymentagent_transfer':
      // case 'paymentagent_withdraw':
      // case 'payout_currencies':
      case 'ping':
        return pingResponse;
      case 'portfolio':
        return portfolioResponse;
      // case 'profit_table':
      // case 'proposal_array':
      case 'proposal_open_contract':
        return proposalOpenContractResponse;
      case 'proposal':
        return proposalResponse;
      // case 'reality_check':
      // case 'residence_list':
      case 'revoke_oauth_app':
        return revokeOauthAppResponse;
      // case 'sell_contract_for_multiple_accounts':
      // case 'sell_expired':
      case 'sell':
        return sellResponse;
      case 'set_account_currency':
        return setAccountCurrencyResponse;
      case 'set_financial_assessment':
        return setFinancialAssessmentResponse;
      // case 'set_self_exclusion':
      case 'set_settings':
        return setSettingsResponse;
      // case 'statement':
      // case 'states_list':
      // case 'history':
      case 'ticks':
        return tickResponse;
      case 'time':
        return serverTimeResponse;
      case 'tnc_approval':
        return tncApprovalResponse;
      // case 'topup_virtual':
      case 'trading_durations':
        return tradingDurationsResponse;
      case 'trading_times':
        return tradingTimesResponse;
      case 'transaction':
        return transactionResponse;
      // case 'transfer_between_accounts':
      case 'verify_email':
        return verifyEmailResponse;
      // case 'website_status':

      default:
        throw APIManagerException(
          message: 'message type \'$method\' not found.',
        );
    }
  }
}