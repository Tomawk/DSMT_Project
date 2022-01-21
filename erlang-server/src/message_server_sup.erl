-module(message_server_sup).
-behaviour(supervisor).
%% API
-export([init/1]).
-include("chat.hrl").

start_link() ->
  supervisor:start_link({local, ?MODULE}, ?MODULE, []).

init([]) ->
  ServerSpec =  {?SERVER,
    {?SERVER, start_link, []},
    permanent, 5000, worker, [?SERVER]},

  ChildSpecs = [ServerSpec],

  ok = supervisor:check_childspecs(ChildSpecs),
  StartSpecs = {{one_for_one, 5, 10}, ChildSpecs},
  {ok, StartSpecs}.