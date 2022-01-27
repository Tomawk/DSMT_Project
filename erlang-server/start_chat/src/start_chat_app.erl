%%%-------------------------------------------------------------------
%% @doc start_chat public API
%% @end
%%%-------------------------------------------------------------------

-module(start_chat_app).

-behaviour(application).

-export([start/2, stop/1]).

start(_StartType, _StartArgs) ->
    start_chat_sup:start_link().

stop(_State) ->
    ok.

%% internal functions
