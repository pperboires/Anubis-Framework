package net.sourceforge.anubis.domain;

import javax.persistence.Entity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;
import org.springframework.roo.addon.entity.RooEntity;
import javax.persistence.Table;
import net.sourceforge.anubis.domain.User;
import javax.validation.constraints.NotNull;
import javax.persistence.ManyToOne;
import javax.persistence.JoinColumn;
import net.sourceforge.anubis.domain.Validity;

@Entity
@RooJavaBean
@RooToString
@RooEntity(identifierField = "uid", identifierColumn = "uid")
@Table(name = "tb_user_assigned_security_administrative_role")
public class UserAssignedSecurityAdministrativeRole {

    @NotNull
    @ManyToOne(targetEntity = User.class)
    @JoinColumn(name = "user_uid")
    private User user;

    @NotNull
    @ManyToOne(targetEntity = Validity.class)
    @JoinColumn(name = "validity_uid")
    private Validity validity;
}
