        // res.json({'status': 200, data: "CountDown up"});



        for (var itr in users) {
            console.log(users[itr].ip);
            var exec = require('exec');
            dir = exec("/bin/ping -c2 -w2 " +users[itr].ip, function (err, stdout, stderr) {
                if (err) {
                    // should have err.code here?
                }
                console.log(stdout);
            });
            dir.on('exit', function (code) {
                // exit code is code
            });
        }
