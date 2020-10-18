doublebet_with_limits = function(x, initialbet = 10, maxbet = 100, bet = even)
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
            if(maxbet < betsize){
                # Table limits, go back to beginning
                betsize = initialbet
            }
        }
        winnings[i] = current_winnings
    }
    winnings
}

s = rep(1, times = 10)

doublebet_with_limits(s)

