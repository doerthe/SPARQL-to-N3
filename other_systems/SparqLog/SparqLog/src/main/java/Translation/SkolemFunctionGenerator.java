package Translation;

import Translation.MyUtils.MyUtils;

import java.util.List;

public class SkolemFunctionGenerator implements SkolemGenerator {
    public String generateSkolemString(List<MyNode> vars, List<Integer> ids, String rule_id, String addedString) {
        StringBuilder sb = new StringBuilder("");
        sb.append("[\"f").append(rule_id).append("\"");

        if(addedString != null){
            sb.append(", ");
            sb.append("\"" + addedString + "\"");
        }

        if (!(vars.isEmpty() && ids.isEmpty())) {
            sb.append(", ");
        }

        int i = 0;
        for (MyNode var : vars) {
            i++;
            sb.append(var.getLabel());
            sb.append(", ");
            sb.append(var.getDatatype());
            sb.append(", ");
            sb.append(var.getLanguageTag());
            if (i != vars.size()) {
                sb.append(", ");
            }
        }

        if (!ids.isEmpty()) {
            sb.append(", ");
        }

        i = 0;
        for (Integer id : ids) {
            i++;
            sb.append(MyUtils.TID + id);
            if (i != ids.size()) {
                sb.append(", ");
            }
        }
        sb.append("]");
        return sb.toString();
    }

    ;
}
