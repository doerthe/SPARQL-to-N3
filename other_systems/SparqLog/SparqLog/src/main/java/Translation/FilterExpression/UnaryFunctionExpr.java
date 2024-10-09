package Translation.FilterExpression;

import Translation.MyNode;

import java.util.List;

import static Translation.MyUtils.MyUtils.prefixVar;

public class UnaryFunctionExpr extends FilterExpression {
    private MyNode arg;
    private String operator;
    private Boolean usesDatatypeAndLanguageTag;

    public UnaryFunctionExpr(MyNode arg, String operator, Boolean usesDatatypeAndLanguageTag) {
        this.arg = new MyNode(arg);
        this.operator = operator;
        this.usesDatatypeAndLanguageTag = usesDatatypeAndLanguageTag;
    }

    public MyNode getArg() {
        return arg;
    }

    public void setArg(MyNode arg) {
        this.arg = arg;
    }


    public String getOperator() {
        return operator;
    }

    public void setOperator(String operator) {
        this.operator = operator;
    }

    @Override
    public String toStringWithoutFunction() {
        if (usesDatatypeAndLanguageTag) {
            return this.operator + "(" + this.arg.getCommaSepVars() + ")";
        } else {
            return this.operator + "(" + this.arg.getLabel() + ")";
        }
    }

    @Override
    public String getAppliedFunction() {
        return this.arg.getAppliedFunction();
    }

    @Override
    public void prefixVars(String prefix1, List<MyNode> vars1, String prefix2, List<MyNode> vars2) {
        // If the argument begins with LOCAL_PREFIX it is a variable:
        if (vars1.contains(this.arg)) {
            this.arg.prefixVarNode(prefix1);
        }

        if (vars2.contains(this.arg)) {
            this.arg.prefixVarNode(prefix2);
        }
    }
}
