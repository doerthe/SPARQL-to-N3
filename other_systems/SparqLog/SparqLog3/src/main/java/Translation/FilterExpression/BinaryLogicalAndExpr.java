package Translation.FilterExpression;

import Translation.MyNode;
import Translation.MyUtils.MyUtils;

import java.util.List;

public class BinaryLogicalAndExpr extends FilterExpression {
    private FilterExpression arg1;
    private FilterExpression arg2;
    private String operator;

    public BinaryLogicalAndExpr(FilterExpression arg1, FilterExpression arg2) {
        this.arg1 = arg1;
        this.arg2 = arg2;
        this.operator = ",";
    }


    public FilterExpression getArg1() {
        return arg1;
    }

    public void setArg1(FilterExpression arg1) {
        this.arg1 = arg1;
    }

    public FilterExpression getArg2() {
        return arg2;
    }

    public void setArg2(FilterExpression arg2) {
        this.arg2 = arg2;
    }

    public String getOperator() {
        return operator;
    }

    public void setOperator(String operator) {
        this.operator = operator;
    }

    @Override
    public String toStringWithoutFunction() {
        return this.arg1.toStringWithoutFunction() + "" + this.operator + " " + this.arg2.toStringWithoutFunction();
    }

    @Override
    public String getAppliedFunction() {
        return this.arg1.getAppliedFunction() + this.arg2.getAppliedFunction();
    }

    @Override
    public void prefixVars(String prefix1, List<MyNode> vars1, String prefix2, List<MyNode> vars2) {
        this.arg1.prefixVars(prefix1, vars1, prefix2, vars2);
        this.arg2.prefixVars(prefix1, vars1, prefix2, vars2);
    }
}
