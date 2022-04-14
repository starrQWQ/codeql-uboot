import cpp

class NetworkByteSwap extends Expr {
  NetworkByteSwap () {
    // TODO: replace <class> and <var>
    exists(MacroInvocation macroInvok |
        // TODO: <condition>
        macroInvok.getMacro().getName().regexpMatch("ntoh(s|l|ll)")
        and this = macroInvok.getExpr()
    )
  }
}

from NetworkByteSwap n
select n as Network_byte_swap