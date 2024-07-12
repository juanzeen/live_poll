defmodule LivePollWeb.PollLive.Index do
  alias LivePoll.PollsContext.Context
  use LivePollWeb, :live_view

  def mount(params, session, socket) do
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
        class="w-10/12 h-72 py-2 bg-zinc-100 rounded-lg flex flex-col polls-center justify-around"
      >
        <h2 class="text-lg uppercase"><%= poll.name %></h2>

        <div class="w-full text-baseline flex items-center justify-center">

        <div class="w-1/3 flex justify-around">
          <span class="font-semibold bg-zinc-700 text-zinc-100 rounded-full px-1.5 py-0.5">
            <%= poll.opt1_votes %>
          </span>
          <p>
            <%= poll.opt1_name %>
          </p>
        </div>

        <span class="bg-lime-500 h-40"></span>

        <div class="w-1/3 flex justify-around">
          <span class="font-semibold bg-zinc-700 text-zinc-100 rounded-full px-1.5 py-0.5">
            <%= poll.opt2_votes%>
          </span>
          <p>
            <%= poll.opt2_name %>
          </p>
        </div>

        </div>

        <div>
        <!-- usamos o JS.push para que não haja necessidade de muitos phx-value-->
          <.button phx-click={JS.push("add_vote", value: %{id: poll.id, origin: "opt1"})}>
            Vote first option
          </.button>

          <.button phx-click={JS.push("add_vote", value: %{id: poll.id, origin: "opt2"})}>
            Vote second option
          </.button>
        </div>
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
