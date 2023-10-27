echo "###############################"
echo "### Run migration DOWNGRADE ###"
echo "###############################"
echo 

echo EXECUTE COMMAND: migrate -path /migrations -database postgres://${DB_USER}:****@${DB_HOST}:${DB_PORT}/${DB_NAME}?sslmode=disable down
migrate -path /migrations -database postgres://${DB_USER}:${DB_PASSWORD}@${DB_HOST}:${DB_PORT}/${DB_NAME}?sslmode=disable down
