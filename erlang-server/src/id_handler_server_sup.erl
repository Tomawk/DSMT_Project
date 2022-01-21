-module(id_handler_server_sup).
-behaviour(supervisor).
%% API
-export([start_link/0, init/1]).
-include("chat.hrl").

start_link() ->
  supervisor:start_link({local, ?MODULE}, ?MODULE, []).

init([]) ->

  ID_handler =  {?ID_HANDLER,
    {?ID_HANDLER, start_link, []},
    permanent, 1000, worker, [?ID_HANDLER]},

  ChildSpecs = [ID_handler],

  ok = supervisor:check_childspecs(ChildSpecs),
  StartSpecs = {{one_for_one, 60, 3600}, ChildSpecs},
  {ok, StartSpecs}.
