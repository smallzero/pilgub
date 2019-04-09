wget http://localhost/pilgub/backend/barchart.php -O barchart.json
wget http://localhost/pilgub/backend/datatable.php -O datatable.json
wget http://localhost/pilgub/backend/summary.php -O summary.json

curl -F "fileToUpload=@barchart.json" http://128.199.96.154/upload_pilgub.php
curl -F "fileToUpload=@datatable.json" http://128.199.96.154/upload_pilgub.php
curl -F "fileToUpload=@summary.json" http://128.199.96.154/upload_pilgub.php


curl -F "fileToUpload=@barchart.json" http://localhost/pilgub_pub/upload_pilgub.php
curl -F "fileToUpload=@datatable.json" http://localhost/pilgub_pub/upload_pilgub.php
curl -F "fileToUpload=@summary.json" http://localhost/pilgub_pub/upload_pilgub.php

del *.json