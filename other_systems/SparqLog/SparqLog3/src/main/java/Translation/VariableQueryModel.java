package Translation;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class VariableQueryModel {
    private boolean nullsIntroduced;
    private String query;
    private List<MyNode> variables;
    private Map<MyNode,MyNode> renamedVarsMap;

    public VariableQueryModel(String query, List<MyNode> variables) {
        this.query = query;
        this.variables = variables;
        this.renamedVarsMap = new HashMap<>();
        this.nullsIntroduced = false;
    }

    public VariableQueryModel(String query, List<MyNode> variables, Map<MyNode, MyNode> renamedVars) {
        this.query = query;
        this.variables = variables;
        this.renamedVarsMap = renamedVars;
        this.nullsIntroduced = false;
    }

    public VariableQueryModel(String query, List<MyNode> variables, boolean nullsIntroduced) {
        this.query = query;
        this.variables = variables;
        this.renamedVarsMap = new HashMap<>();
        this.nullsIntroduced = nullsIntroduced;
    }

    public VariableQueryModel(String query, List<MyNode> variables, Map<MyNode, MyNode> renamedVars,  boolean nullsIntroduced) {
        this.query = query;
        this.variables = variables;
        this.renamedVarsMap = renamedVars;
        this.nullsIntroduced = nullsIntroduced;
    }

    public String getQuery() {
        return query;
    }

    public void setQuery(String query) {
        this.query = query;
    }

    public boolean isNullsIntroduced() {
        return nullsIntroduced;
    }

    public List<MyNode> getVariableNames() {
        return variables;
    }

    public Map<MyNode, MyNode> getRenamedVarsMap() {
        return renamedVarsMap;
    }
}
