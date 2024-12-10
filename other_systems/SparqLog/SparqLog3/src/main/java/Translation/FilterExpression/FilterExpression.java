package Translation.FilterExpression;

import Translation.MyNode;

import java.util.List;

public abstract class FilterExpression {

    public abstract String toStringWithoutFunction();

    public abstract String getAppliedFunction();

    public String toString() {
        return getAppliedFunction() + toStringWithoutFunction();
    }

    /**
     * Prefix vars that occur in vars1 with prefix1
     * Prefix vars that occur in vars2 with prefix2
     * Assumes, that all variables in vars1 and vars2 are prefixed with the LOCAL_PREFIX
     *
     * @param prefix1
     * @param vars1
     * @param prefix2
     * @param vars2
     */
    public abstract void prefixVars(String prefix1, List<MyNode> vars1, String prefix2, List<MyNode> vars2);
}
