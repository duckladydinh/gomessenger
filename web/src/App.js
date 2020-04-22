import React, { useEffect, useReducer } from "react";
import "./App.css";
import TextField from "@material-ui/core/TextField";
import FormControl from "@material-ui/core/FormControl";
import Button from "@material-ui/core/Button";
import List from "@material-ui/core/List";
import ListItem from "@material-ui/core/ListItem";

import api from "./api/chat_service_grpc_web_pb";

const client = new api.ChatServiceClient(
  "http://localhost:9090",
  undefined,
  undefined
);

const reducer = (state, payload) => {
  switch (payload.action) {
    case "text.set":
      return { ...state, text: payload.text };
    case "messages.add":
      const req = new api.AddChatMessageRequest();
      req.setUserid("usr01");
      req.setChannelid("public");
      req.setTimestamp(new Date().getUTCMilliseconds());
      req.setMessage(payload.message);

      client.addChatMessage(req, {}, (err, res) => {
        console.log(err);
        console.log(res);
      });

      return {
        ...state,
        messages: [...state.messages, payload.message],
        text: "",
      };
  }
  throw `Unhandled pair ( state = ${state} , payload = ${payload}`;
};

const App = () => {
  const [state, dispatch] = useReducer(
    reducer,
    { messages: [], text: "" },
    undefined
  );

  useEffect(() => {
    const req = new api.GetChatChannelRequest();
    req.setUserid("usr01");
    req.setChannelid("public");

    const stream = client.getChatChannel(req, {
      "grpc.keepalive_timeout_ms": 1500000,
    });
    console.log("STREAM: ");
    console.log(stream);
    stream.on("data", (res) => {
      console.log("RECV: " + res.getContent());
    });
    stream.on("end", () => {
      console.log("END STREAM");
    });

    return () => {
      stream.cancel();
    };
  }, []);

  return (
    <div className="App">
      <FormControl fullWidth>
        <TextField
          value={state.text}
          onChange={(e) =>
            dispatch({ action: "text.set", text: e.target.value })
          }
          autoFocus
        />
        <Button
          onClick={() =>
            dispatch({ action: "messages.add", message: state.text })
          }
        >
          Send
        </Button>
        <List>
          {state.messages.map((msg) => (
            <ListItem>{msg}</ListItem>
          ))}
        </List>
      </FormControl>
    </div>
  );
};

export default App;
