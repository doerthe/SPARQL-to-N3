package Translation;

import java.util.List;

public interface SkolemGenerator {
    public String generateSkolemString(List<MyNode> varNames, List<Integer> ids, String rule_id, String addedString);
}
