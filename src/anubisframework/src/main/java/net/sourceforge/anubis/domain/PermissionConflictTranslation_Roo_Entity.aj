package net.sourceforge.anubis.domain;

import java.lang.Integer;
import java.lang.Long;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.EntityManager;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.PersistenceContext;
import javax.persistence.Version;
import net.sourceforge.anubis.domain.PermissionConflictTranslation;
import org.springframework.transaction.annotation.Transactional;

privileged aspect PermissionConflictTranslation_Roo_Entity {
    
    @PersistenceContext
    transient EntityManager PermissionConflictTranslation.entityManager;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "uid")
    private Long PermissionConflictTranslation.uid;
    
    @Version
    @Column(name = "version")
    private Integer PermissionConflictTranslation.version;
    
    public Long PermissionConflictTranslation.getUid() {
        return this.uid;
    }
    
    public void PermissionConflictTranslation.setUid(Long id) {
        this.uid = id;
    }
    
    public Integer PermissionConflictTranslation.getVersion() {
        return this.version;
    }
    
    public void PermissionConflictTranslation.setVersion(Integer version) {
        this.version = version;
    }
    
    @Transactional
    public void PermissionConflictTranslation.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void PermissionConflictTranslation.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            PermissionConflictTranslation attached = this.entityManager.find(PermissionConflictTranslation.class, this.uid);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void PermissionConflictTranslation.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void PermissionConflictTranslation.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        PermissionConflictTranslation merged = this.entityManager.merge(this);
        this.entityManager.flush();
        this.uid = merged.getUid();
    }
    
    public static final EntityManager PermissionConflictTranslation.entityManager() {
        EntityManager em = new PermissionConflictTranslation().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long PermissionConflictTranslation.countPermissionConflictTranslations() {
        return (Long) entityManager().createQuery("select count(o) from PermissionConflictTranslation o").getSingleResult();
    }
    
    public static List<PermissionConflictTranslation> PermissionConflictTranslation.findAllPermissionConflictTranslations() {
        return entityManager().createQuery("select o from PermissionConflictTranslation o").getResultList();
    }
    
    public static PermissionConflictTranslation PermissionConflictTranslation.findPermissionConflictTranslation(Long id) {
        if (id == null) return null;
        return entityManager().find(PermissionConflictTranslation.class, id);
    }
    
    public static List<PermissionConflictTranslation> PermissionConflictTranslation.findPermissionConflictTranslationEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("select o from PermissionConflictTranslation o").setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
}
