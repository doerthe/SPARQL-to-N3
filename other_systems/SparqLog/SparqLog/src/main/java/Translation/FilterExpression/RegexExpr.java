package Translation.FilterExpression;

import Translation.MyNode;

import java.util.List;

public class RegexExpr extends FilterExpression {

    private List<MyNode> args;
    private String operator;
    private int ruleID;
    private boolean regexBoolean;

    public RegexExpr(List<MyNode> args, String operator, int ruleID) {
        this.args = args;
        this.operator = operator;
        this.ruleID = ruleID;
        this.regexBoolean = true;
    }

    public List<MyNode> getArgs() {
        return args;
    }

    public void setArgs(List<MyNode> args) {
        this.args = args;
    }

    public String getOperator() {
        return operator;
    }

    public void setOperator(String operator) {
        this.operator = operator;
    }

    public void setRegexBoolean(boolean regexBoolean) {
        this.regexBoolean = regexBoolean;
    }

    public String getRegexVar() {
        return "Reg_Var" + ruleID;
    }

    private String getFuncVar(MyNode regexInputVar) {
        return regexInputVar.getFunction() != null ? "Str" + ruleID + "_" + regexInputVar.getLabel() : regexInputVar.getLabel();
    }

    @Override
    public String toStringWithoutFunction() {
        String function = this.operator + "(";

        for (int i = 0; i < this.args.size(); i++) {
            MyNode fe = this.args.get(i);
            function += getFuncVar(fe);

            if (i < (this.args.size() - 1)) {
                function += ", ";
            }
        }

        function += ")";

        String regVar = getRegexVar();
        function = regVar + " = " + function;

        String boolString = regexBoolean ? "#T" : "#F";
        function = regVar + " = " + boolString + ", " + function;

        return function;
    }

    public String getAppliedFunction() {
        String appliedFunction = "";
        MyNode regexInputVar = this.args.get(0);
        if (regexInputVar.getFunction() != null) {
            appliedFunction = regexInputVar.getFunction() + "(" + regexInputVar.getLabel() + ", " + getFuncVar(regexInputVar) + "), ";
        }
        return appliedFunction;
    }

    @Override
    public void prefixVars(String prefix1, List<MyNode> vars1, String prefix2, List<MyNode> vars2) {
        for (MyNode arg : args) {
            if (vars1.contains(arg)) {
                arg.prefixVarNode(prefix1);
            }

            if (vars2.contains(arg)) {
                arg.prefixVarNode(prefix2);
            }
        }
    }
}
