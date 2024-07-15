defmodule LivePollWeb.PollLive.Index do
  alias LivePoll.PollsContext.Context
  use LivePollWeb, :live_view

  def mount(_params, _session, socket) do
    socket = socket |> assign(polls: Context.list_polls())
    {:ok, socket}
  end


  @spec render(any()) :: Phoenix.LiveView.Rendered.t()
  def render(assigns) do
    ~H"""
    <div class="w-full h-full flex justify-center items-center text-center flex-col space-y-5">
      <.header>
        Live Poll
        <:subtitle>All the Polls are here!</:subtitle>
      </.header>

      <div
        :for={poll <- @polls}
        class="w-3/4 h-20 py-2 bg-zinc-100 rounded-lg flex flex-col polls-center justify-around"
      >
        <h2 class="text-lg"><%= poll.name %></h2>
        <.link navigate={~p"/details/#{poll.id}"}>More details</.link>

      </div>

      <.link navigate={~p"/new"}>
        <.button>
          Create new poll +
        </.button>
      </.link>
    </div>
    """
  end
end
