package com.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JFileChooser;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dao.FoodDao;
import com.model.CartItem;
import com.model.EmailModel;
import com.model.Employee;
import com.model.FoodModel;
import com.model.Login;
import com.model.Otpmodel;
import com.services.AdminService;
import com.services.CartService;
import com.services.EmpServices;
import com.services.FoodServices;
import com.services.UserService;

@Controller
public class MainController {
	@Autowired
	EmpServices empservices;
	@Autowired
	AdminService adminService;
	@Autowired
	FoodServices foodServices;
	@Autowired
	private JavaMailSender emailSender;
	@Autowired
	private CartService cartService;
	@Autowired
	private UserService userService;

	@GetMapping("/viewcart")
	public String viewCart(HttpSession session, Model model) {
		List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
		if (cart == null) {
			cart = new ArrayList<>();
		}
		model.addAttribute("cart", cart);
		return "cart";
	}


//
	@RequestMapping("/registration")
	public String getRegForm() {
		return "Register";
	}

	@RequestMapping("/aboutus")
	public String aboutUs() {

		return "AboutUs";
	}

	@RequestMapping("/addToCart")
	public String addToCart(HttpSession session) {
		session.setAttribute("atc", "success");
		return "redirect:/index.jsp";
	}

	@RequestMapping("addcart")
	public String addToCartUser(@RequestParam int id, @RequestParam String name, @RequestParam double price,
			@RequestParam String fimage, @RequestParam String ftype, HttpSession session, Model model) {

		session.setAttribute("atcu", "success");
		List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
		if (cart == null) {
			cart = new ArrayList<>();
		}
		// Check if item is already in the cart
		boolean itemExists = false;
		for (CartItem item : cart) {
			if (item.getId() == id) {
				item.setQuantity(item.getQuantity() + 1);
				itemExists = true;
				break;
			}
		}
		if (!itemExists) {
			CartItem newItem = new CartItem();
			newItem.setId(id);
			newItem.setFname(name);
			newItem.setPrice(price);
			newItem.setFimage(fimage);
			newItem.setFtype(ftype);
			newItem.setQuantity(1);
			cart.add(newItem);
		}
		session.setAttribute("cart", cart);
		return "redirect:/view";
	}

	@RequestMapping("adminlogin")
	public String adminLogin() {
		return "AdminLogin";
	}

	@RequestMapping(value = "deliver", method = RequestMethod.POST)
	public String deliverFood(HttpSession session) {
		session.setAttribute("delivered", "success");
		return "redirect:/view";
	}

	@RequestMapping("buyfood")
	public String buyFood(HttpSession session) {
		session.setAttribute("msg", "success");
		return "FoodDeliverAddress";
	}

	@RequestMapping("/login")
	public String getLoginForm() {
		return "Login";
	}

	@RequestMapping(value = "register", method = RequestMethod.POST)
	public String saveReg(@ModelAttribute("employee") Employee emp, HttpSession session) {
		boolean status = empservices.addEmp(emp);
		if (status == false) {
			session.setAttribute("sesreg", "emailAlreadyExist");
		} else if (status == true) {
			session.setAttribute("sesreg", "success");
		}
		return "Login";
	}

	@RequestMapping(value = "addFoodItem", method = RequestMethod.POST)
	public String saveReg(@ModelAttribute("fm") FoodModel fm, HttpSession session) {

		String status = foodServices.addFood(fm);
		if (status == "fsuccess") {
			session.setAttribute("fadd", "success");
			return "redirect:/adminView";
		}
		return "AddFood";
	}

	@RequestMapping("viewcart")
	public String viewCart() {
		return "cart";
	}

	@RequestMapping(value = "/dologin", method = RequestMethod.POST)
	public String Login(Login lm, HttpSession session, Model model, RedirectAttributes redirectAttributes) {
		String email = lm.getEmail();
		List<Employee> list = empservices.doEmpLogin(lm);
		if (list != null) {
			session.setAttribute("seslog", "success");
			redirectAttributes.addFlashAttribute("email", email);
			System.out.println(email);
			return "redirect:/view";
		} else {
			session.setAttribute("seslog", "failed");
			return "Login";
		}
	}

	/*
	 * @RequestMapping(value = "/dologin", method = RequestMethod.POST) public
	 * String Login(Login lm, HttpSession session, Model model, RedirectAttributes
	 * redirectAttributes) { if (!userService.isEmailExist(lm.getEmail())) {
	 * model.addAttribute("error", "Email does not exist"); return "Login"; }
	 * 
	 * if (!userService.validatePassword(lm.getEmail(), lm.getPassword())) {
	 * model.addAttribute("error", "Incorrect password"); return "Login"; }
	 * redirectAttributes.addFlashAttribute("email", lm.getEmail()); return
	 * "redirect:/view"; }
	 */
	@RequestMapping("view")
	public String getView(Model model) {

		List<FoodModel> list1 = foodServices.getAllFoods();
		model.addAttribute("list1", list1);
		return "dashboard";
	}

	@RequestMapping(value = "/doadminlogin", method = RequestMethod.POST)
	public String doAdminLogin(@ModelAttribute("lm") Login lm, HttpSession session) {

		boolean status = adminService.doAdminLogin(lm);
		if (status == true) {
			session.setAttribute("seslog", "success");
			return "redirect:/adminView";
		} else if (status == false) {
			session.setAttribute("seslog", "failed");
			return "AdminLogin";
		}
		return "AdminLogin";
	}

	@RequestMapping(value = "edit/{id}", method = RequestMethod.GET)
	public String getDataById(@PathVariable int id, Model model) {
		Employee rm = empservices.getEmpById(id);
		model.addAttribute("command", rm);
		return "Update";
	}

	@RequestMapping("fedit/{id}")
	public String getFoodById(@PathVariable int id, Model model) {
		FoodModel fm = foodServices.GetFoodById(id);
		model.addAttribute("command", fm);
		return "FoodUpdate";
	}

	@RequestMapping(value = "fupdate", method = RequestMethod.POST)
	public String updateFood(FoodModel fm, HttpSession session) {
		foodServices.update(fm);
		session.setAttribute("fupdate", "success");
		return "redirect:/adminView";
	}

	@RequestMapping("logout")
	public String logout(HttpSession session) {
		session.setAttribute("seslogout", "logout");
		return "redirect:/login";
	}

	@RequestMapping("alogout")
	public String alogout(HttpSession session) {
		session.setAttribute("seslogout", "logout");
		return "AdminLogin";
	}

	@RequestMapping("delete/{id}")
	public String deleteById(@PathVariable int id, HttpSession session) {
		empservices.deleteEmpById(id);
		session.setAttribute("sesdelete", "success");
		return "redirect:/adminView";
	}

	@RequestMapping("fdelete/{fid}")
	public String foodDeleteById(@PathVariable int fid, HttpSession session) {
		foodServices.deleteFoodById(fid);
		session.setAttribute("fdelete", "success");
		return "redirect:/adminView";
	}

	@RequestMapping("update")
	public String updateForm(@ModelAttribute("rm") Employee rm, HttpSession session) {
		empservices.updateEmployee(rm);
		session.setAttribute("sesupdate", "success");
		return "redirect:/adminView";
	}

	@RequestMapping("adminView")
	public String getData(Model model) {
		List<Employee> list = empservices.getAllEmps();
		model.addAttribute("list", list);
		List<FoodModel> list1 = foodServices.getAllFoods();
		model.addAttribute("list1", list1);

		return "AdminDashboard";
	}

	@RequestMapping("emailpage")
	public String emailpage() {
		return "EmailPage";
	}

	@RequestMapping("forgotpassword")
	public String forgotPassword() {
		return "ForgotPassword";
	}

	@RequestMapping(value = "EnterEmailServer", method = RequestMethod.POST)
	public String passwordReset(@ModelAttribute("mail") EmailModel mail, HttpSession session) {

		int sentotp = empservices.sendEmailOtp(mail);

		String sentotpp = String.valueOf(sentotp);

		session.setAttribute("sentotp", sentotpp);
		session.setAttribute("EMAIL", mail.getTo());
		session.setAttribute("msg", "Otp sent to your email");

		return "OtpPage";
	}

	@RequestMapping("/addFood")
	public String addFood() {
		return "AddFood";
	}

	@RequestMapping(value = "OTPServer", method = RequestMethod.POST)
	public String getOtp(@ModelAttribute("email") EmailModel email, HttpSession session, HttpServletRequest request,
			Model model) {
		String OTP = String.valueOf(email.getOtp());
		String Otp = (String) session.getAttribute("sentotp");
		String Email = (String) session.getAttribute("EMAIL");
		if (OTP.equals(Otp)) {
			session.setAttribute("OTPVerified", "success");
			session.setAttribute("password", "success");
			try {
				boolean emailSent = empservices.sendPassword(Email);
				if (emailSent) {
					session.setAttribute("passwordSent", "sucess");
					model.addAttribute("message", "Password has been sent to your email.");
				} else {
					model.addAttribute("message", "Email address not found.");
				}
			} catch (Exception e) {
				model.addAttribute("message", "An error occurred: " + e.getMessage());
			}
			return "Login";
		} else {
			session.setAttribute("msg", "OTP not verified");
			return "OtpPage";
		}
	}

	@PostMapping("/updateCart")
	public String updateCart(@RequestParam("action") String action, @RequestParam("itemId") int itemId,
			HttpSession session, Model model) {

		// Retrieve cart from session
		List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");

		// Perform the requested action
		switch (action) {
		case "increment":
			cartService.incrementQuantity(cart, itemId);
			break;
		case "decrement":
			cartService.decrementQuantity(cart, itemId);
			break;
		case "remove":
			cartService.removeItem(cart, itemId);
			break;
		}

		// Update session with the modified cart
		session.setAttribute("cart", cart);
		model.addAttribute("cart", cart);
		return "cart"; // Return the cart view page
	}

}