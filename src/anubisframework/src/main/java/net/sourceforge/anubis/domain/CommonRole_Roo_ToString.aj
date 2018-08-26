package net.sourceforge.anubis.domain;

import java.lang.String;

privileged aspect CommonRole_Roo_ToString {
    
    public String CommonRole.toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Uid: ").append(getUid()).append(", ");
        sb.append("Version: ").append(getVersion()).append(", ");
        sb.append("Id: ").append(getId()).append(", ");
        sb.append("Application: ").append(getApplication()).append(", ");
        sb.append("Enabled: ").append(getEnabled()).append(", ");
        sb.append("Translations: ").append(getTranslations() == null ? "null" : getTranslations().size());
        return sb.toString();
    }
    
}
