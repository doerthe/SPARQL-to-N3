package Translation.FilterExpression;

import Translation.MyNode;

import java.util.List;

public class AtomicLogicalNotExpr extends FilterExpression {
    private FilterExpression arg1;
    private String operator;

    public AtomicLogicalNotExpr(FilterExpression arg1) {
        this.arg1 = arg1;
        operator = "not";
    }

    @Override
    public void prefixVars(String prefix1, List<MyNode> vars1, String prefix2, List<MyNode> vars2) {
        arg1.prefixVars(prefix1, vars1, prefix2, vars2);
    }

    @Override
    public String toStringWithoutFunction() {
        return operator + " " + this.arg1.toStringWithoutFunction();
    }

    @Override
    public String getAppliedFunction() {
        return this.arg1.getAppliedFunction();
    }

}
