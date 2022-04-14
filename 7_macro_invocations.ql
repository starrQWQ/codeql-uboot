
import cpp

from MacroInvocation macroInvok
where macroInvok.getMacro().getName().regexpMatch("ntoh(s|l|ll)")
select macroInvok