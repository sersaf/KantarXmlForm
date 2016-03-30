package ru.javabegin.training.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import javax.xml.transform.TransformerException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.Assert;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import ru.javabegin.training.objects.*;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@Controller
//@SessionAttributes("kantarXmlForm")
public class LoginController {

	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	private static List<KantarXml> kantarXmls = new ArrayList<KantarXml>();
	static {
		kantarXmls.add(new KantarXml("Barack", "Obama","Obama","Obama","Obama","Obama","Obama","Obama","Obama","Obama",
				"Obama","Obama","Obama"));
//		kantarXmls.add(new KantarXml("George", "Bush"));
//		kantarXmls.add(new KantarXml("Bill", "Clinton"));
//		kantarXmls.add(new KantarXml("Ronald", "Reagan"));
	}

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView main() {

		KantarXmlForm kantarXmlForm = new KantarXmlForm();
		kantarXmlForm.setXmls(kantarXmls);

		return new ModelAndView("login" , "kantarXmlForm", kantarXmlForm);
	}


	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public ModelAndView save(KantarXmlForm kantarXmlForm) {
//		System.out.println(kantarXmlForm);
//		System.out.println(kantarXmlForm.getXmls());
		List<KantarXml> xmls = kantarXmlForm.getXmls();

		if(null != xmls && xmls.size() > 0) {
			LoginController.kantarXmls = xmls;
			for (KantarXml kantarXml : xmls) {
				kantarXmlForm.setXmls(xmls);
				System.out.printf("%s \t %s \n", kantarXml.getId(), kantarXml.getSource());
			}
		}

		return new ModelAndView("show_kantar", "kantarXmlForm", kantarXmlForm);
	}

	@RequestMapping(value = "/xmlgen", method = RequestMethod.POST)
	public ModelAndView xmlgen(@ModelAttribute("kantarXmlForm") KantarXmlForm kantarXmlForm) throws TransformerException, IOException {

		for (int i = 0; i < kantarXmlForm.getXmls().size(); i++) {
			ConstructorsForXML constructorsForXML = new ConstructorsForXML(kantarXmlForm);

		}

		return new ModelAndView("show_xml", "kantarXmlForm", kantarXmlForm);

	}





	@RequestMapping(value = "/set_settings", method = RequestMethod.POST)
	public String set_settings(@ModelAttribute("fields") Settings settings) throws IOException {
		if (settings.getFields().equals("1"))
			return "main";
		else
			return "login-failed";
	}

	@RequestMapping(value = "/check-user", method = RequestMethod.POST)
	public String checkUser(@Valid @ModelAttribute("KantarXml") KantarXml kantar, BindingResult bindingResult, Model model) throws TransformerException, IOException {
		if (bindingResult.hasErrors()) {
			return "login";
		}
//		ConstructorsForXML constructorsForXML = new ConstructorsForXML(kantar);
		model.addAttribute("KantarXml", kantar);

		return "main";
	}

	@RequestMapping(value = "/failed", method = RequestMethod.GET)
	public ModelAndView failed() {
		return new ModelAndView("login-failed", "message", "Login failed!");
	}

	@RequestMapping(value = "/get-json", method = RequestMethod.POST, produces = "application/json")
	@ResponseBody
	public KantarXml getJsonUser(@RequestParam("xmls[0].name") String id) {
		KantarXml kantarXml = new KantarXml();
		kantarXml.setId(id);

		return kantarXml;
	}

	@RequestMapping(value = "/put-json-user", method = RequestMethod.POST, consumes = "application/json")
	public ResponseEntity<String> setJsonUser(@RequestBody User user) {
		logger.info(user.getName());
		return new ResponseEntity<String>(HttpStatus.OK);
	}

}
