package net.sourceforge.anubis.web;

import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import net.sourceforge.anubis.domain.ManualGroupTranslation;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.stereotype.Controller;

@RooWebScaffold(path = "manualgrouptranslation", automaticallyMaintainView = true, formBackingObject = ManualGroupTranslation.class)
@RequestMapping("/manualgrouptranslation/**")
@Controller
public class ManualGroupTranslationController {
}
