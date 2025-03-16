import pymongo

myclient=pymongo.MongoClient("mongodb://localhost:27017/")
mydb=myclient["exam"]
mycol=mydb["student"]


mylist = [
    {"_id":1,"Name":"Anjali","Place":"Kollam","Phone":2582639562,"Vaccination_status":"Both vaccinated","RTPCR":"negative","Lab_mark":{"Internal":30,"External":45},"Department":"MCA"},
    {"_id":2,"Name":"Anuradha","Place":"Varkala","Phone":9992639562,"Vaccination_status":"Both vaccinated","RTPCR":"negative","Lab_mark":{"Internal":40,"External":48},"Department":"Civil"},
    {"_id":3,"Name":"Bismiya","Place":"Kollam","Phone":9446639562,"Vaccination_status":"not vaccinated","RTPCR":"positive","Lab_mark":{"Internal":50,"External":39},"Department":"MCA"},    
    {"_id":4,"Name":"Vimal","Place":"Ernakulam","Phone":8582639568,"Vaccination_status":"First dose only","RTPCR":"positive","Lab_mark":{"Internal":40,"External":42},"Department":"Civil"},
    {"_id":5,"Name":"Vivek","Place":"Kollam","Phone":8582639777,"Vaccination_status":"Both vaccinated","RTPCR":"negative","Lab_mark":{"Internal":50,"External":50},"Department":"MCA"}
    ]

x=mycol.insert_many(mylist)
print(x.inserted_ids)

"""
q3=mycol.find({"Vaccination_status":"not vaccinated"})
for i in q3:
    print(i["Name"]+" "+str(i["Phone"])+" "+(i["Vaccination_status"]))
print()


q4=mycol.find().sort("Lab_mark.External",-1).limit(2)
for s in q4:
    print(s["Name"]+" "+str(s["Phone"]))
print()


q5=mycol.find({"Name":{"$regex":"^A"}})
for q in q5:
    print(str(q["_id"])+" "+q["Name"]+" "+q["Department"])
print()


q6=mycol.update_many({"_id":4},{"$set" :{"Vaccination_status":"Both vaccinated"}})
print(q6.modified_count," documents updated ")
print()


q7=mycol.find().sort("Lab_mark.External",-1)
for j in q7:
    print(j["Name"]+" "+str(j["Phone"]))
print()


q8=mycol.delete_many({"Lab_mark.Internal":{"$lte":30}})
print(q8.deleted_count," documents deleted ")
print()

"""