import pymongo

""" Connection """
MyConnection=pymongo.MongoClient("mongodb://localhost:27017/")
Mydb=MyConnection["Exam"]
Mytable=Mydb["Student"]

""" Insertion Logic
Mylist = [
    {"_id":1, "Name":"Anjali", "Place":"Kollam", "Phone":8582639562, "Vaccination_status":"Both Vaccinated", "RTPCR":"Negative", "Lab_Mark":{"Internal": 30,"External":45}, "Department":"MCA"},
    {"_id":2, "Name":"Anuradha", "Place":"Varkala", "Phone":9992639562, "Vaccination_status":"Both Vaccinated", "RTPCR":"Negative", "Lab_Mark":{"Internal":40,"External":48}, "Department":"Civil"},
    {"_id":3, "Name":"Bismiya", "Place":"Kollam", "Phone":9446639562, "Vaccination_status":"Not Vaccinated", "RTPCR":"Positive", "Lab_Mark":{"Internal":50,"External":39}, "Department":"MCA"},
    {"_id":4, "Name":"Vimal", "Place":"Ernakulam", "Phone":8582639568, "Vaccination_status":"First Dose Only", "RTPCR":"Positive", "Lab_Mark":{"Internal":40,"External":42}, "Department":"Civil"},
    {"_id":5, "Name":"Vivek", "Place":"Kollam", "Phone": 8582639777, "Vaccination_status":"Both Vaccinated", "RTPCR":"Negative", "Lab_Mark":{"Internal": 50,"External":50}, "Department":"MCA"}
]
X=Mytable.insert_many(Mylist)
print(X.inserted_ids)
"""

"""QUERY"""
Q1=Mytable.find({"Vaccination_status":"Not Vaccinated"})
for i in Q1:
    print(i["Name"]+" "+str(i["Phone"])+" "+(i["Vaccination_status"]))
print()

Q2=Mytable.find().sort("Lab_Mark.External",-1)
for j in Q2:
    print(j["Name"]+" "+str(j["Phone"]))
print()

Q3=Mytable.find({"Name":{"$regex":"^A"}})
for q in Q3:
    print(str(q["_id"])+" "+q["Name"]+" "+q["Department"])
print()
