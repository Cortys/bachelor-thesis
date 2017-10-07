match (a:concept)-[:inst*0..1]->()<-[:agent]-(r:relation),
	(r)-[:patient]->()<-[:inst*0..1]-(p:concept)
where a.label = "Duane Seppi"
with r, collect(distinct p.label) as patients
optional match (:concept {id:"concept_time"})-[:inst]->(t:concept),
	(t)-[:inst*0..1]->()-[:patient]->(r)
where not exists(t.named) and t.id starts with "concept_"
unwind patients as patient
return r.label as relation, patient, t.label as time
