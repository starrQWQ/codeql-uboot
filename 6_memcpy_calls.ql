import cpp

from FunctionCall funcCall
where funcCall.getTarget().getName() = "memcpy"
select funcCall