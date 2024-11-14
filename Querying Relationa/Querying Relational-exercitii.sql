SELECT customers.fullName, orders.ammount, orders.shippingAddress
FROM orders
    INNER JOIN <table2> ON <table1>.<column> = <table2>.<column>;