/**
 * @kind path-problem
 */

import cpp
import semmle.code.cpp.dataflow.TaintTracking
import DataFlow::PathGraph

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

class Config extends TaintTracking::Configuration {
  Config() { this = "NetworkToMemFuncLength" }

  // find ntoh*
  override predicate isSource(DataFlow::Node source) {
    // TODO
    // check if a value belongs to CodeQL class
    source.asExpr() instanceof NetworkByteSwap
  }
  override predicate isSink(DataFlow::Node sink) {
    // TODO
    exists(FunctionCall funcCall | funcCall.getTarget().getName() = "memcpy" and funcCall.getArgument(2) = sink.asExpr() )
  }
}

from Config cfg, DataFlow::PathNode source, DataFlow::PathNode sink
where cfg.hasFlowPath(source, sink)
select sink as s1, source as s2, sink as s3, "Network byte swap  memcpy"