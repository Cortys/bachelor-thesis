call algo.unionFind.stream(
	"match (:concept {id: 'concept_person'})-[:inst]->(n) " +
	"optional match (x:concept)-[:inst]->(n) " +
	"where x.id in ['concept_I', 'concept_you'] " +
	"with n, count(x) as cx where cx = 0 " +
	"return id(n) as id",
	"match (n1)-[:inst]->(n2) return id(n1) as source, id(n2) as target",
	{graph: "cypher"})
yield nodeId, setId
match (node) where id(node) = nodeId
with setId, collect(distinct node.label) as people
return people
