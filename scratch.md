# DOING

- how we can test a call to a collaborator that is outside the router

# TODO

- is there a way to define a module inline
- what `plug :match` and `plug :dispatch` do
- what `Plug.Test` do
- how we can expose an existing application (e.g. `BankAccountApplication`) through plug
- how we can manipulate the HTTP headers
- how we can put some type of `Authorization` mechanism for HTTP requests
- understand how `Plug.Parsers` [works](https://stackoverflow.com/questions/45154121/how-do-you-set-the-body-of-a-post-request-in-an-elixir-plug-test)
- how can we extract common functions used for the tests
- understand more about the `conn` struct, for example: what `conn.state` means?
- understand when it is useful to define a supervisor with `import Supervisor.Spec` instead of using a separate module

# DONE

- how we can make an HTTP POST request with a JSON payload
- how to test a plug application
- write a readme
- write a simple hello world using plug
