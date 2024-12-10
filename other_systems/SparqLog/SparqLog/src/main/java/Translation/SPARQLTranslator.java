package Translation;

import Translation.FilterExpression.*;
import org.apache.jena.graph.*;
import org.apache.jena.query.Query;
import org.apache.jena.query.QueryFactory;
import org.apache.jena.query.SortCondition;
import org.apache.jena.sparql.algebra.Algebra;
import org.apache.jena.sparql.algebra.Op;
import org.apache.jena.sparql.algebra.op.*;
import org.apache.jena.sparql.core.BasicPattern;
import org.apache.jena.sparql.core.TriplePath;
import org.apache.jena.sparql.core.Var;
import org.apache.jena.sparql.core.VarExprList;
import org.apache.jena.sparql.expr.*;
import org.apache.jena.sparql.path.*;

import java.text.ParseException;
import java.util.*;

import static Translation.MyUtils.MyUtils.*;
import static java.lang.Integer.parseInt;

public class SPARQLTranslator {

    private SkolemGenerator skolemGenerator;
    private Comparator<MyNode> compareLabelsWithoutPrefix = (MyNode o1, MyNode o2) -> removePrefixes(o1.getLabel()).compareTo(removePrefixes(o2.getLabel()));

    private String removePrefixes(String s) {
        return s.replaceAll("^.*\\_", "");
    }

    public SPARQLTranslator(SkolemGenerator skolemGenerator) {
        this.skolemGenerator = skolemGenerator;
    }

    public void setSkolemGenerator(SkolemGenerator skolemGenerator) {
        this.skolemGenerator = skolemGenerator;
    }

    public void appendSkolemFunction(List<MyNode> vars, List<Integer> ids, String rule_id, boolean distinct, StringBuilder sb, String addedString) {
        if (!distinct) {
            sb.append(", ").append(TID).append(rule_id).append(" = ").append(
                    this.skolemGenerator.generateSkolemString(vars, ids, rule_id + "", addedString));
        }
    }

    public void appendSkolemFunction(List<MyNode> vars, List<Integer> ids, int rule_id, boolean distinct, StringBuilder sb, String addedString) {
        appendSkolemFunction(vars, ids, rule_id + "", distinct, sb, addedString);
    }

    public void appendSkolemFunction(List<MyNode> vars, List<Integer> ids, String rule_id, boolean distinct, StringBuilder sb) {
        appendSkolemFunction(vars, ids, rule_id, distinct, sb, null);
    }

    public void appendContantSkolemFunction(int rule_id, boolean distinct, StringBuilder sb) {
        if (!distinct) {
            sb.append(", ").append(TID).append(rule_id).append(" = ").append("[\"_distinct\"]");
        }
    }

    public void appendSkolemFunction(List<MyNode> vars, List<Integer> ids, int rule_id, boolean distinct, StringBuilder sb) {
        appendSkolemFunction(vars, ids, rule_id + "", distinct, sb);
    }

    public void appendAnswerTerm(List<MyNode> variables, StringBuilder sb, String ruleId, String name, boolean distinct, boolean sort) {
        sb.append("ans").append(ruleId).append("(");
        if (!distinct) {
            sb.append(TID).append(ruleId).append(", ");
        }
        appendAnswerVarNames(variables, sb, sort);
        sb.append(name).append(")");
    }

    public void appendAnswerTerm(List<MyNode> variables, StringBuilder sb, String ruleId, String name, boolean distinct) {
        appendAnswerTerm(variables, sb, ruleId, name, distinct, true);
    }

    public void appendAnswerTerm(List<MyNode> variables, StringBuilder sb, int ruleId, String name, boolean distinct) {
        appendAnswerTerm(variables, sb, ruleId + "", name, distinct);
    }

    public void appendAnswerTerm(List<MyNode> variables, StringBuilder sb, int ruleId, String name, boolean distinct, boolean sort) {
        appendAnswerTerm(variables, sb, ruleId + "", name, distinct, sort);
    }

    public void appendSubjectOrObject(MyNode variable, StringBuilder sb) {
        sb.append("subjectOrObject(" + variable.getCommaSepVars() + ")");
    }

    public void appendTerm(MyNode variable, StringBuilder sb) {
        sb.append("term(" + variable.getCommaSepVars() + ")");
    }

    public List<MyNode> getVarNames(List<Var> variables) {
        List<MyNode> varNames = new LinkedList();
        for (Var var : variables) {
            varNames.add(new MyNode(var.getVarName()));
        }
        return varNames;
    }

    // Also eliminates duplicate variable names!
    public void appendAnswerVarNames(List<MyNode> vars, StringBuilder sb, boolean sort) {
        if (sort) {
            Collections.sort(vars, compareLabelsWithoutPrefix);
        }

        for (MyNode var : vars) {
            sb.append(var.getCommaSepVars() + ", ");
        }
    }

    public void appendCompareTerms(List<MyNode> vars, StringBuilder sb) {
        String[] prefixes = new String[]{V1_PREFIX, V2_PREFIX};
        appendCompareTerms(vars, sb, prefixes);
    }

    public void appendCompareTerms(List<MyNode> vars, StringBuilder sb, String[] prefixes) {
        int i = 0;
        for (MyNode var : vars) {
            i++;
            MyNode prefixVar1 = new MyNode(var.getLabel());
            MyNode prefixVar2 = new MyNode(var.getLabel());
            prefixVar1.prefixVarNode(prefixes[0]);
            prefixVar2.prefixVarNode(prefixes[1]);
            appendCompareTerms(prefixVar1, prefixVar2, var, sb);
            if (vars.size() != i) {
                sb.append(", ");
            }
        }
    }

    public void appendCompareTerms(MyNode var1, MyNode var2, MyNode var3, StringBuilder sb) {
        sb.append("comp(");
        sb.append(var1.getLabel() + ", " + var2.getLabel() + ", " + var3.getLabel());
        sb.append("), ");
        sb.append("compD(");
        sb.append(var1.getDatatype() + ", " + var2.getDatatype() + ", " + var3.getDatatype());
        sb.append("), ");
        sb.append("compL(");
        sb.append(var1.getLanguageTag() + ", " + var2.getLanguageTag() + ", " + var3.getLanguageTag());
        sb.append(")");
    }

    public static boolean appendNullChecks(List<MyNode> variables, StringBuilder sb) {
        int i = 0;
        for (MyNode var : variables) {
            i++;
            sb.append("null(");
            sb.append(var.getLabel());
            sb.append("), ");
            sb.append("null(");
            sb.append(var.getDatatype());
            sb.append("), ");
            sb.append("null(");
            sb.append(var.getLanguageTag());
            sb.append(")");
            if (variables.size() != i) {
                sb.append(", ");
            }
        }

        return !variables.isEmpty();
    }

    public void appendJoin(VariableQueryModel leftResult, VariableQueryModel rightResult, StringBuilder sb, int ruleId, String name, boolean distinct, boolean nullsIntroduced) {
        String lPrefix = nullsIntroduced ? V1_PREFIX : LOCAL_PREFIX;
        String rPrefix = nullsIntroduced ? V2_PREFIX : LOCAL_PREFIX;

        List<MyNode> bodyVars = mergeLists(prefixVars(leftResult.getVariableNames(), lPrefix), prefixVars(rightResult.getVariableNames(), rPrefix));
        List<MyNode> intersectionVars = intersectLists(leftResult.getVariableNames(), rightResult.getVariableNames());
        List joinVars = new ArrayList(bodyVars);
        joinVars.removeAll(prefixVars(intersectionVars, lPrefix));
        joinVars.removeAll(prefixVars(intersectionVars, rPrefix));
        joinVars.addAll(intersectionVars);

        int leftChildId = 2 * ruleId;
        int rightChildId = 2 * ruleId + 1;

        appendAnswerTerm(joinVars, sb, ruleId, name, distinct);
        sb.append(" :- ");
        appendAnswerTerm(prefixVars(leftResult.getVariableNames(), lPrefix), sb, leftChildId, name, distinct);
        sb.append(", ");
        appendAnswerTerm(prefixVars(rightResult.getVariableNames(), rPrefix), sb, rightChildId, name, distinct);
        if (!intersectionVars.isEmpty() && nullsIntroduced) {
            sb.append(", ");
            appendCompareTerms(intersectionVars, sb);
        }
        appendSkolemFunction(bodyVars, Arrays.asList(new Integer[]{leftChildId, rightChildId}), ruleId, distinct, sb);
    }

    public void appendZeroPathIfNodeIsNotTerm(MyNode node, boolean distinct, String graphName, int ruleId, StringBuilder sb) {
        appendAnswerTerm(Arrays.asList(X, X), sb, ruleId, graphName, distinct);
        sb.append(" :- ");
        sb.append(" not ");
        appendTerm(X, sb);
        sb.append(", ");
        sb.append(X.getLabel() + " = " + node.getLabel() + ", ");
        sb.append(X.getDatatype() + " = " + node.getDatatype() + ", ");
        sb.append(X.getLanguageTag() + " = " + node.getLanguageTag());
        appendContantSkolemFunction(ruleId, distinct, sb);
        sb.append(".\n");

    }

    public String parseQuery(String query) throws ParseException {
        Query q = QueryFactory.create(query);
        Op op = Algebra.compile(q);

        int ruleId = 1;
        boolean distinct = false;
        String graphName = "\"default\"";

        return parse(op, distinct, graphName, ruleId, q).getQuery();
    }

    //Parses Ask Feature (as these can only be checked when looking at the query q!
    public VariableQueryModel parse(Op op, boolean distinct, String graphName, int ruleId, Query q) throws ParseException {
        String askRuleId = "_ask" + ruleId;
        StringBuilder sb = new StringBuilder("");
        VariableQueryModel subResult;
        VariableQueryModel result;
        if (q.isAskType()) {
            distinct = true; // Ask queries do not care about how many results are created!
            int childRuleID = 2 * ruleId;
            subResult = parse(op, distinct, graphName, childRuleID);
            sb.append("ans" + ruleId + "(HasResult) :- ans" + askRuleId + "(HasResult).\n");
            sb.append("ans" + ruleId + "(HasResult) :- not ans" + askRuleId + "(#T), HasResult = #F.\n");
            sb.append("ans" + askRuleId + "(HasResult) :- ");
            appendAnswerTerm(subResult.getVariableNames(), sb, childRuleID, graphName, distinct);
            String askQueryFeature = sb.toString() + ", HasResult = #T.\n";

            result = new VariableQueryModel(askQueryFeature + subResult.getQuery(), subResult.getVariableNames(), subResult.isNullsIntroduced());
        } else if (q.isSelectType()) {
            result = parse(op, distinct, graphName, ruleId);
        } else {
            result = parse(op, distinct, graphName, ruleId);
        }
        return result;
    }

    public VariableQueryModel parse(Op op, boolean distinct, String graphName, int ruleId) throws ParseException {
        if (op instanceof OpDistinct) {
            return parse((OpDistinct) op, distinct, graphName, ruleId);
        } else if (op instanceof OpProject) {
            return parse((OpProject) op, distinct, graphName, ruleId);
        } else if (op instanceof OpUnion) {
            return parse((OpUnion) op, distinct, graphName, ruleId);
        } else if (op instanceof OpBGP) {
            return parse((OpBGP) op, distinct, graphName, ruleId);
        } else if (op instanceof OpJoin) {
            return parse((OpJoin) op, distinct, graphName, ruleId);
        } else if (op instanceof OpFilter) {
            return parse((OpFilter) op, distinct, graphName, ruleId);
        } else if (op instanceof OpLeftJoin) {
            return parse((OpLeftJoin) op, distinct, graphName, ruleId);
        } else if (op instanceof OpPath) {
            return parse((OpPath) op, distinct, graphName, ruleId);
        } else if (op instanceof OpOrder) {
            return parse((OpOrder) op, distinct, graphName, ruleId);
        } else if (op instanceof OpSlice) {
            return parse((OpSlice) op, distinct, graphName, ruleId);
        } else if (op instanceof OpMinus) {
            return parse((OpMinus) op, distinct, graphName, ruleId);
        } else if (op instanceof OpGraph) {
            return parse((OpGraph) op, distinct, graphName, ruleId);
        } else if (op instanceof OpExtend) {
            return parse((OpExtend) op, distinct, graphName, ruleId);
        } else if (op instanceof OpGroup) {
            return parse((OpGroup) op, distinct, graphName, ruleId);
        } else {
            throw new ParseException("MyException -> Operation " + op.getClass() + " unknown!", 1);
        }
    }

    public VariableQueryModel parse(OpGroup op, boolean distinct, String graphName, int ruleId) throws ParseException {
        StringBuilder sb = new StringBuilder("");
        int childId = 2 * ruleId;
        VariableQueryModel subResult = parse(op.getSubOp(), distinct, graphName, childId);

        List<ExprAggregator> aggregators = op.getAggregators();
        VarExprList groupExpr = op.getGroupVars();
        List<MyNode> groupVars = new ArrayList<>();
        List<MyNode> projectionVarsNames = new ArrayList<>();

        for (Var var : groupExpr.getVars()) {
            groupVars.add(getNodeLabel(var));
        }
        projectionVarsNames.addAll(groupVars);

        for (int i = 0; i < aggregators.size(); i++) {
            ExprAggregator aggregator = aggregators.get(i);
            FilterExpression aggregationExpression = parseFilterExpression(aggregator.getAggregator().getExprList(), 1);
            if (aggregationExpression instanceof MyNode) {
                //MyNode aggregationVar = (MyNode) aggregationExpression;
                MyNode aggregationResultVar = new MyNode(Aggregation_PREFIX + i);
                projectionVarsNames.add(aggregationResultVar);
            } else {
                throw new ParseException("MyException -> Further Expressions are not considered so far!", 1);
            }
        }


        appendAnswerTerm(projectionVarsNames, sb, ruleId, graphName, distinct);
        sb.append(" :- ");
        appendAnswerTerm(subResult.getVariableNames(), sb, childId, graphName, distinct);


        for (int i = 0; i < aggregators.size(); i++) {
            ExprAggregator aggregator = aggregators.get(i);
            String aggType = aggregator.getAggregator().getName();

            switch (aggType) {
                case "COUNT":
                    FilterExpression aggregationExpression = parseFilterExpression(aggregator.getAggregator().getExprList(), 1);
                    if (aggregationExpression instanceof MyNode) {
                        MyNode aggregationVar = (MyNode) aggregationExpression;
                        MyNode aggregationResultVar = new MyNode(Aggregation_PREFIX + i);

                        sb.append(", " + aggregationResultVar.getLabel() + " = " + "count(" + aggregationVar.getLabel() + "), " +
                                aggregationResultVar.getDatatype() + " = " + Integer_TYPE + ", " +
                                aggregationResultVar.getLanguageTag() + " = " + "\"\"");
                    } else {
                        throw new ParseException("MyException -> Further Expressions are not considered so far!", 1);
                    }
                    break;
                default:
                    throw new ParseException("MyException -> Unkown aggregation type: " + aggType, 1);
            }
        }

        appendContantSkolemFunction(ruleId, distinct, sb);
        String query = sb.toString() + ".\n";
        return new VariableQueryModel(query + subResult.getQuery(), projectionVarsNames, subResult.isNullsIntroduced());
    }

    public VariableQueryModel parse(OpExtend op, boolean distinct, String graphName, int ruleId) throws ParseException {
        StringBuilder sb = new StringBuilder("");
        int childId = 2 * ruleId;
        Map<Var, Expr> el = op.getVarExprList().getExprs();

        VariableQueryModel subResult = parse(op.getSubOp(), distinct, graphName, childId);
        Map<MyNode, MyNode> renamedVarsMap = subResult.getRenamedVarsMap();
        List<MyNode> renamedVars = new ArrayList<>();
        renamedVars.addAll(subResult.getVariableNames());

        String renameEqualityExpr = "";

        for (Var v : el.keySet()) {
            Expr expr = el.get(v);
            MyNode renamedVar = getNodeLabel(v);
            FilterExpression fe = parseExpression(expr);

            if (fe instanceof MyNode) {
                MyNode oldVar = (MyNode) fe;

                if (removePrefixes(oldVar.getLabel()).matches("\\.\\d+")) {
                    //If aggregation -> enumerate aggregations!
                    String aggregationString = removePrefixes(oldVar.getLabel()).replace(".", "");
                    int aggregationNumber = parseInt(aggregationString);
                    oldVar = new MyNode(Aggregation_PREFIX + aggregationNumber);
                }

                // Remove old variable
                renamedVars.remove(oldVar);
                // Add renamed variable
                renamedVars.add(renamedVar);

                if (renamedVarsMap.containsKey(oldVar)) {
                    // Rename oldVar, if it was already renamed previously (and thus does not occur in the result anymore!)
                    oldVar = renamedVarsMap.get(oldVar);
                }

                // Add mapping of old Var to renamed Var for future usage
                renamedVarsMap.put(oldVar, renamedVar);
                renameEqualityExpr += ", " + renamedVar.getLabel() + " = " + oldVar.getLabel() +
                        ", " + renamedVar.getDatatype() + " = " + oldVar.getDatatype() +
                        ", " + renamedVar.getLanguageTag() + " = " + oldVar.getLanguageTag();
            } else {
                throw new ParseException("Expression not considered so far: " + fe.getClass(), 1);
            }
        }
        appendAnswerTerm(renamedVars, sb, ruleId, graphName, distinct);
        sb.append(" :- ");
        appendAnswerTerm(subResult.getVariableNames(), sb, childId, graphName, distinct);
        sb.append(renameEqualityExpr);
        appendSkolemFunction(subResult.getVariableNames(), Arrays.asList(new Integer[]{childId}), ruleId, distinct, sb);
        String query = sb.toString() + ".\n";


        return new VariableQueryModel(query + subResult.getQuery(), renamedVars, renamedVarsMap, subResult.isNullsIntroduced());
    }

    public VariableQueryModel parse(OpGraph op, boolean distinct, String graphName, int ruleId) throws ParseException {
        StringBuilder sb = new StringBuilder("");
        int childId = 2 * ruleId;

        MyNode queriedGraph = getNodeLabel(op.getNode());
        VariableQueryModel subResult = parse(op.getSubOp(), distinct, queriedGraph.getLabel(), childId);
        List<MyNode> variables = new ArrayList<>();
        variables.addAll(subResult.getVariableNames());

        if (queriedGraph.getVariable()) {
            variables.add(new MyNode(queriedGraph));
        }

        appendAnswerTerm(variables, sb, ruleId, graphName, distinct);
        sb.append(" :- ");
        appendAnswerTerm(subResult.getVariableNames(), sb, childId, queriedGraph.getLabel(), distinct);
        sb.append(", named(" + queriedGraph.getLabel() + ")");
        sb.append(", " + queriedGraph.getDatatype() + " = \"URI\"");
        sb.append(", " + queriedGraph.getLanguageTag() + " = \"\"");
        appendSkolemFunction(variables, Arrays.asList(new Integer[]{childId}), ruleId, distinct, sb);
        String query = sb.toString() + ".\n";

        return new VariableQueryModel(query + subResult.getQuery(), variables, subResult.isNullsIntroduced());
    }

    public VariableQueryModel parse(OpDistinct op, boolean distinct, String graphName, int ruleId) throws ParseException {
        return parse(op.getSubOp(), true, graphName, ruleId);
    }

    public VariableQueryModel parse(OpProject op, boolean distinct, String graphName, int ruleId) throws ParseException {
        StringBuilder sb = new StringBuilder("");
        int childId = 2 * ruleId;
        List<MyNode> projectionVarsNames = prefixVars(getVarNames(op.getVars()), LOCAL_PREFIX);

        VariableQueryModel subResult = parse(op.getSubOp(), distinct, graphName, childId);

        appendAnswerTerm(projectionVarsNames, sb, ruleId, graphName, distinct);
        sb.append(" :- ");
        appendAnswerTerm(subResult.getVariableNames(), sb, childId, graphName, distinct);
        appendSkolemFunction(subResult.getVariableNames(), Arrays.asList(new Integer[]{childId}), ruleId, distinct, sb);
        String query = sb.toString() + ".\n";


        return new VariableQueryModel(query + subResult.getQuery(), projectionVarsNames, subResult.isNullsIntroduced());
    }

    public VariableQueryModel parse(OpBGP op, boolean distinct, String graphName, int ruleId) throws ParseException {
        // ansi(var(Pi),D):− triple(s,o,p,D).
        if (op.getPattern().size() > 1) {
            // In case of multiple triple patterns in a row no join operation is created, but a OpBGP with 3 triples
            // Thus here is a new join pattern created that contains in the left block the first triple and in the
            // right one the rest.

            List<Triple> bgpPatternList = op.getPattern().getList();

            Map<String, Set<Integer>> variableMapIndices = new HashMap<>();
            Map<Integer, Set<String>> indexMapVariable = new HashMap<>();
            for (int i = 0; i < bgpPatternList.size(); i++) {
                Triple t = bgpPatternList.get(i);
                List<Node> nodes = new ArrayList<>();
                nodes.add(t.getObject());
                nodes.add(t.getPredicate());
                nodes.add(t.getSubject());

                for (Node node : nodes) {
                    if (node.isVariable()) {
                        String varName = node.getName();
                        Set matches = variableMapIndices.getOrDefault(varName, new HashSet<>());
                        matches.add(i);
                        variableMapIndices.put(varName, matches);
                        Set variables = indexMapVariable.getOrDefault(i, new HashSet<>());
                        variables.add(varName);
                        indexMapVariable.put(i, variables);
                    }
                }
            }

            Map<Integer, Set<Integer>> indexMapMatches = new HashMap<>();
            for (int i = 0; i < bgpPatternList.size(); i++) {
                Set<String> variables = indexMapVariable.get(i);
                for (String var : variables) {
                    Set tmp_matches = indexMapMatches.getOrDefault(i, new HashSet<>());
                    Set var_matches = variableMapIndices.getOrDefault(var, new HashSet<>());
                    tmp_matches.addAll(var_matches);
                    indexMapMatches.put(i, tmp_matches);
                }
            }

            int matches = 0;
            int maxMatchIndex = 0;
            for (int i = 0; i < bgpPatternList.size(); i++) {
                int matchesOfTriple = indexMapMatches.get(i).size();
                if (matchesOfTriple > matches) {
                    matches = matchesOfTriple;
                    maxMatchIndex = i;
                }
            }

            List<List<Integer>> joinOrder = new ArrayList<>();

            int currentMatchingTree = -1;
            Queue<Integer> currMatches = new LinkedList<>();
            List<Integer> allJoinIndices = new ArrayList<>();

            while (allJoinIndices.size() < indexMapVariable.size()) {
                if (!currMatches.isEmpty()) {
                    int currIndex = currMatches.poll();
                    if (!allJoinIndices.contains(currIndex)) {
                        joinOrder.get(currentMatchingTree).add(currIndex);
                        allJoinIndices.add(currIndex);
                        currMatches.addAll(indexMapMatches.get(currIndex));
                    }
                }
                if (currMatches.isEmpty() && !(allJoinIndices.size() == indexMapVariable.size())) {
                    matches = 0;
                    maxMatchIndex = 0;
                    currentMatchingTree += 1;
                    for (int i = 0; i < bgpPatternList.size(); i++) {
                        int matchesOfTriple = indexMapMatches.get(i).size();

                        if (matchesOfTriple > matches && !(allJoinIndices.contains(i))) {
                            matches = matchesOfTriple;
                            maxMatchIndex = i;
                        }
                    }

                    joinOrder.add(new ArrayList<>());
                    joinOrder.get(currentMatchingTree).add(maxMatchIndex);
                    allJoinIndices.add(maxMatchIndex);
                    currMatches.addAll(indexMapMatches.get(maxMatchIndex));

                    //throw new ParseException("A cross product appears in parse(OpBGP op, ...), handle this in the future!", currMatches.size());
                }
            }

            List<Op> joinOpTree = new ArrayList<>();
            for (List<Integer> joinTree : joinOrder) {
                if (joinTree.size() != 1) {
                    BasicPattern bL = new BasicPattern();
                    int indexL = joinTree.get(0);
                    bL.add(bgpPatternList.get(indexL));
                    BasicPattern bR = new BasicPattern();
                    int indexR = joinTree.get(1);
                    bR.add(bgpPatternList.get(indexR));
                    OpBGP blockL = new OpBGP(bL);
                    OpBGP blockR = new OpBGP(bR);
                    Op join = OpJoin.create(blockL, blockR);

                    for (int i = 2; i < joinTree.size(); i++) {
                        bR = new BasicPattern();
                        indexR = joinTree.get(i);
                        bR.add(bgpPatternList.get(indexR));
                        blockR = new OpBGP(bR);
                        join = OpJoin.create(join, blockR);
                    }
                    joinOpTree.add(join);
                } else {
                    int index = joinTree.get(0);
                    BasicPattern bgp = new BasicPattern();
                    bgp.add(bgpPatternList.get(index));
                    OpBGP blockBGP = new OpBGP(bgp);
                    joinOpTree.add(blockBGP);
                }
            }

            Op finalJoin;

            if (joinOpTree.size() == 1) {
                finalJoin = joinOpTree.get(0);
            } else {
                Op left = joinOpTree.get(0);
                Op right = joinOpTree.get(1);
                finalJoin = OpJoin.create(left, right);
                for (int i = 2; i < joinOpTree.size(); i++) {
                    Op tree = joinOpTree.get(i);
                    finalJoin = OpJoin.create(finalJoin, tree);
                }
            }

            return parse(finalJoin, distinct, graphName, ruleId);
        }

        StringBuilder sb = new StringBuilder("");
        BasicPattern patterns = op.getPattern();

        Set<MyNode> allVariableNames = new HashSet<MyNode>();

        // List should always have only one value!
        if (patterns.getList().size() != 1) {
            throw new ParseException("MyException -> Triple patterns should only have one triple in the list. " +
                    "\n However following patterns found: " + patterns.getList(), 1);
        }

        for (Triple pattern : patterns.getList()) {
            List<MyNode> tripleVariableNames = new ArrayList<>();
            Node subject = pattern.getSubject();
            Node object = pattern.getObject();
            Node predicate = pattern.getPredicate();

            if (subject.isVariable()) {
                allVariableNames.add(new MyNode(subject.getName()));
                tripleVariableNames.add(new MyNode(subject.getName()));
            }
            if (predicate.isVariable()) {
                allVariableNames.add(new MyNode(predicate.getName()));
                tripleVariableNames.add(new MyNode(predicate.getName()));
            }
            if (object.isVariable()) {
                allVariableNames.add(new MyNode(object.getName()));
                tripleVariableNames.add(new MyNode(object.getName()));
            }

            MyNode subjectNode = getNodeLabel(subject);
            MyNode predicateNode = getNodeLabel(predicate);
            MyNode objectNode = getNodeLabel(object);

            appendAnswerTerm(tripleVariableNames, sb, ruleId, graphName, distinct);
            sb.append(" :- ").append("triple(").append(subjectNode.getLabel()).append(", ").append(subjectNode.getDatatype()).append(", ").append(subjectNode.getLanguageTag()).append(", ");
            sb.append(predicateNode.getLabel()).append(", ").append(predicateNode.getDatatype()).append(", ").append(predicateNode.getLanguageTag()).append(", ");
            sb.append(objectNode.getLabel()).append(", ").append(objectNode.getDatatype()).append(", ").append(objectNode.getLanguageTag()).append(", ").append(graphName).append(")");
            appendSkolemFunction(Arrays.asList(new MyNode[]{subjectNode, predicateNode, objectNode}), new ArrayList<>(), ruleId, distinct, sb);

            sb.append(".\n");
        }

        List<MyNode> allVarNamesUnique = new ArrayList();
        allVarNamesUnique.addAll(allVariableNames);

        return new VariableQueryModel(sb.toString(), prefixVars(allVarNamesUnique, LOCAL_PREFIX));
    }

    public VariableQueryModel parse(OpJoin op, boolean distinct, String graphName, int ruleId) throws ParseException {
        //"ansi(x,D):− ans2i(v1(var(P1)),D), ans2i+1(v2(var(P2)),D), comp(v1(x1),v2(x1),x1),...,comp(v1(xn),v2(xn),xn)";
        StringBuilder sb = new StringBuilder("");

        int leftChildId = 2 * ruleId;
        int rightChildId = 2 * ruleId + 1;

        VariableQueryModel leftResult = parse(op.getLeft(), distinct, graphName, leftChildId);
        VariableQueryModel rightResult = parse(op.getRight(), distinct, graphName, rightChildId);
        boolean nullsIntroduced = leftResult.isNullsIntroduced() || rightResult.isNullsIntroduced();
        List<MyNode> allVars = mergeLists(leftResult.getVariableNames(), rightResult.getVariableNames());

        appendJoin(leftResult, rightResult, sb, ruleId, graphName, distinct, nullsIntroduced);
        String query = sb.toString() + ".\n";

        return new VariableQueryModel(query + leftResult.getQuery() + rightResult.getQuery(), allVars, nullsIntroduced);
    }

    public VariableQueryModel parse(OpUnion op, boolean distinct, String graphName, int ruleId) throws ParseException {
        StringBuilder sb = new StringBuilder("");
        int leftChildId = 2 * ruleId;
        int rightChildId = 2 * ruleId + 1;
        VariableQueryModel leftResult = parse(op.getLeft(), distinct, graphName, leftChildId);
        VariableQueryModel rightResult = parse(op.getRight(), distinct, graphName, rightChildId);
        boolean nullsIntroduced = leftResult.isNullsIntroduced() || rightResult.isNullsIntroduced();

        List<MyNode> allVars = mergeLists(leftResult.getVariableNames(), rightResult.getVariableNames());

        appendAnswerTerm(allVars, sb, ruleId, graphName, distinct);
        sb.append(" :- ");
        appendAnswerTerm(leftResult.getVariableNames(), sb, leftChildId, graphName, distinct);
        List<MyNode> rightWithoutLeft = new ArrayList();
        rightWithoutLeft.addAll(rightResult.getVariableNames());
        rightWithoutLeft.removeAll(leftResult.getVariableNames());
        if (!rightWithoutLeft.isEmpty()) {
            sb.append(", ");
            nullsIntroduced = nullsIntroduced | appendNullChecks(rightWithoutLeft, sb);
        }
        appendSkolemFunction(allVars, Arrays.asList(new Integer[]{leftChildId}), ruleId, distinct, sb);
        sb.append(".\n");

        appendAnswerTerm(allVars, sb, ruleId, graphName, distinct);
        sb.append(" :- ");
        appendAnswerTerm(rightResult.getVariableNames(), sb, rightChildId, graphName, distinct);
        List<MyNode> leftWithoutRight = new ArrayList();
        leftWithoutRight.addAll(leftResult.getVariableNames());
        leftWithoutRight.removeAll(rightResult.getVariableNames());
        if (!leftWithoutRight.isEmpty()) {
            sb.append(", ");
            nullsIntroduced = nullsIntroduced | appendNullChecks(leftWithoutRight, sb);
        }
        appendSkolemFunction(allVars, Arrays.asList(new Integer[]{rightChildId}), ruleId, distinct, sb);
        String query = sb.toString() + ".\n";

        return new VariableQueryModel(query + leftResult.getQuery() + rightResult.getQuery(), allVars, nullsIntroduced);
    }

    public VariableQueryModel parse(OpMinus op, boolean distinct, String graphName, int ruleId) throws ParseException {
        StringBuilder sb = new StringBuilder("");
        int leftChildId = 2 * ruleId;
        int rightChildId = 2 * ruleId + 1;
        String joinRuleId = "_join" + ruleId;
        String equalRuleId = "_equal" + ruleId;

        VariableQueryModel leftResult = parse(op.getLeft(), distinct, graphName, leftChildId);
        VariableQueryModel rightResult = parse(op.getRight(), distinct, graphName, rightChildId);

        boolean nullsIntroduced = leftResult.isNullsIntroduced() || rightResult.isNullsIntroduced();
        String mPrefix = nullsIntroduced ? V2_PREFIX : LOCAL_PREFIX;

        List<MyNode> bodyVars = new ArrayList();
        List<MyNode> allVars = mergeLists(leftResult.getVariableNames(), prefixVars(rightResult.getVariableNames(), V2_PREFIX));
        List<MyNode> intersectionVars = intersectLists(leftResult.getVariableNames(), rightResult.getVariableNames());

        // joinable tuple from left child such that values from left child are NOT null
        if (!intersectionVars.isEmpty()) {
            appendAnswerTerm(allVars, sb, joinRuleId, graphName, true);
            sb.append(" :- ");
            appendAnswerTerm(leftResult.getVariableNames(), sb, leftChildId, graphName, distinct);
            sb.append(", ");
            appendAnswerTerm(prefixVars(rightResult.getVariableNames(), mPrefix), sb, rightChildId, graphName, distinct);
            if (nullsIntroduced) {
                sb.append(", ");
                appendCompareTerms(intersectionVars, sb, new String[]{LOCAL_PREFIX, mPrefix});
            }
            sb.append(".\n");

            for (MyNode inersectVar : intersectionVars) {
                appendAnswerTerm(leftResult.getVariableNames(), sb, equalRuleId, graphName, true);
                sb.append(" :- ");
                appendAnswerTerm(allVars, sb, joinRuleId, graphName, true);
                sb.append(", ");
                sb.append(inersectVar.getLabel() + " = " + prefixVar(inersectVar.getLabel(), mPrefix) + ".\n");
            }

            appendAnswerTerm(leftResult.getVariableNames(), sb, ruleId, graphName, distinct);
            sb.append(" :- ");
            appendAnswerTerm(leftResult.getVariableNames(), sb, leftChildId, graphName, distinct);
            sb.append(", not ");
            appendAnswerTerm(leftResult.getVariableNames(), sb, equalRuleId, graphName, true);

        } else {
            appendAnswerTerm(leftResult.getVariableNames(), sb, ruleId, graphName, distinct);
            sb.append(" :- ");
            appendAnswerTerm(leftResult.getVariableNames(), sb, leftChildId, graphName, distinct);
        }

        appendSkolemFunction(leftResult.getVariableNames(), Arrays.asList(new Integer[]{leftChildId}), ruleId, distinct, sb);

        String query = sb.toString() + ".\n";

        return new VariableQueryModel(query + leftResult.getQuery() + rightResult.getQuery(), leftResult.getVariableNames(), nullsIntroduced);
    }

    public MyNode parseExpression(Expr expr) throws ParseException {
        if (expr.isVariable()) {
            return getNodeLabel(expr.getExprVar().getAsNode());
        } else if (expr.isConstant()) {
            return getNodeLabel(expr.getConstant().asNode());
        } else if (expr.isFunction()) {
            ExprFunction function = expr.getFunction();
            List<Expr> args = function.getArgs();
            String funcName = function.getFunctionSymbol().getSymbol();
            if (!funcName.equals("str")) {
                throw new ParseException("MyException -> Expressionfunction not known " + funcName, 1);
            } else {
                if (args.size() > 1) {
                    String argsString = "Arg: ";
                    for (Expr arg : args) {
                        argsString += getNodeLabel(arg.asVar().asNode()).getLabel() + ", ";
                    }
                    throw new ParseException("MyException -> Expressionfunction str should have only one argument: " + argsString, 1);
                }
                MyNode functionNode = getNodeLabel(args.get(0).asVar().asNode());
                functionNode.setFunction(funcName);
                return functionNode;
            }
        } else {
            throw new ParseException("MyException -> Expressiontype not known: " + expr, 1);
        }
    }

    public FilterExpression parseFilterExpression(ExprList expressions, int expressionId) throws ParseException {
        FilterExpression expression = null;

        int leftExprId = expressionId * 2;
        int rightExprId = expressionId * 2 + 1;

        if (expressions.size() > 1) {
            Expr expL = expressions.get(0);
            List<Expr> allExprs = new ArrayList<>();
            List<Expr> regexExprs = new ArrayList<>();

            for (Expr expr : expressions) {
                if (expr instanceof E_Regex || (expr instanceof E_LogicalNot && ((E_LogicalNot) expr).getArg() instanceof E_Regex)) {
                    regexExprs.add(expr);
                } else {
                    allExprs.add(expr);
                }
            }
            allExprs.addAll(regexExprs);

            for (int i = 1; i < allExprs.size(); i++) {
                Expr expR = allExprs.get(i);
                expL = new E_LogicalAnd(expL, expR);
            }
            return parseFilterExpression(new ExprList(expL), 1);
        }

        for (Expr exp : expressions) {
            if (exp instanceof ExprFunction2) {
                if (exp instanceof E_LogicalAnd) {
                    // Logical expressions are treated differently
                    expression = new BinaryLogicalAndExpr(parseFilterExpression(new ExprList(((E_LogicalAnd) exp).getArg1()), leftExprId), parseFilterExpression(new ExprList(((E_LogicalAnd) exp).getArg2()), rightExprId));
                } else {
                    String op = "";
                    MyNode arg1 = parseExpression(((ExprFunction2) exp).getArg1());
                    MyNode arg2 = parseExpression(((ExprFunction2) exp).getArg2());
                    if (exp instanceof E_Equals) {
                        op = "=";
                    } else if (exp instanceof E_NotEquals) {
                        op = "!=";
                    } else if (exp instanceof E_GreaterThan) {
                        op = ">";
                    } else if (exp instanceof E_GreaterThanOrEqual) {
                        op = ">=";
                    } else if (exp instanceof E_LessThan) {
                        op = "<";
                    } else if (exp instanceof E_LessThanOrEqual) {
                        op = "<=";
                    } else {
                        throw new ParseException("MyException -> Binary Expression " + exp + " not known", 1);
                    }

                    //Otherwise if not logical binary expression -> do the same
                    expression = new BinaryFunctionExpr(arg1, arg2, op);
                }
            } else if (exp instanceof ExprFunction1) {
                if (exp instanceof E_LogicalNot) {
                    Expr subExpr = ((E_LogicalNot) exp).getArg();
                    if (subExpr instanceof E_Regex) {
                        expression = parseFilterExpression(new ExprList(subExpr), expressionId);
                        ((RegexExpr) expression).setRegexBoolean(false);
                        return expression;
                    } else {
                        return new AtomicLogicalNotExpr(parseFilterExpression(new ExprList(subExpr), leftExprId));
                    }
                }

                MyNode arg1 = parseExpression(((ExprFunction1) exp).getArg());
                String op = "";
                if (exp instanceof E_Bound) {
                    op = "term";
                } else if (exp instanceof E_IsIRI) {
                    op = "iri";
                } else if (exp instanceof E_IsBlank) {
                    op = "bnode";
                } else if (exp instanceof E_IsLiteral) {
                    op = "literal";
                } else {
                    throw new ParseException("MyException -> Unary Expression " + exp + " not known", 1);
                }

                expression = new UnaryFunctionExpr(arg1, op, op == "term");

            } else if (exp instanceof ExprVar) {
                expression = parseExpression(exp);
            } else if (exp instanceof E_Regex) {
                List<Expr> args = ((E_Regex) exp).getArgs();
                MyNode variable;
                MyNode regex;
                MyNode flag = null;

                if (args.size() >= 2) {
                    variable = parseExpression(args.get(0));
                    regex = parseExpression(args.get(1));

                    if (args.size() == 3) {
                        flag = parseExpression(args.get(2));
                        switch (flag.getLabel()) {
                            case "\"i\"":
                                flag.setLabel("\"CASE_INSENSITIVE\"");
                                break;
                            default:
                                throw new ParseException("MyException -> Regex flag unknown: " + flag.getLabel(), 1);
                        }

                    } else if (args.size() > 3) {
                        throw new ParseException("MyException -> Regex has more than three arguments!", 1);
                    }
                } else {
                    throw new ParseException("MyException -> Regex has less than two arguments!", 1);
                }

                List<MyNode> list = new ArrayList<>();
                list.add(variable);
                list.add(regex);

                if (flag != null) {
                    list.add(flag);
                }

                expression = new RegexExpr(list, "reg:contains", expressionId);
            } else {
                throw new ParseException("MyException -> Non-unary/non-binary non-variable Expression " + exp + " not known", 1);
            }
        }
        return expression;
    }

    public VariableQueryModel parse(OpFilter op, boolean distinct, String graphName, int ruleId) throws ParseException {
        // ansi(var(Pi),D):− ans2i(var(P1),D),C.
        StringBuilder sb = new StringBuilder("");
        int childId = 2 * ruleId;
        VariableQueryModel subResult = parse(op.getSubOp(), distinct, graphName, childId);

        appendAnswerTerm(subResult.getVariableNames(), sb, ruleId, graphName, distinct);
        sb.append(" :- ");
        appendAnswerTerm(subResult.getVariableNames(), sb, childId, graphName, distinct);
        sb.append(", ").append(parseFilterExpression(op.getExprs(), 1));
        appendSkolemFunction(subResult.getVariableNames(), Arrays.asList(new Integer[]{2 * ruleId}), ruleId, distinct, sb);
        String query = sb.toString() + ".\n";
        return new VariableQueryModel(query + subResult.getQuery(), subResult.getVariableNames(), subResult.isNullsIntroduced());
    }

    public VariableQueryModel parse(OpLeftJoin op, boolean distinct, String graphName, int ruleId) throws ParseException {
        //"ansi(x,D):− ans2i(v1(var(P1)),D), ans2i+1(v2(var(P2)),D), comp(v1(x1),v2(x1),x1),...,comp(v1(xn),v2(xn),xn)";
        StringBuilder sb = new StringBuilder("");
        int leftChildId = 2 * ruleId;
        int rightChildId = 2 * ruleId + 1;
        String optRuleId = "_opt" + ruleId;

        VariableQueryModel leftResult = parse(op.getLeft(), distinct, graphName, leftChildId);
        VariableQueryModel rightResult = parse(op.getRight(), distinct, graphName, rightChildId);

        List<MyNode> allVars = mergeLists(leftResult.getVariableNames(), rightResult.getVariableNames());
        List<MyNode> intersectionVars = intersectLists(leftResult.getVariableNames(), rightResult.getVariableNames());
        List<MyNode> leftMinusRightVars = removeListFromList(leftResult.getVariableNames(), rightResult.getVariableNames());
        List<MyNode> rightMinusLeftVars = removeListFromList(rightResult.getVariableNames(), leftResult.getVariableNames());

        boolean nullsIntroduced = leftResult.isNullsIntroduced() || rightResult.isNullsIntroduced() || !rightMinusLeftVars.isEmpty();

        // joinable tuple from left child such that values from left child are NOT null
        appendAnswerTerm(leftResult.getVariableNames(), sb, optRuleId, graphName, true);
        sb.append(" :- ");
        appendAnswerTerm(leftResult.getVariableNames(), sb, leftChildId, graphName, distinct);
        sb.append(", ");
        appendAnswerTerm(prefixVars(rightResult.getVariableNames(), V2_PREFIX), sb, rightChildId, graphName, distinct);
        if (!intersectionVars.isEmpty() && nullsIntroduced) {
            sb.append(", ");
            appendCompareTerms(intersectionVars, sb, new String[]{LOCAL_PREFIX, V2_PREFIX});
        }
        if (op.getExprs() != null) {
            FilterExpression fe = parseFilterExpression(op.getExprs(), 1);
            fe.prefixVars(LOCAL_PREFIX, leftMinusRightVars, V2_PREFIX, rightMinusLeftVars);
            sb.append(", " + fe + ".\n");
        } else {
            sb.append(".\n");
        }

        // normal join
        appendJoin(leftResult, rightResult, sb, ruleId, graphName, distinct, nullsIntroduced);
        if (op.getExprs() != null) {
            FilterExpression fe = parseFilterExpression(op.getExprs(), 1);
            fe.prefixVars(V1_PREFIX, leftMinusRightVars, V2_PREFIX, rightMinusLeftVars);
            sb.append(", " + fe + ".\n");
        } else {
            sb.append(".\n");
        }

        // adding missing tuples from left child
        appendAnswerTerm(allVars, sb, ruleId, graphName, distinct);
        sb.append(" :- ");
        appendAnswerTerm(leftResult.getVariableNames(), sb, leftChildId, graphName, distinct);
        sb.append(", not ");
        appendAnswerTerm(leftResult.getVariableNames(), sb, optRuleId, graphName, true);

        if (!rightMinusLeftVars.isEmpty()) {
            sb.append(", ");
            appendNullChecks(rightMinusLeftVars, sb);
        }
        appendSkolemFunction(allVars, Arrays.asList(new Integer[]{leftChildId}), ruleId, distinct, sb);

        String query = sb.toString() + ".\n";

        return new VariableQueryModel(query + leftResult.getQuery() + rightResult.getQuery(), allVars, nullsIntroduced);
    }


    public VariableQueryModel parse(OpOrder op, boolean distinct, String graphName, int ruleId) throws ParseException {
        StringBuilder sb = new StringBuilder("");
        VariableQueryModel subResult = parse(op.getSubOp(), distinct, graphName, ruleId);

        List<MyNode> varnames = subResult.getVariableNames();
        Collections.sort(varnames, compareLabelsWithoutPrefix);

        String conditions = "";

        for (SortCondition sc : op.getConditions()) {
            int position = (varnames.indexOf(parseExpression(sc.getExpression()))) * 3 + 1;
            conditions += sc.getDirection() == -2 ? position : "-" + position;
            conditions += ", ";
        }
        conditions = conditions.substring(0, conditions.length() - 2);

        sb.append("@post(\"ans").append(ruleId).append("\", \"orderby(").append(conditions).append(")\").\n");
        return new VariableQueryModel(subResult.getQuery() + sb, subResult.getVariableNames(), subResult.isNullsIntroduced());
    }

    public VariableQueryModel parse(OpSlice op, boolean distinct, String graphName, int ruleId) throws ParseException {
        StringBuilder sb = new StringBuilder("");
        VariableQueryModel subResult = parse(op.getSubOp(), distinct, graphName, ruleId);

        sb.append("@post(\"ans").append(ruleId).append("\", \"limit(").append(op.getLength()).append(")\").\n");
        return new VariableQueryModel(subResult.getQuery() + sb, subResult.getVariableNames(), subResult.isNullsIntroduced());
    }


    public VariableQueryModel parse(OpPath op, boolean distinct, String graphName, int ruleId) throws ParseException {
        StringBuilder sb = new StringBuilder("");
        TriplePath triplePath = op.getTriplePath();
        Path path = triplePath.getPath();

        MyNode s = getNodeLabel(triplePath.getSubject());
        MyNode o = getNodeLabel(triplePath.getObject());

        int childId = 2 * ruleId;
        VariableQueryModel subResult = parsePath(path, s, o, distinct, graphName, childId);

        MyNode sVar = s.getVariable() ? s : X;
        MyNode oVar = o.getVariable() ? o : Y;

        List<MyNode> varsOfInterest = new ArrayList<>();
        if (s.getVariable()) {
            varsOfInterest.add(s);
        }
        if (o.getVariable()) {
            varsOfInterest.add(o);
        }

        appendAnswerTerm(varsOfInterest, sb, ruleId, graphName, distinct);
        sb.append(" :- ");
        appendAnswerTerm(Arrays.asList(sVar, oVar), sb, childId, graphName, distinct, false);
        if (!s.getVariable()) {
            sb.append(", " + sVar.getLabel() + " = " + s.getLabel());
            sb.append(", " + sVar.getDatatype() + " = " + s.getDatatype());
            sb.append(", " + sVar.getLanguageTag() + " = " + s.getLanguageTag());
        }
        if (!o.getVariable()) {
            sb.append(", " + oVar.getLabel() + " = " + o.getLabel());
            sb.append(", " + oVar.getDatatype() + " = " + o.getDatatype());
            sb.append(", " + oVar.getLanguageTag() + " = " + o.getLanguageTag());
        }
        appendSkolemFunction(Arrays.asList(sVar, oVar), Arrays.asList(new Integer[]{childId}), ruleId, distinct, sb);
        String query = sb.toString() + ".\n";

        return new VariableQueryModel(query + subResult.getQuery(), varsOfInterest, subResult.isNullsIntroduced());
    }

    public VariableQueryModel parsePath(Path path, MyNode s, MyNode o, boolean distinct, String name, int ruleId) throws ParseException {
        if (path instanceof P_Inverse) {
            return parsePath((P_Inverse) path, s, o, distinct, name, ruleId);
        } else if (path instanceof P_OneOrMore1) {
            return parsePath((P_OneOrMore1) path, s, o, distinct, name, ruleId);
        } else if (path instanceof P_ZeroOrMore1) {
            return parsePath((P_ZeroOrMore1) path, s, o, distinct, name, ruleId);
        } else if (path instanceof P_ZeroOrOne) {
            return parsePath((P_ZeroOrOne) path, s, o, distinct, name, ruleId);
        } else if (path instanceof P_Alt) {
            return parsePath((P_Alt) path, s, o, distinct, name, ruleId);
        } else if (path instanceof P_Link) {
            return parsePath((P_Link) path, s, o, distinct, name, ruleId);
        } else if (path instanceof P_Seq) {
            return parsePath((P_Seq) path, s, o, distinct, name, ruleId);
        } else if (path instanceof P_NegPropSet) {
            return parsePath((P_NegPropSet) path, s, o, distinct, name, ruleId);
        } else {
            throw new ParseException("MyException -> Path type unkown: " + path, -1);
        }
    }

    public VariableQueryModel parsePath(P_NegPropSet path, MyNode s, MyNode o, boolean distinct, String graphName, int ruleId) throws ParseException {
        int childId = 2 * ruleId;
        StringBuilder sb = new StringBuilder("");
        MyNode pathVar = new MyNode("Path");

        BasicPattern bgp = new BasicPattern();
        bgp.add(new Triple(new Node_Variable("X"), new Node_Variable("Path"), new Node_Variable("Y")));
        VariableQueryModel subResult = parse(new OpBGP(bgp), distinct, graphName, childId);

        List<Node> fwdNodes = path.getFwdNodes();

        if (!fwdNodes.isEmpty()) {
            appendAnswerTerm(Arrays.asList(X, Y), sb, ruleId, graphName, distinct, false);
            sb.append(" :- ");
            appendAnswerTerm(Arrays.asList(X, pathVar, Y), sb, childId, graphName, distinct);

            for (Node fwdNode : path.getFwdNodes()) {
                sb.append(", ");
                sb.append(pathVar.getLabel() + " != " + getNodeLabel(fwdNode).getLabel());
            }
            appendSkolemFunction(Arrays.asList(new MyNode[]{X, pathVar, Y}), Arrays.asList(new Integer[]{childId}), ruleId, distinct, sb);
            sb.append(".\n");
        }

        List<Node> bwdNodes = path.getBwdNodes();
        if (!bwdNodes.isEmpty()) {
            appendAnswerTerm(Arrays.asList(Y, X), sb, ruleId, graphName, distinct, false);
            sb.append(" :- ");
            appendAnswerTerm(Arrays.asList(X, pathVar, Y), sb, childId, graphName, distinct);
            for (Node bwdNode : bwdNodes) {
                sb.append(", ");
                sb.append(pathVar.getLabel() + " != " + getNodeLabel(bwdNode).getLabel());
            }
            appendSkolemFunction(Arrays.asList(new MyNode[]{Y, pathVar, X}), Arrays.asList(new Integer[]{childId}), ruleId, distinct, sb, "inv");
            sb.append(".\n");
        }

        return new VariableQueryModel(sb.toString() + subResult.getQuery(), subResult.getVariableNames(), subResult.isNullsIntroduced());
    }


    public VariableQueryModel parsePath(P_Inverse path, MyNode s, MyNode o, boolean distinct, String graphName, int ruleId) throws ParseException {
        int childId = 2 * ruleId;
        VariableQueryModel subResult = parsePath(path.getSubPath(), s, o, distinct, graphName, childId);

        StringBuilder sb = new StringBuilder("");
        appendAnswerTerm(Arrays.asList(X, Y), sb, ruleId, graphName, distinct);
        sb.append(" :- ");
        appendAnswerTerm(Arrays.asList(Y, X), sb, childId, graphName, distinct, false);
        appendSkolemFunction(Arrays.asList(X, Y), Arrays.asList(new Integer[]{childId}), ruleId, distinct, sb);
        sb.append(".\n");

        return new VariableQueryModel(sb.toString() + subResult.getQuery(), subResult.getVariableNames(), subResult.isNullsIntroduced());
    }

    public VariableQueryModel parsePath(P_Seq path, MyNode s, MyNode o, boolean distinct, String name, int ruleId) throws ParseException {
        int leftChildId = 2 * ruleId;
        int rightChildId = leftChildId + 1;
        VariableQueryModel leftResult = parsePath(path.getLeft(), s, o, distinct, name, leftChildId);
        VariableQueryModel rightResult = parsePath(path.getRight(), s, o, distinct, name, rightChildId);

        StringBuilder sb = new StringBuilder("");
        appendAnswerTerm(Arrays.asList(X, Y), sb, ruleId, name, distinct);
        sb.append(" :- ");
        appendAnswerTerm(Arrays.asList(X, Z), sb, leftChildId, name, distinct);
        sb.append(", ");
        appendAnswerTerm(Arrays.asList(W, Y), sb, rightChildId, name, distinct);

        sb.append(", ");
        appendCompareTerms(Z, W, W, sb);
        appendSkolemFunction(Arrays.asList(X, Y, W, Z),
                Arrays.asList(new Integer[]{leftChildId, rightChildId}), ruleId, distinct, sb);
        sb.append(".\n");

        List<MyNode> allVars = mergeLists(leftResult.getVariableNames(), rightResult.getVariableNames());

        return new VariableQueryModel(sb.toString() + leftResult.getQuery() + rightResult.getQuery(), allVars, leftResult.isNullsIntroduced() || rightResult.isNullsIntroduced());
    }

    public VariableQueryModel parsePath(P_Alt path, MyNode s, MyNode o, boolean distinct, String graphName, int ruleId) throws ParseException {
        int leftChildId = 2 * ruleId;
        int rightChildId = leftChildId + 1;
        VariableQueryModel leftResult = parsePath(path.getLeft(), s, o, distinct, graphName, leftChildId);
        VariableQueryModel rightResult = parsePath(path.getRight(), s, o, distinct, graphName, rightChildId);

        StringBuilder sb = new StringBuilder("");
        appendAnswerTerm(Arrays.asList(X, Y), sb, ruleId, graphName, distinct);
        sb.append(" :- ");
        appendAnswerTerm(Arrays.asList(X, Y), sb, leftChildId, graphName, distinct);
        appendSkolemFunction(Arrays.asList(X, Y),
                Arrays.asList(new Integer[]{leftChildId}), ruleId, distinct, sb);
        sb.append(".\n");

        appendAnswerTerm(Arrays.asList(X, Y), sb, ruleId, graphName, distinct);
        sb.append(" :- ");
        appendAnswerTerm(Arrays.asList(X, Y), sb, rightChildId, graphName, distinct);
        appendSkolemFunction(Arrays.asList(X, Y),
                Arrays.asList(new Integer[]{rightChildId}), ruleId, distinct, sb);
        sb.append(".\n");

        List<MyNode> allVars = mergeLists(leftResult.getVariableNames(), rightResult.getVariableNames());
        return new VariableQueryModel(sb.toString() + leftResult.getQuery() + rightResult.getQuery(), allVars, leftResult.isNullsIntroduced() || rightResult.isNullsIntroduced());
    }

    public VariableQueryModel parsePath(P_OneOrMore1 path, MyNode s, MyNode o, boolean distinct, String graphName, int ruleId) throws ParseException {
        int childId = 2 * ruleId;
        VariableQueryModel subResult = parsePath(path.getSubPath(), s, o, distinct, graphName, childId);

        StringBuilder sb = new StringBuilder("");
        appendAnswerTerm(Arrays.asList(X, Y), sb, ruleId, graphName, distinct);
        sb.append(" :- ");
        appendAnswerTerm(Arrays.asList(X, Y), sb, childId, graphName, distinct);
        appendContantSkolemFunction(ruleId, distinct, sb);
        sb.append(".\n");

        appendAnswerTerm(Arrays.asList(X, Z), sb, ruleId, graphName, distinct);
        sb.append(" :- ");
        appendAnswerTerm(Arrays.asList(X, Y), sb, childId, graphName, distinct);
        sb.append(", ");
        appendAnswerTerm(Arrays.asList(Y, Z), sb, ruleId, graphName, distinct);
        sb.append(", not ");
        appendAnswerTerm(Arrays.asList(X, Z), sb, ruleId, graphName, distinct);
        appendContantSkolemFunction(ruleId, distinct, sb);
        sb.append(".\n");

        return new VariableQueryModel(sb.toString() + subResult.getQuery(), subResult.getVariableNames(), subResult.isNullsIntroduced());
    }

    public VariableQueryModel parsePath(P_ZeroOrMore1 path, MyNode s, MyNode o, boolean distinct, String graphName, int ruleId) throws ParseException {
        int oneOrMoreID = 2 * ruleId;
        Path oneOrMorePath = new P_OneOrMore1(path.getSubPath());
        VariableQueryModel oneOrMoreResult = parsePath((P_OneOrMore1) oneOrMorePath, s, o, distinct, graphName, oneOrMoreID);

        StringBuilder sb = new StringBuilder("");

        if (!s.getVariable() && o.getVariable()) {
            appendZeroPathIfNodeIsNotTerm(s, distinct, graphName, ruleId, sb);
        } else if (s.getVariable() && !o.getVariable()) {
            appendZeroPathIfNodeIsNotTerm(o, distinct, graphName, ruleId, sb);
        } else if (!s.getVariable() && !o.getVariable() && s.equals(o)) {
            appendZeroPathIfNodeIsNotTerm(o, distinct, graphName, ruleId, sb);
        }

        appendAnswerTerm(Arrays.asList(X, X), sb, ruleId, graphName, distinct);
        sb.append(" :- ");
        appendSubjectOrObject(X, sb);
        sb.append(", not ");
        appendAnswerTerm(Arrays.asList(X, X), sb, oneOrMoreID, graphName, distinct);
        appendContantSkolemFunction(ruleId, distinct, sb);
        sb.append(".\n");

        appendAnswerTerm(Arrays.asList(X, Y), sb, ruleId, graphName, distinct);
        sb.append(" :- ");
        appendAnswerTerm(Arrays.asList(X, Y), sb, oneOrMoreID, graphName, distinct);
        appendContantSkolemFunction(ruleId, distinct, sb);
        sb.append(".\n");

        List<MyNode> allVars = oneOrMoreResult.getVariableNames();
        return new VariableQueryModel(sb.toString() + oneOrMoreResult.getQuery(), allVars, oneOrMoreResult.isNullsIntroduced());
    }

    public VariableQueryModel parsePath(P_ZeroOrOne path, MyNode s, MyNode o, boolean distinct, String graphName, int ruleId) throws ParseException {
        int childId = 2 * ruleId;
        VariableQueryModel subResult = parsePath(path.getSubPath(), s, o, distinct, graphName, childId);

        StringBuilder sb = new StringBuilder("");

        if (!s.getVariable() && o.getVariable()) {
            appendZeroPathIfNodeIsNotTerm(s, distinct, graphName, ruleId, sb);
        } else if (s.getVariable() && !o.getVariable()) {
            appendZeroPathIfNodeIsNotTerm(o, distinct, graphName, ruleId, sb);
        } else if (!s.getVariable() && !o.getVariable() && s.equals(o)) {
            appendZeroPathIfNodeIsNotTerm(o, distinct, graphName, ruleId, sb);
        }

        appendAnswerTerm(Arrays.asList(X, X), sb, ruleId, graphName, distinct);
        sb.append(" :- ");
        appendSubjectOrObject(X, sb);
        sb.append(", not ");
        appendAnswerTerm(Arrays.asList(X, X), sb, childId, graphName, distinct);
        appendContantSkolemFunction(ruleId, distinct, sb);
        sb.append(".\n");

        appendAnswerTerm(Arrays.asList(X, Y), sb, ruleId, graphName, distinct);
        sb.append(" :- ");
        appendAnswerTerm(Arrays.asList(X, Y), sb, childId, graphName, distinct);
        appendContantSkolemFunction(ruleId, distinct, sb);
        sb.append(".\n");

        return new VariableQueryModel(sb.toString() + subResult.getQuery(), subResult.getVariableNames(), subResult.isNullsIntroduced());

    }

    public VariableQueryModel parsePath(P_Link path, MyNode s, MyNode o, boolean distinct, String graphName, int ruleId) throws ParseException {
        List<MyNode> resultVariables = new ArrayList<>();
        BasicPattern bgp = new BasicPattern();
        bgp.add(new Triple(new Node_Variable("X"), path.getNode(), new Node_Variable("Y")));
        return new VariableQueryModel(parse(new OpBGP(bgp), distinct, graphName, ruleId).getQuery(), resultVariables);
    }
}

