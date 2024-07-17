defmodule LivePollWeb.PollLive.Index do
  alias LivePoll.PollsContext.Context
  use LivePollWeb, :live_view

  def mount(_params, _session, socket) do
    user_id = create_id(6)
    |>IO.inspect()
    socket = socket |> assign(polls: Context.list_polls(), user_id: user_id)
    {:ok, socket}
  end

  def create_id(length) do
    length
    |> random_bytes()
    |> Base.url_encode64(padding: false)
    |> take_first_chars(length)
  end

  defp random_bytes(n) do
    :crypto.strong_rand_bytes(n)
  end

  defp take_first_chars(string, n) do
    String.slice(string, 0, n)
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
        class="w-3/4 h-20 py-2 bg-zinc-800 rounded-lg flex flex-col polls-center justify-around shadow-xl"
      >
        <h2 class="text-lg text-zinc-100"><%= poll.name %></h2>
        <.link  class="text-lime-400 hover:text-lime-500" navigate={~p"/details/#{poll.id}"}>More details</.link>

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
