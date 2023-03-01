%%%-------------------------------------------------------------------
%% @doc apka public API
%% @end
%%%-------------------------------------------------------------------

-module(apka_app).

-behaviour(application).

-export([start/2, stop/1]).

start(_StartType, _StartArgs) ->
    apka_sup:start_link().

stop(_State) ->
    ok.

%% internal functions
