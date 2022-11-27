package com.demo.controllers.user;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.demo.models.Account;
import com.demo.models.Contact;
import com.demo.models.Item;
import com.demo.models.Item2;
import com.demo.models.Menu;
import com.demo.models.Order;
import com.demo.models.Photo;
import com.demo.models.Role;
import com.demo.models.Tables;
import com.demo.paypal.PayPalConfig;
import com.demo.paypal.PayPalResult;
import com.demo.paypal.PayPalSucess;
import com.demo.repository.ContactRepository;
import com.demo.services.RestaurantService;
import com.demo.validator.AccountValidator;
import com.demo.services.AccountService;
import com.demo.services.CategoryService;
import com.demo.services.ContactService;
import com.demo.services.MenuService;
import com.demo.services.OrderService;

@Controller
@RequestMapping(value = { "user" })

public class HomeController {
	@Autowired
	private ContactService contactService;
	
	@Autowired
	private MenuService menuServer;

	@Autowired
	private OrderService orderService;

	@Autowired
	private AccountService accountService;

	@Autowired
	private AccountValidator accountValidator;
	
	@Autowired
	private RestaurantService restaurantService;

	@Autowired
	private CategoryService categoryService;

	@Autowired
	private Environment environment;

	@RequestMapping(value = { "", "index" }, method = RequestMethod.GET)
	public String index(ModelMap modelMap,Authentication authentication) {
		Account account= accountService.Find(authentication.getName());
		modelMap.put("fullname", account.getFullname());
		modelMap.put("restaurants", accountService.findAllRes());
		return "user/index";
	}
	
	@RequestMapping(value = { "index2" }, method = RequestMethod.GET)
	public String index2(ModelMap modelMap,Authentication authentication) {
		Account account= accountService.Find(authentication.getName());
		modelMap.put("fullname", account.getFullname());
		modelMap.put("restaurants", accountService.findAllRes());
		return "user/index2";
	}

	
	@RequestMapping(value = { "findByCate/{id}" }, method = RequestMethod.GET)
	public String findByCate(@PathVariable("id") int id,ModelMap modelMap) {
		modelMap.put("menus",menuServer.finAllCategory(id));
		return "redirect:/user/menu/" + id;
	}
	@RequestMapping(value = { "discount" }, method = RequestMethod.GET)
	public String discount( ModelMap modelMap) {
		modelMap.put("discounts", accountService.findAllDiscount());
		return "user/discount";
	}

	@RequestMapping(value = { "detail/{id}" }, method = RequestMethod.GET)
	public String detail(@PathVariable("id") int id,ModelMap modelMap) {
		Menu menu=menuServer.find(id);
		
		modelMap.put("detail", menu);
		modelMap.put("photos", menu.getPhotos());
		return "user/menudetail";
	}
	
	@RequestMapping(value = { "tabledetail/{id}" }, method = RequestMethod.GET)
	public String tabledetail(@PathVariable("id") int id,ModelMap modelMap) {
		Tables table =menuServer.FindTable(id);
		
		modelMap.put("detail", table);
		modelMap.put("photos", table.getPhotos());
		return "user/tabledetail";
	}
	
	@RequestMapping(value = { "searchbyname" }, method = RequestMethod.POST)
	public String searchbyname(ModelMap modelMap, @RequestParam("search") String search) {
		modelMap.put("restaurants", accountService.findResByname(search));
		return "user/index";
	}

	@RequestMapping(value = { "cart" }, method = RequestMethod.GET)
	public String cart(ModelMap modelMap) {
		String posturl = environment.getProperty("paypal.posturl");
		String returnurl = environment.getProperty("paypal.returnurl");
		String business = environment.getProperty("paypal.business");
		modelMap.put("business", business);
		modelMap.put("returnurl", returnurl);
		System.err.println(returnurl);
		modelMap.put("posturl", posturl);
		return "user/cart";
	}

	@RequestMapping(value = { "cart2" }, method = RequestMethod.GET)
	public String cart2(ModelMap modelMap) {
		String posturl = environment.getProperty("paypal.posturl");
		String returnurl = environment.getProperty("paypal.returnurl");
		String business = environment.getProperty("paypal.business");
		modelMap.put("business", business);
		modelMap.put("returnurl", returnurl);
		modelMap.put("posturl", posturl);
		return "user/cart2";
	}

	@RequestMapping(value = { "favorite" }, method = RequestMethod.GET)
	public String favorite() {
		return "user/favorite";
	}

	@RequestMapping(value = { "success" }, method = RequestMethod.GET)
	public String success(HttpServletRequest request,ModelMap modelMap,Authentication authentication) {
		String posturl = environment.getProperty("paypal.posturl");
		String returnurl = environment.getProperty("paypal.returnurl");
		String business = environment.getProperty("paypal.business");
		String authtoken = environment.getProperty("paypal.authtoken");
		PayPalConfig config = new PayPalConfig();
		config.setAuthToken(authtoken);
		config.setBusiness(business);
		config.setPosturl(posturl);
		config.setReturnurl(returnurl);
		PayPalResult palResult = PayPalSucess.getPayPal(request, config);
		Order order = new Order();
		order.setDate(new Date());
		order.setTotal(Double.parseDouble(palResult.getPayment_gross()) );
		Account account = accountService.Find(authentication.getName());
		order.setAccount(account);
		orderService.save(order);
		modelMap.put("result",palResult);
		return "user/success";
	}

	@RequestMapping(value = { "profile/{username}" }, method = RequestMethod.GET)
	public String profile(@PathVariable("username") String username, ModelMap modelMap) {
		Account account = accountService.Find(username);
		account.setStatus(true);
		modelMap.put("account", account);
		return "user/profile";
	}

	@RequestMapping(value = { "profile" }, method = RequestMethod.POST)
	public String profile(@ModelAttribute("account") Account account,BindingResult bindingResult) {
		accountValidator.validate(account, bindingResult);
		if(bindingResult.hasErrors()) {
			return "account/register";
		}else {
			Account current = accountService.Find(account.getUsername());
			if (!account.getPassword().isEmpty()) {
				account.setPassword(BCrypt.hashpw(account.getPassword(), BCrypt.gensalt()));
			} else {
				account.setPassword(current.getPassword());
			}
			account.setRoles(current.getRoles());
			accountService.save(account);
			return "redirect:/user/index";	
		}
		
	}

	@RequestMapping(value = { "menu/{id}" }, method = RequestMethod.GET)
	public String menu(@PathVariable("id") int id, ModelMap modelMap,HttpSession session) {
		modelMap.put("menus", restaurantService.findAllMenu(id));
		session.setAttribute("id", id);
		modelMap.put("categorys", categoryService.findAllCate(id));
		return "user/menu";
	}
	
	@RequestMapping(value = { "update" }, method = RequestMethod.GET)
	public String update(@RequestParam("form") String form) {
		if(form.equalsIgnoreCase("1")) {
			return "redirect:/user/index2" ;
		}
		if(form.equalsIgnoreCase("3")) {
			return "user/takeAway";
		}
		else {
			return "redirect:/user/payment";
		}
	}
	
	@RequestMapping(value = { "table/{id}" }, method = RequestMethod.GET)
	public String table(@PathVariable("id") int id, ModelMap modelMap,HttpSession  session) {
		modelMap.put("tables", restaurantService.findAllTable(id));
		session.setAttribute("table_id",id);
		return "user/table";
	}

	@RequestMapping(value = { "savecontact" }, method = RequestMethod.POST)
	public String savecontact(@RequestParam("username")String username,@RequestParam("content")String content) {
		Contact contact= new Contact();
		contact.setStatus(false);
		contact.setAccount(accountService.findByUsername(username));
		contact.setContent(content);;
		contactService.save(contact);
		return "redirect:/user/index";
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = { "buy/{id}" }, method = RequestMethod.GET)
	public String buy(@PathVariable("id") int id, ModelMap modelMap, HttpSession session) {
		if (session.getAttribute("cart") == null) {
			List<Item> cart = new ArrayList<>();
			cart.add(new Item(menuServer.find(id), 1));
			session.setAttribute("cart", cart);
			session.setAttribute("myCartNum", cart.size());
		} else {
			List<Item> cart = (List<Item>) session.getAttribute("cart");
			int index = isExists(id, cart);
			if (index == -1) {
				cart.add(new Item(menuServer.find(id), 1));
			} else {
				int quatity = cart.get(index).getQuantity() + 1;
				cart.get(index).setQuantity(quatity);
			}
			session.setAttribute("myCartNum", cart.size());
			session.setAttribute("cart", cart);
		}
		Menu menu = menuServer.find(id);
		return "redirect:/user/menu/" + menu.getRestaurant().getId();
	}

	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = { "buy2/{id}" }, method = RequestMethod.GET)
	public String buy2(@PathVariable("id") int id, ModelMap modelMap, HttpSession session) {
		if (session.getAttribute("cart2") == null) {
			List<Item2> cart2 = new ArrayList<Item2>();
			cart2.add(new Item2(menuServer.FindTable(id), 1));
			session.setAttribute("cart2", cart2);
			session.setAttribute("myCartNum", cart2.size());
		} else {
			List<Item2> cart2 = (List<Item2>) session.getAttribute("cart2");
			int index = isExists2(id, cart2);
			if (index == -1) {
				cart2.add(new Item2(menuServer.FindTable(id), 1));
			} else {
				int quatity = cart2.get(index).getQuantity() + 1;
				cart2.get(index).setQuantity(quatity);
			}
			session.setAttribute("myCartNum", cart2.size());
			session.setAttribute("cart2", cart2);
		}
		Tables tables = menuServer.FindTable(id);
		return "redirect:/user/menu/" + tables.getRestaurant().getId();
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "remove/{id}", method = RequestMethod.GET)
	public String remove(@PathVariable("id") int id, HttpSession session) {
		try {
			Menu menu = new Menu();
			List<Item> cart = (List<Item>) session.getAttribute("cart");
			int index = this.isExists(id, cart);
			cart.remove(index);
			session.setAttribute("myCartNum", cart.size());
			session.setAttribute("cart", cart);
		} catch (Exception e) {
			System.err.println(e.getMessage());
		}
		return "redirect:/user/cart";
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "removeTable/{id}", method = RequestMethod.GET)
	public String removeTable(@PathVariable("id") int id, HttpSession session) {
		try {
			Tables tables = new Tables();
			List<Item2> cart2 = (List<Item2>) session.getAttribute("cart2");
			int index = this.isExists2(id, cart2);
			cart2.remove(index);
			session.setAttribute("myCartNum", cart2.size());
			session.setAttribute("cart2", cart2);
		} catch (Exception e) {
			System.err.println(e.getMessage());
		}
		return "redirect:/user/cart2";
	}

	@RequestMapping(value = "payment", method = RequestMethod.POST)
	public String payment(HttpServletRequest request, HttpSession session) {
		Menu menu = new Menu();
		try {
			List<Item> cart = (List<Item>) session.getAttribute("cart");
			String[] quantity = request.getParameterValues("quantity");
			for (int i = 0; i < cart.size(); i++) {
				cart.get(i).setQuantity(Integer.parseInt(quantity[i]));
			}
			session.setAttribute("cart", cart);
		} catch (Exception e) {
			System.err.println(e.getMessage());
		}
		return "redirect:/user/cart";
	}

	private int isExists(int id, List<Item> cart) {
		for (int i = 0; i < cart.size(); i++) {
			if (cart.get(i).getMenu().getId().equals(id)) {
				return i;
			}
		}
		return -1;
	}
	
	private int isExists2(int id, List<Item2> cart2) {
		for (int i = 0; i < cart2.size(); i++) {
			if (cart2.get(i).getTables().getId().equals(id)) {
				return i;
			}
		}
		return -1;
	}

}
