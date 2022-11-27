package com.demo.controller.restaurant;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.ServletContextAware;
import org.springframework.web.multipart.MultipartFile;

import com.demo.helpers.UploadHelper;
import com.demo.models.Account;
import com.demo.models.Category;
import com.demo.models.Menu;
import com.demo.models.Photo;
import com.demo.models.Restaurant;
import com.demo.models.Tables;
import com.demo.repository.TableRepository;
import com.demo.services.AccountService;
import com.demo.services.CategoryService;
import com.demo.services.MenuService;
import com.demo.services.OrderService;
import com.demo.services.RestaurantService;

@Controller
@RequestMapping(value = { "restaurant" })
public class RestaurantController implements ServletContextAware {

	private ServletContext servletContext;
	@Autowired
	private RestaurantService restaurantService;

	@Autowired
	private MenuService menuService;

	@Autowired
	private CategoryService categoryService;

	@Autowired
	private OrderService orderService;

	@Autowired
	private AccountService accountService;

	@RequestMapping(value = { "", "dashboard" }, method = RequestMethod.GET)
	public String dashboard(ModelMap modelMap, Authentication authentication) {
		Account account = accountService.Find(authentication.getName());
		modelMap.put("fullname", account.getFullname());
		modelMap.put("restaurants", account.getRestaurants());
		return "restaurant/dashboard";
	}

	@RequestMapping(value = { "restaurantdetail/{id}" }, method = RequestMethod.GET)
	public String restaurantdetail(@PathVariable("id") int id, ModelMap modelMap, HttpSession session) {
		modelMap.put("countMenu", restaurantService.countMenu(id));
		modelMap.put("countOrder", restaurantService.countOrder(id));
		modelMap.put("sumTotal", restaurantService.sumTotal(id));
		modelMap.put("orders", orderService.findAllbyRes(id));
		Restaurant restaurant = restaurantService.Find(id);
		session.setAttribute("res_id", restaurant.getId());
		return "restaurant/restaurantdetail";
	}

	@RequestMapping(value = { "addmenu/{id}" }, method = RequestMethod.GET)
	public String addmenu(@PathVariable("id") int id, ModelMap modelMap, HttpSession session) {
		modelMap.put("menu", new Menu());
		session.setAttribute("id", id);
		modelMap.put("categories", categoryService.findAllCate(id));
		return "restaurant/addmenu";
	}

	@RequestMapping(value = { "menu/{id}" }, method = RequestMethod.GET)
	public String menu(ModelMap modelMap, @PathVariable("id") int id) {
		modelMap.put("menus", restaurantService.findAllMenu(id));
		return "restaurant/menu";
	}

	@RequestMapping(value = { "addcategory/{id}" }, method = RequestMethod.GET)
	public String addcategory(@PathVariable("id") int id, ModelMap modelMap, HttpSession session) {
		Category category = new Category();
		modelMap.put("category", category);
		session.setAttribute("id", id);
		category.setRestaurant(restaurantService.Find(id));
		modelMap.put("categories", categoryService.findAllCate(id));
		return "restaurant/addcategory";
	}

	@RequestMapping(value = { "addcategory" }, method = RequestMethod.POST)
	public String addcategory(@ModelAttribute("category") Category category, HttpSession session) {
		int id = (int) session.getAttribute("id");
		category.setRestaurant(restaurantService.Find(id));
		categoryService.save(category);
		return "redirect:/restaurant/addcategory/" + category.getRestaurant().getId();
	}

	@RequestMapping(value = { "editcategory/{id}" }, method = RequestMethod.GET)
	public String editcategory(@PathVariable("id") int id, ModelMap modelMap) {
		Category category = categoryService.find(id);
		modelMap.put("category", category);
		modelMap.put("categories", categoryService.findAllCate(category.getRestaurant().getId()));
		return "restaurant/editcategory";
	}
	
	@RequestMapping(value = { "editRes/{id}" }, method = RequestMethod.GET)
	public String editRes(@PathVariable("id") int id, ModelMap modelMap) {
		Restaurant restaurant = restaurantService.Find(id);
		modelMap.put("restaurant",restaurant);
		return "restaurant/editRes";
	}
	
	@RequestMapping(value = { "editRes" }, method = RequestMethod.POST)
	public String editRes(@ModelAttribute("restaurant") Restaurant restaurant) {
		Restaurant current = restaurantService.Find(restaurant.getId());
		restaurant.setAccounts(current.getAccounts());
		restaurant.setPhoto(current.getPhoto());
		restaurantService.save(restaurant);
		return "redirect:/restaurant/restaurantdetail/" + restaurant.getId();
	}

	@RequestMapping(value = { "editcategory" }, method = RequestMethod.POST)
	public String editcategory(@ModelAttribute("category") Category category, ModelMap modelMap) {
		Category current = categoryService.find(category.getId());
		category.setRestaurant(current.getRestaurant());
		categoryService.save(category);
		modelMap.put("categories", categoryService.findAllCate(category.getRestaurant().getId()));
		return "redirect:/restaurant/addcategory/" + category.getRestaurant().getId();
	}

	@RequestMapping(value = { "deletecategory/{id}" }, method = RequestMethod.GET)
	public String deletecategory(@PathVariable("id") int id, ModelMap modelMap) {
		try {
			Category category = categoryService.find(id);
			categoryService.deleteCate(id);
			return "redirect:/restaurant/addcategory/" + category.getRestaurant().getId();
		} catch (Exception e) {
			modelMap.put("msg", "Can not delete");
			return "redirect:/restaurant/addcategory";
		}
	}
	
	@RequestMapping(value = { "deleteRes/{id}" }, method = RequestMethod.GET)
	public String deleteRes(@PathVariable("id") int id, ModelMap modelMap) {
		try {
			restaurantService.deleteRes(id);
			return "redirect:/restaurant/";
		} catch (Exception e) {
			modelMap.put("msg", "Can not delete");
			return "redirect:/restaurant/restaurantdetail/" +id;
		}
	}

	@RequestMapping(value = { "menuAdmin/{id}" }, method = RequestMethod.GET)
	public String menuAdmin(ModelMap modelMap, @PathVariable("id") int id) {
		modelMap.put("menus", restaurantService.findAllMenu(id));
		return "restaurant/menuAdmin";
	}

	@RequestMapping(value = { "addmenu" }, method = RequestMethod.POST)
	public String addmenu(@ModelAttribute("menu") Menu menu, @RequestParam(value = "files") MultipartFile[] files,
			HttpSession session) {
		int id = (int) session.getAttribute("id");
		menu.setRestaurant(restaurantService.Find(id));
		List<Photo> photos = new ArrayList<Photo>();
		Photo photo = new Photo();
		if (files != null && files.length > 0) {
			for (MultipartFile file : files) {
				String fileName = saveImage(file);
				photo.setName(fileName);
				photos.add(photo);
			}
			menu.setPhotos(photos);
		}
		menuService.save(menu);

		return "redirect:/restaurant/menu/" + menu.getRestaurant().getId();
	}

	private String saveImage(MultipartFile multipartFile) {
		try {
			byte[] bytes = multipartFile.getBytes();
			Path path = Paths.get(servletContext.getRealPath("/assets/images/" + multipartFile.getOriginalFilename()));
			Files.write(path, bytes);
			return multipartFile.getOriginalFilename();
		} catch (IOException e) {
			return null;
		}
	}

	@RequestMapping(value = { "editmenu/{id}" }, method = RequestMethod.GET)
	public String editmenu(@PathVariable("id") int id, ModelMap modelMap) {
		Menu menu = menuService.find(id);
		modelMap.put("menu", menu);

		modelMap.put("categories", categoryService.findAllCate(menu.getRestaurant().getId()));
		return "restaurant/editmenu";
	}

	@RequestMapping(value = { "editmenu" }, method = RequestMethod.POST)
	public String editmenu(@ModelAttribute("menu") Menu menu, ModelMap modelMap,
			@RequestParam(value = "files") MultipartFile[] files) {
		Menu current = menuService.find(menu.getId());
		menu.setRestaurant(current.getRestaurant());
		List<Photo> photos = new ArrayList<Photo>();
		for (MultipartFile file : files) {
			String fileName = saveImage(file);
			Photo photo = new Photo();
			photo.setName(fileName);
			photos.add(photo);
		}
		menuService.save(menu);
		modelMap.put("menus", restaurantService.findAllMenu(menu.getRestaurant().getId()));
		return "redirect:/restaurant/menuAdmin/" + menu.getRestaurant().getId();
	}

	@RequestMapping(value = { "deletemenu/{id}" }, method = RequestMethod.GET)
	public String deletemenu(@PathVariable("id") int id, ModelMap modelMap) {
		Menu menu = menuService.find(id);
		try {
			menuService.deleteMenu(id);
			return "redirect:/restaurant/menuAdmin/" + menu.getRestaurant().getId();
		} catch (Exception e) {
			modelMap.put("msg", "Can not delete");
			modelMap.put("menus", restaurantService.findAllMenu(id));
			return "restaurant/menuAdmin";
		}
	}

	@RequestMapping(value = { "addRes/{username}" }, method = RequestMethod.GET)
	public String addRes(@PathVariable("username") String username, ModelMap modelMap, HttpSession session) {
		Restaurant restaurant = new Restaurant();
		session.setAttribute("username", username);
		modelMap.put("restaurant", restaurant);
		return "restaurant/addRes";
	}

	@RequestMapping(value = { "addRes" }, method = RequestMethod.POST)
	public String addRes(@ModelAttribute("restaurant") Restaurant restaurant, HttpSession session) {
		Set<Account> accounts = new HashSet<Account>();
		String username = (String) session.getAttribute("username");
		accounts.add(accountService.findByUsername(username));
		restaurant.setAccounts(accounts);
		restaurantService.save(restaurant);
		return "redirect:/restaurant";
	}

	@RequestMapping(value = { "addtable" }, method = RequestMethod.POST)
	public String addtable(@ModelAttribute("table") Tables tables, HttpSession session) {
		int id = (int) session.getAttribute("restaurant_id");
		tables.setRestaurant(restaurantService.Find(id));
		menuService.saveTable(tables);
		return "redirect:/restaurant/addtable/" + id;
	}
	@RequestMapping(value = { "addtable/{id}" }, method = RequestMethod.GET)
	public String addtable(@PathVariable("id") int id, ModelMap modelMap, HttpSession session) {
		Tables tables = new Tables();
		modelMap.put("tables", tables);
		modelMap.put("categories", categoryService.findAllCate(id));
		session.setAttribute("restaurant_id", id);
		modelMap.put("tabless", restaurantService.findAllTable(id));
		return "restaurant/addtable";
	}
	
	@RequestMapping(value = { "deletetable/{id}" }, method = RequestMethod.GET)
	public String deletetable(@PathVariable("id") int id, ModelMap modelMap) {
		try {
			Tables tables = menuService.FindTable(id);
			menuService.deleteTable(id);
			return "redirect:/restaurant/addtable/" + tables.getRestaurant().getId();
		} catch (Exception e) {
			modelMap.put("msg", "Can not delete");
			return "redirect:/restaurant/addtable";
		}
	}
	
	@RequestMapping(value = { "edittable/{id}" }, method = RequestMethod.GET)
	public String edittable(@PathVariable("id") int id, ModelMap modelMap) {
		Tables tables = menuService.FindTable(id);
		modelMap.put("tables", tables);
		modelMap.put("categories", categoryService.findAllCate(tables.getRestaurant().getId()));
		return "restaurant/edittable";
	}
	
	@RequestMapping(value = { "edittable" }, method = RequestMethod.POST)
	public String edittable(@ModelAttribute("tables") Tables tables, ModelMap modelMap) {
		Tables current = menuService.FindTable(tables.getId());
		tables.setRestaurant(current.getRestaurant());
		menuService.saveTable(tables);
		return "redirect:/restaurant/addtable/" + tables.getRestaurant().getId();
	}
	
	@RequestMapping(value = { "neworder/{id}" }, method = RequestMethod.GET)
	public String neworder(@PathVariable("id") int id, ModelMap modelMap) {
		modelMap.put("orders", orderService.NewOrder(id));
		return "restaurant/neworder";
	}

	@RequestMapping(value = { "orderdetail/{id}" }, method = RequestMethod.GET)
	public String orderdetail(@PathVariable("id") int id, ModelMap modelMap) {
		modelMap.put("orders", orderService.Orderdetail(id));
		modelMap.put("orders2", orderService.Orderdetail2(id));
		;
		return "restaurant/orderdetail";
	}

	@Override
	public void setServletContext(ServletContext servletContext) {
		this.servletContext = servletContext;
	}

}
