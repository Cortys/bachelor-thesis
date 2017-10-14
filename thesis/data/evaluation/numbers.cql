match ({id:"concept_number"})-[:inst]->(n)<-[:patient]-(p),
	(p)<-[:inst]-({id:"concept_person"})-[:inst]->(person)-[:inst*0..1]->(p),
    (number)-[:inst*0..1]->(n)
where exists(person.named) and person.id starts with "concept_"
with person.label as name, n, collect(distinct number.label) as numbers
return name, numbers
order by name
