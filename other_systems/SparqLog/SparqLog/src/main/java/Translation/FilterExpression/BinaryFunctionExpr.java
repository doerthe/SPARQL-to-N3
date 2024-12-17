package Translation.FilterExpression;

import Translation.MyNode;
import Translation.MyUtils.MyUtils;

import java.util.List;

import static Translation.MyUtils.MyUtils.*;

public class BinaryFunctionExpr extends FilterExpression {
    private MyNode arg1;
    private MyNode arg2;
    private String operator;

    public BinaryFunctionExpr(MyNode arg1, MyNode arg2, String operator) {
        this.arg1 = arg1;
        this.arg2 = arg2;
        this.operator = operator;
    }

    public MyNode getArg1() {
        return arg1;
    }

    public void setArg1(MyNode arg1) {
        this.arg1 = arg1;
    }

    public MyNode getArg2() {
        return arg2;
    }

    public void setArg2(MyNode arg2) {
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
        String checkEqualityDType = "";
        String checkEqualityLTag = "";

        if (this.operator.equals("=")) {
            checkEqualityDType = ", " + this.arg1.getDatatype() + " = " + this.arg2.getDatatype();
            checkEqualityLTag = ", " + this.arg1.getLanguageTag() + " = " + this.arg2.getLanguageTag();
        }

        return this.arg1.getLabel() + " " + this.operator + " " + this.arg2.getLabel() +
                checkEqualityDType + checkEqualityLTag;
    }

    @Override
    public String getAppliedFunction() {
        return this.arg1.getAppliedFunction() + this.arg2.getAppliedFunction();
    }

    @Override
    public void prefixVars(String prefix1, List<MyNode> vars1, String prefix2, List<MyNode> vars2) {
        // If the argument begins with LOCAL_PREFIX it is a variable:

        if (vars1.contains(this.arg1)) {
            this.arg1.prefixVarNode(prefix1);
        }

        if (vars2.contains(this.arg1)) {
            this.arg1.prefixVarNode(prefix2);
        }

        if (vars1.contains(this.arg2)) {
            this.arg2.prefixVarNode(prefix1);
        }

        if (vars2.contains(this.arg2)) {
            this.arg2.prefixVarNode(prefix2);
        }
    }

}
