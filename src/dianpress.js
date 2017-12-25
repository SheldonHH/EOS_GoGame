//matchId, pos, player, host
void dianpress(Pressdian_message  message){
    bool great = true;
    bool trump = false;
    assert(great, "Great am here");
//    assert(trump, "Trump am here");
    require_auth( message.player );

    print(" Welcome to dianpress: \n here is your message.host: "+ name(message.host) +name(message.matchid));



    match match_query;
    match_query.matchid = message.matchid;
    bool match_exist = MatchTable::get(match_query, message.host);
    assert( match_query.status == 1, "Match was not accepted or is already over " );
    assert( match_exist, "Match not found!" );


    assert( match_query.white == message.player || match_query.black == message.player, "Player not found!" );
    assert( match_query.white == message.host || match_query.black == message.host, "Host not found!" );
    matchrequest request;
    request.opponent = message.host;
//
    char message_host []= "xpmessage.host_name():";
    const char *ptr = &message_host[0];
    print(ptr, name(message.host));

    matchrequest requested;
    requested.opponent = match_query.opponent;
    print("\n\n\nname(requested.opponent): "+name(requested.opponent));

    uint8_t player_side;
    (match_query.white == message.player) ?  player_side = 0 : player_side = 1;
    assert( player_side != match_query.lastmoveside, "It's not your turn!" );
    print( "\n(match_query.lastmoveside): ", name(match_query.lastmoveside));
//
//
    uint8_t board[9][9];
    db_array_to_board(board, match_query.board);
    uint8_t piece = board[message.pos[0]][message.pos[1]];
//    assert( piece == 0, "这里已经落棋了");
//    if (player_side == 0) {
//        assert( piece_side(piece) == 0, "可以，棋子属于其他: message.matchid"+name(message.matchid)  );
//    } else {
//        assert(match_query.lastmoveside == 0, "It's not your turn!" );
//        assert( piece_side(piece) == 1, "这个回合不属于你，棋子属于其他: message.host"+name(message.host) );
//    }
//
//
//
    uint8_t t = 0;
    if(piece == 0){
        print("进来了");
        if(message.host == message.player){
            print("black");
            board[message.pos[0]][message.pos[1]] = 2; t=2;
        }else{
            print("white");
            board[message.pos[0]][message.pos[1]] = 1; t=1;
        }
    }
//    uint8_t x = message.pos[0], y = message.pos[1]; uint8_t i, j;
//    uint8_t qtanji=9;
//    bool win = false;
//
//    // 一三象限
//    if (x >= 0 && y >= 0 && t == board[x][y] && t == board[x + 1][y + 1] && t == board[x + 2][y + 2] && t == board[x + 3][y + 3] && t == board[x + 4][y + 4]){
//        win = true;
//        assert(!win,"一三象限，x >= 0");
//    }
//
//    if (x >= 1 && y >= 1  && t == board[x-1][y-1] && t == board[x][y] && t == board[x + 1][y + 1] && t == board[x + 2][y + 2] && t == board[x + 3][y + 3]){
//        win = true;
//        assert(!win,"一三象限x >= 1");
//    }
//    if (x >= 2 && y >= 2 && t == board[x-2][y-2] && t == board[x - 1][y - 1] && t == board[x][y] && t == board[x + 1][y + 1] && t == board[x + 2][y + 2]){
//        win = true;
//        assert(!win,"一三象限x >= 2");
//    }
//
//    if (x >= 3 && y >= 3 && t == board[x-3][y-3] && t == board[x - 2][y - 2] && t == board[x - 1][y - 1] && t == board[x][y] && t == board[x + 1][y + 1]){
//        win = true;
//        assert(!win,"一三象限x >= 3");
//    }
//
//    if (x >= 4 && y >= 4  && t == board[x-4][y-4] && t == board[x - 3][y - 3] && t == board[x - 2][y - 2] && t == board[x - 1][y - 1] && t == board[x][y]){
//        win = true;
//        assert(!win,"一三象限x >= 4");
//
//    }
//
//
//
//    //二四象限
//    if (x >= 4  && y >= 0 && t == board[x][y] && t == board[x - 1][y + 1] && t == board[x - 2][y + 2]&& t == board[x - 3][y + 3] && t == board[x - 4][y + 4]){
//        win = true;
//        assert(!win,"二四象限 x >= 4  && y >= 0 ");
//    }
//    if (x >= 3  && y >= 1 && t == board[x+1][y-1] && t == board[x][y] && t == board[x-1][y + 1]&& t == board[x - 2][y + 2] && t == board[x - 3][y + 3]){
//        win = true;
//        assert(!win,"二四象限 x >= 3  && y >= 1 ");
//    }
//    if (x >= 2  && y >= 2 && t == board[x+2][y-2] && t == board[x + 1][y - 1] && t == board[x][y]&& t == board[x - 1][y + 1] && t == board[x-2][y+2]){
//        win = true;
//        assert(!win,"x >= 2  && y >= 2");
//    }
//    if (x >= 1  && y >= 3 && t == board[x+3][y-3] && t == board[x + 2][y - 2] && t == board[x + 1][y - 1]&& t == board[x][y] && t == board[x - 1][y + 1]){
//        win = true;
//        assert(!win,"x >= 1  && y >= 3 ");
//    }
//    if (x >= 0  && y >= 4 && t == board[x+4][y-4] && t == board[x + 3][y + 3] && t == board[x + 2][y - 2]&& t == board[x+1][y - 1] && t == board[x][y]){
//        win = true;
//        assert(!win,"x >= 0  && y >= 4 ");
//    }
//
//
//
//
//
//    //y
//    if (y >= 4 && t == board[x][y-4] && t == board[x][y-3] && t == board[x][y-2] && t == board[x][y-1] && t == board[x][y]) {
//        win = true;
//        assert(!win,"y >= 4");
//    }
//
//    if (y >= 3 && t == board[x][y-3] && t == board[x][y-2] && t == board[x][y-1] && t == board[x][y] && t == board[x][y + 1]){
//        win = true;
//        assert(!win,"y >= 3");
//    }
//
//    if (y >= 2  && t == board[x][y-2] && t == board[x][y-1] && t == board[x][y] && t == board[x][y + 1] && t == board[x][y + 2]){
//        win = true;
//        assert(!win,"y >= 2");
//    }
//    if (y >= 1 && t == board[x][y-1] && t == board[x][y] && t == board[x][y + 1] && t == board[x][y + 2] && t == board[x][y + 3]){
//        win = true;
//        assert(!win,"y >= 1");
//    }
//
//    if (y >= 0 && t == board[x][y] && t == board[x][y + 1] && t == board[x][y + 2] && t == board[x][y + 3] && t == board[x][y + 4]){
//        win = true;
//
//        assert(!win,"y >= 0");
//    }
//
//
//
//
//
//    // x
//    if (x >= 0  && t == board[x][y] && t == board[x + 1][y] && t == board[x + 2][y] && t == board[x + 3][y] && t == board[x + 4][y]){
//        win = true;
//        assert(!win,"x >= 0");
//    }
//    if (x >= 1  && t == board[x-1][y] && t == board[x][y] && t == board[x + 1][y] && t == board[x + 2][y] && t == board[x + 3][y]){
//        win = true;
//        assert(!win,"x >= 1");
//    }
//    if (x >= 2 && t == board[x-2][y] && t == board[x - 1][y] && t == board[x][y] && t == board[x + 1][y] && t == board[x + 2][y]){
//        win = true;
//        assert(!win,"x >= 2");
//    }
//    if (x >= 3  && t == board[x-3][y] && t == board[x - 2][y] && t == board[x - 1][y] && t == board[x][y] && t == board[x + 1][y]){
//        win = true;
//        assert(!win,"x >= 3");
//    }
//    if (x >= 4 && t == board[x-4][y] && t == board[x + 3][y] && t == board[x - 2][y] && t == board[x - 1][y] && t == board[x][y]){
//        win = true;
//        assert(!win,"x >= 4");
//    }
//
//
//
//
//    assert(!win, "硬了");




    match_query.lastmoveside = player_side;
    print("match_query.lastmoveside: ", name(match_query.lastmoveside));

    uint8_t b = 0;
    uint8_t g = 0;
    for (uint8_t i = 0; i < 81; i++) {
        match_query.board[i] = board[g][b];
        if (b == 8) {
            g++;
            b = 0;
        } else {
            b++;
        }
    }

    const char *comma = ",";
    for (uint8_t i = 0; i < 81; i++) {
       print(comma, name(match_query.board[i]));

    }

    if (match_query.matchstart == 0) {
        match_query.matchstart = now();
    }
    if (match_query.white == message.host) {
        request.opponentside = 0;
        requested.opponentside = 1;
    } else {
        request.opponentside = 1;
        requested.opponentside = 0;
    }
//
    request.maxmoveinterval = match_query.maxmoveinterval;
    request.matchid = match_query.matchid;
    request.lastmovetime = match_query.lastmovetime;
    request.status = 1;
    request.matchstart = match_query.matchstart;
    requested.matchid = match_query.matchid;
    requested.lastmovetime = match_query.lastmovetime;
    requested.maxmoveinterval = match_query.maxmoveinterval;
    requested.status = 1;
    requested.matchstart = match_query.matchstart;
    bool update_request =  RequestTable::update(request, match_query.opponent);
    bool update_requested =  RequestedTable::update(requested, message.host);
    bool update_match =  MatchTable::update(match_query, message.host);



}
