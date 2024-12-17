package Translation;

import Translation.FilterExpression.FilterExpression;

import java.util.List;
import java.util.Objects;

import static Translation.MyUtils.MyUtils.*;

public class MyNode extends FilterExpression {
    private String label;
    private String datatype;
    private String languageTag;
    private Boolean isVariable;
    private String function;

    // For cloning
    public MyNode(MyNode myNode) {
        this.label = myNode.label;
        this.datatype = myNode.datatype;
        this.languageTag = myNode.languageTag;
        this.isVariable = myNode.isVariable;
    }

    // Constructor for variables
    public MyNode(String varname) {
        this.label = prefixVar(varname, LOCAL_PREFIX);
        this.datatype = prefixVar(varname, DataType_PREFIX);
        this.languageTag = prefixVar(varname, LanguageTag_PREFIX);
        this.isVariable = true;
    }

    // To be used for URIs and literals without language tag
    public MyNode(String element, String datatype) {
        this.label = element;
        this.datatype = datatype;
        this.languageTag = "\"\"";
        this.isVariable = false;
    }

    // To be used for URIs and literals with language tag
    public MyNode(String element, String datatype, String languageTag) {
        this.label = element;
        this.datatype = datatype;
        this.languageTag = languageTag;
        this.isVariable = false;
    }

    public void setFunction(String function) {
        this.function = function;
    }

    public String getFunction() {
        return this.function;
    }

    public String getLabel() {
        return label;
    }

    public void setLabel(String label) {
        this.label = label;
    }

    public String getDatatype() {
        return datatype;
    }

    public String getLanguageTag() {
        return languageTag;
    }

    public Boolean getVariable() {
        return isVariable;
    }

    public void prefixVarNode(String prefix) {
        if (isVariable) {
            this.label = prefixVar(this.label, prefix);
            if (!prefix.equals(LOCAL_PREFIX)) {
                this.datatype = prefixVar(this.datatype, prefix);
                this.languageTag = prefixVar(this.languageTag, prefix);
            }
        } else {
            System.out.println("The prefixed node is not a variable!");
        }
    }

    @Override
    public String toString() {
        return this.getLabel();
    }

    public String getLabelIfNotBlank() {
        if(this.getDatatype() != "Blanknode") {
            return "{" + this.getLabel() + "}";
        } else {
            return "Blanknode";
        }
    }

    @Override
    public String toStringWithoutFunction() {
        return this.getLabel();
    }

    @Override
    public String getAppliedFunction() {
        return "";
    }

    public String getCommaSepVars() {
        return this.getLabel() + ", " + this.getDatatype() + ", " + this.getLanguageTag();
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        MyNode myNode = (MyNode) o;
        return Objects.equals(label, myNode.label) &&
                Objects.equals(datatype, myNode.datatype) &&
                Objects.equals(languageTag, myNode.languageTag) &&
                Objects.equals(isVariable, myNode.isVariable);
    }

    @Override
    public int hashCode() {
        return Objects.hash(label, datatype, languageTag, isVariable);
    }

    @Override
    public void prefixVars(String prefix1, List<MyNode> vars1, String prefix2, List<MyNode> vars2) {
        // If the argument begins with LOCAL_PREFIX it is a variable:
        if (vars1.contains(this)) {
            this.prefixVarNode(prefix1);

            if (vars2.contains(this)) {
                this.prefixVarNode(prefix2);
            }
        }
    }
}
