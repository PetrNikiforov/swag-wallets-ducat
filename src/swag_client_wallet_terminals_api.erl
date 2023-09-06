%% -*- mode: erlang -*-
-module(swag_client_wallet_terminals_api).

%% generated methods

-export([get_terminal_account/2]).
-export([get_terminal_account/3]).


-spec get_terminal_account(Endpoint :: swag_client_wallet:endpoint(), Params :: map()) ->
    {ok, Code :: integer(), RespHeaders :: list(), Response :: map()} |
    {error, _Reason}.
get_terminal_account(Endpoint, Params) ->
    get_terminal_account(Endpoint, Params, []).

-spec get_terminal_account(Endpoint :: swag_client_wallet:endpoint(), Params :: map(), Opts :: swag_client_wallet:transport_opts()) ->
    {ok, Code :: integer(), RespHeaders :: list(), Response :: map()} |
    {error, _Reason}.
get_terminal_account(Endpoint, Params, Opts) ->
    process_response(swag_client_wallet_procession:process_request(
        get,
        swag_client_wallet_utils:get_url(Endpoint, "/wallet/v0/terminals/:terminalID/account"),
        Params,
        get_request_spec(get_terminal_account),
        Opts
    ), get_terminal_account).

process_response({ok, Code, Headers, RespBody}, OperationID) ->
    try swag_client_wallet_procession:process_response(
        get_response_spec(OperationID, Code),
        RespBody
    ) of
        {ok, Resp} ->
            {ok, Code, Headers, Resp};
        Error ->
            Error
    catch
        error:invalid_response_code ->
            {error, {invalid_response_code, Code}}
    end;
process_response(Error, _) ->
    Error.


-spec get_request_spec(OperationID :: swag_client_wallet:operation_id()) ->
    Spec :: swag_client_wallet_procession:request_spec() | no_return().


get_request_spec('get_terminal_account') ->
    [
        {'X-Request-ID', #{
            source => header,
            rules  => [{type, 'binary'}, {max_length, 32}, {min_length, 1}, true
, {required, true}]
        }},
        {'terminalID', #{
            source => binding,
            rules  => [{type, 'binary'}, {max_length, 40}, {min_length, 1}, true
, {required, true}]
        }},
        {'X-Request-Deadline', #{
            source => header,
            rules  => [{type, 'binary'}, {max_length, 40}, {min_length, 1}, true
, {required, false}]
        }}
    ].

-spec get_response_spec(OperationID :: swag_client_wallet:operation_id(), Code :: swag_client_wallet_procession:code()) ->
    Spec :: swag_client_wallet_procession:response_spec() | no_return().


get_response_spec('get_terminal_account', 200) ->
    {'TerminalAccount', 'TerminalAccount'};

get_response_spec('get_terminal_account', 400) ->
    {'BadRequest', 'BadRequest'};

get_response_spec('get_terminal_account', 401) ->
    undefined;

get_response_spec('get_terminal_account', 404) ->
    undefined;

get_response_spec(_, _) ->
    error(invalid_response_code).
