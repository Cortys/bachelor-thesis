match (sender:concept {label: "John Doe"})-[:inst*0..1]->()<-[:agent]-(send),
	(send:relation)-[:patient]->(msg:concept),
	(msg)<-[:agent]-(contains:relation)-[:patient]->(ctx:context),
	nestPath = (ctx)-[:nest*]->(r:relation),
	(a:concept)-[:inst*0..1]->()<-[:agent]-(r),
	(r)-[:patient]->()<-[:inst*0..1]-(p:concept)
with collect(distinct a.label) as agents,
	collect(distinct p.label) as patients,
	r, nestPath
unwind nodes(nestPath) as ctx
optional match (ctx)-[:nest]->(child)
with ctx, count(ctx) as cnt, agents, r, patients
with filter(c in collect({neg: ctx.negative, cnt: cnt}) where c.neg) as negs,
	agents, r, patients
with case
	when size(negs) > 0 then case
		when any(c in negs where c.cnt > 1) then "CONDITIONAL"
		else "NEGATIVE"
	end
	else "POSITIVE"
end as truth, agents, r, patients
return agents, r.label as relation, patients, truth
