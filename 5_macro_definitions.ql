
import cpp

from Macro macro
where macro.getName() in ["ntohs", "ntohl", "ntoll"]
select macro, "ntoh* function"