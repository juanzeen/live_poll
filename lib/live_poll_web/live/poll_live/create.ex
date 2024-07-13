defmodule LivePollWeb.PollLive.Create do
  alias LivePoll.PollsContext.Context
  alias LivePoll.PollsContext.Polls
  use LivePollWeb, :live_view

  def mount(_params, _session, socket) do
    form = Polls.changeset(%Polls{}) |> to_form()

    socket = assign(socket, form: form)

    {:ok, socket}
  end

  def handle_event("create_poll", %{"polls" => poll_params}, socket) do
    socket =
      case Context.create_poll(poll_params) do
        {:ok, %Polls{} = poll} -> put_flash(socket, :info, "The #{poll.name} was created!")
        {:error, %Ecto.Changeset{} = changeset} -> form = to_form(changeset)
        socket |> assign(form: form) |> put_flash(:error, "Invalid poll")
      end
    {:noreply, socket}
  end

  def handle_event("validate_poll", %{"polls" => poll_params}, socket) do
    #params_w_votes = %{poll_params | opt1_votes: 0, opt2_votes: 0}

    form =
      Polls.changeset(%Polls{}, poll_params)
      |> Map.put(:action, :validate)
      |> to_form()

    {:noreply, assign(socket, form: form)}
  end

  def render(assigns) do
    ~H"""
    <div class="space-y-5 flex flex-col items-center">
     Put here the data for the new poll!
      <.form
      for={@form}
     phx-submit="create_poll"
     class="w-full space-y-3 text-center"
     >

        <.input placeholder="Poll name" field={@form[:name]}></.input>

        <.input placeholder="First option" field={@form[:opt1_name]}></.input>

        <.input placeholder="Second option" field={@form[:opt2_name]}></.input>

        <.button type="submit">Create Poll</.button>
      </.form>

      <.link navigate={~p"/"}>
        <.button>
          Go back to the list of polls
        </.button>
      </.link>
    </div>
    """
  end

end
