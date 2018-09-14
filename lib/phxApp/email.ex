defmodule PhxApp.Email do
alias PhxApp.Email
  use Bamboo.Phoenix, view: PhxApp.EmailView

  def welcome_text_email(email_address,body,subject) do
    new_email
    |> to(email_address)
    |> from("noreply@hoovi.in")
    |> subject(subject)
    |> html_body(body
          )
  end
end