var websocket;

const LOGIN = "&LOGIN";
const LOGOUT = "&LOGOUT";
const PING = "&PING";

var username = "";

const server_url = "ws://localhost:3307";

var id_timer = null;

// UTILITY

function print_message(sender_name, message, receiver = null) {
    const data = new Date();
    const string_date = data.getMinutes() + "" +
        ":" + data.getHours() + "" +
        " " + data.getDay() + "" +
        "/" + data.getMonth() + "" +
        "/" + data.getFullYear();
    var externDiv = document.createElement("div");
    externDiv.setAttribute("class", "chatbox__messages__user-message");
    var messageDiv = document.createElement("div");
    var p_name = document.createElement("p");
    var p_name_text;
    var p_message = document.createElement("p");
    var p_message_text;
    if(receiver != null) {
        messageDiv.setAttribute("class", "chatbox__messages__user-message--right-message");
        p_name_text = document.createTextNode("Sent to " + receiver + ":");
        p_message_text = document.createTextNode(message);
    } else {
        messageDiv.setAttribute("class", "chatbox__messages__user-message--left-message");
        if (sender_name == null) {
            // messaggio inviato dal server
            p_name_text = document.createTextNode("From: System");
            p_message_text = document.createTextNode(message);
        } else {
            // messaggio da un altro utente
            p_name_text = document.createTextNode("From: " + sender_name);
            p_message_text = document.createTextNode(message);
        }
    }
    p_name.appendChild(p_name_text);
    p_message.appendChild(p_message_text);
    messageDiv.appendChild(p_name);
    messageDiv.appendChild(document.createElement("br"));
    messageDiv.appendChild(p_message);
    externDiv.appendChild(messageDiv);
    document.getElementById("message_box").appendChild(externDiv);
}

function update_online_users(users_list) {
    //flush of all the options
    var select_block = document.getElementById("select_receiver");
    while(select_block.lastChild.id != select_block.firstChild.id)
        select_block.removeChild(select_block.lastChild);
    //insert new list
    document.getElementById("placeholder").selected = "selected";
    var all_users_list = document.getElementsByName("chatbox_user")
    for(var i = 0; i < all_users_list.length; i++){
        all_users_list[i].setAttribute("class", "chatbox__user--busy");
    }
    var option;
    var option_text;
    for(var i = 0; i < users_list.length - 1; ++i){
        if(users_list[i] === username)
            continue;	//the logged user can not send a message to himself!
        option = document.createElement("option");
        option.setAttribute("id", users_list[i]);
        option.setAttribute("value", users_list[i]);
        option.setAttribute("class", "online_user");
        option_text = document.createTextNode(users_list[i]);
        option.append(option_text);
        select_block.append(option);
        //update online users in the list of all the users
        document.getElementById(users_list[i]).setAttribute("class", "chatbox__user--active");
    }
}

// WEBSOCKET

function keep_connection_alive(){
    const timeout = 20000;
    if(websocket.readyState === websocket.OPEN)
        websocket.send(PING);
    id_timer = setTimeout(keep_connection_alive, timeout);
}

function stop_keep_alive(){
    clearTimeout(id_timer);
}

function ws_onOpen() {
    websocket.send(LOGIN + ":" + username);
    keep_connection_alive();
}

function ws_onClose() {

}

function ws_onMessage(event) {
    var message_fields = event.data.split(':');
    if(message_fields.length === 2){
        //normale messaggio inviato da un altro utente
        print_message(message_fields[0], message_fields[1]);
    } else {
        message_fields = event.data.split('|');
        if(message_fields.length > 1){
            //the new online users list is arrived
            update_online_users(message_fields);
        } else {
            // semplice stringa di risposta
            print_message(null, event.data);
        }
    }
}

//logging_user is the username of the user that is entering in the chat page
function connect(logging_user){
    //alert(logging_user);
    username = logging_user;
    websocket = new WebSocket(server_url);
    websocket.onopen = function(){ws_onOpen()};
    websocket.onclose = function(){ws_onClose()};
    websocket.onmessage = function(event){ws_onMessage(event)};
}

function disconnect(){
    websocket.send(LOGOUT);
    websocket.close();
}

function send_message(event){
    var keycode = event.keyCode;
    if(keycode != 13){
        return true;
    }
    var message_text = document.getElementById("text_input").value;
    const receiver_index = document.getElementById("select_receiver").selectedIndex;
    const receiver_username = document.getElementById("select_receiver").options[receiver_index].value;
    websocket.send(message_text + ":" + username + ":" + receiver_username);
    print_message(null, message_text, receiver_username);
    document.getElementById("text_input").value = "";
    return false;
}
