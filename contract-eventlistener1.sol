Coin.Sent().watch({}, '', function(error, result){
  if (!error){
  console.log("Coin Transfer: "+ result.args.amount + " Coin sent from: " + reslt.args.from + " To" + result.args.to);
  colsole.log("Balances now: " + " Sender: " + Coin.balances.call(result.args.from) + " Receiver: " + Coin.balances.call(result.args.to));
  }
  })
