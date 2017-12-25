
void movepiece(Move_message message) {
  eosio::require_auth( message.player );
  match query;
  query.matchid = message.matchid;
  bool matchexist = MainTable::get(query);
  assert( query.status == 1, "Match was not accepted or is already over" );
  assert( matchexist, "Match not found!" );
  assert( query.white == message.player || query.black == message.player, "Player not found!" );
  uint8_t playerside;
  (query.white == message.player) ?  playerside = 0 : playerside = 1;
  assert( playerside != query.lastmoveside, "It's not your turn!" );
  uint8_t board[8][8];
  db_array_to_board(board, query.board);
  uint8_t piece = board[message.steps[0]][message.steps[1]];
  assert( piece != 0 , "There is no piece on this position" );
  if (playerside == 0) {
    assert( piece_side(piece) == 0, "Piece belongs to opponent" );
  } else {
    assert( piece_side(piece) == 1, "Piece belongs to opponent" );
  }

  board[message.steps[0]][message.steps[1]] = 0;
  query.lastmove[0] = piece;
  query.lastmove[1] = message.steps[0];
  query.lastmove[2] = message.steps[1];
  query.lastmove[3] = last_position[0];
  query.lastmove[4] = last_position[1];
  bool is_checked = false;
  if (!playerside) {
    query.moveswhite++;
    if (king) {
      query.kings[0] = last_position[0];
      query.kings[1] = last_position[1];
    }
    detect_check(board, query.kings[0], query.kings[1], is_checked, 0);
  }
  else {
    query.movesblack++;
    if (king) {
      query.kings[2] = last_position[0];
      query.kings[3] = last_position[1];
    }
    detect_check(board, query.kings[2], query.kings[3], is_checked, 1);
  }
  assert(!is_checked, "You cannot end your move if your king is in check");
  query.lastmoveside = playerside;
  query.lastmovetime = now();
  uint8_t b = 0;
  uint8_t g = 0;
  for (uint8_t i = 0; i < 64; i++) {
    query.board[i] = board[g][b];
    if (b == 7) {
      g++;
      b = 0;
    } else {
      b++;
    }
  }

  bool res =  MainTable::update(query);
  if (res == true) {
    eosio::print( "saved move", "\n" );
    //ask player2
  } else {
    eosio::print( "couldnt save move", "\n" );
    //why?
  }
}
