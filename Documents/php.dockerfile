php bin/magento setup:install --base-url=http://varshap.bkp/ --db-host=localhost --db-name=varsha --db-user=varsha --db-password='varsha' --admin-firstname=Magento --admin-lastname=User --admin-email= --admin-user=admin --admin-password=admin123 --language=en_US --currency=USD --timezone=America/Chicago --use-rewrites=1 
find var generated vendor pub/static pub/media app/etc -type f -exec chmod g+w {} + && find var generated vendor pub/static pub/media app/etc -type d -exec chmod g+ws {} + && chown -R :www-data . && chmod u+x bin/magento && chmod -R 777 var generated
php bin/magento setup:di:compile 
php bin/magento setup:static-content:deploy -f 
php bin/magento cache:clean 
php bin/magento cache:flush 