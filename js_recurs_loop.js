
        var count_value = users.length;
        console.log(count_value);
        var count_ip_down = function(count_value) {
            if (count_value > -1) {
                console.log(users[count_value-1].ip);
                return count_ip_down(count_value - 1);
            } else {
                return count_value;
            }
        };

        count_ip_down(count_value);
