db = db.getSiblingDB("${MONGO_DBNAME}");
db.init.insert({"welcome":"hello"})
db.createUser({user: "${MONGO_USER_NAME}", pwd:  "${MONGO_USER_PASS}", roles: [{ role:"readWrite", db: "${MONGO_DBNAME}"}, { role:"read", db: "reporting"}]});
db.createUser({user: "${MONGO_ADMINUSER}", pwd:  "${MONGO_USER_PASS}", roles: [{ role:"root", db: "admin"}]});