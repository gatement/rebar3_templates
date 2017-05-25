-module({{name}}).
-behaviour(gen_server).
-define(SERVER, ?MODULE).

%% ------------------------------------------------------------------
%% API Function Exports
%% ------------------------------------------------------------------

-export([start_link/1]).

%% ------------------------------------------------------------------
%% gen_server Function Exports
%% ------------------------------------------------------------------

-export([init/1, handle_call/3, handle_cast/2, handle_info/2,
         terminate/2, code_change/3]).

%% ------------------------------------------------------------------
%% API Function Definitions
%% ------------------------------------------------------------------

start_link(Args) ->
    gen_server:start_link(?MODULE, Args, []).

%% ------------------------------------------------------------------
%% gen_server Function Definitions
%% ------------------------------------------------------------------

init(Args) ->
    io:format("[~p/~p/~p] started: ~p~n", [erlang:localtime(), ?MODULE, erlang:self(), Args]),
    {ok, Args, 0}.

handle_call(Request, From, State) ->
    io:format("[~p/~p/~p] called: ~p~n", [erlang:localtime(), ?MODULE, erlang:self(), {From, Request}]),
    {reply, ok, State}.

handle_cast(Msg, State) ->
    io:format("[~p/~p/~p] casted: ~p~n", [erlang:localtime(), ?MODULE, erlang:self(), Msg]),
    {noreply, State}.

handle_info(Info, State) ->
    io:format("[~p/~p/~p] infoed: ~p~n", [erlang:localtime(), ?MODULE, erlang:self(), Info]),
    {noreply, State}.

terminate(Reason, _State) ->
    io:format("[~p/~p/~p] terminated: ~p~n", [erlang:localtime(), ?MODULE, erlang:self(), Reason]),
    ok.

code_change(OldVsn, State, Extra) ->
    io:format("[~p/~p/~p] code_changed: ~p~n", [erlang:localtime(), ?MODULE, erlang:self(), {OldVsn, Extra}]),
    {ok, State}.

%% ------------------------------------------------------------------
%% Internal Function Definitions
%% ------------------------------------------------------------------
