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
import net.sourceforge.anubis.domain.Operation;
import org.springframework.transaction.annotation.Transactional;

privileged aspect Operation_Roo_Entity {
    
    @PersistenceContext
    transient EntityManager Operation.entityManager;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "uid")
    private Long Operation.uid;
    
    @Version
    @Column(name = "version")
    private Integer Operation.version;
    
    public Long Operation.getUid() {
        return this.uid;
    }
    
    public void Operation.setUid(Long id) {
        this.uid = id;
    }
    
    public Integer Operation.getVersion() {
        return this.version;
    }
    
    public void Operation.setVersion(Integer version) {
        this.version = version;
    }
    
    @Transactional
    public void Operation.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void Operation.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            Operation attached = this.entityManager.find(Operation.class, this.uid);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void Operation.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void Operation.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Operation merged = this.entityManager.merge(this);
        this.entityManager.flush();
        this.uid = merged.getUid();
    }
    
    public static final EntityManager Operation.entityManager() {
        EntityManager em = new Operation().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long Operation.countOperations() {
        return (Long) entityManager().createQuery("select count(o) from Operation o").getSingleResult();
    }
    
    public static List<Operation> Operation.findAllOperations() {
        return entityManager().createQuery("select o from Operation o").getResultList();
    }
    
    public static Operation Operation.findOperation(Long id) {
        if (id == null) return null;
        return entityManager().find(Operation.class, id);
    }
    
    public static List<Operation> Operation.findOperationEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("select o from Operation o").setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
}
