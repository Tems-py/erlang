-module(apka_srv).
-behaviour(gen_server).

-export([start_link/0]).

-export([init/1, handle_call/3, handle_cast/2, service/0, service/3]).

start_link() ->
    gen_server:start_link({local, ?MODULE}, ?MODULE, [], []).

init([]) ->
    io:format("Started serevr"),
    {ok, started}.

handle_call(Args, From, OldState) ->
    io:format("A: ~p~nB: ~p~nC: ~p~n", [Args, From, OldState]),
    io:format("Recived"),
    A = lists:nth(2, Args),
    if 
        A == '*' ->
            {reply, lists:nth(1, Args) * lists:nth(3, Args), ok};
        A == '/' ->
            {reply, lists:nth(1, Args) / lists:nth(3, Args), ok};
        A == '+' ->
            {reply, lists:nth(1, Args) + lists:nth(3, Args), ok};
        A == '-' ->
            {reply, lists:nth(1, Args) - lists:nth(3, Args), ok};
        true ->
            {"noreply", "ok"}
    end.

handle_cast(A, B) ->
    io:format("Recived"),
    {"noreply", "ok"}.

service() ->
    gen_server:call(?MODULE, [argument]).

service(L1, M, L2) ->
    gen_server:call(?MODULE, [L1, M, L2]).
