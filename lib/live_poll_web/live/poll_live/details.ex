defmodule LivePollWeb.PollLive.Details do
  alias LivePoll.PollsContext.Context
  use LivePollWeb, :live_view

 def mount(%{"id" => id}, _session, socket) do
  #pego o id no params, porque os dados da query da url são pegos nesse campo
  current_poll = Context.get_poll!(id)
  socket =
    socket
    |> assign(current_poll: current_poll)

  {:ok, socket}
 end

  def handle_event("add_vote", %{"destiny" => destiny}, socket) do


    case destiny do
      "opt1_votes" ->
        voted_poll = Map.put(socket.assigns.current_poll, :opt1_votes, socket.assigns.current_poll.opt1_votes + 1)
        Context.add_vote(socket.assigns.current_poll, Map.from_struct(voted_poll))

      "opt2_votes" ->
        voted_poll = Map.put(socket.assigns.current_poll, :opt2_votes, socket.assigns.current_poll.opt2_votes + 1)
        Context.add_vote(socket.assigns.current_poll, Map.from_struct(voted_poll))

      _ ->
        :error
    end

    {:noreply, socket |> assign(current_poll: Context.get_poll!(socket.assigns.current_poll.id))}
  end

  def render(assigns) do
    ~H"""
    <div class="flex flex-col items-center space-y-5">
    <div class="w-10/12 h-72 py-2 bg-zinc-50 rounded-lg flex flex-col items-center justify-around shadow-lg">
      <h2 class="text-lg"><%= @current_poll.name%></h2>

      <div class="w-full text-baseline flex items-center justify-center">
        <div class="w-1/2 flex justify-around">
          <span class="font-semibold bg-zinc-700 text-zinc-100 rounded-full px-1.5 py-0.5">
            <%= @current_poll.opt1_votes%>
          </span>
          <p>
          <%= @current_poll.opt1_name%>
          </p>
        </div>

        <div class="w-1/2 flex justify-evenly">
        <span class="font-semibold bg-zinc-700 text-zinc-100 rounded-full px-1.5 py-0.5">
            <%= @current_poll.opt2_votes%>
          </span>
          <p>
          <%= @current_poll.opt2_name%>
          </p>
        </div>
      </div>
      <div>
        <!-- usamos o JS.push para que não haja necessidade de muitos phx-value-->
        <.button
        phx-click={JS.push("add_vote", value: %{destiny: "opt1_votes"})}
        >
          <%= @current_poll.opt1_name %>
        </.button>

        <.button
        phx-click={JS.push("add_vote", value: %{destiny: "opt2_votes"})}
        >
        <%= @current_poll.opt2_name %>
        </.button>
      </div>
    </div>


      <.back navigate={~p"/"}>
          Go back to the list of polls
      </.back>

    </div>
    """
  end
end
