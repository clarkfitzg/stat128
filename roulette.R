# Betting functions
even = function(x)
{
    win = (x %% 2 == 0) & (x != 0)
    ifelse(win, 1, -1)
}


high = function(x)
{
    win = (18 < x) & (x != 0)
    ifelse(win, 1, -1)
}


column1 = function(x)
{
    ifelse(x %% 3 == 1, 2, -1)
}


single = function(x, n = 1)
{
    ifelse(x == n, 35, -1)
}


# Construct a simple betting strategy
simple_strategy = function(bet = even)
{
    function(x) cumsum(bet(x))
}


#' Simulate plays from a betting strategy
#'
#' @param strategy
#' @param nplayers number of players to use this strategy
#' @param ntimes number of times each player should play
play = function(strategy = simple_strategy()
    , nplayers = 100L
    , ntimes = 1000L
    , ballvalues = 0:36
){
    out = replicate(nplayers
            , strategy(sample(ballvalues, size = ntimes, replace = TRUE))
            , simplify = FALSE
    )
    data.frame(winnings = do.call(base::c, out)
            , player = rep(seq(nplayers), each = ntimes)
            , time = rep(seq(ntimes), times = nplayers)
    )
}


doublebet = function(x, initialbet = 1, bet = even)
{
    winnings = rep(NA, length(x))
    betsize = initialbet
    current_winnings = 0
    for(i in seq_along(x)){
        if(bet(x[i]) == 1){
            current_winnings = current_winnings + betsize
            betsize = initialbet
        } else {
            current_winnings = current_winnings - betsize
            betsize = 2 * betsize
        }
        winnings[i] = current_winnings
    }
    winnings
}
